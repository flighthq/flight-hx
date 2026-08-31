// Line-by-line Haxe/Lime port of the upstream `benchmark` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flight.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and Flight's Lime host capabilities are enabled with `HostLime.enableHostLime(this)`.
// The offscreen `<canvas>` that paints the shape texture and the DOM FPS overlay are browser glue; the
// canvas is a minimal stub that keeps the SDK call sites, and the overlay is replaced by a plain field.
import flight.hostLime.HostLime;
import flight.Sdk.*;
import flight.types.DisplayObject;
import flight.types.Bitmap;
import flight.types.QuadBatch;
import flight.types.TextLabel;
import flight.types.TextureAtlas;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.Window;
import flight._internal._UInt8ClampedArray;

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
      registerRenderer(renderState, QuadBatchKind, defaultCanvasQuadBatchRenderer);
      registerRenderer(renderState, TextLabelKind, defaultCanvasTextLabelRenderer);
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
      registerGlStandardMaterial(renderState);
      registerStandardGlTextureResolvers(renderState);
      registerRenderer(renderState, QuadBatchKind, defaultGlQuadBatchRenderer);
      registerRenderer(renderState, TextLabelKind, defaultGlTextLabelRenderer);
      enableGlBlendModeSupport(renderState);
    }

    atlas = createTextureAtlasFromImageResource(createShapeImage());
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

    final count:Int = Std.int(quadBatch.data.instanceCount);
    final transforms:flight._internal._Float32Array = quadBatch.data.transforms;

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
    // Nothing changed since the last frame: skip the draw AND cancel this frame's present, so
    // Lime does not flip to the never-drawn back buffer (a black flash every second frame on
    // page-flip hardware). OpenFL's Stage pauses rendering the same way; the skipped frame costs
    // nothing, which matters on the interpreter targets.
    if (!prepareScene2DRender(renderState, root)) {
      window.onRender.cancel();
      return;
    }
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
