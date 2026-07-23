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
import flighthq.types.QuadBatch;
import flighthq.types.TextLabel;
import flighthq.types.TextureAtlas;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.Window;

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;

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
    registerRenderer(renderState, QuadBatchKind, defaultGlQuadBatchRenderer);
    registerRenderer(renderState, TextLabelKind, defaultGlTextLabelRenderer);
    enableGlBlendModeSupport(renderState);

    final shapeCanvas = new _ShapeCanvas();
    shapeCanvas.width = SHAPE_SIZE;
    shapeCanvas.height = SHAPE_SIZE;
    final ctx = shapeCanvas.getContext('2d');
    ctx.fillStyle = '#44aaee';
    ctx.beginPath();
    ctx.arc(SHAPE_SIZE / 2, SHAPE_SIZE / 2, SHAPE_SIZE / 2 - 1, 0, Math.PI * 2);
    ctx.fill();

    atlas = createTextureAtlas({image: createImageResource(shapeCanvas)});
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
    final transforms:Dynamic = quadBatch.data.transforms;

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
  override public function render(context:RenderContext):Void {
    if (!ready || root == null) return;
    if (!prepareDisplayObjectRender(renderState, root)) return;
    renderGlBackground(renderState);
    renderGlDisplayObject(renderState, root);
  }

  // Portable stand-in for the browser `performance.now()` millisecond clock.
  static inline function now():Float {
    return haxe.Timer.stamp() * 1000;
  }
}

// Minimal offscreen-canvas stub over the upstream `document.createElement('canvas')` shape painter.
// It keeps the SDK call sites (`createImageResource(shapeCanvas)`) and reports its dimensions; the
// per-pixel 2D painting is browser-only and is a no-op here.
private class _ShapeCanvas {
  public var width:Int = 0;
  public var height:Int = 0;

  public function new() {}

  public function getContext(contextId:String):_ShapeContext {
    return new _ShapeContext();
  }
}

private class _ShapeContext {
  public var fillStyle:String = '';

  public function new() {}

  public function beginPath():Void {}

  public function arc(x:Float, y:Float, radius:Float, startAngle:Float, endAngle:Float):Void {}

  public function fill():Void {}
}

// Minimal GL canvas adapter over the Lime window, matching the shape `createGlRenderState` expects.
private class _GlCanvas {
  public var width(get, never):Int;
  public var height(get, never):Int;

  final window:Window;
  final context:Dynamic;

  public function new(window:Window) {
    this.window = window;
    context = resolveContext(window);
    if (context == null) throw 'Flight examples require a hardware OpenGL/WebGL window.';
  }

  public function getContext(contextId:String, ?attributes:Dynamic):Dynamic {
    return context;
  }

  function get_width():Int {
    return window.width;
  }

  function get_height():Int {
    return window.height;
  }

  static function resolveContext(window:Window):Dynamic {
    final renderContext:Dynamic = window.context;
    if (renderContext == null) return null;
    final webgl2 = renderContext.webgl2;
    return webgl2 == null ? renderContext.webgl : webgl2;
  }
}
