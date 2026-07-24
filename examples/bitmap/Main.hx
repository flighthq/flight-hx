// Line-by-line Haxe/Lime port of the upstream `bitmap` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// The browser Canvas-2D image painters become minimal stubs that hand `createImageResource` a
// `{width, height}` image source, keeping every SDK call site identical.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.Bitmap;
import flighthq.types.DisplayObject;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.Window;

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;

  var root:DisplayObject;

  var gradientBitmap:Bitmap;
  var checkerBitmap:Bitmap;
  var circleBitmap:Bitmap;
  var rotatedBitmap:Bitmap;
  var combinedBitmap:Bitmap;

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
    registerRenderer(renderState, BitmapKind, defaultGlBitmapRenderer);
    registerGlShapeCommands(defaultGlShapeCommands);
    enableGlBlendModeSupport(renderState);

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    // Gradient square: a colorful linear gradient from top-left to bottom-right.

    gradientBitmap = createBitmap();
    gradientBitmap.data.image = createImageResource(createGradientImage(128, 128));
    gradientBitmap.x = 60;
    gradientBitmap.y = 60;
    addNodeChild(root, gradientBitmap);

    // Checkerboard pattern: demonstrates procedural pattern generation.

    checkerBitmap = createBitmap();
    checkerBitmap.data.image = createImageResource(createCheckerboardImage(128, 128));
    checkerBitmap.x = 340;
    checkerBitmap.y = 60;
    checkerBitmap.alpha = 0.5;
    addNodeChild(root, checkerBitmap);

    // Circle with radial gradient: scaled to 2x.

    circleBitmap = createBitmap();
    circleBitmap.data.image = createImageResource(createRadialGradientImage(128, 128));
    circleBitmap.x = 620;
    circleBitmap.y = 60;
    circleBitmap.scaleX = 2;
    circleBitmap.scaleY = 2;
    addNodeChild(root, circleBitmap);

    // Rotated gradient square: the same gradient image rotated 30 degrees.

    rotatedBitmap = createBitmap();
    rotatedBitmap.data.image = createImageResource(createGradientImage(96, 96));
    rotatedBitmap.x = 200;
    rotatedBitmap.y = 340;
    rotatedBitmap.rotation = 30;
    addNodeChild(root, rotatedBitmap);

    // Combined properties: scaled, semi-transparent, and rotated checkerboard.

    combinedBitmap = createBitmap();
    combinedBitmap.data.image = createImageResource(createCheckerboardImage(80, 80));
    combinedBitmap.x = 500;
    combinedBitmap.y = 340;
    combinedBitmap.scaleX = 1.5;
    combinedBitmap.scaleY = 1.5;
    combinedBitmap.alpha = 0.7;
    combinedBitmap.rotation = -15;
    addNodeChild(root, combinedBitmap);

    ready = true;
  }

  // Upstream `render(root)`, driven by Lime's per-frame `render`.
  override public function render(context:RenderContext):Void {
    if (!ready || root == null) return;
    if (!prepareDisplayObjectRender(renderState, root)) return;
    renderGlBackground(renderState);
    renderGlDisplayObject(renderState, root);
  }

  // Browser-only Canvas-2D image painters become headless stubs: the GL bitmap renderer only needs a
  // sized image source, so hand back a `{width, height}` descriptor with the same call signature.
  function createGradientImage(width:Float, height:Float):Dynamic {
    return {width: width, height: height};
  }

  function createCheckerboardImage(width:Float, height:Float):Dynamic {
    return {width: width, height: height};
  }

  function createRadialGradientImage(width:Float, height:Float):Dynamic {
    return {width: width, height: height};
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
