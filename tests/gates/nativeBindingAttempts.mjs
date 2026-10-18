// Load every holder containing a symbol-backed function or value that flight-compiler refused.
// This is deliberately a Haxe C++-target typecheck, not a claim that every attempted ABI carrier
// already survives hxcpp/C++ compilation; binding-attempts.json preserves that distinction.
import { existsSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import path from 'node:path';
import process from 'node:process';
import { spawnSync } from 'node:child_process';

const root = path.join(import.meta.dirname, '..', '..');
const report = JSON.parse(readFileSync(path.join(root, 'src-cpp', 'binding-attempts.json'), 'utf8'));
if (report.schema !== 'flight-hx-native-binding-attempts/1') fail(`unknown report schema ${String(report.schema)}`);
const arrayProbe = report.compileProbes?.find(
  ({ publicName }) => publicName === 'flight.Adjustments.createBrightnessColorMatrix',
);
if (
  !arrayProbe ||
  arrayProbe.haxeCodeGeneration !== 'pass' ||
  arrayProbe.cppCompilation !== 'failed-as-classified' ||
  arrayProbe.requiredAdapter !== 'flight-array-to-hxcpp-array' ||
  !arrayProbe.diagnostic.includes("flight::Array<double>") ||
  !readFileSync(path.join(root, arrayProbe.fixture), 'utf8').includes('createBrightnessColorMatrix(0.5)')
) {
  fail('native Array carrier compile-probe classification is missing or stale');
}
if (!Array.isArray(report.summary.carrierFamilies) || report.summary.carrierFamilies.length === 0) {
  fail('native binding attempts do not classify their carrier families');
}
const externClasses = new Set(report.declarations.map(({ externClass }) => externClass));
if (externClasses.size !== report.summary.isolatedExterns || externClasses.size !== report.summary.total) {
  fail('native binding attempts are not isolated one-per-extern');
}
for (const externClass of externClasses) {
  const filename = path.join(root, 'src', ...externClass.split('.')) + '.hx';
  if (!existsSync(filename)) fail(`isolated native attempt extern is missing: ${externClass}`);
}

const holders = new Map();
for (const declaration of report.declarations) {
  const match = /^flight\.([A-Za-z_][A-Za-z0-9_]*)\.([A-Za-z_][A-Za-z0-9_]*)$/u.exec(declaration.publicName);
  if (!match) fail(`unsupported attempted binding name ${declaration.publicName}`);
  if (!holders.has(match[1])) holders.set(match[1], match[2]);
}

const temporaryRoot = mkdtempSync(path.join(tmpdir(), 'flight-hx-native-binding-attempts-'));
try {
  const imports = [...holders]
    .sort(([left], [right]) => compareText(left, right))
    .map(([holder, field], index) => `import flight.${holder}.${field} as attempt${String(index)};`);
  writeFileSync(
    path.join(temporaryRoot, 'NativeBindingAttempts.hx'),
    [...imports, '', 'class NativeBindingAttempts {', '  static function main():Void {}', '}', ''].join('\n'),
  );

  const haxeRoot = path.join(root, '.haxe', '4.3.7');
  const haxe = path.join(haxeRoot, process.platform === 'win32' ? 'haxe.exe' : 'haxe');
  const environment = {
    ...process.env,
    HAXELIB_PATH: path.join(root, '.haxelib'),
    HAXE_STD_PATH: path.join(haxeRoot, 'std'),
    PATH: `${haxeRoot}${path.delimiter}${process.env.PATH ?? ''}`,
  };
  const result = spawnSync(
    haxe,
    [
      '-cp',
      path.join(root, 'src'),
      '-cp',
      path.join(root, 'src-cpp'),
      '-cp',
      temporaryRoot,
      '--main',
      'NativeBindingAttempts',
      '-cpp',
      path.join(temporaryRoot, 'cpp'),
      '--no-output',
      '-D',
      `flight_cpp_root=${path.join(root, '.dependencies', 'flight-cpp')}`,
      '-D',
      `flight_hx_root=${root}`,
    ],
    { cwd: temporaryRoot, encoding: 'utf8', env: environment },
  );
  if (result.status !== 0) fail(`complete native function/value attempt surface does not type-check:\n${result.stdout}${result.stderr}`);

  process.stdout.write(
    `native-binding-attempt gate: ${String(report.summary.functions)} function and ` +
      `${String(report.summary.values)} value attempts across ${String(report.summary.holders)} holders type-check ` +
      `on the C++ target through ${String(report.summary.isolatedExterns)} per-symbol externs; ` +
      `${String(report.compileProbes.length)} actual hxcpp probe(s) retain classified adapter failures.\n`,
  );
} finally {
  rmSync(temporaryRoot, { force: true, recursive: true });
}

function compareText(left, right) {
  return left < right ? -1 : left > right ? 1 : 0;
}

function fail(message) {
  process.stderr.write(`${message}\n`);
  process.exit(1);
}
