// Line-by-line Haxe/Lime port of the upstream `shapes` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flight.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and Flight's Lime host capabilities are enabled with `HostLime.enableHostLime(this)`.
// Every statement of the upstream program is otherwise translated faithfully.
import flight.hostLime.HostLime;
import flight.Sdk.*;
import flight.types.DisplayObject;
import flight.types.Shape;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;
import lime.ui.Window;

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;
  var usingCairo = false;

  var main:DisplayObject;

  // Layout constants for the five-row grid.
  final ROW_HEIGHT = 110;
  final ROW_PADDING = 10;
  final COL_START = 20;

  final FILL_COLOR = 0x4488ccff;
  final STROKE_COLOR = 0x88ccffff;

  public function new() {
    super();
  }

  // Lime: window/GL are ready. Wire the Flight Lime backend, set up the GL renderer, build the scene.
  override public function onWindowCreate():Void {
    HostLime.enableHostLime(this);
    trace('window context type: ' + window.context.type);
    switch (window.context.type) {
      case CAIRO:
        usingCairo = true;
      case OPENGL, OPENGLES, WEBGL:
      default:
        throw 'Flight examples require an OpenGL/WebGL or cairo render context.';
    }
    scale = window.scale;
    final surfaceCreator = flight.Scene2DCairo.createCairoRenderSurfaceCreator();
    if (usingCairo) {
      final canvas = flight.Scene2DCairo.createCairoSurface(window);
      renderState = createCanvasRenderState(createCanvasRenderSurface(surfaceCreator, canvas, {pixelRatio: window.scale}), scene2dCanvasPipeline, createCanvasTextureResolvers(surfaceCreator), {
        pixelRatio: window.scale,
        backgroundColor: 0x1a1a2eff,
        sceneGraphSyncPolicy: 'requiresInvalidation',
      });
      enableFlightDiagnostics(renderState);
      registerRenderer(renderState, ShapeKind, defaultCanvasShapeRenderer);
      registerCanvasShapeCommands(renderState, defaultCanvasShapeCommands);
      registerCanvasImageTextureResolver(getCanvasRenderStateTextureResolvers(renderState));
      registerCanvasBitmapTextureResolver(getCanvasRenderStateTextureResolvers(renderState));
      enableCanvasBlendMode(renderState);
    } else {
      final canvas = flight.hostLime.GlSurface.createGlSurface(window);
      renderState = createGlRenderState(createGlContextState(createGlContextFromCanvasElement(canvas, {contextAttributes: {alpha: false, preserveDrawingBuffer: true}})), scene2dGlPipeline, {
        pixelRatio: window.scale,
        backgroundColor: 0x1a1a2eff,
        sceneGraphSyncPolicy: 'requiresInvalidation',
      });
      enableFlightDiagnostics(renderState);
      registerGlStandardMaterial(renderState);
      registerStandardGlTextureResolvers(renderState);
      registerRenderer(renderState, ShapeKind, defaultGlShapeRenderer);
      // Upstream f1a7a9a0: gradient and texture fills have no tessellated form on this backend, so
      // they draw through an explicit canvas rasterizer alongside the GPU mesh command lane.
      final shapeRasterizerResolvers = createCanvasTextureResolvers(surfaceCreator);
      connectCanvasTextureResolverMisses(shapeRasterizerResolvers, renderState);
      registerCanvasBitmapTextureResolver(shapeRasterizerResolvers);
      registerCanvasImageTextureResolver(shapeRasterizerResolvers);
      registerGlShapeRasterizer(renderState, createCanvasShapeRasterizer(shapeRasterizerResolvers));
      registerGlShapeCommands(renderState, defaultGlShapeCommands);
      enableGlBlendModeSupport(renderState);
    }

    main = createDisplayObject();
    main.scaleX = scale;
    main.scaleY = scale;

    // ===== Row 1: Basic primitives =====

    final row1Y = rowY(0);

    final rect = createShape();
    appendShapeBeginFill(rect, FILL_COLOR);
    appendShapeRectangle(rect, 0, 0, 120, 80);
    appendShapeEndFill(rect);
    placeShape(rect, COL_START, row1Y + 15);

    final circ = createShape();
    appendShapeBeginFill(circ, FILL_COLOR);
    appendShapeCircle(circ, 50, 50, 50);
    appendShapeEndFill(circ);
    placeShape(circ, COL_START + 160, row1Y + 5);

    final ellip = createShape();
    appendShapeBeginFill(ellip, FILL_COLOR);
    appendShapeEllipse(ellip, 0, 0, 140, 90);
    appendShapeEndFill(ellip);
    placeShape(ellip, COL_START + 300, row1Y + 10);

    final roundRect = createShape();
    appendShapeBeginFill(roundRect, FILL_COLOR);
    appendShapeRoundRectangle(roundRect, 0, 0, 140, 90, 20, 20);
    appendShapeEndFill(roundRect);
    placeShape(roundRect, COL_START + 500, row1Y + 10);

    // ===== Row 2: Polygons =====

    final row2Y = rowY(1);
    final polySize = 45;

    final triangle = createShape();
    appendShapeBeginFill(triangle, FILL_COLOR);
    drawRegularPolygon(triangle, polySize, polySize + 5, polySize, 3);
    appendShapeEndFill(triangle);
    placeShape(triangle, COL_START, row2Y);

    final pentagon = createShape();
    appendShapeBeginFill(pentagon, FILL_COLOR);
    drawRegularPolygon(pentagon, polySize, polySize + 5, polySize, 5);
    appendShapeEndFill(pentagon);
    placeShape(pentagon, COL_START + 140, row2Y);

    final hexagon = createShape();
    appendShapeBeginFill(hexagon, FILL_COLOR);
    drawRegularPolygon(hexagon, polySize, polySize + 5, polySize, 6);
    appendShapeEndFill(hexagon);
    placeShape(hexagon, COL_START + 280, row2Y);

    final star5 = createShape();
    appendShapeBeginFill(star5, FILL_COLOR);
    drawStar(star5, polySize, polySize + 5, polySize, polySize * 0.4, 5);
    appendShapeEndFill(star5);
    placeShape(star5, COL_START + 420, row2Y);

    // ===== Row 3: Lines and curves =====

    final row3Y = rowY(2);
    final curveWidth = 200;
    final curveHeight = 80;

    final straightLine = createShape();
    appendShapeLineStyle(straightLine, 3, STROKE_COLOR);
    appendShapeMoveTo(straightLine, 0, curveHeight / 2);
    appendShapeLineTo(straightLine, curveWidth, curveHeight / 2);
    placeShape(straightLine, COL_START, row3Y + 15);

    final quadCurve = createShape();
    appendShapeLineStyle(quadCurve, 3, STROKE_COLOR);
    appendShapeMoveTo(quadCurve, 0, curveHeight);
    appendShapeCurveTo(quadCurve, curveWidth / 2, -curveHeight * 0.4, curveWidth, curveHeight);
    placeShape(quadCurve, COL_START + 240, row3Y + 10);

    final cubicCurve = createShape();
    appendShapeLineStyle(cubicCurve, 3, STROKE_COLOR);
    appendShapeMoveTo(cubicCurve, 0, curveHeight);
    appendShapeCubicCurveTo(
      cubicCurve,
      curveWidth * 0.33,
      -curveHeight * 0.3,
      curveWidth * 0.66,
      curveHeight * 1.3,
      curveWidth,
      0,
    );
    placeShape(cubicCurve, COL_START + 500, row3Y + 10);

    // ===== Row 4: Fill types =====

    final row4Y = rowY(3);
    final fillSize = 80;

    final solidFill = createShape();
    appendShapeBeginFill(solidFill, 0xcc4444ff);
    appendShapeRectangle(solidFill, 0, 0, fillSize, fillSize);
    appendShapeEndFill(solidFill);
    placeShape(solidFill, COL_START, row4Y + 15);

    final alphaFill = createShape();
    appendShapeBeginFill(alphaFill, 0x44cc44ff, 0.5);
    appendShapeRectangle(alphaFill, 0, 0, fillSize, fillSize);
    appendShapeEndFill(alphaFill);
    placeShape(alphaFill, COL_START + 140, row4Y + 15);

    final strokeOnly = createShape();
    appendShapeLineStyle(strokeOnly, 3, 0xcccc44ff);
    appendShapeRectangle(strokeOnly, 0, 0, fillSize, fillSize);
    placeShape(strokeOnly, COL_START + 280, row4Y + 15);

    final fillAndStroke = createShape();
    appendShapeBeginFill(fillAndStroke, 0x4444ccff);
    appendShapeLineStyle(fillAndStroke, 3, 0xcccc44ff);
    appendShapeRectangle(fillAndStroke, 0, 0, fillSize, fillSize);
    appendShapeEndFill(fillAndStroke);
    placeShape(fillAndStroke, COL_START + 420, row4Y + 15);

    // ===== Row 5: Stroke variations =====

    final row5Y = rowY(4);
    final strokeLineLength = 160;

    // Thin stroke.
    final thinStroke = createShape();
    appendShapeLineStyle(thinStroke, 1, STROKE_COLOR);
    appendShapeMoveTo(thinStroke, 0, 20);
    appendShapeLineTo(thinStroke, strokeLineLength, 20);
    // Medium stroke below.
    appendShapeLineStyle(thinStroke, 4, STROKE_COLOR);
    appendShapeMoveTo(thinStroke, 0, 50);
    appendShapeLineTo(thinStroke, strokeLineLength, 50);
    // Thick stroke below.
    appendShapeLineStyle(thinStroke, 10, STROKE_COLOR);
    appendShapeMoveTo(thinStroke, 0, 80);
    appendShapeLineTo(thinStroke, strokeLineLength, 80);
    placeShape(thinStroke, COL_START, row5Y);

    // Cap styles: none, round, square.
    final capsNone = createShape();
    appendShapeLineStyle(capsNone, 10, 0xcc8844ff, 1, false, 'normal', 'none');
    appendShapeMoveTo(capsNone, 10, 20);
    appendShapeLineTo(capsNone, strokeLineLength - 10, 20);
    appendShapeLineStyle(capsNone, 10, 0x44cc88ff, 1, false, 'normal', 'round');
    appendShapeMoveTo(capsNone, 10, 50);
    appendShapeLineTo(capsNone, strokeLineLength - 10, 50);
    appendShapeLineStyle(capsNone, 10, 0x8844ccff, 1, false, 'normal', 'square');
    appendShapeMoveTo(capsNone, 10, 80);
    appendShapeLineTo(capsNone, strokeLineLength - 10, 80);
    placeShape(capsNone, COL_START + 220, row5Y);

    // Join styles: miter, round, bevel.
    final joinMiter = createShape();
    appendShapeLineStyle(joinMiter, 6, 0xcc8844ff, 1, false, 'normal', 'none', 'miter');
    appendShapeMoveTo(joinMiter, 0, 80);
    appendShapeLineTo(joinMiter, 40, 10);
    appendShapeLineTo(joinMiter, 80, 80);
    placeShape(joinMiter, COL_START + 440, row5Y + 10);

    final joinRound = createShape();
    appendShapeLineStyle(joinRound, 6, 0x44cc88ff, 1, false, 'normal', 'none', 'round');
    appendShapeMoveTo(joinRound, 0, 80);
    appendShapeLineTo(joinRound, 40, 10);
    appendShapeLineTo(joinRound, 80, 80);
    placeShape(joinRound, COL_START + 550, row5Y + 10);

    final joinBevel = createShape();
    appendShapeLineStyle(joinBevel, 6, 0x8844ccff, 1, false, 'normal', 'none', 'bevel');
    appendShapeMoveTo(joinBevel, 0, 80);
    appendShapeLineTo(joinBevel, 40, 10);
    appendShapeLineTo(joinBevel, 80, 80);
    placeShape(joinBevel, COL_START + 660, row5Y + 10);

    ready = true;
  }

  function rowY(row:Int):Float {
    return ROW_PADDING + row * (ROW_HEIGHT + ROW_PADDING);
  }

  // Positions a shape in the grid and adds it to the scene.
  function placeShape(shape:Shape, x:Float, y:Float):Void {
    shape.x = x;
    shape.y = y;
    invalidateNodeLocalTransform(shape);
    addNodeChild(main, shape);
  }

  // Draws a regular polygon centered at (cx, cy) with a given radius and number of sides.
  // The first vertex points upward (-Y).
  function drawRegularPolygon(shape:Shape, cx:Float, cy:Float, radius:Float, sides:Int):Void {
    final step = (Math.PI * 2) / sides;
    final startAngle = -Math.PI / 2;
    for (i in 0...sides + 1) {
      final angle = startAngle + step * i;
      final px = cx + Math.cos(angle) * radius;
      final py = cy + Math.sin(angle) * radius;
      if (i == 0) {
        appendShapeMoveTo(shape, px, py);
      } else {
        appendShapeLineTo(shape, px, py);
      }
    }
  }

  // Draws a star centered at (cx, cy) with outer and inner radii and a given number of points.
  function drawStar(shape:Shape, cx:Float, cy:Float, outerRadius:Float, innerRadius:Float, points:Int):Void {
    final totalVertices = points * 2;
    final step = Math.PI / points;
    final startAngle = -Math.PI / 2;
    for (i in 0...totalVertices + 1) {
      final angle = startAngle + step * i;
      final r = i % 2 == 0 ? outerRadius : innerRadius;
      final px = cx + Math.cos(angle) * r;
      final py = cy + Math.sin(angle) * r;
      if (i == 0) {
        appendShapeMoveTo(shape, px, py);
      } else {
        appendShapeLineTo(shape, px, py);
      }
    }
  }

  // Upstream `enterFrame` only re-renders each frame; Lime's `render` override drives that.
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
  }

  // Upstream `render(main)`, driven by Lime's per-frame `render`.
  override public function render(context:RenderContext):Void {
    if (!ready || main == null) return;
    // Nothing changed since the last frame: skip the draw AND cancel this frame's present, so
    // Lime does not flip to the never-drawn back buffer (a black flash every second frame on
    // page-flip hardware). OpenFL's Stage pauses rendering the same way; the skipped frame costs
    // nothing, which matters on the interpreter targets.
    if (!prepareScene2DRender(renderState, main)) {
      window.onRender.cancel();
      return;
    }
    if (usingCairo) {
      renderCanvasBackground(renderState);
      renderCanvasScene2D(renderState, main);
    } else {
      renderGlBackground(renderState);
      renderGlScene2D(renderState, main);
    }
  }

  // Portable stand-in for JavaScript's `Number.prototype.toFixed`.
  static function toFixed(value:Float, digits:Int):String {
    final factor = Math.pow(10, digits);
    final rounded = Math.round(value * factor) / factor;
    var s = Std.string(rounded);
    final dot = s.indexOf('.');
    if (digits == 0) return dot == -1 ? s : s.substr(0, dot);
    if (dot == -1) s += '.';
    var decimals = s.length - s.indexOf('.') - 1;
    while (decimals < digits) {
      s += '0';
      decimals++;
    }
    return s;
  }
}
