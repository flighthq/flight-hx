// hostWeb browser smoke: loads the compiled Flight SDK (build/haxe-js/flight.cjs)
// in a REAL headless Chromium (SwiftShader) and asserts two things node + jsdom
// cannot give: (1) the `flight` global initializes with its expected public
// facades in a browser, and (2) a real WebGL2 context renders + reads back green
// — the web analog of the Clay native GL smoke. Exits non-zero on any failure so
// CI fails loudly. See tests/host-web/browser-smoke/README.md.
import { chromium } from 'playwright';
import { readFileSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, resolve } from 'node:path';

const here = dirname(fileURLToPath(import.meta.url));
const bundle = resolve(here, '../../../build/haxe-js/flight.cjs');
const src = readFileSync(bundle, 'utf8');

// Public facades verified present on the built `flight` global; all must survive
// the trip into a browser (Haxe @:expose lands on `window` when there is no CJS
// `exports`). If a facade goes missing the compiled SDK did not initialize.
const EXPECT = [
  'App',
  'Application',
  'RenderGl',
  'Bitmap',
  'Audio',
  'Clipboard',
  'Dialog',
  'Color',
  'Geometry',
  'Screen',
  'Platform',
  'Input',
  'Assets',
  'Clock',
];

// eslint-disable-next-line no-console -- smoke progress/summary output is intentional
const log = (...args) => console.log(...args);

let failures = 0;
const check = (name, ok) => {
  log((ok ? '[PASS] ' : '[FAIL] ') + name);
  if (!ok) failures++;
};

const browser = await chromium.launch({
  args: ['--use-gl=swiftshader', '--enable-webgl', '--ignore-gpu-blocklist'],
});
try {
  const page = await browser.newPage();
  const pageErrors = [];
  page.on('pageerror', (e) => pageErrors.push(String(e)));

  await page.setContent('<!doctype html><meta charset="utf-8"><canvas id="c" width="64" height="64"></canvas>');
  await page.addScriptTag({ content: src });

  // 1) The Flight SDK loaded and exposed its public facades in the browser.
  const facades = await page.evaluate((expect) => {
    const f = window.flight;
    if (!f) return { ok: false, count: 0, missing: ['<no window.flight>'] };
    const missing = expect.filter((k) => !(k in f));
    return { ok: missing.length === 0, count: Object.keys(f).length, missing };
  }, EXPECT);
  check(`flight SDK loads in browser (${facades.count} facades)`, facades.ok);
  if (!facades.ok) log('   missing facades:', facades.missing.join(', '));
  if (pageErrors.length) log('   page errors:', pageErrors.join(' | '));

  // 2) A real WebGL2 context renders and reads back the cleared color.
  const gl = await page.evaluate(() => {
    const canvas = document.getElementById('c');
    const ctx = canvas.getContext('webgl2');
    if (!ctx) return { ok: false, reason: 'no webgl2 context' };
    ctx.viewport(0, 0, 1, 1);
    ctx.clearColor(0, 1, 0, 1);
    ctx.clear(ctx.COLOR_BUFFER_BIT);
    const px = new Uint8Array(4);
    ctx.readPixels(0, 0, 1, 1, ctx.RGBA, ctx.UNSIGNED_BYTE, px);
    return { ok: px[0] === 0 && px[1] === 255 && px[2] === 0, px: [...px] };
  });
  check('WebGL2 render+readback (green)', gl.ok);
  if (!gl.ok) log('   webgl2:', JSON.stringify(gl));

  log(failures === 0 ? 'ALL HOSTWEB SMOKES PASSED' : `${failures} FAILURE(S)`);
} finally {
  await browser.close();
}
process.exit(failures === 0 ? 0 : 1);
