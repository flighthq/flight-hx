// Haxe port of the upstream `clock` example's simulation logic, written directly
// against the generated Haxe surface (`flighthq.ClockApi`) — no TypeScript and no
// JavaScript bridge. It is deliberately headless (no rendering) so it compiles and
// runs on every Haxe target, demonstrating the cross-platform native story: a user
// writes Haxe over Flight and ships it to JS, C++, Python, Eval, and beyond.
import flighthq.ClockApi.*;
import flighthq.Types.Clock;

class Main {
  static function approx(a:Float, b:Float):Bool {
    return Math.abs(a - b) < 1e-6;
  }

  static function main():Void {
    // A root clock driving two child clocks: A at 1x, B at half speed.
    final root:Clock = createClock();
    final childA:Clock = createChildClock(root, {scale: 1.0});
    final childB:Clock = createChildClock(root, {scale: 0.5});

    // Advancing the root one second advances children recursively by their scale.
    advanceClock(root, 1.0);
    assert(approx(root.elapsed, 1.0), 'root elapsed ${root.elapsed}');
    assert(approx(childA.elapsed, 1.0), 'childA elapsed ${childA.elapsed}');
    assert(approx(childB.elapsed, 0.5), 'childB elapsed ${childB.elapsed}');

    // Pausing child A freezes it while its sibling keeps advancing.
    pauseClock(childA);
    advanceClock(root, 1.0);
    assert(approx(childA.elapsed, 1.0), 'paused childA advanced to ${childA.elapsed}');
    assert(approx(childB.elapsed, 1.0), 'childB after 2s ${childB.elapsed}');
    assert(isClockEffectivelyPaused(childA), 'childA should read as paused');

    // Effective scale composes down the parent chain.
    resumeClock(childA);
    setClockScale(root, 2.0);
    assert(approx(getClockEffectiveScale(childB), 1.0), 'childB effective scale ${getClockEffectiveScale(childB)}');

    // `trace` resolves on every Haxe target (JS, C++, Python, Eval, …); a sys-only
    // API like `Sys.println` would not compile to the JavaScript target.
    trace('clock example OK: root=${root.elapsed}s childA=${childA.elapsed}s childB=${childB.elapsed}s effB=${getClockEffectiveScale(childB)}');
  }

  static function assert(condition:Bool, message:String):Void {
    if (!condition) throw 'clock example failed: ${message}';
  }
}
