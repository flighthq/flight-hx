import flight.HostWeb;
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
    trace('FLIGHT_WEB_HOST_OK');
  }
}
