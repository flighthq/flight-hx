// Line-by-line Haxe/Lime port of the upstream `tilemap` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// The browser Canvas-2D tileset painter (`createTilesetCanvas`) becomes a minimal stub that hands
// `createImageResource` a `{width, height}` image source, keeping every SDK call site identical.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.tilemapFormats.TilemapFormats.buildTilemapLayersFromTiled;
import flighthq.tilemapFormats.TilemapFormats.parseTiledTmj;
import flighthq.types.Bitmap;
import flighthq.types.DisplayObject;
import flighthq._internal._UInt8ClampedArray;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.Window;

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;
  var usingCairo = false;

  final TILE_SIZE = 32;
  final TILE_COUNT = 8;
  final MAP_COLUMNS = 25;
  final MAP_ROWS = 19;

  var root:DisplayObject;

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
      final canvas = flighthq.scene2dCairo.Scene2dCairo.createCairoSurface(window);
      renderState = createCanvasRenderState(canvas, {
        pixelRatio: window.scale,
        backgroundColor: 0x1a1a2eff,
        sceneGraphSyncPolicy: 'requiresInvalidation',
      });
      registerRenderer(renderState, SpriteKind, defaultCanvasSpriteRenderer);
      registerRenderer(renderState, TilemapKind, defaultCanvasTilemapRenderer);
      registerCanvasShapeCommands(renderState, defaultCanvasShapeCommands);
      registerCanvasImageTextureResolver(getCanvasRenderStateTextureResolvers(renderState));
      registerCanvasBitmapTextureResolver(getCanvasRenderStateTextureResolvers(renderState));
      enableCanvasBlendMode(renderState);
    } else {
      final canvas = flighthq.hostLime.GlSurface.createGlSurface(window);
      renderState = createGlRenderState(canvas, {
        pixelRatio: window.scale,
        backgroundColor: 0x1a1a2eff,
        contextAttributes: {alpha: false, preserveDrawingBuffer: true},
        sceneGraphSyncPolicy: 'requiresInvalidation',
      });
      registerGlStandardMaterial(renderState);
      registerStandardGlTextureResolvers(renderState);
      registerRenderer(renderState, SpriteKind, defaultGlSpriteRenderer);
      registerRenderer(renderState, TilemapKind, defaultGlTilemapRenderer);
      registerGlShapeCommands(renderState, defaultGlShapeCommands);
      enableGlBlendModeSupport(renderState);
    }

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    final imageResource = createTilesetImage();
    final atlas = createTextureAtlasFromGrid({
      columns: TILE_COUNT,
      frameHeight: TILE_SIZE,
      frameWidth: TILE_SIZE,
      imageFile: '',
      imageHeight: TILE_SIZE,
      imageWidth: TILE_SIZE * TILE_COUNT,
      rows: 1,
    }, createTexture(cast {dimension: '2d', source: imageResource}));

    // Author the terrain as Tiled's one-based global tile IDs, then consume it through the same TMJ
    // parser and projection API used for a map loaded from disk.
    final tiledGids:Array<Int> = [];
    for (row in 0...MAP_ROWS) {
      for (col in 0...MAP_COLUMNS) {
        var id:Int;
        final heightNoise = Math.sin(col * 0.4) * 1.5 + Math.cos(col * 0.7 + 1) * 1;

        if (row < 3 + heightNoise) {
          id = 5; // snow
        } else if (row < 5 + heightNoise) {
          id = 3; // stone
        } else if (row < 14 + heightNoise * 0.5) {
          id = 0; // grass
          if ((col + row) % 7 == 0) id = 4; // occasional dirt
        } else if (row < 15 + heightNoise * 0.3) {
          id = 2; // sand
        } else {
          id = 1; // water
          if (row == MAP_ROWS - 1 && col % 5 == 2) id = 7; // deep void
        }

        // Place a lava pool near center.
        final cx = MAP_COLUMNS / 2;
        final cy = 8;
        final dist = Math.sqrt(Math.pow(col - cx, 2) + Math.pow(row - cy, 2));
        if (dist < 2.5) id = 6;

        tiledGids.push(id + 1);
      }
    }

    final tiledMap = parseTiledTmj(haxe.Json.stringify({
      height: MAP_ROWS,
      infinite: false,
      layers: [{
        data: tiledGids,
        height: MAP_ROWS,
        id: 1,
        name: 'terrain',
        type: 'tilelayer',
        width: MAP_COLUMNS,
      }],
      orientation: 'orthogonal',
      renderorder: 'right-down',
      tiledversion: '1.10.2',
      tileheight: TILE_SIZE,
      tilesets: [{firstgid: 1, source: 'terrain.tsj'}],
      tilewidth: TILE_SIZE,
      type: 'map',
      version: '1.10',
      width: MAP_COLUMNS,
    }));
    if (tiledMap == null) throw 'Unable to parse bundled terrain.tmj';

    final tilemapLayers = buildTilemapLayersFromTiled(tiledMap, 0, () -> ({
      atlas: atlas,
      tileHeight: TILE_SIZE,
      tileWidth: TILE_SIZE,
    } : Dynamic));
    if (tilemapLayers == null || tilemapLayers.length != 1) {
      throw 'Unable to project terrain.tmj into a Flight tilemap';
    }

    final tilemap = createTilemap(cast {data: tilemapLayers[0]});
    invalidateNodeAppearance(tilemap);
    addNodeChild(root, tilemap);

    ready = true;
  }

  // Portable procedural tileset: TILE_COUNT solid terrain tiles laid out horizontally, uploaded as real
  // RGBA bytes through the Bitmap texture-source path (the upstream example paints a browser canvas;
  // a Bitmap with explicit pixel data is the portable equivalent under the TextureSource split).
  function createTilesetImage():Dynamic {
    final width = TILE_SIZE * TILE_COUNT;
    // Indices match the tile ids placed below: 0 grass, 1 water, 2 sand, 3 stone, 4 dirt, 5 snow, 6 lava, 7 void.
    final colors = [
      [86, 160, 64], [48, 110, 200], [214, 192, 120], [120, 120, 130],
      [140, 96, 58], [235, 240, 248], [230, 90, 30], [20, 20, 28],
    ];
    final pixels = new _UInt8ClampedArray(width * TILE_SIZE * 4);
    for (y in 0...TILE_SIZE) {
      for (x in 0...width) {
        final c = colors[Std.int(x / TILE_SIZE)];
        // Darken the top/left edge of each tile so tile boundaries read on the map.
        final edge = (x % TILE_SIZE == 0 || y == 0) ? 0.7 : 1.0;
        final i = (y * width + x) * 4;
        pixels[i] = Std.int(c[0] * edge);
        pixels[i + 1] = Std.int(c[1] * edge);
        pixels[i + 2] = Std.int(c[2] * edge);
        pixels[i + 3] = 255;
      }
    }
    return imageFromPixels(width, TILE_SIZE, pixels);
  }

  function imageFromPixels(width:Int, height:Int, pixels:_UInt8ClampedArray):Dynamic {
    final bitmap:Bitmap = createBitmap(width, height);
    // createBitmap allocates zeroed pixels; overwrite them with the painted tiles.
    for (i in 0...Std.int(pixels.length)) bitmap.data[i] = pixels[i];
    return createImageResourceFromBitmap(bitmap);
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
