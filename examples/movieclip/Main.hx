// Line-by-line Haxe/Lime port of the upstream `movieclip` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// Every statement of the upstream program is otherwise translated faithfully.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.DisplayObject;
import flighthq.types.MovieClip;
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

  var root:DisplayObject;

  final TOTAL_FRAMES = 24;
  final FRAME_RATE = 8;

  // Lazily cache a child Shape per MovieClip target so the source is shareable.
  final shapeCache = new haxe.ds.ObjectMap<DisplayObject, Shape>();

  var clip:MovieClip;

  // Frame scripts at labeled frames update the frame-script status text.
  var lastFrameScriptMessage = '';

  var titleLabel:DisplayObject;
  var frameLabel:DisplayObject;
  var labelLabel:DisplayObject;
  var statusLabel:DisplayObject;
  var scriptLabel:DisplayObject;
  var controlsLabel:DisplayObject;

  public function new() {
    super();
  }

  function getOrCreateChildShape(target:DisplayObject):Shape {
    var shape = shapeCache.get(target);
    if (shape == null) {
      shape = createShape();
      shape.x = 300;
      shape.y = 180;
      invalidateNodeLocalTransform(shape);
      addNodeChild(target, shape);
      shapeCache.set(target, shape);
    }
    return shape;
  }

  // Draw different shapes/colors depending on the frame range:
  //   Frames 1-8 (intro): growing blue squares
  //   Frames 9-18 (loop): rotating green triangles
  //   Frames 19-24 (outro): shrinking red circles
  function drawFrameContent(shape:Shape, frame:Float):Void {
    clearShapeCommands(shape);

    if (frame <= 8) {
      final progress = frame / 8;
      final size = 40 + progress * 80;
      final half = size / 2;
      final blue = 0x4488ccff;
      appendShapeBeginFill(shape, blue);
      appendShapeRectangle(shape, -half, -half, size, size);
      appendShapeEndFill(shape);
    } else if (frame <= 18) {
      final progress = (frame - 8) / 10;
      final size = 60 + progress * 40;
      final half = size / 2;
      final height = (size * Math.sqrt(3)) / 2;
      final green = 0x44cc88ff;
      appendShapeBeginFill(shape, green);
      appendShapeMoveTo(shape, 0, -height / 2);
      appendShapeLineTo(shape, half, height / 2);
      appendShapeLineTo(shape, -half, height / 2);
      appendShapeLineTo(shape, 0, -height / 2);
      appendShapeEndFill(shape);
    } else {
      final progress = (frame - 18) / 6;
      final radius = 60 - progress * 40;
      final red = 0xcc4444ff;
      appendShapeBeginFill(shape, red);
      appendShapeCircle(shape, 0, 0, radius);
      appendShapeEndFill(shape);
    }

    invalidateNodeAppearance(shape);
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

    // Build the timeline source with labeled frame ranges.
    final timelineSource = createTimelineSource({
      totalFrames: TOTAL_FRAMES,
      frameRate: FRAME_RATE,
      labels: [
        {name: 'intro', frame: 1},
        {name: 'loop', frame: 9},
        {name: 'outro', frame: 19},
      ],
      constructFrame: function(target:DisplayObject, frame:Float):Void {
        final shape = getOrCreateChildShape(target);
        drawFrameContent(shape, frame);
      },
    });

    // Create the MovieClip and bind its source.
    clip = createMovieClip();
    clip.x = 100;
    clip.y = 20;
    invalidateNodeLocalTransform(clip);
    addNodeChild(root, clip);
    setMovieClipSource(clip, timelineSource);

    addMovieClipFrameScript(clip, 'intro', function():Void {
      lastFrameScriptMessage = 'Frame script: entered "intro"';
    });

    addMovieClipFrameScript(clip, 'loop', function():Void {
      lastFrameScriptMessage = 'Frame script: entered "loop"';
    });

    addMovieClipFrameScript(clip, 'outro', function():Void {
      lastFrameScriptMessage = 'Frame script: entered "outro"';
    });

    // Start playing.
    playMovieClip(clip);

    // HUD labels.
    titleLabel = createLabel('Movie Clip', 20, 10, 24, 0xffffff);
    addNodeChild(root, titleLabel);

    frameLabel = createLabel('', 20, 50, 16, 0xcccccc);
    addNodeChild(root, frameLabel);

    labelLabel = createLabel('', 20, 75, 16, 0x88aacc);
    addNodeChild(root, labelLabel);

    statusLabel = createLabel('', 20, 100, 16, 0x88cc88);
    addNodeChild(root, statusLabel);

    scriptLabel = createLabel('', 20, 125, 14, 0xccaa44);
    addNodeChild(root, scriptLabel);

    controlsLabel = createLabel('Space play/stop   Left/Right step   1 intro   2 loop   3 outro', 20, 470, 13, 0x888888);
    addNodeChild(root, controlsLabel);

    ready = true;
  }

  // HUD labels.
  function createLabel(text:String, x:Float, y:Float, size:Float, color:Int):DisplayObject {
    final label = createTextLabel();
    label.data.text = text;
    label.data.textFormat = {size: size, color: color};
    label.x = x;
    label.y = y;
    invalidateNodeLocalTransform(label);
    return label;
  }

  function updateLabel(label:DisplayObject, text:String):Void {
    label.data.text = text;
    invalidateNodeAppearance(label);
  }

  // Keyboard controls. In the browser this is a `keydown` listener; here it is Lime's `onKeyDown`.
  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {
    if (!ready) return;
    switch (keyCode) {
      case SPACE:
        if (isMovieClipPlaying(clip)) {
          stopMovieClip(clip);
        } else {
          playMovieClip(clip);
        }
      case LEFT:
        prevFrameMovieClip(clip);
      case RIGHT:
        nextFrameMovieClip(clip);
      case NUMBER_1:
        gotoAndPlayMovieClip(clip, 'intro');
      case NUMBER_2:
        gotoAndPlayMovieClip(clip, 'loop');
      case NUMBER_3:
        gotoAndStopMovieClip(clip, 'outro');
      default:
    }
  }

  // Upstream `enterFrame`, driven by Lime's per-frame `update` (deltaTime is milliseconds).
  override public function update(deltaTime:Int):Void {
    if (!ready) return;

    updateMovieClip(clip, deltaTime);

    // Update HUD.
    final currentFrame = getMovieClipCurrentFrame(clip);
    final totalFrames = getMovieClipTotalFrames(clip);
    final currentLabel = getMovieClipCurrentLabel(clip);
    final playing = isMovieClipPlaying(clip);

    updateLabel(frameLabel, 'Frame: ' + currentFrame + ' / ' + totalFrames);
    updateLabel(labelLabel, 'Label: ' + (currentLabel != null ? currentLabel.name : '(none)'));
    updateLabel(statusLabel, playing ? 'Playing' : 'Stopped');
    updateLabel(scriptLabel, lastFrameScriptMessage);
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
