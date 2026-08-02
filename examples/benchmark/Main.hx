// Line-by-line Haxe/Lime port of the upstream `benchmark` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// The offscreen `<canvas>` that paints the shape texture and the DOM FPS overlay are browser glue; the
// canvas is a minimal stub that keeps the SDK call sites, and the overlay is replaced by a plain field.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.DisplayObject;
import flighthq.types.Bitmap;
import flighthq.types.QuadBatch;
import flighthq.types.TextLabel;
import flighthq.types.TextureAtlas;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.Window;
import flighthq._internal._UInt8ClampedArray;

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;
  var usingCairo = false;

  final GRAVITY = 0.5;
  final WIDTH = 800;
  final HEIGHT = 500;
  final INITIAL_COUNT = 10;
  final BATCH_SIZE = 100;
  final SHAPE_SIZE = 16;

  var atlas:TextureAtlas;
  var root:DisplayObject;
  var quadBatch:QuadBatch;
  var countLabel:TextLabel;

  final posX:Array<Float> = [];
  final posY:Array<Float> = [];
  final speedX:Array<Float> = [];
  final speedY:Array<Float> = [];
  var addingShapes = false;

  var frameCount = 0;
  var fpsTime = 0.0;
  // Stand-in for the DOM FPS overlay (`fpsOverlay.textContent`); browser-only in the upstream.
  var fpsText = '';

  public function new() {
    super();
  }

  // Lime: window/GL are ready. Wire the Flight Lime backend, set up the GL renderer, build the scene.
  override public function onWindowCreate():Void {
    App.setAppBackend(LimeApp.createLimeAppBackend(this));
    trace('window context type: ' + window.context.type);
    switch (window.context.type) {
      case CAIRO:
        usingCairo = true;
      case OPENGL, OPENGLES, WEBGL:
      default:
        throw 'Flight examples require an OpenGL/WebGL or cairo render context.';
    }
    scale = window.scale;
    if (usingCairo) {
      final canvas = new _CairoCanvas(window);
      renderState = createCanvasRenderState(canvas, {
        pixelRatio: window.scale,
        backgroundColor: 0x1a1a2eff,
        sceneGraphSyncPolicy: 'requiresInvalidation',
      });
      registerRenderer(renderState, QuadBatchKind, defaultCanvasQuadBatchRenderer);
      registerRenderer(renderState, TextLabelKind, defaultCanvasTextLabelRenderer);
      registerCanvasImageTextureResolver(renderState);
      registerCanvasBitmapTextureResolver(renderState);
      enableCanvasBlendMode(renderState);
    } else {
      final canvas = new _GlCanvas(window);
      renderState = createGlRenderState(canvas, {
        pixelRatio: window.scale,
        backgroundColor: 0x1a1a2eff,
        contextAttributes: {alpha: false, preserveDrawingBuffer: true},
        sceneGraphSyncPolicy: 'requiresInvalidation',
      });
      registerGlStandardMaterial(renderState);
      registerStandardGlTextureResolvers(renderState);
      registerRenderer(renderState, QuadBatchKind, defaultGlQuadBatchRenderer);
      registerRenderer(renderState, TextLabelKind, defaultGlTextLabelRenderer);
      enableGlBlendModeSupport(renderState);
    }

    atlas = createTextureAtlas({image: createShapeImage()});
    addTextureAtlasRegion(atlas, 0, 0, SHAPE_SIZE, SHAPE_SIZE);

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    quadBatch = createQuadBatch();
    quadBatch.data.atlas = atlas;
    addNodeChild(root, quadBatch);

    countLabel = createTextLabel();
    countLabel.data.text = '0 shapes';
    countLabel.data.textFormat = {size: 14, color: 0xffffff};
    countLabel.x = 10;
    countLabel.y = HEIGHT - 24;
    invalidateNodeLocalTransform(countLabel);
    addNodeChild(root, countLabel);

    fpsTime = now();

    for (i in 0...INITIAL_COUNT) {
      addShape();
    }

    #if sys
    // Probe-only population: headless runs have no pointer to grow the scene,
    // so the perf harness sets a fixed shape count for a stable workload.
    final perfShapes = Sys.getEnv('FLIGHT_PERF_SHAPES');
    if (perfShapes != null) {
      while (posX.length < Std.parseInt(perfShapes)) {
        addShape();
      }
    }
    #end

    ready = true;
  }

  function addShape():Void {
    resizeQuadBatch(quadBatch, posX.length + 1);
    invalidateNodeAppearance(quadBatch);
    posX.push(0);
    posY.push(0);
    speedX.push(Math.random() * 5);
    speedY.push(Math.random() * 5 - 2.5);
  }

  // Upstream `canvas.addEventListener('mousedown'/'mouseup', …)`.
  override public function onMouseDown(x:Float, y:Float, button:Int):Void {
    addingShapes = true;
  }

  override public function onMouseUp(x:Float, y:Float, button:Int):Void {
    addingShapes = false;
  }

  // Upstream `enterFrame`, driven by Lime's per-frame `update`.
  override public function update(deltaTime:Int):Void {
    if (!ready) return;

    final count:Int = quadBatch.data.instanceCount;
    final transforms:flighthq._internal._Float32Array = quadBatch.data.transforms;

    for (i in 0...count) {
      posX[i] += speedX[i];
      posY[i] += speedY[i];
      speedY[i] += GRAVITY;

      if (posX[i] > WIDTH - SHAPE_SIZE) {
        speedX[i] *= -1;
        posX[i] = WIDTH - SHAPE_SIZE;
      } else if (posX[i] < 0) {
        speedX[i] *= -1;
        posX[i] = 0;
      }

      if (posY[i] > HEIGHT - SHAPE_SIZE) {
        speedY[i] *= -0.8;
        posY[i] = HEIGHT - SHAPE_SIZE;
        if (Math.random() > 0.5) {
          speedY[i] -= 3 + Math.random() * 4;
        }
      } else if (posY[i] < 0) {
        speedY[i] = 0;
        posY[i] = 0;
      }

      transforms[i * 2] = posX[i];
      transforms[i * 2 + 1] = posY[i];
    }

    invalidateNodeAppearance(quadBatch);

    if (addingShapes) {
      for (i in 0...BATCH_SIZE) {
        addShape();
      }
    }

    countLabel.data.text = posX.length + ' shapes';
    invalidateNodeAppearance(countLabel);

    frameCount++;
    final t = now();
    if (t - fpsTime >= 1000) {
      fpsText = frameCount + ' FPS';
      frameCount = 0;
      fpsTime = t;
    }
  }

  // Upstream `render(root)`, driven by Lime's per-frame `render`.
  var perfFrames = 0;
  var perfStart = 0.0;

  override public function render(context:RenderContext):Void {
    if (!ready || root == null) return;
    #if sys
    if (Sys.getEnv('FLIGHT_PERF_FRAMES') != null) {
      if (perfFrames == 0) perfStart = haxe.Timer.stamp();
      perfFrames++;
      final target = Std.parseInt(Sys.getEnv('FLIGHT_PERF_FRAMES'));
      if (perfFrames >= target) {
        final elapsed = haxe.Timer.stamp() - perfStart;
        Sys.println('PERF frames=' + (perfFrames - 1) + ' elapsed=' + elapsed + 's fps=' + ((perfFrames - 1) / elapsed));
        lime.system.System.exit(0);
      }
    }
    #end
    if (!prepareScene2DRender(renderState, root)) return;
    #if sys
    // Script-only bench mode: full update/prepare cost without backend draws,
    // so tranche measurements are not flattened by the rasterizer floor.
    if (Sys.getEnv('FLIGHT_PERF_MODE') == 'script') return;
    #end
    if (usingCairo) {
      renderCanvasBackground(renderState);
      renderCanvasScene2D(renderState, root);
    } else {
      renderGlBackground(renderState);
      renderGlScene2D(renderState, root);
    }
  }

  // Portable stand-in for the browser `performance.now()` millisecond clock.
  static inline function now():Float {
    return haxe.Timer.stamp() * 1000;
  }

  // Portable procedural shape sprite: a filled #44aaee disc, uploaded as real RGBA bytes through the
  // ImageResource `data` path. A bare `{width, height}` object would instead become `image.source` and
  // hit the DOM-element `texImage2D` overload, which rejects a plain object.
  function createShapeImage():Dynamic {
    final size = SHAPE_SIZE;
    final pixels = new _UInt8ClampedArray(size * size * 4);
    final c = (size - 1) / 2;
    final r = size / 2 - 1;
    for (y in 0...size) {
      for (x in 0...size) {
        final d = Math.sqrt((x - c) * (x - c) + (y - c) * (y - c));
        if (d <= r) {
          final i = (y * size + x) * 4;
          pixels[i] = 68;
          pixels[i + 1] = 170;
          pixels[i + 2] = 238;
          pixels[i + 3] = 255;
        }
      }
    }
    return imageFromPixels(size, size, pixels);
  }

  function imageFromPixels(width:Int, height:Int, pixels:_UInt8ClampedArray):Dynamic {
    final bitmap:Bitmap = createBitmap(width, height);
    // createBitmap allocates zeroed pixels; overwrite them with the painted content.
    for (i in 0...Std.int(pixels.length)) bitmap.data[i] = pixels[i];
    return createImageResourceFromBitmap(bitmap);
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

// Canvas adapter presenting the Lime software window's cairo context as the 2D
// canvas `createCanvasRenderState` expects (the cairo counterpart of _GlCanvas).
@:keep
private class _CairoCanvas {
  public var width:Int = 0;
  public var height:Int = 0;

  final window:Window;
  final context:Dynamic;

  public function new(window:Window) {
    this.window = window;
    #if (lime && !js && lime_cairo)
    // Lime creates (and can recreate) the window Cairo at render-surface lock,
    // so hand the context a live provider instead of one cached instance.
    final windowRef = window;
    context = new flighthq._internal.backend.NativeCanvas2dContext(window.context.cairo,
      () -> windowRef.context.cairo);
    #else
    context = null;
    #end
    syncSize();
    window.onResize.add((_, _) -> syncSize());
  }

  public function getContext(contextId:String, ?attributes:Dynamic):Dynamic {
    return context;
  }

  function syncSize():Void {
    width = Std.int(window.width * window.scale);
    height = Std.int(window.height * window.scale);
    #if (lime && !js && lime_cairo)
    (cast context : flighthq._internal.backend.NativeCanvas2dContext).resize(width, height);
    #end
  }
}
