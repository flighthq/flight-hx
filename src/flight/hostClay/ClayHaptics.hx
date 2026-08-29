// Maintained host adapter: Flight HapticsBackend for Clay (sentinel-copy).
// WRITE-AHEAD against develop 2cf1c5cef. Desktop Clay/SDL has no reliable
// haptics; this is an honest negative-capability backend (no fabricated
// feedback), mirroring hostLime's conservative subset. See host-develop-adaptation.md.
package flight.hostClay;

#if clay
class ClayHaptics {
  /** Install via `flight._Haptics.installHapticsHostBackend`. */
  public static function createClayHapticsBackend():Dynamic {
    final backend:Dynamic = Reflect.copy((flight._Haptics._sentinel__haptics : Dynamic));
    // TODO(develop): SDL gamepad rumble via Clay's runtime where a controller
    // exists; the sentinel (no-op, unsupported capability) is correct otherwise.
    return cast backend;
  }
}
#end
