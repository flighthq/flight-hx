// Maintained host aggregator: composes a Clay-backed Flight `Host`. Clay
// counterpart of flight.hostLime.HostLime. Clay is single-application
// (`clay.Clay.app`), so the host is a single global cache rather than
// HostLime's per-Application map.
package flight.hostClay;

#if clay
import flight.hostClay.ClayLoop.ClayLoopBackend;
import flight._Entity.createHost;
import flight._TextLayout.setTextLayoutMeasureProvider;
import flight.types.Host;

/**
 * Composes a Clay-backed Flight `Host`.
 *
 * On develop the host seam is entirely explicit: every capability Clay can
 * implement is composed into one `createHost({...})` object here and passed to
 * Flight functions (or their capability slices) by the caller. There are no
 * global `install<X>HostBackend` installers any more — the previous provider
 * backends (audio, audio-device, video, font loading, bitmap readback/encode,
 * input ingress) are now ordinary host slots (`media.audioCodec`,
 * `media.audioDevice`, `media.video`, `text.fontLoading`,
 * `graphics.bitmapReadback`, `graphics.bitmapEncode`, `input.ingress`).
 *
 * Build the host with `createClayHost()` once the Clay app is ready (from
 * `clay.Events.ready`) and forward the frame to `pumpLoop()` from
 * `clay.Events.tick` so Flight's application loop runs on Clay's clock.
 */
class HostClay {
  static var host:Host = null;
  static var loop:ClayLoopBackend = null;

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
      graphics: {
        bitmapReadback: ClayBitmap.createClayBitmapReadbackBackend(),
        bitmapEncode: ClayBitmap.createClayBitmapEncodeBackend(),
      },
      text: {fontLoading: ClayFont.createClayFontLoadingBackend()},
      media: {
        audioCodec: ClayAudioBackend.createClayAudioBackend(),
        audioDevice: ClayAudioDevice.createClayAudioDeviceBackend(),
        video: ClayVideo.createClayVideoCapabilityBackend(),
      },
      input: {
        haptics: ClayHaptics.createClayHapticsBackend(),
        ingress: ClayInputIngress.createClayInputIngressBackend(),
      },
      net: {http: ClayNet.createClayNetBackend()},
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

    // Text measurement is a global provider seam, not a host slot. develop's
    // preferred `setTextShaperBackend` seam (@flighthq/textshaper) is not yet
    // emitted by the generator, so feed the surviving lower-level measure
    // provider with the shaper's `measureText` (which returns the metrics shape
    // `TextMeasureFunction` expects), rather than the backend object itself.
    final shaper:Dynamic = ClayTextShaper.createClayTextShaperBackend();
    setTextLayoutMeasureProvider(shaper.measureText);
    return host;
  }

  /** Drive Flight's application loop + SoLoud ended callbacks from Clay's frame. */
  public static function pumpLoop():Void {
    if (loop != null) loop.pump();
    ClayAudioDevice.pumpEnded();
  }
}
#end
