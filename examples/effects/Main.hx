// Line-by-line Haxe/Lime port of the upstream `effects` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and its one-shot `render(root, effects)` call are replaced by Lime's
// window/render lifecycle, and the Flight app backend is wired with
// `App.setAppBackend(createLimeAppBackend(this))`. Every statement is otherwise translated faithfully.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.DisplayContainer;
import flighthq.types.RenderEffect;
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

  var root:DisplayContainer;
  // Effect chain: bloom -> vignette -> tone map, plus the GL effect pipeline that applies it.
  var effects:Array<RenderEffect>;
  var pipeline:Dynamic;

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
      backgroundColor: 0x0a0c14ff,
      contextAttributes: {alpha: false, preserveDrawingBuffer: true},
    });
    registerDefaultGlMaterial(renderState);
    registerRenderer(renderState, ShapeKind, defaultGlShapeRenderer);
    registerGlShapeCommands(defaultGlShapeCommands);
    registerStandardGlRenderEffects(renderState);
    enableGlBlendModeSupport(renderState);
    pipeline = createGlRenderEffectPipeline(renderState);

    root = createDisplayContainer();
    root.scaleX = scale;
    root.scaleY = scale;

    // Bright shapes on a dark background — bloom makes them glow, vignette draws focus
    // to the center, and tone mapping compresses highlights.
    final colors = [0xff3366, 0x33ff99, 0x3399ff, 0xffcc33, 0xff66cc];

    for (i in 0...colors.length) {
      final shape = createShape();
      final angle = (i / colors.length) * Math.PI * 2;
      final cx = 400 + Math.cos(angle) * 180;
      final cy = 300 + Math.sin(angle) * 140;

      appendShapeBeginFill(shape, colors[i], 1);
      appendShapeCircle(shape, cx, cy, 60 + i * 8);
      appendShapeEndFill(shape);
      addNodeChild(root, shape);
    }

    // Center diamond shape.
    final center = createShape();
    appendShapeBeginFill(center, 0xffffff, 1);
    appendShapeRectangle(center, 350, 250, 100, 100);
    appendShapeEndFill(center);
    center.rotation = 45;
    center.pivotX = 400;
    center.pivotY = 300;
    invalidateNodeLocalTransform(center);
    addNodeChild(root, center);

    // Effect chain: bloom -> vignette -> tone map.
    effects = [
      createBloomEffect({threshold: 0.5, intensity: 1.2}),
      createVignetteEffect({intensity: 0.8}),
      createToneMapEffect({"operator": 'aces', exposure: 1.2}),
    ];

    ready = true;
  }

  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {}

  // The upstream program renders once; Lime re-renders every frame with no per-frame state changes.
  override public function update(deltaTime:Int):Void {}

  // Upstream `render(root, effects)`, driven by Lime's per-frame `render`.
  override public function render(context:RenderContext):Void {
    if (!ready || root == null) return;
    if (!prepareDisplayObjectRender(renderState, root)) return;
    beginGlRenderEffectPipeline(renderState, pipeline);
    renderGlBackground(renderState);
    renderGlDisplayObject(renderState, root);
    endGlRenderEffectPipeline(renderState, pipeline, cast effects);
  }
}

// Minimal GL canvas adapter over the Lime window, matching the shape `createGlRenderState` expects.
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
