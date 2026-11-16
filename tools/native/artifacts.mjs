import { existsSync, readFileSync, readdirSync } from 'node:fs';
import path from 'node:path';
import { digest } from '../flight-source.mjs';

const targets = JSON.parse(readFileSync(new URL('./platforms.json', import.meta.url), 'utf8'));
export function nativePayload(root, { allowEmpty = false } = {}) {
  const directory = path.join(root, 'native/artifacts');
  const manifests = existsSync(directory) ? readdirSync(directory).filter((name) => name.endsWith('.json')).sort() : [];
  if (!manifests.length && !allowEmpty) throw new Error('No staged Flight binaries. Run npm run native:build, or use --externs-only for a bindings-only archive.');
  const provenance = readFileSync(path.join(root, 'generated/externs/provenance.json'));
  const parsed = JSON.parse(provenance);
  const source = parsed.source;
  const files = new Set();
  for (const filename of manifests) {
    const manifestPath = `native/artifacts/${filename}`;
    const m = JSON.parse(readFileSync(path.join(root, manifestPath), 'utf8'));
    const target = targets[m.platform];
    if (m.schema !== 'flight-native-artifacts/1' || !target || filename !== `${m.platform}.json` || target.triple !== m.triple) throw new Error(`Invalid native artifact identity: ${filename}`);
    if (m.externProvenanceSha256 !== digest(provenance) || JSON.stringify(m.source) !== JSON.stringify(source)) throw new Error(`Stale Flight binaries: ${filename}`);
    const required = ['native/include/flight_ffi.h'];
    if (target.static) required.push(`native/lib/${m.platform}/${target.static}`);
    else required.push(`native/bin/${m.platform}/${target.shared}`);
    if (target.importLibrary) required.push(`native/lib/${m.platform}/${target.importLibrary}`);
    if (m.hashLink) {
      if (target.static) throw new Error('This package supports HashLink adapters only on desktop');
      required.push(`ndll/${m.platform}/flight.hdll`);
    }
    if (parsed.nativeHeaderSha256 && m.files.find((file) => file.path === 'native/include/flight_ffi.h')?.sha256 !== parsed.nativeHeaderSha256) throw new Error('Native header differs from the extern ABI provenance');
    const actual = m.files.map((file) => file.path).sort();
    if (JSON.stringify(actual) !== JSON.stringify(required.sort())) throw new Error(`Incomplete or unexpected native payload: ${filename}`);
    for (const file of m.files) {
      const contents = readFileSync(path.join(root, file.path));
      if (contents.length !== file.size || digest(contents) !== file.sha256) throw new Error(`Changed native artifact: ${file.path}`);
      if (m.platform.startsWith('Linux') && (file.path.endsWith('.so') || file.path.endsWith('.hdll'))) {
        if (contents.subarray(0, 4).toString('hex') !== '7f454c46' || contents[4] !== 2 || contents[5] !== 1 ||
            contents.readUInt16LE(18) !== (m.platform === 'Linux64' ? 62 : 183)) throw new Error(`Wrong Linux binary architecture: ${file.path}`);
      }
      files.add(file.path);
    }
    files.add(manifestPath);
  }
  return [...files].sort();
}
