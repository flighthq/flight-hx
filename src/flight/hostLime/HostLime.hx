package flight.hostLime;

#if lime
import flight._Entity.createHost;
import flight._GlyphAtlas.installGlyphRasterizerHostBackend;
import flight._Image.installImageHostBackend;
import flight._Image.observeImageHostResult;
import flight.types.Host;
import haxe.ds.ObjectMap;
import lime.app.Application;

/**
 * Composes a Lime-backed Flight `Host` and installs the surviving global
 * provider backends.
 *
 * The upstream host seam moved most capabilities from global installation to an
 * explicit host argument: build the host with `createLimeHost(application)` and
 * pass it (or its capability slices) to Flight functions. `enableHostLime`
 * installs only the provider-style backends Flight still resolves globally
 * (glyph rasterizer, image). Input, networking, and audio remain per-context.
 */
class HostLime {
  static final hosts = new ObjectMap<Application, Host>();
  static var raster2DSurfaceEnabled = false;

  /**
   * Builds the composed Lime host, cached once per application.
   *
   * Every capability HostLime can implement honestly is composed here:
   * identity/paths/locale/visibility/quit + loop (app), clipboard, dialog,
   * screen, window, haptics (input), networking (net), platform + lifecycle
   * (system), and — on `sys` targets — local storage + the file system.
   */
  public static function createLimeHost(application:Application):Host {
    var host = hosts.get(application);
    if (host != null) return host;

    // app.loop lives inside the app namespace in the new host contract.
    final app:Dynamic = LimeApp.createLimeAppCapabilities(application);
    app.loop = LimeLoop.createLimeLoopBackend(application);

    host = cast createHost({
      app: app,
      clipboard: LimeClipboard.createLimeClipboardCapabilities(),
      dialog: LimeDialog.createLimeApplicationDialogCapabilities(application),
      screen: LimeScreen.createLimeScreenCapabilities(application),
      window: LimeWindow.createLimeWindowBackend(application),
      input: {haptics: LimeHaptics.createLimeHapticsBackend()},
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
   * Installs the provider-style backends Flight still resolves globally.
   *
   * Call once the first Lime window exists (normally from `onWindowCreate`).
   * The composed capabilities (createLimeHost) are passed to Flight explicitly
   * rather than installed.
   */
  public static function enableHostLime(application:Application):Void {
    enableHostLimeGlyphRasterizer(application);
    enableHostLimeRaster2DSurface(application);
    enableHostLimeImage(application);
  }

  /**
   * Installs the native Raster2DSurface provider GL text rasterization needs.
   *
   * Idempotent: the provider is a fresh object each call, and the installer is
   * first-wins (a second, different provider flags a conflict), so guard so
   * repeated `enableHostLime` calls install exactly one. Returns false when the
   * active Lime build has no native Cairo support (no scratch surface to draw
   * glyphs onto), matching the glyph rasterizer's Cairo requirement.
   */
  public static function enableHostLimeRaster2DSurface(application:Application):Bool {
    if (raster2DSurfaceEnabled) return true;
    #if (!js && lime_cairo)
    flight._Render.installRaster2DSurfaceHostProvider(flight.Scene2DCairo.createCairoRaster2DSurfaceProvider());
    raster2DSurfaceEnabled = true;
    return true;
    #else
    return false;
    #end
  }

  /** Returns false when the active Lime build has no native Cairo support. */
  public static function enableHostLimeGlyphRasterizer(application:Application):Bool {
    final backend = LimeGlyphRasterizer.createLimeGlyphRasterizerBackend();
    if (backend == null) return false;
    installGlyphRasterizerHostBackend(backend);
    return true;
  }

  public static function enableHostLimeImage(application:Application):Void {
    final inner = LimeImage.createLimeImageBackend();
    installImageHostBackend(cast {
      loadImageFromUrl: function(url:String, crossOrigin:Null<String>, signal:Null<flight._internal.dom.AbortSignal>) {
        return inner.loadImageFromUrl(url, crossOrigin, signal).then(function(image) {
          observeImageHostResult('loadImageFromUrl', true);
          return image;
        }, function(error):flight.types.Image {
          observeImageHostResult('loadImageFromUrl', false);
          throw error;
        });
      },
    });
  }
}
#end
