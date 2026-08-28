import { readFileSync } from 'node:fs';
import path from 'node:path';
import { describe, expect, it } from 'vitest';

// Confidence gate for the hostClay GL adapter. render-gl routes every GL call
// through flight._internal.backend.WebGl2Backend, which dispatches `gl.<method>(...)`
// on the context. On the Clay target `GlContext = Dynamic`, so those calls are
// unchecked at compile time — a missing forward in ClayGlContext is a runtime
// crash. This test derives the required method set from WebGl2Backend and asserts
// the adapter covers it, so completeness is verified from source and stays honest
// as render-gl evolves. See src/flight/hostClay/README.md.

const root = path.resolve('.');
const backend = readFileSync(path.join(root, 'src/flight/_internal/backend/WebGl2Backend.hx'), 'utf8');
const adapter = readFileSync(path.join(root, 'src/flight/hostClay/GlSurface.hx'), 'utf8');

function required(): Set<string> {
  const set = new Set<string>();
  for (const m of backend.matchAll(/\bgl\.([a-z][A-Za-z0-9]*)\s*\(/g)) if (m[1]) set.add(m[1]);
  return set;
}
function provided(): Set<string> {
  const set = new Set<string>();
  for (const m of adapter.matchAll(/public inline function ([a-z][A-Za-z0-9]*)\s*\(/g)) if (m[1]) set.add(m[1]);
  return set;
}

describe('hostClay GL adapter coverage', () => {
  it('ClayGlContext forwards every GL method WebGl2Backend dispatches on the context', () => {
    const req = required();
    const prov = provided();
    const missing = [...req].filter((m) => !prov.has(m)).sort();
    // Surface the count for confidence reporting; empty missing set is the gate.
    expect({ required: req.size, missing }).toEqual({ required: req.size, missing: [] });
  });

  it('the required surface is non-trivial (guards against a regex that silently matches nothing)', () => {
    expect(required().size).toBeGreaterThan(80);
  });
});
