// Line-by-line Haxe/Lime port of the upstream `tilemap` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// The browser Canvas-2D tileset painter (`createTilesetCanvas`) becomes a minimal stub that hands
// `createImageResource` a `{width, height}` image source, keeping every SDK call site identical.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.DisplayObject;
import flighthq.types.ImageResource;
import lime.utils.UInt8Array;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.Window;

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;

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
    registerRenderer(renderState, TilemapKind, defaultGlTilemapRenderer);
    registerGlShapeCommands(defaultGlShapeCommands);
    enableGlBlendModeSupport(renderState);

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    final imageResource = createTilesetImage();
    final tileset = createTilesetFromImageResource(imageResource, TILE_SIZE, TILE_SIZE);

    final tilemap = createTilemap();
    resizeTilemap(tilemap, MAP_COLUMNS, MAP_ROWS);
    tilemap.data.tileset = tileset;

    // Procedural landscape: snow peaks at top, stone mountains, grass plains, sand shore, water.
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

        setTilemapTile(tilemap, col, row, id);
      }
    }

    invalidateNodeAppearance(tilemap);
    addNodeChild(root, tilemap);

    ready = true;
  }

  // Portable procedural tileset: TILE_COUNT solid terrain tiles laid out horizontally, uploaded as real
  // RGBA bytes through the ImageResource `data` path. A bare `{width, height}` object would instead become
  // `image.source` and hit the DOM-element `texImage2D` overload, which rejects a plain object.
  function createTilesetImage():ImageResource {
    final width = TILE_SIZE * TILE_COUNT;
    // Indices match the tile ids placed below: 0 grass, 1 water, 2 sand, 3 stone, 4 dirt, 5 snow, 6 lava, 7 void.
    final colors = [
      [86, 160, 64], [48, 110, 200], [214, 192, 120], [120, 120, 130],
      [140, 96, 58], [235, 240, 248], [230, 90, 30], [20, 20, 28],
    ];
    final pixels = new UInt8Array(width * TILE_SIZE * 4);
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

  function imageFromPixels(width:Int, height:Int, pixels:UInt8Array):ImageResource {
    final image = createImageResource();
    image.width = width;
    image.height = height;
    image.data = pixels;
    return image;
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
