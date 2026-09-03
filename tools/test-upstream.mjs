import { execFileSync, spawn } from 'node:child_process';
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
// `--shard i/n` deterministically partitions the sorted package list so CI can
// split the sweep across parallel jobs; every package lands in exactly one
// shard, so nothing is silently skipped.
const shardSpec = argValue('--shard');
const shardMatch = shardSpec ? /^([1-9]\d*)\/([1-9]\d*)$/u.exec(shardSpec) : null;
if (shardSpec && !shardMatch) {
  process.stderr.write('Expected --shard i/n with 1 <= i <= n.\n');
  process.exit(2);
}
const shard = shardMatch ? { index: Number(shardMatch[1]), total: Number(shardMatch[2]) } : null;
if (shard && shard.index > shard.total) {
  process.stderr.write('Expected --shard i/n with 1 <= i <= n.\n');
  process.exit(2);
}
const serial = process.argv.includes('--serial');
const strict = process.argv.includes('--strict');
const requestedJobs = Number(argValue('--jobs'));
// Each process loads the full compiled bridge. Keep the implicit pool aligned
// with the proven parity workflow setting so larger upstream pins do not turn
// green suites into resource-exhaustion failures; callers can still override it.
const jobs = serial
  ? 1
  : Number.isFinite(requestedJobs) && requestedJobs > 0
    ? Math.floor(requestedJobs)
    : Math.max(1, Math.min(3, availableParallelism() - 1));

