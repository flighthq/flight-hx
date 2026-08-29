// Maintained host adapter: Flight clipboard backend for the Clay host.
// Text clipboard is real via Clay's SDL binding (clay.sdl.SDL) on native; file
// clipboard has no cross-platform SDL flavor and keeps the empty sentinel, as in
// LimeClipboard. WRITE-AHEAD against develop seams. See host-develop-adaptation.md.
package flight.hostClay;

#if clay
import flight.types.ClipboardBackend;
import flight._internal._Promise;

class ClayClipboard {
  /** Allocation entry point, Flight-style: `createClayClipboardBackend()`. */
  public static function createClayClipboardBackend():ClipboardBackend {
    final backend:Dynamic = Reflect.copy((flight._Clipboard._sentinel__clipboard : Dynamic));
    #if clay_sdl
    backend.readText = function():_Promise<Dynamic>
      return _Promise.resolve(clay.sdl.SDL.hasClipboardText() ? clay.sdl.SDL.getClipboardText() : '');
    backend.writeText = function(text:String):_Promise<Dynamic>
      return _Promise.resolve(clay.sdl.SDL.setClipboardText(text == null ? '' : text));
    #end
    // readFiles/writeFiles and HTML/RTF/image flavors stay sentinel: SDL exposes
    // only text/plain (same deliberate limit LimeClipboard documents).
    return cast backend;
  }
}
#end
