// Example fleet smoke gate: every example must BUILD, RUN without a runtime
// error, and (on native windowed targets) present a NOT-BLANK frame.
//
//   node tools/examples-smoke.mjs --target neko|html5|linux|all [--filter name]
//     [--resume] [--modes gl,cairo]
//
// html5 is build-only (no headless browser here; the capture harness covers
// pixels for web). Native targets run each binary under Xvfb, scrape the
// window with `import`, and reject single-color frames via ImageMagick's
// standard deviation. Results land in build/examples-smoke-<target>.json and
// a non-zero exit means at least one example failed — no silent truncation.
import { execFileSync, execSync } from 'node:child_process';
import { existsSync, mkdirSync, readdirSync, readFileSync, writeFileSync } from 'node:fs';
import path from 'node:path';

const repo = path.resolve(path.dirname(new URL(import.meta.url).pathname), '..');
const args = process.argv.slice(2);
const opt = (name, fallback = null) => {
  const index = args.indexOf(`--${name}`);
  return index >= 0 ? args[index + 1] : fallback;
};
const flag = (name) => args.includes(`--${name}`);

const targetArg = opt('target', 'all');
const targets = targetArg === 'all' ? ['neko', 'html5', 'linux'] : targetArg.split(',');
const filter = opt('filter');
const modes = opt('modes', 'gl,cairo').split(',');
const resume = flag('resume');

// Examples that only implement the GL path (no cairo branch).
const GL_ONLY = new Set(['scene3d', 'skeleton']);
const RUN_SECONDS = 10;
const BUILD_SECONDS = 600;

const examples = readdirSync(path.join(repo, 'examples'), { withFileTypes: true })
  .filter((entry) => entry.isDirectory() && existsSync(path.join(repo, 'examples', entry.name, 'project.xml')))
  .map((entry) => entry.name)
  .filter((name) => !filter || name.includes(filter))
  .sort();

const env = {
  ...process.env,
  HAXELIB_PATH: path.join(repo, '.haxelib'),
  PATH: `${path.join(repo, 'node_modules', '.bin')}:${process.env.PATH}`,
};

function sh(command, timeoutSeconds) {
  return execSync(command, { env, timeout: timeoutSeconds * 1000, stdio: 'pipe' }).toString();
}

function frameStdDev(pngPath) {
  const out = execFileSync('convert', [pngPath, '-format', '%[fx:standard_deviation]', 'info:'], {
    timeout: 30_000,
  }).toString();
  return Number.parseFloat(out);
}

function smokeOne(example, target, mode) {
  const defines = mode === 'cairo' ? '-Dcairo' : '-Dnoaa';
  const cwd = path.join(repo, 'examples', example);
  try {
    sh(`cd ${cwd} && haxelib run lime build ${target} ${target === 'html5' ? '' : defines}`, BUILD_SECONDS);
  } catch (error) {
    return { status: 'BUILDFAIL', detail: String(error.stderr || error.message).slice(-400) };
  }
  if (target === 'html5') return { status: 'OK', detail: 'build-only' };

  const binDir = path.join(cwd, 'bin', target, 'bin');
  const binary = readdirSync(binDir).find((f) => f.startsWith('Flight') && !f.includes('.'));
  if (!binary) return { status: 'NOBIN', detail: binDir };

  const log = `/tmp/smoke-${example}-${target}-${mode}.log`;
  const shot = `/tmp/smoke-${example}-${target}-${mode}.png`;
  const script = [
    `cd ${binDir}`,
    `LIBGL_ALWAYS_SOFTWARE=1 ./${binary} > ${log} 2>&1 & APP=$!`,
    `sleep ${RUN_SECONDS - 2}`,
    `WID=$(xwininfo -root -tree 2>/dev/null | grep -i flight | grep -o "0x[0-9a-f]*" | head -1)`,
    `[ -n "$WID" ] && import -window $WID ${shot} 2>/dev/null`,
    `kill $APP 2>/dev/null; true`,
  ].join(' && ');
  try {
    execSync(`xvfb-run -a -s "-screen 0 1024x768x24" bash -c '${script}'`, {
      env,
      timeout: (RUN_SECONDS + 20) * 1000,
      stdio: 'pipe',
    });
  } catch {
    // Fall through: the log and screenshot checks decide.
  }

  const runLog = existsSync(log) ? readFileSync(log, 'utf8') : '';
  const errorLine = runLog
    .split('\n')
    .find((line) => /Uncaught|Error :|Called from|no method/.test(line) && !/ALSA/.test(line));
  if (errorLine) return { status: 'RUNERR', detail: errorLine.slice(0, 200) };
  if (!existsSync(shot)) return { status: 'NOWINDOW', detail: 'no capturable window' };
  const deviation = frameStdDev(shot);
  if (!(deviation > 0.005)) return { status: 'BLANK', detail: `frame stddev ${deviation}` };
  return { status: 'OK', detail: `stddev ${deviation.toFixed(4)}` };
}

let failures = 0;
mkdirSync(path.join(repo, 'build'), { recursive: true });
for (const target of targets) {
  const resultsPath = path.join(repo, 'build', `examples-smoke-${target}.json`);
  const results = resume && existsSync(resultsPath) ? JSON.parse(readFileSync(resultsPath, 'utf8')) : {};
  const targetModes = target === 'html5' ? ['build'] : modes;
  for (const example of examples) {
    for (const mode of targetModes) {
      if (mode === 'cairo' && GL_ONLY.has(example)) continue;
      const key = `${example}/${mode}`;
      if (resume && results[key]?.status === 'OK') continue;
      const outcome = smokeOne(example, target, mode);
      results[key] = outcome;
      writeFileSync(resultsPath, JSON.stringify(results, null, 2));
      const line = `${target} ${key}: ${outcome.status}${outcome.status === 'OK' ? '' : ` — ${outcome.detail}`}`;
      // eslint-disable-next-line no-console -- CLI progress output is intentional.
      console.log(line);
      if (outcome.status !== 'OK') failures++;
    }
  }
}
// eslint-disable-next-line no-console -- CLI summary output is intentional.
console.log(failures === 0 ? 'SMOKE OK' : `SMOKE FAILED: ${failures} failing entries`);
process.exit(failures === 0 ? 0 : 1);
