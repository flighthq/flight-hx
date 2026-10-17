import flight.Math;

// One source file exercises the generated Flight ESM extern on web and direct flight-cpp headers
// on hxcpp. Keeping this host-free isolates the binding and packaging contract from windowing.
class CrossTargetMath {
  static function main():Void {
    assertClose('clamp', clamp(4.0, -1.0, 2.0), 2.0);
    assertClose('lerp', lerp(10.0, 20.0, 0.25), 12.5);
    assertClose('saturate', saturate(-0.5), 0.0);
    report('CROSS_TARGET_MATH_OK');
  }

  static function assertClose(name:String, actual:Float, expected:Float):Void {
    if (Math.abs(actual - expected) > 1e-9) throw '$name: expected $expected, received $actual';
  }

  static inline function report(message:String):Void {
    #if sys
    Sys.println(message);
    #else
    trace(message);
    #end
  }
}
