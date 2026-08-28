// Maintained host adapter: Flight dialog backend for the Clay host.
// Clay counterpart of flight.hostLime.LimeDialog. SKELETON: Clay/SDL has no
// portable native file/message dialog, so this is the honest gap — upstream's
// sentinel returns (cancelled/unsupported) are correct until a platform dialog
// library is wired. Typed stub so the seam is installable.
package flight.hostClay;

#if clay
import flight.types.DialogBackend;

class ClayDialog {
  /** Allocation entry point, Flight-style: `createClayDialogBackend()`. */
  public static function createClayDialogBackend():DialogBackend {
    final backend:Dynamic = Reflect.copy((flight._Dialog._sentinel__dialog : Dynamic));
    // TODO(hostClay): wire a native dialog provider (e.g. tinyfiledialogs) or
    // keep the sentinel returns for cancelled/unsupported dialogs.
    return cast backend;
  }
}
#end
