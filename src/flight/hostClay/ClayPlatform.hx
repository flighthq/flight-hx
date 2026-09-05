// Maintained host adapter: Flight PlatformBackend for Clay (sentinel-copy + Sys
// overrides). WRITE-AHEAD against develop 2cf1c5cef. See host-develop-adaptation.md.
package flight.hostClay;

#if clay
class ClayPlatform {
  /** Composed into the host `system.platform` slot by HostClay. */
  public static function createClayPlatformBackend():Dynamic {
    final backend:Dynamic = ({} : Dynamic);
    #if sys
    backend.getOsName = function():String return Sys.systemName();
    #end
    backend.getRuntime = function():String return 'clay';
    backend.getEndianness = function():String
      return haxe.io.Bytes.alloc(1).get(0) == 0 ? 'little' : 'little'; // host is LE on supported targets
    // TODO(develop): OS version/kind/arch via Sys/lime.system.System; sentinel otherwise.
    return cast backend;
  }
}
#end
