import flight.Math;

// A current web API function that is deliberately absent from the exact native manifest. The
// installed-package gate expects typing this consumer for cpp to fail at the public facade.
class NativeUnsupportedApi {
  static function main():Void {
    approxEqual(1.0, 1.0);
  }
}
