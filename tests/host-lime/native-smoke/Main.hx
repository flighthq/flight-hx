import flight.hostLime.GlSurface;
import flight.hostLime.HostLime;
import flight.types.ApplicationWindow;
import flight.types.GlRenderState;
import haxe.io.Bytes;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.graphics.opengl.GL;
import lime.system.System;

class Main extends Application {
  var host:flight.types.Host;
  var attachedWindow:ApplicationWindow;
  var renderState:GlRenderState;
  var rendered = false;

  public function new() {
    super();
  }

  override public function onWindowCreate():Void {
    try {
      assert(window != null, 'Lime created a native window');
      assert(window.context != null, 'Lime created a native render context');
      assert(switch (window.context.type) {
        case OPENGL, OPENGLES, WEBGL: true;
        default: false;
      }, 'Lime window uses a hardware GL context');

      // The window capability is now composed into a Host and passed explicitly
      // to Flight's window functions rather than installed globally.
      HostLime.enableHostLime(this);
      host = HostLime.createLimeHost(this);

      attachedWindow = flight.Application.createApplicationWindow();
      assert(flight.Application.attachWindow(cast host, attachedWindow, cast window, cast 'host'), 'attach the existing Lime window');
      assert(flight.Application.attachWindow(cast host, attachedWindow, cast window, cast 'host'), 'same attachment is idempotent');
      assert(attachedWindow.width == window.width && attachedWindow.height == window.height, 'attachment mirrors native size');
      assert(attachedWindow.devicePixelRatio == window.scale, 'attachment mirrors native scale');

      final conflicting = flight.Application.createApplicationWindow();
      assert(!flight.Application.attachWindow(cast host, conflicting, cast window, cast 'host'), 'one native handle cannot back two entities');

      flight.Application.setWindowTitle(cast host, attachedWindow, 'HostLime Native Smoke Ready');
      assert(window.title == 'HostLime Native Smoke Ready', 'Flight title command reaches Lime');
      flight.Application.setWindowSize(cast host, attachedWindow, 160, 96);
      assert(window.width == 160 && window.height == 96, 'Flight size command reaches Lime');
      final bounds = flight.Application.getWindowBounds(cast host, attachedWindow, {x: 0, y: 0, width: 0, height: 0});
      assert(bounds.width == window.width && bounds.height == window.height, 'Flight bounds read the native window');

      window.onMove.dispatch(17, 23);
      assert(attachedWindow.x == 17 && attachedWindow.y == 23, 'native move events update the Flight entity');
      window.onResize.dispatch(160, 96);
      assert(attachedWindow.width == 160 && attachedWindow.height == 96, 'native resize events update the Flight entity');

      final ownedWindow = flight.Application.createApplicationWindow();
      assert(flight.Application.openWindow(cast host, ownedWindow, {
        title: 'HostLime Owned Window',
        width: 80,
        height: 64,
        visible: false,
      }), 'Flight opens a Lime-owned native window');
      assert(windows.length == 2, 'opened native window joins the Lime application');
      assert(flight.Application.closeWindow(cast host, ownedWindow), 'Flight closes its owned native window');
      assert(windows.length == 1, 'closing an owned window releases it from Lime');

      final surface = GlSurface.createGlSurface(window);
      final context = flight.RenderGl.createGlContextFromCanvasElement(surface, {
        contextAttributes: {alpha: false, preserveDrawingBuffer: true},
      });
      final expectedContext:Dynamic = window.context.webgl2 == null ? window.context.webgl : window.context.webgl2;
      assert((cast context : Dynamic) == expectedContext, 'Flight preserves the caller-owned Lime GL context');
      final pipeline = flight.RenderGl.createGlPipeline(flight.RenderGl.createEmptyGlRegistries());
      renderState = flight.RenderGl.createGlRenderState(context, pipeline, {
        backgroundColor: 0x00ff00ff,
        pixelRatio: window.scale,
      });
      final surfaceValue:Dynamic = surface;
      assert(surfaceValue.width == Std.int(window.width * window.scale), 'GL surface width uses physical pixels');
      assert(surfaceValue.height == Std.int(window.height * window.scale), 'GL surface height uses physical pixels');
    } catch (error:Dynamic) {
      fail(error);
    }
  }

  override public function render(_context:RenderContext):Void {
    if (rendered || renderState == null) return;
    rendered = true;
    try {
      flight.RenderGl.renderGlBackground(renderState);
      GL.finish();
      final pixel = Bytes.alloc(4);
      GL.readPixels(0, 0, 1, 1, GL.RGBA, GL.UNSIGNED_BYTE, pixel);
      assert(pixel.get(0) == 0 && pixel.get(1) == 255 && pixel.get(2) == 0 && pixel.get(3) == 255,
        'Flight GL background reaches a real native framebuffer');
      flight.RenderGl.destroyGlRenderState(renderState);

      assert(flight.Application.closeWindow(cast host, attachedWindow), 'Flight detaches the host-owned window');
      assert(window.context != null && windows.length == 1, 'host-owned close leaves the Lime window alive');
      Sys.println('HOST_LIME_NATIVE_SMOKE_OK');
      System.exit(0);
    } catch (error:Dynamic) {
      fail(error);
    }
  }

  static function assert(condition:Bool, message:String):Void {
    if (!condition) throw message;
  }

  static function fail(error:Dynamic):Void {
    Sys.stderr().writeString('HOST_LIME_NATIVE_SMOKE_FAILED: ' + Std.string(error) + '\n');
    System.exit(1);
  }
}
