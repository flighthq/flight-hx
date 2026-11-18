import flight.HostWeb;
import flight.HostApp;
import flight.HostApp.WindowAttachmentOwnership;
import js.html.CanvasElement;
import js.Syntax;

class WebHostSmoke {
  static function main() {
    // Node runs this smoke with a minimal DOM double. All host and surface operations use Flight.
    final canvas:CanvasElement = Syntax.code(
      "new (globalThis.HTMLCanvasElement = class { style = {}; getContext(kind) { return kind === '2d' ? {} : null; } })()"
    );
    final input = HostWeb.createInputTargetHandle(canvas);
    HostWeb.inputTarget.prepare(input);
    if (canvas.style.touchAction != 'none') throw 'host did not resolve the input handle';

    final surface = HostWeb.createCanvasSurfaceFromNativeHandle(HostWeb.canvas, canvas);
    if (surface == null || HostWeb.getCanvasHandle(surface) != canvas) throw 'host did not retain the canvas handle';
    HostWeb.destroyCanvasSurface(HostWeb.canvas, surface);
    Syntax.code("{0}.getContext = () => null", canvas);
    if (HostWeb.createCanvasSurfaceFromNativeHandle(HostWeb.canvas, canvas) != null) throw 'host refusal should return null';
    final window:js.html.Window = Syntax.code(
      "({addEventListener() {}, removeEventListener() {}, close() { throw new Error('caller owns the window'); }})"
    );
    final flightWindow = HostApp.createAppWindow();
    if (!HostApp.attachWindow(HostWeb.windowAttach, HostWeb.windowLifecycle, flightWindow, window, Host))
      throw 'browser window attach failed';
    if (HostWeb.getWindowHandle(flightWindow) != window) throw 'wrong browser window handle';

    var frame:Null<Float->Void> = null;
    var cancelled = false;
    Syntax.code("globalThis.requestAnimationFrame = {0}", (callback:Float->Void) -> {
      frame = callback;
      return 1;
    });
    Syntax.code("globalThis.cancelAnimationFrame = {0}", (handle:Int) -> {
      if (handle != 1) throw 'wrong frame handle';
      frame = null;
      cancelled = true;
    });
    final loop = HostApp.createAppLoop();
    HostApp.setAppLoopMainWindow(loop, flightWindow);
    HostApp.startAppLoop(HostWeb.frameScheduler, HostWeb.lifecycle, loop, {backgroundFrameRate: 0});
    final tick = frame;
    if (tick == null || !HostApp.isAppLoopRunning(loop)) throw 'browser frame was not scheduled';
    frame = null;
    tick(16);
    if (frame == null) throw 'browser frame was not rescheduled';
    HostApp.stopAppLoop(loop);
    if (!cancelled || frame != null || HostApp.isAppLoopRunning(loop)) throw 'browser loop did not stop';
    HostApp.disposeAppLoop(loop);
    if (!HostApp.closeWindow(HostWeb.windowLifecycle, flightWindow) || HostWeb.getWindowHandle(flightWindow) != null)
      throw 'browser window did not detach';
    HostApp.disposeAppWindow(flightWindow);
    trace('FLIGHT_WEB_HOST_OK');
  }
}
