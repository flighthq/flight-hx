import {
  closeSync,
  mkdirSync,
  openSync,
  readFileSync,
  readdirSync,
  renameSync,
  rmSync,
  writeSync,
} from 'node:fs';
import path from 'node:path';
import process from 'node:process';
import { deflateRawSync } from 'node:zlib';

// Haxelib consumes ordinary ZIP archives, but Node has no built-in ZIP container writer. This
// small deterministic ZIP32 writer keeps packaging dependency-free: fixed timestamps, sorted paths,
// fixed compression, and an explicit consumer-only allowlist. It deliberately supports only the
// regular files in this SDK (well below ZIP32 limits).

const root = path.resolve(import.meta.dirname, '..');
const manifest = JSON.parse(readFileSync(path.join(root, 'haxelib.json'), 'utf8'));
const crcTable = Array.from({ length: 256 }, (_, value) => {
  let entry = value;
  for (let bit = 0; bit < 8; bit += 1) entry = entry & 1 ? 0xedb88320 ^ (entry >>> 1) : entry >>> 1;
  return entry >>> 0;
});
const options = process.argv.slice(2);
const outputOption = options.indexOf('--out');
const unknown = options.filter((option, index) => option !== '--out' && index !== outputOption + 1);
if (unknown.length > 0 || (outputOption !== -1 && options[outputOption + 1] === undefined)) {
  process.stderr.write('Usage: node tools/package-haxelib.mjs [--out <archive.zip>]\n');
  process.exit(2);
}
const output = path.resolve(
  outputOption === -1 ? path.join(root, 'dist', `flight-${manifest.version}.zip`) : options[outputOption + 1],
);
const temporary = `${output}.tmp-${String(process.pid)}`;
const files = packageFiles();
const centralDirectory = [];
let archive;
let offset = 0;

mkdirSync(path.dirname(output), { recursive: true });
try {
  archive = openSync(temporary, 'w');
  for (const filename of files) {
    const name = Buffer.from(portable(filename), 'utf8');
    const contents = readFileSync(path.join(root, filename));
    const compressed = deflateRawSync(contents, { level: 9 });
    const checksum = crc32(contents);
    const localOffset = offset;
    const local = Buffer.alloc(30);
    local.writeUInt32LE(0x04034b50, 0);
    local.writeUInt16LE(20, 4);
    local.writeUInt16LE(0x0800, 6);
    local.writeUInt16LE(8, 8);
    local.writeUInt16LE(0, 10);
    local.writeUInt16LE(0x0021, 12);
    local.writeUInt32LE(checksum, 14);
    local.writeUInt32LE(compressed.length, 18);
    local.writeUInt32LE(contents.length, 22);
    local.writeUInt16LE(name.length, 26);
    local.writeUInt16LE(0, 28);
    write(local);
    write(name);
    write(compressed);

    const central = Buffer.alloc(46);
    central.writeUInt32LE(0x02014b50, 0);
    central.writeUInt16LE(0x0314, 4);
    central.writeUInt16LE(20, 6);
    central.writeUInt16LE(0x0800, 8);
    central.writeUInt16LE(8, 10);
    central.writeUInt16LE(0, 12);
    central.writeUInt16LE(0x0021, 14);
    central.writeUInt32LE(checksum, 16);
    central.writeUInt32LE(compressed.length, 20);
    central.writeUInt32LE(contents.length, 24);
    central.writeUInt16LE(name.length, 28);
    central.writeUInt16LE(0, 30);
    central.writeUInt16LE(0, 32);
    central.writeUInt16LE(0, 34);
    central.writeUInt16LE(0, 36);
    central.writeUInt32LE((0o100644 << 16) >>> 0, 38);
    central.writeUInt32LE(localOffset, 42);
    centralDirectory.push(central, name);
  }
  const centralOffset = offset;
  for (const block of centralDirectory) write(block);
  const centralSize = offset - centralOffset;
  const end = Buffer.alloc(22);
  end.writeUInt32LE(0x06054b50, 0);
  end.writeUInt16LE(0, 4);
  end.writeUInt16LE(0, 6);
  end.writeUInt16LE(files.length, 8);
  end.writeUInt16LE(files.length, 10);
  end.writeUInt32LE(centralSize, 12);
  end.writeUInt32LE(centralOffset, 16);
  end.writeUInt16LE(0, 20);
  write(end);
  closeSync(archive);
  archive = undefined;
  renameSync(temporary, output);
} catch (error) {
  if (archive !== undefined) closeSync(archive);
  rmSync(temporary, { force: true });
  throw error;
}

process.stdout.write(
  `Haxelib archive: ${portable(path.relative(root, output))} (${String(files.length)} files, ${String(offset)} bytes).\n`,
);

function packageFiles() {
  const roots = ['examples', 'generated', 'lib', 'src', 'src-cpp'];
  const fixed = ['AGENTS.md', 'extraParams.hxml', 'haxelib.json', 'LICENSE.md', 'README.md'];
  const esm = filesUnder('tools/esm').filter((filename) => filename.endsWith('.hx'));
  const result = [...fixed, ...roots.flatMap(filesUnder), ...esm].sort(compareText);
  if (result.length > 0xffff) throw new Error('Haxelib archive exceeds the ZIP32 entry limit');
  return result;
}

function filesUnder(relativeDirectory) {
  const directory = path.join(root, relativeDirectory);
  return readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    const relative = path.join(relativeDirectory, entry.name);
    return entry.isDirectory() ? filesUnder(relative) : [relative];
  });
}

function write(buffer) {
  if (offset + buffer.length > 0xffffffff) throw new Error('Haxelib archive exceeds the ZIP32 size limit');
  let written = 0;
  while (written < buffer.length) written += writeSync(archive, buffer, written, buffer.length - written);
  offset += buffer.length;
}

function crc32(buffer) {
  let checksum = 0xffffffff;
  for (const byte of buffer) checksum = crcTable[(checksum ^ byte) & 0xff] ^ (checksum >>> 8);
  return (checksum ^ 0xffffffff) >>> 0;
}

function portable(filename) {
  return filename.split(path.sep).join('/');
}

function compareText(left, right) {
  return left.localeCompare(right, 'en');
}
