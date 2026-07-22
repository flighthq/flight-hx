import { spawnSync } from 'node:child_process';
import { mkdirSync, readdirSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import process from 'node:process';

const repositoryRoot = process.cwd();
const packagesDirectory = path.join(repositoryRoot, 'upstream', 'packages');
const selectedIndex = process.argv.indexOf('--package');
const selectedPackage = selectedIndex >= 0 ? process.argv[selectedIndex + 1] : undefined;
const ansiEscape = new RegExp(`${String.fromCodePoint(0x1b)}\\[[0-9;]*m`, 'gu');
const reportFile = path.join(
  repositoryRoot,
  'reports',
  selectedPackage ? `upstream-parity-${selectedPackage}.json` : 'upstream-parity.json',
);

if (selectedIndex >= 0 && !selectedPackage) {
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
const packageTests = packageNames.map((packageName) => ({
  files: testFiles(path.join(packagesDirectory, packageName, 'src')),
  packageName,
}));
const testedPackageCount = packageTests.filter((item) => item.files.length > 0).length;

if (selectedPackage && packageNames.length === 0) {
  process.stderr.write(`Unknown upstream package: ${selectedPackage}\n`);
  process.exit(2);
}

const packages = [];
const startedAt = new Date().toISOString();
let executed = 0;
let failures = 0;

for (const { files, packageName } of packageTests) {
  if (files.length === 0) {
    packages.push({ package: packageName, status: 'no-tests', testFiles: 0 });
    continue;
  }

  executed += 1;
  const label = `[${String(executed).padStart(3, ' ')}/${String(testedPackageCount).padStart(3, ' ')}] ${packageName}`;
  process.stdout.write(`${label} ... `);
  const start = performance.now();
  const result = spawnSync(
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
      encoding: 'utf8',
      env: { ...process.env, FLIGHT_UPSTREAM_PACKAGE: packageName },
      maxBuffer: 32 * 1024 * 1024,
    },
  );
  const durationMs = Math.round(performance.now() - start);
  const output = cleanOutput(`${result.stdout ?? ''}\n${result.stderr ?? ''}`);
  const status = result.status === 0 ? 'passed' : result.status === null ? 'crashed' : 'failed';
  if (status !== 'passed') failures += 1;
  const summary = testSummary(output);
  process.stdout.write(`${status}${summary ? ` (${summary})` : ''} ${durationMs}ms\n`);
  if (status !== 'passed' && selectedPackage) process.stdout.write(`${output}\n`);
  const failureOutput = status === 'passed' ? undefined : output.slice(-256 * 1024);
  packages.push({
    durationMs,
    error: result.error?.message,
    exitCode: result.status,
    failureOutput,
    package: packageName,
    signal: result.signal,
    status,
    summary,
    testFiles: files.length,
  });
}

const report = {
  completedAt: new Date().toISOString(),
  failedPackages: failures,
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
