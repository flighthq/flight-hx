// Maintained host adapter: Flight VideoCapabilityBackend for Clay.
// WRITE-AHEAD against develop 2cf1c5cef. Clay has no video facility, so this is
// an honest negative-capability backend (no fabricated support), mirroring the
// hostLime video sentinel. See agents/host-develop-adaptation.md.
package flight.hostClay;

#if clay
class ClayVideo {
  /** Composed into the host `media.video` slot by HostClay. */
  public static function createClayVideoCapabilityBackend():Dynamic {
    return {
      canPlayType: function(mimeType:String):Bool return false,
      createVideoElement: function():Dynamic return null,
    };
  }
}
#end
