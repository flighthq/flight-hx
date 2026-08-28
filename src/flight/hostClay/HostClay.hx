// Maintained host aggregator: installs Clay-owned Flight capability backends.
// Clay counterpart of flight.hostLime.HostLime. Clay is single-application
// (`clay.Clay.app`), so installation state is a single global guard rather than
// HostLime's per-Application map.
package flight.hostClay;

#if clay
import flight.hostClay.ClayLoop.ClayLoopBackend;
import flight._App.installAppHostBackend;
import flight._Application.installLoopHostBackend;
import flight._Clipboard.installClipboardHostBackend;
import flight._Dialog.installDialogHostBackend;
#if sys
import flight._FileSystem.installFileSystemHostBackend;
import flight._Storage.installStorageHostBackend;
#end

/**
 * Installs Clay-owned Flight capability backends with host-layer precedence.
 *
 * Call `enableHostClay()` once the Clay app is ready (from `clay.Events.ready`),
 * and forward the frame to `pumpLoop()` from `clay.Events.tick` so Flight's
 * application loop runs on Clay's clock. Repeating `enableHostClay` is
 * idempotent. Networking (`ClayNet`) and audio are intentionally separate, as in
 * HostLime: net has no host-install seam yet, and audio is a per-context service.
 */
class HostClay {
  static var enabled = false;
  static var loop:ClayLoopBackend = null;

  public static function enableHostClay():Void {
    if (enabled) return;
    enabled = true;

    installAppHostBackend(ClayApp.createClayAppBackend());

    loop = ClayLoop.createClayLoopBackend();
    installLoopHostBackend(loop.backend());

    installClipboardHostBackend(ClayClipboard.createClayClipboardBackend());
    installDialogHostBackend(ClayDialog.createClayDialogBackend());
    #if sys
    installFileSystemHostBackend(ClayFileSystem.createClayFileSystemBackend());
    installStorageHostBackend(ClayStorage.createClayStorageBackend());
    #end
    // TODO(hostClay): as their Clay adapters land, install screen/platform/
    // lifecycle/haptics (mirroring HostLime) and the image/glyph backends over
    // linc_stb. Cursor and the GL surface are wired by the app, not installed.
  }

  /** Drive Flight's application loop from Clay's frame. Call from Events.tick. */
  public static function pumpLoop():Void {
    if (loop != null) loop.pump();
  }
}
#end
