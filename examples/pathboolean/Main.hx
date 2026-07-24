// Line-by-line Haxe/Lime port of the upstream `pathboolean` example (`app.ts`), written directly
// against the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`:
// the browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// The DOM overlay labels become in-scene text labels; pointer drag becomes Lime's mouse callbacks.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.DisplayObject;
import flighthq.types.Path;
import flighthq.types.Shape;
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

  final CELL_W = 400;
  final CELL_H = 300;

  final FILL_COLORS:Array<Int> = [
    0x2980b9, // union: blue
    0x27ae60, // intersect: green
    0xc0392b, // difference: red
    0x8e44ad, // xor: purple
  ];

  final OUTLINE_COLOR_A = 0x34495e;
  final OUTLINE_COLOR_B = 0xe67e22;

  var root:DisplayObject;

  // Source shape center offsets (relative to each cell center). Shape A is left of center, shape B
  // is right of center, overlapping in the middle.
  var shapeAOffsetX:Float = -40;
  var shapeAOffsetY:Float = 0;
  var shapeBOffsetX:Float = 40;
  var shapeBOffsetY:Float = 0;

  // Grid cells: [row, col] -> [Union, Intersect, Difference, XOR].
  final labels = ['Union', 'Intersect', 'Difference (A - B)', 'XOR'];
  var resultShapes:Array<Shape> = [];
  var outlineShapes:Array<Shape> = [];

  // Drag interaction: detect which source shape the pointer is near and drag it.
  var dragging:String = null; // 'a' | 'b' | null
  var dragStartX:Float = 0;
  var dragStartY:Float = 0;
  var dragStartOffsetX:Float = 0;
  var dragStartOffsetY:Float = 0;

  public function new() {
    super();
  }

  // Lime: window/GL are ready. Wire the Flight Lime backend, set up the GL renderer, build the scene.
  override public function onWindowCreate():Void {
    App.setAppBackend(LimeApp.createLimeAppBackend(this));
    switch (window.context.type) {
      case OPENGL, OPENGLES, WEBGL:
      default:
        throw 'Flight examples require an OpenGL/WebGL render context.';
    }
    scale = window.scale;
    final canvas = new _GlCanvas(window);
    renderState = createGlRenderState(canvas, {
      pixelRatio: window.scale,
      backgroundColor: 0xf0f0f0ff,
      contextAttributes: {alpha: false, preserveDrawingBuffer: true},
      sceneGraphSyncPolicy: 'requiresInvalidation',
    });
    registerDefaultGlMaterial(renderState);
    registerRenderer(renderState, ShapeKind, defaultGlShapeRenderer);
    registerRenderer(renderState, TextLabelKind, defaultGlTextLabelRenderer);
    registerGlShapeCommands(defaultGlShapeCommands);
    enableGlBlendModeSupport(renderState);

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    for (i in 0...4) {
      final col = i % 2;
      final row = Std.int(i / 2);

      final resultShape = createShape();
      resultShape.x = col * CELL_W;
      resultShape.y = row * CELL_H;
      invalidateNodeLocalTransform(resultShape);
      addNodeChild(root, resultShape);
      resultShapes.push(resultShape);

      final outlineShape = createShape();
      outlineShape.x = col * CELL_W;
      outlineShape.y = row * CELL_H;
      invalidateNodeLocalTransform(outlineShape);
      addNodeChild(root, outlineShape);
      outlineShapes.push(outlineShape);
    }

    rebuild();

    // Overlay labels (DOM elements in the browser) rendered as in-scene text labels here.
    for (i in 0...4) {
      addLabel(labels[i], i % 2, Std.int(i / 2));
    }

    ready = true;
  }

  function buildSourcePaths():{pathA:Path, pathB:Path} {
    final cx = CELL_W / 2;
    final cy = CELL_H / 2;

    final pathA = createPath();
    appendPathCircle(pathA, cx + shapeAOffsetX, cy + shapeAOffsetY, 80);

    final pathB = createPath();
    appendPathRoundRectangle(pathB, cx + shapeBOffsetX - 70, cy + shapeBOffsetY - 60, 140, 120, 16);

    return {pathA: pathA, pathB: pathB};
  }

  function drawOutlines(shape:Shape, pathA:Path, pathB:Path):Void {
    appendShapeLineStyle(shape, 2, OUTLINE_COLOR_A, 0.5);
    appendShapePath(shape, pathA.commands, pathA.data, pathA.winding);
    appendShapeEndFill(shape);

    appendShapeLineStyle(shape, 2, OUTLINE_COLOR_B, 0.5);
    appendShapePath(shape, pathB.commands, pathB.data, pathB.winding);
    appendShapeEndFill(shape);
  }

  function drawBooleanResult(shape:Shape, resultPath:Path, color:Int):Void {
    appendShapeBeginFill(shape, color, 0.7);
    appendShapePath(shape, resultPath.commands, resultPath.data, resultPath.winding);
    appendShapeEndFill(shape);
  }

  function rebuild():Void {
    final built = buildSourcePaths();
    final pathA = built.pathA;
    final pathB = built.pathB;

    final operations:Array<(Path, Path) -> Path> = [
      (a, b) -> unionPaths(a, b),
      (a, b) -> intersectPaths(a, b),
      (a, b) -> differencePaths(a, b),
      (a, b) -> xorPaths(a, b),
    ];

    for (i in 0...4) {
      final resultPath = operations[i](pathA, pathB);

      clearShapeCommands(resultShapes[i]);
      drawBooleanResult(resultShapes[i], resultPath, FILL_COLORS[i]);

      clearShapeCommands(outlineShapes[i]);
      drawOutlines(outlineShapes[i], pathA, pathB);
    }
  }

  function canvasToWorld(clientX:Float, clientY:Float):{x:Float, y:Float} {
    // The browser maps client coordinates through the canvas bounding rect; here the window fills the
    // canvas, so the window size stands in for `rect.width`/`rect.height`.
    return {
      x: (clientX / window.width) * (CELL_W * 2),
      y: (clientY / window.height) * (CELL_H * 2),
    };
  }

  function distToShapeCenter(wx:Float, wy:Float, offsetX:Float, offsetY:Float):Float {
    final cx = CELL_W / 2 + offsetX;
    final cy = CELL_H / 2 + offsetY;
    final dx = wx - cx;
    final dy = wy - cy;
    return Math.sqrt(dx * dx + dy * dy);
  }

  // Overlay labels using in-scene text labels positioned over the grid cells.
  function addLabel(text:String, col:Int, row:Int):Void {
    final label = createTextLabel();
    label.data.text = text;
    label.data.textFormat = {size: 14, color: 0x333333};
    label.x = col * CELL_W + 10;
    label.y = row * CELL_H + 8;
    invalidateNodeLocalTransform(label);
    addNodeChild(root, label);
  }

  // Drag interaction. Browser `pointerdown` becomes Lime's `onMouseDown`.
  override public function onMouseDown(x:Float, y:Float, button:Int):Void {
    if (!ready) return;
    final world = canvasToWorld(x, y);
    final distA = distToShapeCenter(world.x, world.y, shapeAOffsetX, shapeAOffsetY);
    final distB = distToShapeCenter(world.x, world.y, shapeBOffsetX, shapeBOffsetY);

    // Pick the closer shape if within reach (generous 100px radius).
    if (distA < 100 && distA <= distB) {
      dragging = 'a';
      dragStartX = world.x;
      dragStartY = world.y;
      dragStartOffsetX = shapeAOffsetX;
      dragStartOffsetY = shapeAOffsetY;
    } else if (distB < 100) {
      dragging = 'b';
      dragStartX = world.x;
      dragStartY = world.y;
      dragStartOffsetX = shapeBOffsetX;
      dragStartOffsetY = shapeBOffsetY;
    }
  }

  override public function onMouseMove(x:Float, y:Float):Void {
    if (dragging == null) return;
    final world = canvasToWorld(x, y);
    final dx = world.x - dragStartX;
    final dy = world.y - dragStartY;

    if (dragging == 'a') {
      shapeAOffsetX = dragStartOffsetX + dx;
      shapeAOffsetY = dragStartOffsetY + dy;
    } else {
      shapeBOffsetX = dragStartOffsetX + dx;
      shapeBOffsetY = dragStartOffsetY + dy;
    }

    rebuild();
  }

  override public function onMouseUp(x:Float, y:Float, button:Int):Void {
    dragging = null;
  }

  // Upstream `render(root)`, driven by Lime's per-frame `render`.
  override public function render(context:RenderContext):Void {
    if (!ready || root == null) return;
    if (!prepareDisplayObjectRender(renderState, root)) return;
    renderGlBackground(renderState);
    renderGlDisplayObject(renderState, root);
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

// Minimal GL canvas adapter over the Lime window, matching the shape `createGlRenderState` expects.
// @:keep — Flight reaches this adapter only reflectively (getContext/width/height via Reflect),
// so full DCE would strip those members and reflective access would crash. Retain the whole adapter.
@:keep
private class _GlCanvas {
  // Flight's GL renderer reads `canvas.width`/`canvas.height` reflectively (`Reflect.field`) to build
  // both the GL viewport and the pixel->clip projection. A Haxe `(get, never)` property compiles to
  // `get_width()` with no reflectable `width` field, so the reflective read returns `undefined`, the
  // viewport becomes 0x0 and the projection `2 / undefined` becomes NaN — every draw is discarded while
  // the (viewport/projection-independent) background clear still shows. So expose plain physical fields
  // and keep them in sync with the backing buffer size (device pixels = window size * scale).
  public var width:Int = 0;
  public var height:Int = 0;

  final window:Window;
  final context:Dynamic;

  public function new(window:Window) {
    this.window = window;
    context = resolveContext(window);
    if (context == null) throw 'Flight examples require a hardware OpenGL/WebGL window.';
    syncSize();
    window.onResize.add((_, _) -> syncSize());
  }

  public function getContext(contextId:String, ?attributes:Dynamic):Dynamic {
    return context;
  }

  function syncSize():Void {
    width = Std.int(window.width * window.scale);
    height = Std.int(window.height * window.scale);
  }

  static function resolveContext(window:Window):Dynamic {
    final renderContext:Dynamic = window.context;
    if (renderContext == null) return null;
    final webgl2 = renderContext.webgl2;
    return webgl2 == null ? renderContext.webgl : webgl2;
  }
}
