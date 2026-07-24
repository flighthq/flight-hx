// Line-by-line Haxe/Lime port of the upstream `tween` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and the `requestAnimationFrame`/`stepApplicationLoop` loop are replaced
// by Lime's window/render lifecycle, and the Flight app backend is wired with
// `App.setAppBackend(createLimeAppBackend(this))`. Every statement is otherwise translated faithfully.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.DisplayObject;
import flighthq.types.EasingFunction;
import flighthq.types.Shape;
import flighthq.types.TweenManager;
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

  final CANVAS_WIDTH = 800;
  final CANVAS_HEIGHT = 600;
  final COLUMNS = 3;
  final ROWS = 5;
  final CELL_WIDTH = 800 / 3;
  final CELL_HEIGHT = 600 / 5;
  final CIRCLE_RADIUS = 8;
  final TWEEN_DURATION = 1500;
  final TRACK_MARGIN = 20;
  final FRAME_DELTA = 1000 / 60;

  var easings:Array<{name:String, ease:EasingFunction}>;
  var manager:TweenManager;
  var root:DisplayObject;
  // Upstream drives frames through a Flight `Application`; the browser `requestAnimationFrame` loop
  // becomes Lime's per-frame `update`.
  var app:flighthq.types.Application;
  var frame = 0;

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
      backgroundColor: 0x1a1a2eff,
      contextAttributes: {alpha: false, preserveDrawingBuffer: true},
      sceneGraphSyncPolicy: 'requiresInvalidation',
    });
    registerDefaultGlMaterial(renderState);
    registerRenderer(renderState, ShapeKind, defaultGlShapeRenderer);
    registerRenderer(renderState, TextLabelKind, defaultGlTextLabelRenderer);
    registerGlShapeCommands(defaultGlShapeCommands);
    enableGlBlendModeSupport(renderState);

    easings = [
      {name: 'easeInQuadratic', ease: easeInQuadratic},
      {name: 'easeOutQuadratic', ease: easeOutQuadratic},
      {name: 'easeInOutQuadratic', ease: easeInOutQuadratic},
      {name: 'easeInCubic', ease: easeInCubic},
      {name: 'easeOutCubic', ease: easeOutCubic},
      {name: 'easeInOutCubic', ease: easeInOutCubic},
      {name: 'easeInSine', ease: easeInSine},
      {name: 'easeOutSine', ease: easeOutSine},
      {name: 'easeInOutSine', ease: easeInOutSine},
      {name: 'easeInExponential', ease: easeInExponential},
      {name: 'easeOutExponential', ease: easeOutExponential},
      {name: 'easeInOutExponential', ease: easeInOutExponential},
      {name: 'easeInElastic', ease: easeInElastic},
      {name: 'easeOutElastic', ease: easeOutElastic},
      {name: 'easeOutBounce', ease: easeOutBounce},
    ];

    manager = createTweenManager();
    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    for (i in 0...easings.length) {
      final col = i % COLUMNS;
      final row = Std.int(i / COLUMNS);
      final cellX = col * CELL_WIDTH;
      final cellY = row * CELL_HEIGHT;

      final label = createTextLabel();
      label.data.text = easings[i].name;
      label.data.textFormat = {size: 13, color: 0xcccccc};
      label.x = cellX + 10;
      label.y = cellY + 8;
      invalidateNodeLocalTransform(label);
      addNodeChild(root, label);

      final trackStartX = cellX + TRACK_MARGIN;
      final trackEndX = cellX + CELL_WIDTH - TRACK_MARGIN;
      final trackY = cellY + CELL_HEIGHT * 0.62;

      final circle = createShape();
      appendShapeBeginFill(circle, 0x44aaee);
      appendShapeCircle(circle, 0, 0, CIRCLE_RADIUS);
      appendShapeEndFill(circle);
      circle.x = trackStartX;
      circle.y = trackY;
      invalidateNodeLocalTransform(circle);
      addNodeChild(root, circle);

      startTween(circle, trackStartX, trackEndX, easings[i].ease);
    }

    app = createApplication();
    connectSignal(app.onUpdate, function(delta) {
      updateTweens(manager, delta);
    });
    connectSignal(app.onRender, function(_) {
      // Upstream calls `render(root)` here; the actual GL draw happens in Lime's `render(context)`.
    });

    ready = true;
  }

  function startTween(circle:Shape, startX:Float, endX:Float, ease:EasingFunction):Void {
    circle.x = startX;
    invalidateNodeLocalTransform(circle);
    final tween = createTween(manager, circle, TWEEN_DURATION, {x: endX}, {ease: ease});
    connectSignal(tween.onComplete, function(_) {
      startTween(circle, startX, endX, ease);
    });
    connectSignal(tween.onUpdate, function(_) {
      invalidateNodeRender(circle);
    });
  }

  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {}

  // Upstream `enterFrame` stepped the Flight application loop; Lime drives it per frame.
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    stepApplicationLoop(app, frame == 0 ? 0 : FRAME_DELTA);
    frame++;
  }

  // Upstream `render(root)` (via `app.onRender`), driven by Lime's per-frame `render`.
  override public function render(context:RenderContext):Void {
    if (!ready || root == null) return;
    if (!prepareDisplayObjectRender(renderState, root)) return;
    renderGlBackground(renderState);
    renderGlDisplayObject(renderState, root);
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
