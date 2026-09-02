import { spawnSync } from 'node:child_process';
import path from 'node:path';
import process from 'node:process';

const pairCount = readPositiveInt(process.env.FLIGHT_SCENE3D_BENCH_PAIRS, 5);
const variants = [
  { define: undefined, name: 'candidate' },
  { define: 'flight_struct_typedef', name: 'typedef-baseline' },
];

for (const variant of variants) compile(variant);

const samples = Object.fromEntries(variants.map((variant) => [variant.name, []]));
let expectedChecksum;
for (let pair = 0; pair < pairCount; pair++) {
  const order = pair % 2 === 0 ? variants : variants.toReversed();
  for (const variant of order) {
    const sample = run(variant);
    expectedChecksum ??= sample.checksum;
    if (Math.abs(sample.checksum - expectedChecksum) > 1e-6) {
      throw new Error(`${variant.name} checksum ${sample.checksum} did not match ${expectedChecksum}`);
    }
    samples[variant.name].push(sample.elapsedMs);
  }
}

const candidateMedianMs = median(samples.candidate);
const typedefBaselineMedianMs = median(samples['typedef-baseline']);
const pairedClassGainsPercent = samples.candidate.map(
  (candidateMs, index) =>
    ((samples['typedef-baseline'][index] - candidateMs) / samples['typedef-baseline'][index]) * 100,
);
process.stdout.write(
  `${JSON.stringify({
    candidateMedianMs,
    candidateSamplesMs: samples.candidate,
    medianPairedClassGainPercent: median(pairedClassGainsPercent),
    pairCount,
    pairedClassGainsPercent,
    typedefBaselineMedianMs,
    typedefBaselineSamplesMs: samples['typedef-baseline'],
  })}\n`,
);

function compile(variant) {
  const arguments_ = [
    'tools/haxe.mjs',
    '-cp',
    'src',
    '-cp',
    'generated',
    '-cp',
    'tests/haxe',
    '--main',
    'Scene3DPrepareBench',
    '--cpp',
    outputDirectory(variant),
    '-D',
    'analyzer-optimize',
  ];
  if (variant.define) arguments_.push('-D', variant.define);
  const result = spawnSync(process.execPath, arguments_, { cwd: process.cwd(), stdio: 'inherit' });
  if (result.error) throw result.error;
  if (result.status !== 0) process.exit(result.status ?? 1);
}

function run(variant) {
  const suffix = process.platform === 'win32' ? '.exe' : '';
  const executable = path.join(outputDirectory(variant), `Scene3DPrepareBench${suffix}`);
  const result = spawnSync(executable, { cwd: process.cwd(), encoding: 'utf8' });
  if (result.error) throw result.error;
  if (result.status !== 0) {
    process.stderr.write(result.stderr);
    process.exit(result.status ?? 1);
  }
  process.stdout.write(`${variant.name}: ${result.stdout.trim()}\n`);
  return JSON.parse(result.stdout.trim().split(/\r?\n/).at(-1));
}

function outputDirectory(variant) {
  return path.join('build', 'bench-scene3d-prepare', variant.name);
}

function median(values) {
  const sorted = values.toSorted((a, b) => a - b);
  const middle = Math.floor(sorted.length / 2);
  return sorted.length % 2 === 0 ? (sorted[middle - 1] + sorted[middle]) / 2 : sorted[middle];
}

function readPositiveInt(value, fallback) {
  const parsed = Number.parseInt(value ?? '', 10);
  return Number.isInteger(parsed) && parsed > 0 ? parsed : fallback;
}
