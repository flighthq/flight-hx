import { execFileSync } from 'node:child_process';
import { mkdirSync, rmSync, writeFileSync } from 'node:fs';
import path from 'node:path';
import { describe, expect, it } from 'vitest';

// Guards the contract-lane visibility mapping documented in
// agents/public-surface-and-contract-visibility.md against the pinned Haxe toolchain.
// The mechanism, not generated output, is under test, so the fixtures are self-contained:
// a minimal flight.* tree plus an out-of-package consumer standing in for end-user code.

const fixtureRoot = path.resolve('build/contract-visibility-fixture');

function writeFlightTree(): void {
  rmSync(fixtureRoot, { force: true, recursive: true });
  mkdirSync(path.join(fixtureRoot, 'flight'), { recursive: true });
  mkdirSync(path.join(fixtureRoot, 'flight', '_fixtureGeometry'), { recursive: true });
  mkdirSync(path.join(fixtureRoot, 'game'), { recursive: true });

  // Contract members carry their own grant, so an unrelated module-private
  // sibling remains private. Contract-exclusive types can only be completion-hidden.
  writeFileSync(
    path.join(fixtureRoot, 'flight', '_Node.hx'),
    `package flight;
class _Node {
  public var publicX:Int = 1;
  @:allow(flight)
  private var contractY:Int = 2;
  private var moduleOnly:Int = 4;
  @:allow(flight)
  private static function contractFn():Int return 40;
  public function new() {}
}
@:noCompletion
typedef SharedContract = { value:Int }
private typedef ContractOnly = { secret:Int }
`,
  );

  // A sibling flight package reaching the contract member and static across packages (tier 2, must compile).
  writeFileSync(
    path.join(fixtureRoot, 'flight', '_fixtureGeometry', 'Consumer.hx'),
    `package flight._fixtureGeometry;
import flight._Node;
class Consumer {
  public static function use():Int {
    final n = new _Node();
    final shared:flight._Node.SharedContract = { value: 0 };
    return n.publicX + n.contractY + _Node.contractFn() + shared.value;
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
  return existingCompileError(`game.${main}`);
}

function existingCompileError(main: string): string {
  try {
    execFileSync('node', ['tools/haxe.mjs', '-cp', fixtureRoot, '--main', main, '--interp'], {
      cwd: path.resolve('.'),
      stdio: 'pipe',
    });
  } catch (error: unknown) {
    const shell = error as { stdout?: Buffer; stderr?: Buffer };
    return `${shell.stdout?.toString() ?? ''}${shell.stderr?.toString() ?? ''}`;
  }
  throw new Error(`expected ${main} to fail compilation, but it succeeded`);
}

describe('contract-lane visibility mapping', () => {
  it('A: @:allow(flight) grants cross-package access to a private member and static (recursively)', () => {
    writeFlightTree();
    expect(() => compile('flight._fixtureGeometry.Consumer')).not.toThrow();
  });

  it('B: end-user code outside flight is rejected at compile time on a contract member', () => {
    writeFlightTree();
    const output = compileError(
      'App',
      `package game;
import flight._Node;
class App {
  public static function main():Void {
    final n = new _Node();
    trace(n.publicX);
    trace(n.contractY);
  }
}
`,
    );
    expect(output).toContain('Cannot access private field contractY');
  });

  it('C: a module-private type is unreachable cross-module, so contract-exclusive types cannot be private', () => {
    writeFlightTree();
    // Even a flight-internal package cannot see a module-private type in another module.
    writeFileSync(
      path.join(fixtureRoot, 'flight', '_fixtureGeometry', 'WantsType.hx'),
      `package flight._fixtureGeometry;
class WantsType {
  public static function f():Int {
    final c:flight._Node.ContractOnly = { secret: 3 };
    return c.secret;
  }
  static function main():Void { f(); }
}
`,
    );
    const output = existingCompileError('flight._fixtureGeometry.WantsType');
    expect(output).toContain('Cannot access private type ContractOnly');
  });

  it('D: a member-level grant does not expose an unrelated module-private sibling', () => {
    writeFlightTree();
    writeFileSync(
      path.join(fixtureRoot, 'flight', '_fixtureGeometry', 'WantsLocal.hx'),
      `package flight._fixtureGeometry;
import flight._Node;
class WantsLocal {
  static function main():Void {
    final n = new _Node();
    trace(n.moduleOnly);
  }
}
`,
    );
    expect(existingCompileError('flight._fixtureGeometry.WantsLocal')).toContain(
      'Cannot access private field moduleOnly',
    );
  });

  it('E: @:noCompletion contract types remain compile-visible to consumers', () => {
    writeFlightTree();
    writeFileSync(
      path.join(fixtureRoot, 'game', 'TypeConsumer.hx'),
      `package game;
class TypeConsumer {
  static function main():Void {
    final value:flight._Node.SharedContract = { value: 3 };
    if (value.value != 3) throw 'contract type miscompiled';
  }
}
`,
    );
    expect(() => compile('game.TypeConsumer')).not.toThrow();
  });
});
