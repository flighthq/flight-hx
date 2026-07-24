// Line-by-line Haxe/Lime port of the upstream `spritesheet` example (`app.ts`), written directly
// against the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`:
// the browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// Every statement of the upstream program is otherwise translated faithfully. The Canvas-2D coin
// strip is procedural browser art with no SDK call sites, so `createSpriteStrip` is reduced to a
// size-reporting stub the image resource wraps.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.Bitmap;
import flighthq.types.DisplayObject;
import flighthq.types.ImageResource;
import lime.utils.UInt8Array;
import flighthq.types.Spritesheet;
import flighthq.types.SpritesheetPlayer;
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

  // Frames are authored at a higher resolution than they are shown: the bitmaps display at
  // DISPLAY_SCALE (a downscale), so the renderer samples the oversized source down to size
  // instead of magnifying a small one. Downsampling a hi-res source stays crisp; upscaling a
  // low-res one is what produced the earlier aliased, blocky coins.
  final FRAME_SIZE = 192;
  final FRAME_COUNT = 12;
  final STRIP_WIDTH = 192 * 12;
  final DISPLAY_SCALE = 0.5;

  var root:DisplayObject;

  var imageResource:Dynamic;
  var spritesheet:Spritesheet;

  var spinAnimation:Dynamic;
  var pingpongAnimation:Dynamic;

  var bitmap1:Bitmap;
  var bitmap2:Bitmap;
  var bitmap3:Bitmap;

  var player1:SpritesheetPlayer;
  var player2:SpritesheetPlayer;
  var player3:SpritesheetPlayer;

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
    registerRenderer(renderState, BitmapKind, defaultGlBitmapRenderer);
    registerGlShapeCommands(defaultGlShapeCommands);
    enableGlBlendModeSupport(renderState);

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    // Build the spritesheet from the procedural sprite strip.

    imageResource = createSpriteStrip();

    spritesheet = createSpritesheetFromGrid({
      columns: FRAME_COUNT,
      imageFile: '',
      imageHeight: FRAME_SIZE,
      imageWidth: STRIP_WIDTH,
      rows: 1,
    });

    // Attach the image resource to the atlas that createSpritesheetFromGrid built internally.
    spritesheet.atlas.image = imageResource;

    // Create two animations over the spritesheet frames.

    final allFrameIndices = [for (i in 0...FRAME_COUNT) i];

    spinAnimation = createSpritesheetAnimation({
      frameDuration: 80,
      frames: allFrameIndices,
      loop: true,
    });

    pingpongAnimation = createSpritesheetAnimation({
      direction: 'pingpong',
      frameDuration: 120,
      frames: allFrameIndices,
      loop: true,
    });

    // Instance 1: spinning star at normal speed (1x).

    bitmap1 = createBitmap();
    bitmap1.data.image = imageResource;
    bitmap1.x = 120;
    bitmap1.y = 140;
    bitmap1.scaleX = DISPLAY_SCALE;
    bitmap1.scaleY = DISPLAY_SCALE;
    invalidateNodeLocalTransform(bitmap1);
    addNodeChild(root, bitmap1);

    player1 = createSpritesheetPlayer();
    playSpritesheetAnimation(player1, spinAnimation);

    // Instance 2: spinning star at double speed (2x).

    bitmap2 = createBitmap();
    bitmap2.data.image = imageResource;
    bitmap2.x = 370;
    bitmap2.y = 140;
    bitmap2.scaleX = DISPLAY_SCALE;
    bitmap2.scaleY = DISPLAY_SCALE;
    invalidateNodeLocalTransform(bitmap2);
    addNodeChild(root, bitmap2);

    player2 = createSpritesheetPlayer();
    player2.speed = 2;
    playSpritesheetAnimation(player2, spinAnimation);

    // Instance 3: pingpong animation.

    bitmap3 = createBitmap();
    bitmap3.data.image = imageResource;
    bitmap3.x = 620;
    bitmap3.y = 140;
    bitmap3.scaleX = DISPLAY_SCALE;
    bitmap3.scaleY = DISPLAY_SCALE;
    invalidateNodeLocalTransform(bitmap3);
    addNodeChild(root, bitmap3);

    player3 = createSpritesheetPlayer();
    playSpritesheetAnimation(player3, pingpongAnimation);

    // Apply initial frames so the bitmaps are visible on the first render.

    applyFrameToBitmap(player1, spritesheet, bitmap1);
    applyFrameToBitmap(player2, spritesheet, bitmap2);
    applyFrameToBitmap(player3, spritesheet, bitmap3);

    ready = true;
  }

  // Portable procedural coin strip: FRAME_COUNT gold discs whose horizontal radius shrinks toward the
  // middle frames to read as a spinning coin, uploaded as real RGBA bytes through the ImageResource
  // `data` path (a bare `{width, height}` object would become `image.source` and hit the DOM-element
  // `texImage2D` overload, which rejects a plain object).
  function createSpriteStrip():ImageResource {
    final pixels = new UInt8Array(STRIP_WIDTH * FRAME_SIZE * 4);
    final ry = FRAME_SIZE * 0.42;
    for (f in 0...FRAME_COUNT) {
      final cx = f * FRAME_SIZE + FRAME_SIZE / 2;
      final cy = FRAME_SIZE / 2;
      final rx = 6 + (FRAME_SIZE * 0.42 - 6) * Math.abs(Math.cos(f / FRAME_COUNT * Math.PI));
      for (y in 0...FRAME_SIZE) {
        for (x in 0...FRAME_SIZE) {
          final px = f * FRAME_SIZE + x;
          final nx = (px - cx) / rx;
          final ny = (y - cy) / ry;
          final d = nx * nx + ny * ny;
          if (d <= 1.0) {
            final i = (y * STRIP_WIDTH + px) * 4;
            final shade = 0.6 + 0.4 * (1.0 - d);
            pixels[i] = Std.int(240 * shade);
            pixels[i + 1] = Std.int(196 * shade);
            pixels[i + 2] = Std.int(64 * shade);
            pixels[i + 3] = 255;
          }
        }
      }
    }
    return imageFromPixels(STRIP_WIDTH, FRAME_SIZE, pixels);
  }

  function imageFromPixels(width:Int, height:Int, pixels:UInt8Array):ImageResource {
    final image = createImageResource();
    image.width = width;
    image.height = height;
    image.data = pixels;
    return image;
  }

  // Applies the current player frame's atlas region to a Bitmap's sourceRectangle.
  function applyFrameToBitmap(player:SpritesheetPlayer, sheet:Spritesheet, bitmap:Bitmap):Void {
    final frame = getSpritesheetPlayerFrame(player, sheet);
    if (frame == null || sheet.atlas == null) return;
    final region = getTextureAtlasRegionById(sheet.atlas, frame.id);
    if (region == null) return;
    if (bitmap.data.sourceRectangle == null) {
      bitmap.data.sourceRectangle = createRectangle(region.x, region.y, region.width, region.height);
    } else {
      bitmap.data.sourceRectangle.x = region.x;
      bitmap.data.sourceRectangle.y = region.y;
      bitmap.data.sourceRectangle.width = region.width;
      bitmap.data.sourceRectangle.height = region.height;
    }
    invalidateNodeAppearance(bitmap);
  }

  // Upstream `enterFrame(now)`, driven by Lime's per-frame `update`. The spritesheet player advances
  // in milliseconds, which is exactly what Lime's `deltaTime` reports.
  override public function update(deltaTime:Int):Void {
    if (!ready) return;

    updateSpritesheetPlayer(player1, deltaTime);
    updateSpritesheetPlayer(player2, deltaTime);
    updateSpritesheetPlayer(player3, deltaTime);

    applyFrameToBitmap(player1, spritesheet, bitmap1);
    applyFrameToBitmap(player2, spritesheet, bitmap2);
    applyFrameToBitmap(player3, spritesheet, bitmap3);
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
