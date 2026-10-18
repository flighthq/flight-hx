import flight.Adjustments.createBrightnessColorMatrix;

// Forces one compiler-refused, symbol-backed function through hxcpp code generation. The
// validation script expects this probe either to compile as the carrier improves or to fail with a
// classified ABI diagnostic; the declaration remains available in the default API in both cases.
class NativeAttemptCompile {
  static function main():Void {
    final matrix:Array<Float> = createBrightnessColorMatrix(0.5);
    if (matrix.length == 0) throw 'unexpected empty brightness matrix';
  }
}
