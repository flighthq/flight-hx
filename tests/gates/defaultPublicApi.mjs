// Default-public-API gate: prove that the target-selected `flight.*` ESM facade is an exact,
// complete forwarding view of the compiler-emitted extern contract. This is deliberately
// bidirectional so both missing wrappers and accidental public declarations fail loudly.
import { readFileSync, readdirSync, statSync } from 'node:fs';
import path from 'node:path';
import process from 'node:process';

import { collectExternSurface, collectPublicHaxeSurface } from '../../tools/backend-hx/haxeSurface.mjs';

const repoRoot = path.join(import.meta.dirname, '..', '..');
const generatedRoot = path.join(repoRoot, 'generated', 'js');
const files = filesUnder(generatedRoot)
  .filter((filename) => filename.endsWith('.hx'))
  .map((filename) => ({
    contents: readFileSync(filename, 'utf8'),
    path: portable(path.relative(generatedRoot, filename)),
  }));
const extern = collectExternSurface(files);
const public_ = collectPublicHaxeSurface(files);
const report = readJson('generated/js/default-api.json');
const manifest = readJson('generated/js/manifest.json');
const failures = [];

equal('report schema', report.schema, 'flight-hx-default-public-api/1');
compareDeclarations('type', extern.types, public_.types, typeKey, ({ typeParameters }) => typeParameters);
compareDeclarations('function', extern.functions, public_.functions, holderKey, ({ signature }) => signature);
compareDeclarations(
  'value',
  extern.values,
  public_.values,
  holderKey,
  ({ declarationKind, valueType }) => `${declarationKind}\0${valueType}`,
);

const publicFiles = files.filter(({ path: filename }) => /^flight\/[^/]+\.hx$/u.test(filename));
const publicFilesByPath = new Map(publicFiles.map((file) => [file.path, file.contents]));
for (const declaration of extern.functions) {
  const optionalParameters = declaration.parameters.filter(({ optional }) => optional);
  if (optionalParameters.length === 0) continue;
  const contents = publicFilesByPath.get(`flight/${declaration.holder}.hx`);
  const body = publicFunctionBody(contents, declaration.signature);
  for (const { name } of optionalParameters) {
    const normalization = `${name} == null ? js.Syntax.code("undefined") : ${name}`;
    if (!body.includes(normalization)) {
      failures.push(
        `function ${declaration.holder}.${declaration.publicName} does not preserve omitted ${name} as JavaScript undefined`,
      );
    }
  }
}
const holderCount = new Set([...extern.functions, ...extern.values].map(({ holder }) => holder)).size;
const packageNames = manifest.packages.map(({ package: packageName }) => packageName);
equal('summary files', report.summary.files, publicFiles.length);
equal('summary functions', report.summary.functions, extern.functions.length);
equal('summary holders', report.summary.holders, holderCount);
equal('summary packages', report.summary.packages, manifest.summary.packages);
equal('summary types', report.summary.types, extern.types.length);
equal('summary values', report.summary.values, extern.values.length);
equal('manifest summary', stable(manifest.summary.defaultPublicApi), stable(report.summary));
equal('package names', stable(report.packages.map(({ package: packageName }) => packageName)), stable(packageNames));

const reportFunctions = report.packages.flatMap((package_) =>
  package_.functions.map((entry) => ({ ...entry, publicName: entry.name, sourcePackage: package_.package })),
);
const reportValues = report.packages.flatMap((package_) =>
  package_.values.map((entry) => ({
    ...entry,
    publicName: entry.name,
    sourcePackage: package_.package,
    valueType: entry.type,
  })),
);
compareDeclarations(
  'reported function',
  extern.functions,
  reportFunctions,
  packageHolderKey,
  ({ signature, sourceName }) => `${signature}\0${sourceName}`,
);
compareDeclarations(
  'reported value',
  extern.values,
  reportValues,
  packageHolderKey,
  ({ declarationKind, sourceName, valueType }) => `${declarationKind}\0${valueType}\0${sourceName}`,
);

const reportedTypes = new Set();
for (const package_ of report.packages) {
  equal(`${package_.package} unique types`, new Set(package_.types).size, package_.types.length);
  for (const name of package_.types) reportedTypes.add(name);
}
equal(
  'reported type names',
  stable([...reportedTypes].sort(compareText)),
  stable(extern.types.map(({ publicName }) => publicName).sort(compareText)),
);

if (failures.length > 0) {
  process.stderr.write(`default-public-API gate failed:\n- ${failures.join('\n- ')}\n`);
  process.exit(1);
}
process.stdout.write(
  `default-public-API gate: ${String(report.summary.packages)} packages expose ${String(report.summary.types)} types, ` +
    `${String(report.summary.functions)} functions, and ${String(report.summary.values)} values through an exact flight.* facade.\n`,
);

function compareDeclarations(label, expected, actual, key, value) {
  const expectedIndex = indexDeclarations(label, expected, key, value);
  const actualIndex = indexDeclarations(label, actual, key, value);
  for (const [name, expectedValue] of expectedIndex) {
    if (!actualIndex.has(name)) failures.push(`${label} ${displayKey(name)} is missing`);
    else equal(`${label} ${displayKey(name)}`, actualIndex.get(name), expectedValue);
  }
  for (const name of actualIndex.keys()) {
    if (!expectedIndex.has(name)) failures.push(`${label} ${displayKey(name)} is unexpected`);
  }
}

function publicFunctionBody(contents, signature) {
  const marker = `inline ${signature} {`;
  const start = contents?.indexOf(marker) ?? -1;
  if (start < 0) return '';
  const end = contents.indexOf('\n}', start + marker.length);
  return end < 0 ? '' : contents.slice(start, end);
}

function indexDeclarations(label, declarations, key, value) {
  const result = new Map();
  for (const declaration of declarations) {
    const name = key(declaration);
    if (result.has(name)) failures.push(`${label} ${displayKey(name)} is duplicated`);
    result.set(name, value(declaration));
  }
  return result;
}

function typeKey({ publicName }) {
  return publicName;
}

function holderKey({ holder, publicName }) {
  return `${holder}\0${publicName}`;
}

function packageHolderKey({ holder, publicName, sourcePackage }) {
  return `${sourcePackage}\0${holder}\0${publicName}`;
}

function displayKey(value) {
  return value.replaceAll('\0', '.');
}

function readJson(filename) {
  return JSON.parse(readFileSync(path.join(repoRoot, filename), 'utf8'));
}

function filesUnder(directory) {
  return readdirSync(directory)
    .sort(compareText)
    .flatMap((name) => {
      const filename = path.join(directory, name);
      return statSync(filename).isDirectory() ? filesUnder(filename) : [filename];
    });
}

function portable(filename) {
  return filename.split(path.sep).join('/');
}

function stable(value) {
  return JSON.stringify(value);
}

function equal(label, actual, expected) {
  if (actual !== expected) failures.push(`${label}: ${String(actual)} != ${String(expected)}`);
}

function compareText(left, right) {
  return left < right ? -1 : left > right ? 1 : 0;
}
