// Line-by-line Haxe/Lime port of the upstream `bitmap` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flight.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and Flight's Lime host capabilities are enabled with `HostLime.enableHostLime(this)`.
// The browser Canvas-2D image painters become portable procedural pixel generators that build an
// `ImageResource` from real RGBA bytes (the `data` upload path), keeping every SDK call site identical.
import flight.hostLime.HostLime;
import flight.Sdk.*;
import flight.types.Bitmap;
import flight.types.Sprite;
import flight.types.DisplayObject;
import flight.types.Bitmap;
import flight.types.Sprite;
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

  var root:DisplayObject;

  var gradientBitmap:Sprite;
  var checkerBitmap:Sprite;
  var circleBitmap:Sprite;
  var rotatedBitmap:Sprite;
  var combinedBitmap:Sprite;

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
      renderState = createCanvasRenderState(createCanvasRenderSurface(surfaceCreator, canvas, {pixelRatio: window.scale}), createCanvasPipeline(createEmptyCanvasRegistries()), createCanvasTextureResolvers(surfaceCreator), {
        pixelRatio: window.scale,
        backgroundColor: 0xf0f0f0ff,
        sceneGraphSyncPolicy: 'requiresInvalidation',
      });
      registerRenderer(renderState, SpriteKind, defaultCanvasSpriteRenderer);
      registerCanvasShapeCommands(renderState, defaultCanvasShapeCommands);
      registerCanvasImageTextureResolver(getCanvasRenderStateTextureResolvers(renderState));
      registerCanvasBitmapTextureResolver(getCanvasRenderStateTextureResolvers(renderState));
      enableCanvasBlendMode(renderState);
    } else {
      final canvas = flight.hostLime.GlSurface.createGlSurface(window);
      renderState = createGlRenderState(createGlContextState(createGlContextFromCanvasElement(canvas, {contextAttributes: {alpha: false, preserveDrawingBuffer: true}})), createGlPipeline(createEmptyGlRegistries()), {
        pixelRatio: window.scale,
        backgroundColor: 0xf0f0f0ff,
        sceneGraphSyncPolicy: 'requiresInvalidation',
      });
      registerGlStandardMaterial(renderState);
      registerStandardGlTextureResolvers(renderState);
      registerRenderer(renderState, SpriteKind, defaultGlSpriteRenderer);
      registerGlShapeCommands(renderState, defaultGlShapeCommands);
      enableGlBlendModeSupport(renderState);
    }

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    // Gradient square: a colorful linear gradient from top-left to bottom-right.

    gradientBitmap = createSprite();
    gradientBitmap.data.texture = createTexture(cast {dimension: '2d', source: createGradientImage(128, 128)});
    gradientBitmap.x = 60;
    gradientBitmap.y = 60;
    addNodeChild(root, gradientBitmap);

    // Checkerboard pattern: demonstrates procedural pattern generation.

    checkerBitmap = createSprite();
    checkerBitmap.data.texture = createTexture(cast {dimension: '2d', source: createCheckerboardImage(128, 128)});
    checkerBitmap.x = 340;
    checkerBitmap.y = 60;
    checkerBitmap.alpha = 0.5;
    addNodeChild(root, checkerBitmap);

    // Circle with radial gradient: scaled to 2x.

    circleBitmap = createSprite();
    circleBitmap.data.texture = createTexture(cast {dimension: '2d', source: createRadialGradientImage(128, 128)});
    circleBitmap.x = 620;
    circleBitmap.y = 60;
    circleBitmap.scaleX = 2;
    circleBitmap.scaleY = 2;
    addNodeChild(root, circleBitmap);

    // Rotated gradient square: the same gradient image rotated 30 degrees.

    rotatedBitmap = createSprite();
    rotatedBitmap.data.texture = createTexture(cast {dimension: '2d', source: createGradientImage(96, 96)});
    rotatedBitmap.x = 200;
    rotatedBitmap.y = 340;
    rotatedBitmap.rotation = 30;
    addNodeChild(root, rotatedBitmap);

    // Combined properties: scaled, semi-transparent, and rotated checkerboard.

    combinedBitmap = createSprite();
    combinedBitmap.data.texture = createTexture(cast {dimension: '2d', source: createCheckerboardImage(80, 80)});
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
    // Nothing changed since the last frame: skip the draw AND cancel this frame's present, so
    // Lime does not flip to the never-drawn back buffer (a black flash every second frame on
    // page-flip hardware). OpenFL's Stage pauses rendering the same way; the skipped frame costs
    // nothing, which matters on the interpreter targets.
    if (!prepareScene2DRender(renderState, root)) {
      window.onRender.cancel();
      return;
    }
    if (usingCairo) {
      renderCanvasBackground(renderState);
      renderCanvasScene2D(renderState, root);
    } else {
      renderGlBackground(renderState);
      renderGlScene2D(renderState, root);
    }
  }

  // The browser Canvas-2D painters are replaced with portable procedural pixel generators. Each returns
  // an `ImageResource` backed by real RGBA bytes via the `data` upload path (`source` stays null), which
  // the GL bitmap renderer uploads with the 9-argument `texImage2D(width, height, ..., data)` overload.
  // Handing a bare `{width, height}` object instead becomes `image.source` and hits the DOM-element
  // `texImage2D` overload, which rejects a plain object ("Overload resolution failed").
  function imageFromPixels(width:Int, height:Int, pixels:_UInt8ClampedArray):Dynamic {
    final bitmap:Bitmap = createBitmap(width, height);
    // createBitmap allocates zeroed pixels; overwrite them with the painted content.
    for (i in 0...Std.int(pixels.length)) bitmap.data[i] = pixels[i];
    return createImageResourceFromBitmap(bitmap);
  }

  // Colorful linear gradient from top-left to bottom-right.
  function createGradientImage(width:Int, height:Int):Dynamic {
    final pixels = new _UInt8ClampedArray(width * height * 4);
    for (y in 0...height) {
      for (x in 0...width) {
        final i = (y * width + x) * 4;
        final r = Std.int(255 * x / (width - 1));
        final g = Std.int(255 * y / (height - 1));
        pixels[i] = r;
        pixels[i + 1] = g;
        pixels[i + 2] = 255 - r;
        pixels[i + 3] = 255;
      }
    }
    return imageFromPixels(width, height, pixels);
  }

  // Two-tone checkerboard pattern.
  function createCheckerboardImage(width:Int, height:Int):Dynamic {
    final pixels = new _UInt8ClampedArray(width * height * 4);
    final cell = 16;
    for (y in 0...height) {
      for (x in 0...width) {
        final i = (y * width + x) * 4;
        final on = ((Std.int(x / cell) + Std.int(y / cell)) % 2) == 0;
        final v = on ? 230 : 40;
        pixels[i] = v;
        pixels[i + 1] = v;
        pixels[i + 2] = v;
        pixels[i + 3] = 255;
      }
    }
    return imageFromPixels(width, height, pixels);
  }

  // Radial gradient: bright center fading to the edges.
  function createRadialGradientImage(width:Int, height:Int):Dynamic {
    final pixels = new _UInt8ClampedArray(width * height * 4);
    final cx = (width - 1) / 2;
    final cy = (height - 1) / 2;
    final maxR = Math.min(cx, cy);
    for (y in 0...height) {
      for (x in 0...width) {
        final i = (y * width + x) * 4;
        final d = Math.sqrt((x - cx) * (x - cx) + (y - cy) * (y - cy));
        final t = Math.max(0.0, 1.0 - d / maxR);
        pixels[i] = Std.int(255 * t);
        pixels[i + 1] = Std.int(120 * t);
        pixels[i + 2] = Std.int(220 * t);
        pixels[i + 3] = 255;
      }
    }
    return imageFromPixels(width, height, pixels);
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
