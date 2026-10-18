import flight.Color;
import flight.Math;

// The optional transpiled-Haxe backend remains a deliberately separate, legacy-pinned surface.
// Keep a focused behavior proof here without adding backend branches to the TS/C++ sample.
class CrossTargetFallback {
  static function main():Void {
    assertClose('clamp', clamp(4.0, -1.0, 2.0), 2.0);
    assertTrue('inRange', inRange(0.5, 0.0, 1.0));
    assertClose('inverseLerp', inverseLerp(10.0, 20.0, 12.5), 0.25);
    assertClose('lerp', lerp(10.0, 20.0, 0.25), 12.5);
    assertClose('remap', remap(5.0, 0.0, 10.0, 10.0, 20.0), 15.0);
    assertClose('saturate', saturate(-0.5), 0.0);
    assertClose('smoothStep', smoothStep(0.0, 1.0, 0.5), 0.5);
    assertClose('step', step(0.5, 0.49), 0.0);
    assertClose('sRGB round trip', srgbChannelToLinear(linearChannelToSrgb(0.25)), 0.25);
    trace('CROSS_TARGET_FALLBACK_OK');
  }

  static function assertClose(name:String, actual:Float, expected:Float, tolerance:Float = 1e-9):Void {
    if (Math.abs(actual - expected) > tolerance) throw '$name: expected $expected, received $actual';
  }

  static function assertTrue(name:String, actual:Bool):Void {
    if (!actual) throw '$name: expected true';
  }
}
