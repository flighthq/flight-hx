package flight.hostLime;

#if lime
import flight._Entity.createHost;
import flight.types.Host;
import haxe.ds.ObjectMap;
import lime.app.Application;

/**
 * Composes a Lime-backed Flight `Host`.
 *
 * On develop the host seam is entirely explicit: every capability a Lime build
 * can implement is composed into one `createHost({...})` object here and passed
 * to Flight functions (or their capability slices) by the caller. There are no
 * global `install<X>HostBackend` installers any more — the previous provider
 * backends (glyph rasterizer, image, audio device, input ingress) are now
 * ordinary host slots (`text.glyphRasterizer`, `graphics.image`,
 * `media.audioDevice`, `input.ingress`).
 */
class HostLime {
  static final hosts = new ObjectMap<Application, Host>();

  /**
   * Builds the composed Lime host, cached once per application.
   *
   * Every capability HostLime can implement honestly is composed here:
   * identity/paths/locale/visibility/quit + loop (app), clipboard, dialog,
   * screen, window, image (graphics), glyph rasterizer (text, when the build
   * has a raster context), audio device (media), haptics + input ingress
   * (input), networking (net), platform + lifecycle (system), and — on `sys`
   * targets — local storage + the file system.
   */
  public static function createLimeHost(application:Application):Host {
    var host = hosts.get(application);
    if (host != null) return host;

    // app.loop lives inside the app namespace in the new host contract.
    final app:Dynamic = LimeApp.createLimeAppCapabilities(application);
    app.loop = LimeLoop.createLimeLoopBackend(application);

    // The glyph rasterizer is only available where the build can rasterize
    // glyphs (js canvas, or native with Cairo); omit the slot otherwise so
    // Flight falls back rather than resolving a null backend.
    final text:Dynamic = {};
    final glyphRasterizer = LimeGlyphRasterizer.createLimeGlyphRasterizerBackend();
    if (glyphRasterizer != null) text.glyphRasterizer = glyphRasterizer;

    host = cast createHost({
      app: app,
      clipboard: LimeClipboard.createLimeClipboardCapabilities(),
      dialog: LimeDialog.createLimeApplicationDialogCapabilities(application),
      screen: LimeScreen.createLimeScreenCapabilities(application),
      window: LimeWindow.createLimeWindowBackend(application),
      graphics: {image: LimeImage.createLimeImageBackend()},
      text: text,
      media: {audioDevice: LimeAudioDevice.createLimeAudioDeviceBackend()},
      input: {
        haptics: LimeHaptics.createLimeHapticsBackend(),
        ingress: LimeInputIngress.createLimeInputIngressBackend(),
      },
      net: {http: LimeNet.createLimeNetBackend()},
      system: {
        platform: LimePlatform.createLimePlatformBackend(),
        lifecycle: LimeLifecycle.createLimeLifecycleBackend(application),
      },
      #if sys
      storage: {
        local: LimeStorage.createLimeStorageBackend(),
        fileSystem: cast LimeFileSystem.createLimeFileSystemBackend(),
      },
      #end
    });
    hosts.set(application, host);
    return host;
  }

  /**
   * The native (Cairo) Raster2DSurfaceProvider GL text rasterization needs.
   *
   * On develop the provider is passed explicitly through
   * `GlRenderOptions.raster2DSurfaceProvider` when the caller builds its GL
   * render state — it is not a host slot and is not installed globally:
   *
   * ```haxe
   * final provider = HostLime.createLimeRaster2DSurfaceProvider();
   * final state = flight.RenderGl.createGlRenderState(contextState, pipeline,
   *   provider == null ? null : {raster2DSurfaceProvider: provider});
   * ```
   *
   * Returns null on builds without native Cairo (js, or lime without
   * `lime_cairo`), matching the glyph rasterizer's Cairo requirement.
   */
  public static function createLimeRaster2DSurfaceProvider():Null<flight.types.Raster2DSurfaceProvider> {
    #if (!js && lime_cairo)
    return flight.Scene2DCairo.createCairoRaster2DSurfaceProvider();
    #else
    return null;
    #end
  }
}
#end
