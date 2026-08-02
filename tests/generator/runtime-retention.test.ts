import { readFileSync } from 'node:fs';
import path from 'node:path';

import { describe, expect, it } from 'vitest';

describe('reflective runtime retention', () => {
  it('keeps every class returned by _Runtime.globalValue', () => {
    const workspace = process.cwd();
    const runtime = readFileSync(path.join(workspace, 'src', 'flighthq', '_internal', '_Runtime.hx'), 'utf8');
    const reflectiveClasses = [...runtime.matchAll(/case '[^']+': (_[A-Za-z0-9]+);/gu)].map((match) => match[1]!);

    expect(reflectiveClasses).toEqual(['_Map', '_Set', '_WeakMap', '_WeakSet', '_TextDecoder', '_DataView']);
    for (const className of reflectiveClasses) {
      const source = readFileSync(path.join(workspace, 'src', 'flighthq', '_internal', `${className}.hx`), 'utf8');
      expect(source, `${className} is reachable only through reflection and must survive DCE`).toMatch(
        new RegExp(`@:keep\\s+class ${className}\\b`, 'u'),
      );
    }
  });
});
