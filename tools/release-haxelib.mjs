// Haxelib release driver, meant to run from a tag-triggered CI job (and
// locally with --dry-run). The flow is deliberately strict:
//
//   1. The pushed tag must equal `v<haxelib.json version>` exactly. The
//      version is committed before tagging, so the published artifact is
//      reproducible from the tree; a mismatch fails loudly instead of
//      rewriting files during release.
//   2. `npm run package` builds AND validates the zip (isolated haxelib
//      install, consumer compile and run) — the same gate that runs in
//      development, so the only step unique to release is the upload.
//   3. `haxelib submit` runs with credentials from HAXELIB_USERNAME /
//      HAXELIB_PASSWORD, fed over stdin. `--dry-run` stops before the upload
//      so the whole flow short of submission is rehearsable anywhere.
//
//   node tools/release-haxelib.mjs --tag v0.1.0 [--dry-run]
import { spawnSync } from 'node:child_process';
import { existsSync, readFileSync } from 'node:fs';
import path from 'node:path';

const workspace = path.resolve(path.dirname(new URL(import.meta.url).pathname), '..');
const args = process.argv.slice(2);
const argValue = (flag) => {
  const index = args.indexOf(flag);
  return index >= 0 ? args[index + 1] : undefined;
};
const dryRun = args.includes('--dry-run');
const tag = argValue('--tag') ?? process.env.GITHUB_REF_NAME;

if (!tag) fail('no tag: pass --tag v<version> or set GITHUB_REF_NAME');
const metadata = JSON.parse(readFileSync(path.join(workspace, 'haxelib.json'), 'utf8'));
const expected = `v${metadata.version}`;
if (tag !== expected) {
  fail(
    `tag ${tag} does not match haxelib.json version ${metadata.version} (expected tag ${expected}); ` +
      'commit the version bump before tagging',
  );
}

run('npm', ['run', 'package']);
const artifact = path.join(workspace, 'build', 'package', `${metadata.name}-${metadata.version}.zip`);
if (!existsSync(artifact)) fail(`packaged artifact missing: ${artifact}`);

if (dryRun) {
  process.stdout.write(`Dry run: ${path.relative(workspace, artifact)} is ready for haxelib submit (${tag}).\n`);
  process.exit(0);
}

const username = process.env.HAXELIB_USERNAME;
const password = process.env.HAXELIB_PASSWORD;
if (!username || !password) fail('HAXELIB_USERNAME and HAXELIB_PASSWORD must be set for a real submit');
const haxeDirectory = path.join(workspace, '.haxe', '4.3.7');
const submit = spawnSync(path.join(haxeDirectory, 'haxelib'), ['submit', artifact], {
  cwd: workspace,
  env: { ...process.env, PATH: `${haxeDirectory}${path.delimiter}${process.env.PATH ?? ''}` },
  input: `${username}\n${password}\n`,
  encoding: 'utf8',
});
process.stdout.write(submit.stdout ?? '');
process.stderr.write(submit.stderr ?? '');
if (submit.status !== 0) fail(`haxelib submit exited with status ${String(submit.status)}`);
process.stdout.write(`Published ${metadata.name} ${metadata.version} to haxelib.\n`);

function run(command, commandArguments) {
  const result = spawnSync(command, commandArguments, { cwd: workspace, stdio: 'inherit' });
  if (result.status !== 0) fail(`${command} ${commandArguments.join(' ')} exited with status ${String(result.status)}`);
}

function fail(message) {
  process.stderr.write(`release-haxelib: ${message}\n`);
  process.exit(1);
}
