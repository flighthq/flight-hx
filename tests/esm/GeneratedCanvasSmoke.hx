import flight.esm.HostWeb;
import flight.esm.Render;
import flight.esm.Scene2DCanvas;
import flight.esm.Shape;
import flight.esm.types.flow.Types.FlowStack;
import js.Syntax;
using Lambda;

class GeneratedCanvasSmoke {
  static function main() {
    final surface = Scene2DCanvas.createCanvasElement(HostWeb.webHostCanvas, 16, 16);
    final canvas = HostWeb.getWebSurfaceCanvasHandle(surface);
    if (canvas == null) throw 'Browser host did not allocate a canvas';

    final screen = Scene2DCanvas.createCanvasScreenRenderTarget(surface);
    final state = Scene2DCanvas.createCanvasRenderState({canvasHost: HostWeb.webHostCanvas});
    Render.registerNodeRenderer(state, Shape.ShapeKind, Scene2DCanvas.canvasShapeRenderer);
    Scene2DCanvas.registerCanvasShapeCommands(state, [
      Scene2DCanvas.canvasBeginFill,
      Scene2DCanvas.canvasDrawRectangle,
      Scene2DCanvas.canvasEndFill,
    ]);

    final shape = Shape.createShape();
    Shape.appendShapeBeginFill(shape, 0x2196f3ff);
    Shape.appendShapeRectangle(shape, 2, 3, 8, 7);
    Shape.appendShapeEndFill(shape);
    if (!Render.prepareScene2DRender(state, shape)) throw 'Canvas render preparation failed';
    final pass = Scene2DCanvas.beginCanvasRenderPass(state, screen);
    Scene2DCanvas.renderCanvasScene2D(pass, shape);
    Scene2DCanvas.endCanvasRenderPass(pass);

    final recorded:Array<Dynamic> = Syntax.code('globalThis.flightTestCanvasOperations');
    if (recorded != null) {
      final rect:Dynamic = recorded.find((operation:Dynamic) -> operation[0] == 'rect');
      final fill:Dynamic = recorded.find((operation:Dynamic) -> operation[0] == 'fill');
      if (rect == null || rect[1] != 2 || rect[2] != 3 || rect[3] != 8 || rect[4] != 7 ||
          fill == null || fill[1] != 'rgba(33,150,243,1)')
        throw 'The renderer did not fill the expected rectangle';
    } else {
      final pixel = canvas.getContext2d().getImageData(4, 4, 1, 1).data;
      if (pixel[0] != 0x21 || pixel[1] != 0x96 || pixel[2] != 0xf3 || pixel[3] != 0xff)
        throw 'The rendered pixel did not match the shape fill';
    }
    Scene2DCanvas.destroyCanvasRenderState(state);
    Scene2DCanvas.disposeCanvasScreenRenderTarget(screen);
    final stack = new FlowStack();
    if (stack.stackDepth() != 0) throw 'Named ESM class constructor failed';
    trace('FLIGHT_GENERATED_CANVAS_OK');
  }
}
