// Maintained host adapter: Flight dialog backend for the Clay host.
// HONEST CAPABILITY: Clay's SDL binding (clay.sdl.SDL) exposes NO dialog surface
// — no message box, no open/save/directory picker. (Its only dialog-adjacent
// symbol is the SDL_HINT_FILE_DIALOG_DRIVER hint constant, implying the
// underlying SDL3 has native file dialogs, but Clay has not bound them.) With no
// callable dialog API, every operation returns Flight's capability-owned sentinel
// (cancelled/denied/unsupported) rather than fabricating a result — the same
// honest posture LimeDialog takes for confirm/prompt. Wiring real dialogs would
// require binding SDL3's dialog functions (or a lib like tinyfiledialogs) in
// Clay's linc layer, which is out of scope here. See host-develop-adaptation.md.
package flight.hostClay;

#if clay
import flight.types.DialogBackend;

class ClayDialog {
  /** Allocation entry point, Flight-style: `createClayDialogBackend()`.
   * Returns the sentinel backend unchanged: Clay exposes no dialog operations to
   * override, so nothing is installed on top of Flight's defaults. */
  public static function createClayDialogBackend():DialogBackend {
    return cast Reflect.copy((flight._Dialog._sentinel__dialog : Dynamic));
  }
}
#end
