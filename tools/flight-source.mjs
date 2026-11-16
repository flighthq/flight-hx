import { createHash } from 'node:crypto';
import { existsSync, mkdirSync, mkdtempSync, readFileSync, renameSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';

export const digest = (data) => createHash('sha256').update(data).digest('hex');
export function patchIdentity(root) {
  const manifest = JSON.parse(readFileSync(path.join(root, 'patches/flight/manifest.json'), 'utf8'));
  return { commit: manifest.sourceCommit, patches: manifest.patches.map((filename) => ({ path: filename, sha256: digest(readFileSync(path.join(root, filename))) })) };
}

export function preparedIdentity(directory, execute) {
  const filename = path.join(directory, '.git/flight-hx-source.json');
  if (!existsSync(filename)) throw new Error('Flight checkout is dirty; commit its source before recording generated provenance');
  const identity = JSON.parse(readFileSync(filename, 'utf8'));
  if (execute('git', ['rev-parse', 'HEAD'], directory).trim() !== identity.commit ||
      digest(execute('git', ['diff', '--binary', 'HEAD'], directory)) !== identity.diffSha256 ||
      execute('git', ['ls-files', '--others', '--exclude-standard'], directory).trim()) {
    throw new Error('Prepared Flight source changed outside the recorded producer patch');
  }
  return identity;
}

// Carry upstream changes as a reviewable patch. Never edit the rehydrated source or silently
// accept arbitrary local changes. Both Haxe and native artifacts use this same patched producer.
export function prepareFlight(root, original, execute) {
  const identity = patchIdentity(root);
  const commit = execute('git', ['rev-parse', 'HEAD'], original).trim();
  if (commit !== identity.commit) throw new Error('Flight revision does not match the native producer patch base');
  if (execute('git', ['status', '--porcelain'], original).trim()) throw new Error('Pinned Flight input checkout must be clean');
  const key = digest(JSON.stringify(identity)).slice(0, 20);
  const artifacts = path.join(root, '.artifacts');
  mkdirSync(artifacts, { recursive: true });
  const destination = path.join(artifacts, `flight-source-${key}`);
  if (!existsSync(destination)) {
    const temporary = mkdtempSync(path.join(artifacts, 'flight-source-prep-'));
    try {
      execute('git', ['-c', 'advice.detachedHead=false', 'clone', '--shared', '--quiet', original, path.join(temporary, 'repo')], root);
      const checkout = path.join(temporary, 'repo');
      for (const patch of identity.patches) execute('git', ['apply', path.join(root, patch.path)], checkout);
      // Intent-to-add makes newly emitted producer source part of the exact diff fingerprint.
      execute('git', ['add', '-N', '.'], checkout);
      const diffSha256 = digest(execute('git', ['diff', '--binary', 'HEAD'], checkout));
      writeFileSync(path.join(checkout, '.git/flight-hx-source.json'), JSON.stringify({ ...identity, diffSha256 }));
      renameSync(checkout, destination);
    } finally { rmSync(temporary, { recursive: true, force: true }); }
  }
  const actual = preparedIdentity(destination, execute);
  if (JSON.stringify(actual.patches) !== JSON.stringify(identity.patches)) throw new Error('Producer patch cache identity mismatch');
  return destination;
}
