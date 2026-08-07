// Derives the Cairo-named alias surface from the generated canvas packages.
//
// Native Lime rendering runs the canvas backends over cairo, so the natural
// native spelling of the 2D API is Cairo-named. This tool mechanically mirrors
// the generated package facades (`Scene2dCanvas`, `EffectsCanvas`) into
// maintained alias modules (`flighthq.scene2dCairo.Scene2dCairo`,
// `flighthq.effectsCairo.EffectsCairo`) whose every entry point forwards
// inline to the canvas original under a Canvas->Cairo rename, plus typedef
// aliases for the Canvas-named canonical types (`flighthq.types.CairoX`).
// `textshaperCanvas` is deliberately not mirrored: its entire static surface
// is contract-only (`@:noCompletion`), and the protected channel must not be
// re-exposed under new names.
//
// The output is committed under `src/` and this tool is the source of truth
// for it: run with no arguments to refresh, `--check` to fail loudly when the
// committed aliases drift from the current generated surface (wired into
// `npm run check`). Hand edits to the derived files are not allowed.
import { mkdirSync, readdirSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';

const workspace = path.resolve(path.dirname(new URL(import.meta.url).pathname), '..');
const checkOnly = process.argv.includes('--check');

const FACADES = [
  {
    cairoModule: 'Scene2dCairo',
    cairoPackage: 'scene2dCairo',
    canvasModule: 'Scene2dCanvas',
    canvasPackage: 'scene2dCanvas',
  },
  {
    cairoModule: 'EffectsCairo',
    cairoPackage: 'effectsCairo',
    canvasModule: 'EffectsCanvas',
    canvasPackage: 'effectsCanvas',
  },
];

const header = '// Derived by tools/derive-cairo-aliases.mjs from the generated canvas surface. Do not edit.\n';

function renamed(name) {
  const replaced = name.replaceAll('Canvas', 'Cairo').replaceAll('canvas', 'cairo');
  return replaced;
}

/** Split a parameter list on top-level commas, respecting <>, (), and {} nesting. */
function splitParameters(list) {
  const parts = [];
  let depth = 0;
  let current = '';
  for (const character of list) {
    if ('<({['.includes(character)) depth += 1;
    else if ('>)}]'.includes(character)) depth -= 1;
    if (character === ',' && depth === 0) {
      parts.push(current.trim());
      current = '';
    } else {
      current += character;
    }
  }
  if (current.trim() !== '') parts.push(current.trim());
  return parts;
}

function parameterName(parameter) {
  const withoutRest = parameter.startsWith('...') ? parameter.slice(3) : parameter;
  const withoutOptional = withoutRest.startsWith('?') ? withoutRest.slice(1) : withoutRest;
  const colon = withoutOptional.indexOf(':');
  const name = (colon === -1 ? withoutOptional : withoutOptional.slice(0, colon)).trim();
  if (!/^[A-Za-z_]\w*$/u.test(name)) {
    throw new Error(`derive-cairo-aliases: cannot extract a parameter name from "${parameter}"`);
  }
  return parameter.startsWith('...') ? `...${name}` : name;
}

/** Find the top-level close paren matching the open paren at `start`. */
function matchParen(text, start) {
  let depth = 0;
  for (let index = start; index < text.length; index += 1) {
    if (text[index] === '(') depth += 1;
    else if (text[index] === ')') {
      depth -= 1;
      if (depth === 0) return index;
    }
  }
  throw new Error('derive-cairo-aliases: unbalanced parentheses in a facade signature');
}

function deriveFacade({ cairoModule, cairoPackage, canvasModule, canvasPackage }) {
  const source = readFileSync(
    path.join(workspace, 'generated', 'flighthq', canvasPackage, `${canvasModule}.hx`),
    'utf8',
  );
  const imports = source
    .split('\n')
    .filter((line) => line.startsWith('import '))
    .join('\n');
  const qualified = `flighthq.${canvasPackage}.${canvasModule}`;
  const lines = [];

  const functionPattern = /^ {2}public static function ([A-Za-z_]\w*)(<[^>]+>)?\(/gmu;
  for (const match of source.matchAll(functionPattern)) {
    const [, name, generics] = match;
    if (name.includes('__')) continue;
    const open = match.index + match[0].length - 1;
    const close = matchParen(source, open);
    const parameters = source.slice(open + 1, close);
    const returnMatch = /^:((?:[^({\n]|\([^)]*\))*?)\s*\{/u.exec(source.slice(close + 1));
    if (!returnMatch) {
      throw new Error(`derive-cairo-aliases: cannot read the return type of ${canvasModule}.${name}`);
    }
    const returnType = returnMatch[1].trim();
    const argumentNames = splitParameters(parameters).map(parameterName).join(', ');
    const call = `${qualified}.${name}(${argumentNames})`;
    const body = returnType === 'Void' ? `{ ${call}; }` : `{ return ${call}; }`;
    lines.push(
      `  public static inline function ${renamed(name)}${generics ?? ''}(${parameters}):${returnType} ${body}`,
    );
  }

  const finalPattern = /^ {2}public static final ([A-Za-z_]\w*):((?:[^=<\n]|<[^>]*>)*?) = /gmu;
  for (const match of source.matchAll(finalPattern)) {
    const [, name, type] = match;
    if (name.includes('__')) continue;
    const alias = renamed(name);
    lines.push(`  public static var ${alias}(get, never):${type.trim()};`);
    lines.push(`  static inline function get_${alias}():${type.trim()} return ${qualified}.${name};`);
  }

  if (lines.length === 0) throw new Error(`derive-cairo-aliases: ${canvasModule} yielded no aliases`);
  const module = `${header}package flighthq.${cairoPackage};\n\n${imports}\n\nclass ${cairoModule} {\n${lines.join('\n')}\n}\n`;
  return { content: module, relative: path.join('src', 'flighthq', cairoPackage, `${cairoModule}.hx`) };
}

function deriveTypes() {
  const typesDirectory = path.join(workspace, 'generated', 'flighthq', 'types');
  const outputs = [];
  const names = readdirSync(typesDirectory)
    .filter((name) => name.endsWith('.hx') && name.includes('Canvas'))
    .sort();
  // A module may declare its primary type plus secondary types (or only
  // secondaries); alias every declared Canvas-named type through the dotted
  // module path, which resolves both forms uniformly.
  const declarationPattern =
    /^(?:@:\w+(?:\([^)]*\))?\s+)*(?:typedef|class|interface|enum(?: abstract)?|abstract) ([A-Za-z_]\w*)(<[^>]+>)?/gmu;
  for (const fileName of names) {
    const moduleName = fileName.slice(0, -3);
    const source = readFileSync(path.join(typesDirectory, fileName), 'utf8');
    for (const match of source.matchAll(declarationPattern)) {
      const [, typeName, generics] = match;
      if (!typeName.includes('Canvas') || typeName.includes('__')) continue;
      const alias = renamed(typeName);
      const genericNames = generics
        ? `<${splitParameters(generics.slice(1, -1))
            .map((parameter) => parameter.split(':')[0].trim())
            .join(', ')}>`
        : '';
      const content = `${header}package flighthq.types;\n\ntypedef ${alias}${generics ?? ''} = flighthq.types.${moduleName}.${typeName}${genericNames};\n`;
      outputs.push({ content, relative: path.join('src', 'flighthq', 'types', `${alias}.hx`) });
    }
  }
  if (outputs.length === 0) throw new Error('derive-cairo-aliases: no Canvas-named canonical types found');
  return outputs;
}

const derived = [...FACADES.map(deriveFacade), ...deriveTypes()];
const derivedByPath = new Map(derived.map((entry) => [entry.relative, entry.content]));

const OWNED_DIRECTORIES = ['src/flighthq/scene2dCairo', 'src/flighthq/effectsCairo'];
const ownedFiles = new Set(derivedByPath.keys());
const stale = [];
for (const directory of OWNED_DIRECTORIES) {
  let entries = [];
  try {
    entries = readdirSync(path.join(workspace, directory));
  } catch {
    continue;
  }
  for (const entry of entries) {
    const relative = path.join(directory, entry);
    if (!ownedFiles.has(relative)) stale.push(relative);
  }
}
let typeEntries = [];
try {
  typeEntries = readdirSync(path.join(workspace, 'src', 'flighthq', 'types'));
} catch {
  // No maintained type aliases yet.
}
for (const entry of typeEntries) {
  const relative = path.join('src', 'flighthq', 'types', entry);
  if (entry.startsWith('Cairo') && !ownedFiles.has(relative)) stale.push(relative);
}

const drift = [];
for (const [relative, content] of derivedByPath) {
  let existing = null;
  try {
    existing = readFileSync(path.join(workspace, relative), 'utf8');
  } catch {
    existing = null;
  }
  if (existing !== content) drift.push(relative);
}

if (checkOnly) {
  if (drift.length > 0 || stale.length > 0) {
    for (const relative of drift) process.stderr.write(`cairo aliases drift: ${relative}\n`);
    for (const relative of stale) process.stderr.write(`cairo aliases stale file: ${relative}\n`);
    process.stderr.write('Run `npm run cairo:aliases` and commit the result.\n');
    process.exit(1);
  }
  process.stdout.write(`Cairo aliases are current (${String(derivedByPath.size)} files).\n`);
  process.exit(0);
}

for (const relative of stale) rmSync(path.join(workspace, relative));
for (const [relative, content] of derivedByPath) {
  mkdirSync(path.dirname(path.join(workspace, relative)), { recursive: true });
  writeFileSync(path.join(workspace, relative), content);
}
process.stdout.write(
  `Derived ${String(derivedByPath.size)} Cairo alias files (${String(drift.length)} updated, ${String(stale.length)} removed).\n`,
);
