// Line-by-line Haxe/Lime port of the upstream `spatial` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// Every statement of the upstream program is otherwise translated faithfully.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.DisplayObject;
import flighthq.types.Shape;
import flighthq.types.Spatial.SpatialAabb;
import flighthq.types.Spatial.SpatialIndex;
import flighthq.types.Spatial.SpatialObjectId;
import flighthq.types.Spatial.SpatialPair;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;
import lime.ui.MouseButton;
import lime.ui.Window;

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;

  final CANVAS_WIDTH = 800;
  final CANVAS_HEIGHT = 500;

  final COLOR_IDLE = 0x4488cc;
  final COLOR_OVERLAP = 0xcc4444;
  final COLOR_POINT_HIT = 0x44cc44;
  final COLOR_RAY_HIT = 0xcccc44;
  final COLOR_REGION_HIT = 0x44cccc;
  final COLOR_OUTLINE = 0x335577;

  final OBJECT_COUNT = 20;
  final MOVING_COUNT = 5;

  var root:DisplayObject;
  var index:SpatialIndex;

  var objects:Array<SpatialObject> = [];

  var queryOverlay:Shape;
  var hudLabel:DisplayObject;
  var modeLabel:DisplayObject;

  // Interaction state.
  var mouseX:Float;
  var mouseY:Float;

  var activeMode:String = 'pairs';

  // Reusable query output arrays.
  var pairsOut:Array<SpatialPair> = [];
  var idsOut:Array<SpatialObjectId> = [];

  public function new() {
    super();
    mouseX = CANVAS_WIDTH / 2;
    mouseY = CANVAS_HEIGHT / 2;
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
      backgroundColor: 0x1a1a2eff,
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

    index = createSpatialIndex(createUniformGridSpatialBackend(100));

    for (i in 0...OBJECT_COUNT) {
      final w = randomRange(30, 80);
      final h = randomRange(20, 60);
      final x = randomRange(10, CANVAS_WIDTH - w - 10);
      final y = randomRange(40, CANVAS_HEIGHT - h - 50);
      final bounds:SpatialAabb = {minX: x, minY: y, maxX: x + w, maxY: y + h};

      final shape = createShape();
      addNodeChild(root, shape);

      final isMoving = i < MOVING_COUNT;
      final speed = 30;

      objects.push({
        id: i,
        bounds: bounds,
        shape: shape,
        vx: isMoving ? randomRange(-speed, speed) : 0,
        vy: isMoving ? randomRange(-speed, speed) : 0,
      });

      insertSpatialObject(index, i, bounds);
    }

    // Query visualization overlay: draws region box, ray line, or point marker.
    queryOverlay = createShape();
    addNodeChild(root, queryOverlay);

    // HUD label.
    hudLabel = createTextLabel();
    hudLabel.data.text = 'Click: point query | R: ray query | Q: region query';
    hudLabel.data.textFormat = {size: 13, color: 0x888888};
    hudLabel.x = 10;
    hudLabel.y = 6;
    invalidateNodeLocalTransform(hudLabel);
    addNodeChild(root, hudLabel);

    modeLabel = createTextLabel();
    modeLabel.data.text = 'Mode: Pairs';
    modeLabel.data.textFormat = {size: 14, color: 0xcccccc};
    modeLabel.x = 10;
    modeLabel.y = CANVAS_HEIGHT - 30;
    invalidateNodeLocalTransform(modeLabel);
    addNodeChild(root, modeLabel);

    ready = true;
  }

  function randomRange(min:Float, max:Float):Float {
    return min + Math.random() * (max - min);
  }

  // Pointer moves in the browser update the query position; here Lime's `onMouseMove` supplies canvas coords.
  override public function onMouseMove(x:Float, y:Float):Void {
    mouseX = x;
    mouseY = y;
  }

  override public function onMouseDown(x:Float, y:Float, button:MouseButton):Void {
    activeMode = 'point';
  }

  override public function onMouseUp(x:Float, y:Float, button:MouseButton):Void {
    activeMode = 'pairs';
  }

  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {
    if (keyCode == R) activeMode = 'ray';
    if (keyCode == Q) activeMode = 'region';
  }

  override public function onKeyUp(keyCode:KeyCode, modifier:KeyModifier):Void {
    if (keyCode == R || keyCode == Q) activeMode = 'pairs';
  }

  function redrawObject(obj:SpatialObject, color:Int):Void {
    final b = obj.bounds;
    clearShapeCommands(obj.shape);
    appendShapeBeginFill(obj.shape, color, 0.5);
    appendShapeLineStyle(obj.shape, 1, COLOR_OUTLINE);
    appendShapeRectangle(obj.shape, b.minX, b.minY, b.maxX - b.minX, b.maxY - b.minY);
    appendShapeEndFill(obj.shape);
    invalidateNodeLocalTransform(obj.shape);
  }

  function drawQueryOverlay():Void {
    clearShapeCommands(queryOverlay);

    if (activeMode == 'point') {
      // Draw a small crosshair at the mouse position.
      appendShapeLineStyle(queryOverlay, 2, COLOR_POINT_HIT);
      appendShapeMoveTo(queryOverlay, mouseX - 8, mouseY);
      appendShapeLineTo(queryOverlay, mouseX + 8, mouseY);
      appendShapeMoveTo(queryOverlay, mouseX, mouseY - 8);
      appendShapeLineTo(queryOverlay, mouseX, mouseY + 8);
    } else if (activeMode == 'ray') {
      // Draw a ray from the left edge toward the mouse position.
      final dx = mouseX;
      final dy = mouseY - CANVAS_HEIGHT / 2;
      final len = Math.sqrt(dx * dx + dy * dy);
      if (len > 0) {
        final nx = dx / len;
        final ny = dy / len;
        final endX = nx * CANVAS_WIDTH * 1.5;
        final endY = CANVAS_HEIGHT / 2 + ny * CANVAS_WIDTH * 1.5;
        appendShapeLineStyle(queryOverlay, 1, COLOR_RAY_HIT);
        appendShapeMoveTo(queryOverlay, 0, CANVAS_HEIGHT / 2);
        appendShapeLineTo(queryOverlay, endX, endY);
      }
    } else if (activeMode == 'region') {
      // Draw a 100x100 query box centered at mouse.
      appendShapeBeginFill(queryOverlay, COLOR_REGION_HIT, 0.15);
      appendShapeLineStyle(queryOverlay, 1, COLOR_REGION_HIT);
      appendShapeRectangle(queryOverlay, mouseX - 50, mouseY - 50, 100, 100);
      appendShapeEndFill(queryOverlay);
    }

    invalidateNodeLocalTransform(queryOverlay);
  }

  function updateModeLabel(resultCount:Int):Void {
    final modeNames:Map<String, String> = ['pairs' => 'Pairs', 'point' => 'Point', 'ray' => 'Ray', 'region' => 'Region'];
    modeLabel.data.text = 'Mode: ' + modeNames[activeMode] + '  Hits: ' + resultCount;
    invalidateNodeAppearance(modeLabel);
  }

  // Upstream `enterFrame`, driven by Lime's per-frame `update` (deltaTime is milliseconds).
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    final rawDelta = deltaTime / 1000.0;
    final dt = Math.min(rawDelta, 0.05);

    // Move the first few objects and bounce them off the edges.
    for (i in 0...MOVING_COUNT) {
      final obj = objects[i];
      final w = obj.bounds.maxX - obj.bounds.minX;
      final h = obj.bounds.maxY - obj.bounds.minY;

      obj.bounds.minX += obj.vx * dt;
      obj.bounds.minY += obj.vy * dt;
      obj.bounds.maxX = obj.bounds.minX + w;
      obj.bounds.maxY = obj.bounds.minY + h;

      if (obj.bounds.minX < 0) {
        obj.bounds.minX = 0;
        obj.bounds.maxX = w;
        obj.vx = Math.abs(obj.vx);
      }
      if (obj.bounds.maxX > CANVAS_WIDTH) {
        obj.bounds.maxX = CANVAS_WIDTH;
        obj.bounds.minX = CANVAS_WIDTH - w;
        obj.vx = -Math.abs(obj.vx);
      }
      if (obj.bounds.minY < 0) {
        obj.bounds.minY = 0;
        obj.bounds.maxY = h;
        obj.vy = Math.abs(obj.vy);
      }
      if (obj.bounds.maxY > CANVAS_HEIGHT) {
        obj.bounds.maxY = CANVAS_HEIGHT;
        obj.bounds.minY = CANVAS_HEIGHT - h;
        obj.vy = -Math.abs(obj.vy);
      }

      updateSpatialObject(index, obj.id, obj.bounds);
    }

    // Determine which objects to highlight based on the active query mode.
    final highlightSet = new Map<Int, Bool>();
    var resultCount = 0;

    if (activeMode == 'pairs') {
      querySpatialPairs(index, pairsOut);
      resultCount = pairsOut.length;
      for (i in 0...pairsOut.length) {
        highlightSet.set(Std.int(pairsOut[i].a), true);
        highlightSet.set(Std.int(pairsOut[i].b), true);
      }
    } else if (activeMode == 'point') {
      querySpatialPoint(index, mouseX, mouseY, idsOut);
      resultCount = idsOut.length;
      for (i in 0...idsOut.length) {
        highlightSet.set(Std.int(idsOut[i]), true);
      }
    } else if (activeMode == 'ray') {
      final dx = mouseX;
      final dy = mouseY - CANVAS_HEIGHT / 2;
      querySpatialRay(index, 0, CANVAS_HEIGHT / 2, dx, dy, idsOut);
      resultCount = idsOut.length;
      for (i in 0...idsOut.length) {
        highlightSet.set(Std.int(idsOut[i]), true);
      }
    } else if (activeMode == 'region') {
      final region:SpatialAabb = {
        minX: mouseX - 50,
        minY: mouseY - 50,
        maxX: mouseX + 50,
        maxY: mouseY + 50,
      };
      querySpatialRegion(index, region, idsOut);
      resultCount = idsOut.length;
      for (i in 0...idsOut.length) {
        highlightSet.set(Std.int(idsOut[i]), true);
      }
    }

    // Choose highlight color based on mode.
    final hitColor = activeMode == 'point' ? COLOR_POINT_HIT : activeMode == 'ray' ? COLOR_RAY_HIT : activeMode == 'region' ? COLOR_REGION_HIT : COLOR_OVERLAP;

    for (i in 0...objects.length) {
      redrawObject(objects[i], highlightSet.exists(Std.int(objects[i].id)) ? hitColor : COLOR_IDLE);
    }

    drawQueryOverlay();
    updateModeLabel(resultCount);
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

// Upstream `SpatialObject` interface.
private typedef SpatialObject = {
  var id:SpatialObjectId;
  var bounds:SpatialAabb;
  var shape:Shape;
  var vx:Float;
  var vy:Float;
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
