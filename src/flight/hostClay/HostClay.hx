// Maintained host aggregator: installs Clay-owned Flight capability backends.
// Clay counterpart of flight.hostLime.HostLime. Clay is single-application
// (`clay.Clay.app`), so installation state is a single global guard rather than
// HostLime's per-Application map.
package flight.hostClay;

// WRITE-AHEAD note: as of develop 2cf1c5cef this aggregator also installs the
// new host slots (audio-device, input-ingress, audio, net). Those imports do not
// resolve on the 0.4.0 base; reconcile module/fn names on rebase.
#if clay
import flight.hostClay.ClayLoop.ClayLoopBackend;
import flight._App.installAppHostBackend;
import flight._Application.installLoopHostBackend;
import flight._Clipboard.installClipboardHostBackend;
import flight._Dialog.installDialogHostBackend;
import flight._Media.installAudioDeviceHostBackend;
import flight._Audio.installAudioHostBackend;
import flight._Input.installInputIngressHostBackend;
import flight._Net.installNetHostBackend;
import flight._Font.installFontLoadingHostBackend;
import flight._Bitmap.installBitmapReadbackHostBackend;
import flight._Bitmap.installBitmapEncodeHostBackend;
import flight._Video.installVideoCapabilityHostBackend;
// RECONCILED vs builder's develop tree: text-shaping installs through the
// measure-provider mechanism in flight._TextShaper (setTextLayoutMeasureProvider),
// not flight._TextLayout.setTextShaperBackend. Exact fn/signature to confirm on a
// clean compile (builder's WIP tree still has generation bugs, e.g. ButtonController).
import flight._TextShaper.setTextLayoutMeasureProvider;
import flight._Screen.installScreenHostBackend;
import flight._Platform.installPlatformHostBackend;
import flight._Lifecycle.installLifecycleHostBackend;
import flight._Haptics.installHapticsHostBackend;
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

    // develop host slots
    installAudioHostBackend(ClayAudioBackend.createClayAudioBackend());
    installAudioDeviceHostBackend(ClayAudioDevice.createClayAudioDeviceBackend());
    installInputIngressHostBackend(ClayInputIngress.createClayInputIngressBackend());
    installNetHostBackend(ClayNet.createClayNetBackend());
    installFontLoadingHostBackend(ClayFont.createClayFontLoadingBackend());
    installBitmapReadbackHostBackend(ClayBitmap.createClayBitmapReadbackBackend());
    installBitmapEncodeHostBackend(ClayBitmap.createClayBitmapEncodeBackend());
    installVideoCapabilityHostBackend(ClayVideo.createClayVideoCapabilityBackend());
    setTextLayoutMeasureProvider(ClayTextShaper.createClayTextShaperBackend());
    installScreenHostBackend(ClayScreen.createClayScreenBackend());
    installPlatformHostBackend(ClayPlatform.createClayPlatformBackend());
    installLifecycleHostBackend(ClayLifecycle.createClayLifecycleBackend());
    installHapticsHostBackend(ClayHaptics.createClayHapticsBackend());

    #if sys
    installFileSystemHostBackend(ClayFileSystem.createClayFileSystemBackend());
    installStorageHostBackend(ClayStorage.createClayStorageBackend());
    #end
    // Cursor and the GL surface are wired by the app (window-scoped), not
    // installed here. Input-ingress/audio-device backends are installed; the app
    // creates devices/attaches sources and forwards clay.Events to the dispatchers.
  }

  /** Drive Flight's application loop + SoLoud ended callbacks from Clay's frame. */
  public static function pumpLoop():Void {
    if (loop != null) loop.pump();
    ClayAudioDevice.pumpEnded();
  }
}
#end
