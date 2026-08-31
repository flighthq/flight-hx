// Maintained host adapter: Flight `dialog` capability namespace for the Clay
// host. Clay's SDL binding (clay.sdl.SDL) exposes NO dialog surface — no message
// box, no open/save/directory picker — so the namespace is empty and every dialog
// operation resolves to Flight's capability-owned sentinel (cancelled/denied)
// rather than fabricating a result. Wiring real dialogs would require binding
// SDL3's dialog functions in Clay's linc layer, which is out of scope here.
package flight.hostClay;

#if clay
import flight.types.HostDialogCapabilities;

class ClayDialog {
  /** Clay exposes no dialog operations, so the namespace is empty. */
  public static function createClayDialogCapabilities():HostDialogCapabilities {
    return cast {};
  }
}
#end
