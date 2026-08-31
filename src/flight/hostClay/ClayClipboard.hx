// Maintained host adapter: Flight `clipboard` capability namespace for the Clay
// host. Text clipboard is real via Clay's SDL binding (clay.sdl.SDL) on native;
// richer flavors (HTML/RTF/image/bookmark) have no cross-platform SDL surface, so
// those namespaces are omitted and Flight's sentinels stand, as in LimeClipboard.
package flight.hostClay;

#if clay
import flight._internal._Promise;
import flight.types.HostClipboardCapabilities;

class ClayClipboard {
  /** Builds the Clay-backed `clipboard` capability namespace (composed by HostClay). */
  public static function createClayClipboardCapabilities():HostClipboardCapabilities {
    #if clay_sdl
    return cast {
      text: {
        readText: function():_Promise<Dynamic>
          return _Promise.resolve(clay.sdl.SDL.hasClipboardText() ? clay.sdl.SDL.getClipboardText() : ''),
        writeText: function(text:String):_Promise<Dynamic>
          return _Promise.resolve(clay.sdl.SDL.setClipboardText(text == null ? '' : text)),
        hasText: function():_Promise<Dynamic>
          return _Promise.resolve(clay.sdl.SDL.hasClipboardText()),
        clear: function():_Promise<Dynamic>
          return _Promise.resolve(clay.sdl.SDL.setClipboardText('')),
      },
    };
    #else
    return cast {};
    #end
  }
}
#end
