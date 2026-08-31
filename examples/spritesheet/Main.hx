// Line-by-line Haxe/Lime port of the upstream `spritesheet` example (`app.ts`), written directly
// against the generated Flight Haxe surface (`flight.*`). It is a standalone `lime.app.Application`:
// the browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and Flight's Lime host capabilities are enabled with `HostLime.enableHostLime(this)`.
// Every statement of the upstream program is otherwise translated faithfully. The Canvas-2D coin
// strip is procedural browser art with no SDK call sites, so `createSpriteStrip` is reduced to a
// size-reporting stub the image resource wraps.
import flight.hostLime.HostLime;
import flight.Sdk.*;
import flight.types.Bitmap;
import flight.types.DisplayObject;
import flight.types.Sprite;
import flight.types.Bitmap;
import flight.types.Spritesheet;
import flight.types.SpritesheetPlayer;
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
  var usingCairo = false;

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

  var bitmap1:Sprite;
  var bitmap2:Sprite;
  var bitmap3:Sprite;

  var player1:SpritesheetPlayer;
  var player2:SpritesheetPlayer;
  var player3:SpritesheetPlayer;

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
      enableFlightDiagnostics(renderState);
      registerRenderer(renderState, SpriteKind, defaultCanvasSpriteRenderer);
      registerCanvasShapeCommands(renderState, defaultCanvasShapeCommands);
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
      enableFlightDiagnostics(renderState);
      registerGlStandardMaterial(renderState);
      registerStandardGlTextureResolvers(renderState);
      registerRenderer(renderState, SpriteKind, defaultGlSpriteRenderer);
      registerGlShapeCommands(renderState, defaultGlShapeCommands);
      enableGlBlendModeSupport(renderState);
    }

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
    spritesheet.atlas.texture = createTexture(cast {dimension: '2d', source: imageResource});

    // Create two animations over the spritesheet frames.

    final allFrameIndices = [for (i in 0...FRAME_COUNT) i * 1.0];

    spinAnimation = createSpritesheetAnimation({
      frameDuration: 80,
      frames: allFrameIndices,
      repeatCount: -1,
    });

    pingpongAnimation = createSpritesheetAnimation({
      direction: 'pingpong',
      frameDuration: 120,
      frames: allFrameIndices,
      repeatCount: -1,
    });

    // Instance 1: spinning star at normal speed (1x).

    bitmap1 = createSprite();
        bitmap1.x = 120;
    bitmap1.y = 140;
    bitmap1.scaleX = DISPLAY_SCALE;
    bitmap1.scaleY = DISPLAY_SCALE;
    invalidateNodeLocalTransform(bitmap1);
    addNodeChild(root, bitmap1);

    player1 = createSpritesheetPlayer();
    playSpritesheetAnimation(player1, spinAnimation);

    // Instance 2: spinning star at double speed (2x).

    bitmap2 = createSprite();
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

    bitmap3 = createSprite();
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
  // `texImage2D` overload, which rejects a plain object). The discs are written directly into the
  // bitmap's pixel store: a staging array plus a full-strip element-by-element copy costs ~20s on
  // the neko interpreter (two abstract dispatches per element across 1.77M elements), which held the
  // window black past the smoke gate's capture. Direct writes only touch lit pixels and start in
  // well under the gate on every target.
  function createSpriteStrip():Dynamic {
    final bitmap:Bitmap = createBitmap(STRIP_WIDTH, FRAME_SIZE);
    final data = bitmap.data;
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
            data[i] = Std.int(240 * shade);
            data[i + 1] = Std.int(196 * shade);
            data[i + 2] = Std.int(64 * shade);
            data[i + 3] = 255;
          }
        }
      }
    }
    return createImageResourceFromBitmap(bitmap);
  }

  // Applies the current player frame's atlas region to a Sprite's texture.
  function applyFrameToBitmap(player:SpritesheetPlayer, sheet:Spritesheet, bitmap:Sprite):Void {
    final frame = getSpritesheetPlayerFrame(player, sheet);
    if (frame == null || sheet.atlas == null) return;
    bitmap.data.texture = getTextureAtlasRegionTexture(sheet.atlas, frame.id);
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
