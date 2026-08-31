// Maintained host aggregator: composes a Clay-backed Flight `Host` and installs
// the surviving Clay-owned provider backends. Clay counterpart of
// flight.hostLime.HostLime. Clay is single-application (`clay.Clay.app`), so the
// host and installation state are single global guards rather than HostLime's
// per-Application map.
package flight.hostClay;

#if clay
import flight.hostClay.ClayLoop.ClayLoopBackend;
import flight._Entity.createHost;
import flight._Media.installAudioDeviceHostBackend;
import flight._Audio.installAudioHostBackend;
import flight._Input.installInputIngressHostBackend;
import flight._Font.installFontLoadingHostBackend;
import flight._Bitmap.installBitmapReadbackHostBackend;
import flight._Bitmap.installBitmapEncodeHostBackend;
import flight._Video.installVideoCapabilityHostBackend;
import flight._TextLayout.setTextLayoutMeasureProvider;
import flight.types.Host;

/**
 * Composes a Clay-backed Flight `Host` and installs Clay-owned provider backends.
 *
 * The upstream host seam moved most capabilities from global installation to an
 * explicit host argument: build the host with `createClayHost()` and pass it (or
 * its capability slices) to Flight functions. `enableHostClay` installs only the
 * provider-style backends Flight still resolves globally (audio, audio-device,
 * input-ingress, font, bitmap, video, text-shaping). Call `enableHostClay()` once
 * the Clay app is ready (from `clay.Events.ready`) and forward the frame to
 * `pumpLoop()` from `clay.Events.tick` so Flight's application loop runs on Clay's
 * clock. Both are idempotent.
 */
class HostClay {
  static var host:Host = null;
  static var loop:ClayLoopBackend = null;
  static var enabled = false;

  /** Builds the composed Clay host, cached globally (Clay is single-application). */
  public static function createClayHost():Host {
    if (host != null) return host;

    // app.loop lives inside the app namespace; the loop is also pumped from
    // Clay's tick via pumpLoop().
    loop = ClayLoop.createClayLoopBackend();
    final app:Dynamic = ClayApp.createClayAppCapabilities();
    app.loop = loop.backend();

    host = cast createHost({
      app: app,
      clipboard: ClayClipboard.createClayClipboardCapabilities(),
      dialog: ClayDialog.createClayDialogCapabilities(),
      screen: ClayScreen.createClayScreenCapabilities(),
      net: {http: ClayNet.createClayNetBackend()},
      input: {haptics: ClayHaptics.createClayHapticsBackend()},
      system: {
        platform: ClayPlatform.createClayPlatformBackend(),
        lifecycle: ClayLifecycle.createClayLifecycleBackend(),
      },
      #if sys
      storage: {
        local: ClayStorage.createClayStorageBackend(),
        fileSystem: cast ClayFileSystem.createClayFileSystemBackend(),
      },
      #end
    });
    return host;
  }

  /** Installs the provider-style backends Flight still resolves globally. */
  public static function enableHostClay():Void {
    if (enabled) return;
    enabled = true;
    createClayHost();

    installAudioHostBackend(ClayAudioBackend.createClayAudioBackend());
    installAudioDeviceHostBackend(ClayAudioDevice.createClayAudioDeviceBackend());
    installInputIngressHostBackend(ClayInputIngress.createClayInputIngressBackend());
    installFontLoadingHostBackend(ClayFont.createClayFontLoadingBackend());
    installBitmapReadbackHostBackend(ClayBitmap.createClayBitmapReadbackBackend());
    installBitmapEncodeHostBackend(ClayBitmap.createClayBitmapEncodeBackend());
    installVideoCapabilityHostBackend(ClayVideo.createClayVideoCapabilityBackend());
    setTextLayoutMeasureProvider(ClayTextShaper.createClayTextShaperBackend());
  }

  /** Drive Flight's application loop + SoLoud ended callbacks from Clay's frame. */
  public static function pumpLoop():Void {
    if (loop != null) loop.pump();
    ClayAudioDevice.pumpEnded();
  }
}
#end