const reportFile = path.join(
  repositoryRoot,
  'reports',
  selectedPackage
    ? `upstream-parity-${selectedPackage}.json`
    : shard
      ? `upstream-parity-shard-${String(shard.index)}-of-${String(shard.total)}.json`
      : 'upstream-parity.json',
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

function failureCount(summary) {
  const value = /(?:^|\|\s+)(\d+) failed(?:\s|$)/u.exec(summary ?? '')?.[1];
  return value === undefined ? null : Number(value);
}

function failureIdentities(output) {
  return [
    ...new Set(
      (output ?? '')
        .split(/\r?\n/u)
        .filter((line) => line.startsWith(' FAIL  '))
        .map((line) => line.slice(' FAIL  '.length).trim()),
    ),
  ];
}

function reviewedResults() {
  let files;
  try {
    files = execFileSync('git', ['ls-tree', '-r', '--name-only', 'HEAD', 'reports'], {
      cwd: repositoryRoot,
      encoding: 'utf8',
      stdio: ['ignore', 'pipe', 'ignore'],
    })
      .trim()
      .split('\n')
      .filter((file) => /^reports\/upstream-parity(?:-[^/]+)?\.json$/u.test(file));
  } catch {
    return new Map();
  }

  const reviewed = new Map();
  for (const file of files) {
    try {
      const report = JSON.parse(
        execFileSync('git', ['show', `HEAD:${file}`], {
          cwd: repositoryRoot,
          encoding: 'utf8',
          stdio: ['ignore', 'pipe', 'ignore'],
        }),
      );
      const reviewedAt = report.completedAt ?? report.startedAt;
      const reviewedTime = Date.parse(reviewedAt ?? '');
      for (const item of report.packages ?? []) {
        const existing = reviewed.get(item.package);
        if (existing && existing.reviewedTime > reviewedTime) continue;
        reviewed.set(item.package, { item, report: file, reviewedAt, reviewedTime });
      }
    } catch {
      // A malformed historical report cannot become an implicit approval.
    }
  }
  return reviewed;
}

function classifyReview(item, reviewed) {
  const baseline = reviewed.get(item.package);
  if (item.status === 'crashed') {
    return {
      baselineReport: baseline?.report ?? null,
      reviewedAt: baseline?.reviewedAt ?? null,
      status: 'infrastructure-failure',
      unreviewedFailures: 1,
    };
  }
  if (item.status === 'passed') {
    return {
      baselineReport: baseline?.report ?? null,
      reviewedAt: baseline?.reviewedAt ?? null,
      status: baseline?.item.status === 'failed' ? 'fixed-since-review' : 'passed',
      unreviewedFailures: 0,
    };
  }
  if (item.status !== 'failed') {
    return {
      baselineReport: baseline?.report ?? null,
      reviewedAt: baseline?.reviewedAt ?? null,
      status: item.status,
      unreviewedFailures: 0,
    };
  }

  const currentIdentities = failureIdentities(item.failureOutput);
  const baselineIdentities = failureIdentities(baseline?.item.failureOutput);
  const baselineIdentitySet = new Set(baselineIdentities);
  const newIdentities = currentIdentities.filter((identity) => !baselineIdentitySet.has(identity));
  const currentCount = failureCount(item.summary) ?? currentIdentities.length;
  const baselineCount = failureCount(baseline?.item.summary) ?? baselineIdentities.length;
  const reviewedFailure =
    baseline?.item.status === 'failed' &&
    (currentIdentities.length > 0 && baselineIdentities.length > 0
      ? newIdentities.length === 0 && currentCount <= baselineCount
      : currentCount > 0 && currentCount <= baselineCount);
  return {
    baselineReport: baseline?.report ?? null,
    reviewedAt: baseline?.reviewedAt ?? null,
    status: reviewedFailure ? 'reviewed-failure' : 'unreviewed-failure',
    unreviewedFailures: reviewedFailure
      ? 0
      : Math.max(newIdentities.length, baseline ? currentCount - baselineCount : currentCount, 1),
  };
}

function testSummary(output) {
  return /Tests\s+([^\n]+)/u.exec(output)?.[1]?.trim();
}

// The test files a failed run reported as failing, as repo-relative paths. Vitest prints
// `FAIL  upstream/packages/<pkg>/src/<file>.test.ts > <name>` (optionally behind a `|project|` tag)
// for each. Used to re-run only those files hermetically in the isolation-retry.
function parseFailingFiles(output) {
  const files = new Set();
  const pattern = /(?:^|\s)FAIL\s+(?:\|[^|]*\|\s+)?(upstream\/\S+?\.test\.[cm]?tsx?)/gu;
  let match;
  while ((match = pattern.exec(output ?? '')) !== null) files.add(match[1]);
  return [...files];
}

const packageNames = readdirSync(packagesDirectory, { withFileTypes: true })
  .filter((entry) => entry.isDirectory())
  .map((entry) => entry.name)
  .filter((name) => !selectedPackage || name === selectedPackage)
  .sort()
  .filter((name, index) => !shard || index % shard.total === shard.index - 1);

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

function runPackage(packageName, files, { extraArgs = [], extraEnv = {} } = {}) {
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
        ...extraArgs,
      ],
      {
        cwd: repositoryRoot,
        env: {
          ...process.env,
          FLIGHT_UPSTREAM_PACKAGE: packageName,
          // The heaviest suites (scene2d-wgpu) pass every test and then hit the
          // default V8 heap ceiling during teardown, turning a green run into
          // exit 1. Give vitest workers explicit headroom; an existing
          // NODE_OPTIONS wins so callers can still override.
          NODE_OPTIONS: process.env.NODE_OPTIONS ?? '--max-old-space-size=6144',
          ...extraEnv,
        },
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

// The shared-worker parity run is fast but not hermetic: a file that leaks module state or an
// unrestored spy can fail a later file that passes in isolation. Rather than pay per-file isolation for
// the whole sweep (re-evaluating the 13 MB compiled bundle per file OOMs), re-run ONLY a failed
// package's failing files hermetically. A failure that survives is a real port difference; one that
// clears was shared-worker pollution. Set FLIGHT_UPSTREAM_NO_ISOLATION_RETRY=1 to disable.
const isolationRetryEnabled =
  process.env.FLIGHT_UPSTREAM_ISOLATE !== '1' && process.env.FLIGHT_UPSTREAM_NO_ISOLATION_RETRY !== '1';
async function isolationRetry(result, item) {
  if (!isolationRetryEnabled || result.status !== 'failed') return result;
  const failingFiles = parseFailingFiles(result.failureOutput);
  if (failingFiles.length === 0) return result;
  const retry = await runPackage(item.packageName, failingFiles, {
    extraArgs: failingFiles,
    extraEnv: { FLIGHT_UPSTREAM_ISOLATE: '1' },
  });
  if (retry.status !== 'passed') return result;
  return {
    ...result,
    durationMs: result.durationMs + retry.durationMs,
    failureOutput: undefined,
    isolationRecovered: true,
    isolationRecoveredFiles: failingFiles,
    status: 'passed',
  };
}

// Bounded concurrency pool over the runnable packages.
const queue = [...runnable];
async function worker() {
  for (;;) {
    const next = queue.shift();
    if (!next) return;
    const result = await isolationRetry(await runPackage(next.packageName, next.files), next);
    results.set(next.packageName, result);
    executed += 1;
    if (result.status !== 'passed') failures += 1;
    const label = `[${String(executed).padStart(3, ' ')}/${String(testedPackageCount).padStart(3, ' ')}] ${next.packageName}`;
    const recovered = result.isolationRecovered ? ' (isolation-recovered)' : '';
    process.stdout.write(
      `${label} ... ${result.status}${recovered}${result.summary ? ` (${result.summary})` : ''} ${String(result.durationMs)}ms\n`,
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
    isolationRecovered: result.isolationRecovered ?? false,
    isolationRecoveredFiles: result.isolationRecoveredFiles,
    package: packageName,
    signal: result.signal,
    status: result.status,
    summary: result.summary,
    testFiles: files.length,
  };
});

const reviewed = reviewedResults();
for (const item of packages) item.review = classifyReview(item, reviewed);
const reviewedFailures = packages.filter((item) => item.review.status === 'reviewed-failure').length;
const unreviewedFailures = packages.filter((item) => item.review.status === 'unreviewed-failure').length;
const infrastructureFailures = packages.filter((item) => item.review.status === 'infrastructure-failure').length;
const fixedSinceReview = packages.filter((item) => item.review.status === 'fixed-since-review').length;

const report = {
  completedAt: new Date().toISOString(),
  failedPackages: failures,
  fixedSinceReview,
  infrastructureFailures,
  jobs,
  packages,
  reviewedFailures,
  schemaVersion: 2,
  selectedPackage: selectedPackage ?? null,
  startedAt,
  strict,
  unreviewedFailures,
};
mkdirSync(path.dirname(reportFile), { recursive: true });
writeFileSync(reportFile, `${JSON.stringify(report, null, 2)}\n`);

process.stdout.write(
  `Upstream parity: ${String(executed - failures)} passed, ${String(failures)} failed ` +
    `(${String(reviewedFailures)} reviewed, ${String(unreviewedFailures)} unreviewed), ` +
    `${String(fixedSinceReview)} fixed since review, ${String(packageNames.length - executed)} without tests.\n`,
);
const isolationRecovered = packages.filter((item) => item.isolationRecovered).map((item) => item.package);
if (isolationRecovered.length > 0) {
  // These packages failed the shared-worker run but passed a hermetic per-file re-run: the port is
  // correct and the failure was cross-file pollution. Surfaced (not silently swallowed) so a rising
  // count flags harness hermeticity debt rather than masking it.
  process.stdout.write(
    `Shared-worker pollution recovered under isolation (${String(isolationRecovered.length)}): ${isolationRecovered.join(', ')}.\n`,
  );
}
for (const [label, status] of [
  ['Reviewed parity differences', 'reviewed-failure'],
  ['Unreviewed parity differences', 'unreviewed-failure'],
  ['Fixed since review', 'fixed-since-review'],
]) {
  const names = packages.filter((item) => item.review.status === status).map((item) => item.package);
  if (names.length > 0) process.stdout.write(`${label}: ${names.join(', ')}.\n`);
}
if (failures > 0 && !strict && infrastructureFailures === 0) {
  process.stdout.write('Parity assertion differences are report-only; pass --strict to fail on them.\n');
}
process.exit(infrastructureFailures > 0 || (strict && failures > 0) ? 1 : 0);
