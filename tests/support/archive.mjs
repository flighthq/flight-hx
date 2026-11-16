import assert from 'node:assert/strict';
import { mkdirSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { inflateRawSync } from 'node:zlib';

// Read our deterministic ZIP32 output without an OS-specific archive command.
export function unpack(bytes, directory) {
  const entries = [];
  let offset = 0;
  while (bytes.readUInt32LE(offset) === 0x04034b50) {
    assert.equal(bytes.readUInt16LE(offset + 6), 0x0800);
    assert.equal(bytes.readUInt16LE(offset + 8), 8);
    const size = bytes.readUInt32LE(offset + 18);
    const expected = bytes.readUInt32LE(offset + 22);
    const nameSize = bytes.readUInt16LE(offset + 26);
    const extraSize = bytes.readUInt16LE(offset + 28);
    const name = bytes.subarray(offset + 30, offset + 30 + nameSize).toString('utf8');
    assert.ok(!name.startsWith('/') && !name.includes('\\') && !name.split('/').includes('..'));
    assert.ok(!entries.includes(name), `duplicate archive path: ${name}`);
    const start = offset + 30 + nameSize + extraSize;
    const contents = inflateRawSync(bytes.subarray(start, start + size));
    assert.equal(contents.length, expected);
    const target = path.join(directory, name);
    mkdirSync(path.dirname(target), { recursive: true });
    writeFileSync(target, contents);
    entries.push(name);
    offset = start + size;
  }
  assert.equal(bytes.readUInt32LE(offset), 0x02014b50);
  return entries;
}
