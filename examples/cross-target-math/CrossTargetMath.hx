import flight.Color;
import flight.Math;

// One source file exercises the generated Flight ESM externs on web and every compile-proven scalar
// flight-cpp binding on hxcpp. Keeping this host-free isolates binding from the window/render gap.
class CrossTargetMath {
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
    report('CROSS_TARGET_MATH_OK');
  }

  static function assertClose(name:String, actual:Float, expected:Float):Void {
    if (Math.abs(actual - expected) > 1e-9) throw '$name: expected $expected, received $actual';
  }

  static function assertTrue(name:String, actual:Bool):Void {
    if (!actual) throw '$name: expected true';
  }

  static inline function report(message:String):Void {
    #if sys
    Sys.println(message);
    #else
    trace(message);
    #end
  }
}
