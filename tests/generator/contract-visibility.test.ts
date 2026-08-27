import { execFileSync } from 'node:child_process';
import { mkdirSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { describe, expect, it } from 'vitest';

// Guards the contract-lane visibility mapping documented in
// agents/public-surface-and-contract-visibility.md against the pinned Haxe toolchain.
// The mechanism, not generated output, is under test, so the fixtures are self-contained:
// a minimal flighthq.* tree plus an out-of-package consumer standing in for end-user code.

const fixtureRoot = path.resolve('build/contract-visibility-fixture');

function writeFlighthqTree(): void {
  rmSync(fixtureRoot, { force: true, recursive: true });
  mkdirSync(path.join(fixtureRoot, 'flighthq', 'node'), { recursive: true });
  mkdirSync(path.join(fixtureRoot, 'flighthq', 'geometry'), { recursive: true });
  mkdirSync(path.join(fixtureRoot, 'game'), { recursive: true });

  // A contract-bearing type: public API + private contract member/static, opened to flighthq only.
  // A module-private type stands in for something used only within this module.
  writeFileSync(
    path.join(fixtureRoot, 'flighthq', 'node', 'Node.hx'),
    `package flighthq.node;
@:allow(flighthq)
class Node {
  public var publicX:Int = 1;
  private var contractY:Int = 2;
  private static function contractFn():Int return 40;
  public function new() {}
}
private typedef ContractOnly = { secret:Int }
`,
  );

  // A sibling flighthq package reaching the contract member and static across packages (tier 2, must compile).
  writeFileSync(
    path.join(fixtureRoot, 'flighthq', 'geometry', 'Consumer.hx'),
    `package flighthq.geometry;
import flighthq.node.Node;
class Consumer {
  public static function use():Int {
    final n = new Node();
    return n.publicX + n.contractY + Node.contractFn();
  }
  static function main():Void {
    if (use() != 43) throw 'cross-package contract access miscompiled';
  }
}
`,
  );
}

function compile(main: string): void {
  execFileSync('node', ['tools/haxe.mjs', '-cp', fixtureRoot, '--main', main, '--interp'], {
    cwd: path.resolve('.'),
    stdio: 'pipe',
  });
}

function compileError(main: string, source: string): string {
  writeFileSync(path.join(fixtureRoot, 'game', `${main}.hx`), source);
  try {
    execFileSync('node', ['tools/haxe.mjs', '-cp', fixtureRoot, '--main', `game.${main}`, '--interp'], {
      cwd: path.resolve('.'),
      stdio: 'pipe',
    });
  } catch (error: unknown) {
    const shell = error as { stdout?: Buffer; stderr?: Buffer };
    return `${shell.stdout?.toString() ?? ''}${shell.stderr?.toString() ?? ''}`;
  }
  throw new Error(`expected game.${main} to fail compilation, but it succeeded`);
}

describe('contract-lane visibility mapping', () => {
  it('A: @:allow(flighthq) grants cross-package access to a private member and static (recursively)', () => {
    writeFlighthqTree();
    expect(() => compile('flighthq.geometry.Consumer')).not.toThrow();
  });

  it('B: end-user code outside flighthq is rejected at compile time on a contract member', () => {
    writeFlighthqTree();
    const output = compileError(
      'App',
      `package game;
import flighthq.node.Node;
class App {
  public static function main():Void {
    final n = new Node();
    trace(n.publicX);
    trace(n.contractY);
  }
}
`,
    );
    expect(output).toContain('Cannot access private field contractY');
  });

  it('C: a module-private type is unreachable cross-module, so contract-exclusive types cannot be private', () => {
    writeFlighthqTree();
    // Even a flighthq-internal package cannot see a module-private type in another module.
    writeFileSync(
      path.join(fixtureRoot, 'flighthq', 'geometry', 'WantsType.hx'),
      `package flighthq.geometry;
class WantsType {
  public static function f():Int {
    final c:flighthq.node.Node.ContractOnly = { secret: 3 };
    return c.secret;
  }
  static function main():Void { f(); }
}
`,
    );
    let output = '';
    try {
      compile('flighthq.geometry.WantsType');
      throw new Error('expected module-private type access to fail');
    } catch (error: unknown) {
      const shell = error as { stdout?: Buffer; stderr?: Buffer };
      output = `${shell.stdout?.toString() ?? ''}${shell.stderr?.toString() ?? ''}`;
    }
    expect(output).toContain('Cannot access private type ContractOnly');
  });
});
