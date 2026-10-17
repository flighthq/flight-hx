import flight.Color;

// A current web API function that is deliberately absent from the exact native manifest. The
// installed-package gate expects typing this consumer for cpp to fail at the public facade.
class NativeUnsupportedApi {
  static function main():Void {
    colorFromKelvin(6500.0);
  }
}
