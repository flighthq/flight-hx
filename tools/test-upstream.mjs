import { spawn } from 'node:child_process';
import { availableParallelism } from 'node:os';
import { mkdirSync, readdirSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import process from 'node:process';

// Upstream parity runner. Each package is verified in its own isolated vitest
// process against the compiled Haxe bridge. That per-package process boundary is
// the unit of isolation that runs green deterministically: the whole suite in one
// shared worker pool suffers nondeterministic worker-process crashes (the compiled
// `flight.cjs` singleton and jsdom accumulate state across hundreds of files until
// a worker dies, taking unrelated files with it). Keeping one process per package
// stays under that cliff, so results are reproducible. Speed comes from running
// packages concurrently, not from sharing an environment across packages.
const repositoryRoot = process.cwd();
const packagesDirectory = path.join(repositoryRoot, 'upstream', 'packages');
const ansiEscape = new RegExp(`${String.fromCodePoint(0x1b)}\\[[0-9;]*m`, 'gu');

function argValue(flag) {
  const index = process.argv.indexOf(flag);
  return index >= 0 ? process.argv[index + 1] : undefined;
}

const selectedPackage = argValue('--package');
const serial = process.argv.includes('--serial');
const requestedJobs = Number(argValue('--jobs'));
const jobs = serial
  ? 1
  : Number.isFinite(requestedJobs) && requestedJobs > 0
    ? Math.floor(requestedJobs)
    : Math.max(1, Math.min(12, availableParallelism() - 1));

const reportFile = path.join(
  repositoryRoot,
  'reports',
  selectedPackage ? `upstream-parity-${selectedPackage}.json` : 'upstream-parity.json',
);

if (process.argv.includes('--package') && !selectedPackage) {
  process.stderr.write('Expected a package name after --package.\n');
  process.exit(2);
}

function testFiles(directory) {
  return readdirSync(directory, { recursive: true, withFileTypes: true })
    .filter((entry) => entry.isFile() && /(?:^|\.)test\.[cm]?tsx?$/u.test(entry.name))
    .map((entry) => path.join(entry.parentPath, entry.name))
    .sort();
}

function cleanOutput(value) {
  return value.replaceAll(ansiEscape, '').trim();
}

function testSummary(output) {
  return /Tests\s+([^\n]+)/u.exec(output)?.[1]?.trim();
}

const packageNames = readdirSync(packagesDirectory, { withFileTypes: true })
  .filter((entry) => entry.isDirectory())
  .map((entry) => entry.name)
  .filter((name) => !selectedPackage || name === selectedPackage)
  .sort();

if (selectedPackage && packageNames.length === 0) {
  process.stderr.write(`Unknown upstream package: ${selectedPackage}\n`);
  process.exit(2);
}

const packageTests = packageNames.map((packageName) => ({
  files: testFiles(path.join(packagesDirectory, packageName, 'src')),
  packageName,
}));
const runnable = packageTests.filter((item) => item.files.length > 0);
const testedPackageCount = runnable.length;

function runPackage(packageName, files) {
  return new Promise((resolve) => {
    const start = performance.now();
    const child = spawn(
      process.execPath,
      [
        path.join(repositoryRoot, 'node_modules', 'vitest', 'vitest.mjs'),
        'run',
        '--config',
        path.join(repositoryRoot, 'vitest.upstream.config.ts'),
        '--reporter=dot',
        '--maxWorkers=1',
        '--no-file-parallelism',
      ],
      {
        cwd: repositoryRoot,
        env: { ...process.env, FLIGHT_UPSTREAM_PACKAGE: packageName },
      },
    );
    let stdout = '';
    let stderr = '';
    child.stdout.on('data', (chunk) => (stdout += chunk));
    child.stderr.on('data', (chunk) => (stderr += chunk));
    child.on('error', (error) => {
      const output = cleanOutput(`${stdout}\n${stderr}\n${error.message}`);
      resolve({
        durationMs: Math.round(performance.now() - start),
        error: error.message,
        exitCode: null,
        failureOutput: output.slice(-256 * 1024),
        files: files.length,
        packageName,
        signal: null,
        status: 'crashed',
        summary: undefined,
      });
    });
    child.on('close', (code, signal) => {
      const output = cleanOutput(`${stdout}\n${stderr}`);
      const status = code === 0 ? 'passed' : code === null ? 'crashed' : 'failed';
      resolve({
        durationMs: Math.round(performance.now() - start),
        error: undefined,
        exitCode: code,
        failureOutput: status === 'passed' ? undefined : output.slice(-256 * 1024),
        files: files.length,
        packageName,
        signal,
        status,
        summary: testSummary(output),
      });
    });
  });
}

const startedAt = new Date().toISOString();
const results = new Map();
let executed = 0;
let failures = 0;

process.stdout.write(`Running ${String(testedPackageCount)} package suites with ${String(jobs)} job(s).\n`);

// Bounded concurrency pool over the runnable packages.
const queue = [...runnable];
async function worker() {
  for (;;) {
    const next = queue.shift();
    if (!next) return;
    const result = await runPackage(next.packageName, next.files);
    results.set(next.packageName, result);
    executed += 1;
    if (result.status !== 'passed') failures += 1;
    const label = `[${String(executed).padStart(3, ' ')}/${String(testedPackageCount).padStart(3, ' ')}] ${next.packageName}`;
    process.stdout.write(
      `${label} ... ${result.status}${result.summary ? ` (${result.summary})` : ''} ${String(result.durationMs)}ms\n`,
    );
    if (result.status !== 'passed' && selectedPackage) process.stdout.write(`${result.failureOutput}\n`);
  }
}

await Promise.all(Array.from({ length: Math.min(jobs, testedPackageCount) || 1 }, () => worker()));

const packages = packageTests.map(({ files, packageName }) => {
  if (files.length === 0) return { package: packageName, status: 'no-tests', testFiles: 0 };
  const result = results.get(packageName);
  return {
    durationMs: result.durationMs,
    error: result.error,
    exitCode: result.exitCode,
    failureOutput: result.failureOutput,
    package: packageName,
    signal: result.signal,
    status: result.status,
    summary: result.summary,
    testFiles: files.length,
  };
});

const report = {
  completedAt: new Date().toISOString(),
  failedPackages: failures,
  jobs,
  packages,
  schemaVersion: 1,
  selectedPackage: selectedPackage ?? null,
  startedAt,
};
mkdirSync(path.dirname(reportFile), { recursive: true });
writeFileSync(reportFile, `${JSON.stringify(report, null, 2)}\n`);

process.stdout.write(
  `Upstream parity: ${String(executed - failures)} passed, ${String(failures)} failed, ${String(packageNames.length - executed)} without tests.\n`,
);
process.exit(failures === 0 ? 0 : 1);
