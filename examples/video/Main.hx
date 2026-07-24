// Line-by-line Haxe/Lime port of the upstream `video` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// The browser MediaRecorder/blob pipeline (`generateVideoBlob` + `loadVideoResourceFromBlob`) is
// unavailable headless, so it becomes a minimal stub that hands each node a `{width, height}` video
// source while keeping the `createVideo`/`setVideoSource`/`invalidateNodeAppearance` call sites intact.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.DisplayContainer;
import flighthq.types.Video;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.Window;

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;

  var root:DisplayContainer;
  var videoNode:Video;
  var secondVideoNode:Video;
  var thirdVideoNode:Video;

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
    registerRenderer(renderState, VideoKind, defaultGlVideoRenderer);
    registerGlShapeCommands(defaultGlShapeCommands);
    enableGlBlendModeSupport(renderState);

    root = createDisplayContainer();
    root.scaleX = scale;
    root.scaleY = scale;

    videoNode = createVideo();
    videoNode.x = 40;
    videoNode.y = 40;
    addNodeChild(root, videoNode);

    secondVideoNode = createVideo();
    secondVideoNode.x = 400;
    secondVideoNode.y = 40;
    secondVideoNode.scaleX = 1.5;
    secondVideoNode.scaleY = 1.5;
    secondVideoNode.alpha = 0.8;
    addNodeChild(root, secondVideoNode);

    thirdVideoNode = createVideo();
    thirdVideoNode.x = 200;
    thirdVideoNode.y = 280;
    thirdVideoNode.rotation = 10;
    addNodeChild(root, thirdVideoNode);

    // Upstream `generateVideoBlob().then(async (blob) => { ... })`, flattened to a synchronous headless
    // path: the MediaRecorder/blob capture and browser video loading are unavailable, so stubbed video
    // resources feed the same `setVideoSource` call sites.
    final blob = generateVideoBlob();
    final opts = {muted: true, playsInline: true};
    final resource1 = loadVideoResourceFromBlob(blob, opts);
    final resource2 = loadVideoResourceFromBlob(blob, opts);
    final resource3 = loadVideoResourceFromBlob(blob, opts);

    setVideoSource(videoNode, resource1);
    setVideoSource(secondVideoNode, resource2);
    setVideoSource(thirdVideoNode, resource3);

    for (r in [resource1, resource2, resource3]) {
      if (r.element != null) {
        r.element.loop = true;
        r.element.play();
      }
    }

    ready = true;
  }

  // Upstream `enterFrame`, driven by Lime's per-frame `update` (deltaTime is milliseconds).
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    invalidateNodeAppearance(videoNode);
    invalidateNodeAppearance(secondVideoNode);
    invalidateNodeAppearance(thirdVideoNode);
  }

  // Upstream `render(root)`, driven by Lime's per-frame `render`.
  override public function render(context:RenderContext):Void {
    if (!ready || root == null) return;
    if (!prepareDisplayObjectRender(renderState, root)) return;
    renderGlBackground(renderState);
    renderGlDisplayObject(renderState, root);
  }

  // Browser MediaRecorder/canvas capture becomes a headless stub: return a plain descriptor standing in
  // for the recorded `Blob`. The stubbed `loadVideoResourceFromBlob` below never dereferences it.
  function generateVideoBlob():Dynamic {
    return {};
  }

  // Headless stand-in for the browser blob loader: returns a `{width, height}` sized video source with a
  // null `element`, so the `r.element != null` play guard cleanly no-ops without a platform media source.
  function loadVideoResourceFromBlob(blob:Dynamic, opts:Dynamic):Dynamic {
    return {width: 320, height: 240, element: null};
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
