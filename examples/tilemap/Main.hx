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

    final tilesetCanvas = createTilesetCanvas();
    final imageResource = createImageResource(tilesetCanvas);
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

  // Browser-only Canvas-2D tileset painter becomes a headless stub: the GL tilemap renderer only needs
  // a sized image source, so hand back a `{width, height}` descriptor matching the atlas dimensions.
  function createTilesetCanvas():Dynamic {
    return {width: TILE_SIZE * TILE_COUNT, height: TILE_SIZE};
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
