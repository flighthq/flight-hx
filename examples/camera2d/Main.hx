// Line-by-line Haxe/Lime port of the upstream `camera2d` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// Browser input glue is adapted to Lime: `keydown`/`keyup` become `onKeyDown`/`onKeyUp`, and the canvas
// `wheel` handler becomes `onMouseWheel` using the last pointer position tracked by `onMouseMove`.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.Camera2D;
import flighthq.types.DisplayContainer;
import flighthq.types.DisplayObject;
import flighthq.types.Rectangle;
import flighthq.types.Shape;
import flighthq.types.Vector2;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;
import lime.ui.MouseWheelMode;
import lime.ui.Window;

typedef LandmarkData = {
  var x:Float;
  var y:Float;
  var width:Float;
  var height:Float;
  var color:Int;
  var kind:String;
};

typedef ParallaxStar = {
  var x:Float;
  var y:Float;
  var radius:Float;
  var brightness:Float;
};

typedef ParallaxCloud = {
  var x:Float;
  var y:Float;
  var width:Float;
  var height:Float;
};

typedef ParallaxMountain = {
  var x:Float;
  var baseY:Float;
  var peakHeight:Float;
  var width:Float;
};

typedef PlayerState = {
  var x:Float;
  var y:Float;
};

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;

  final CANVAS_WIDTH = 800;
  final CANVAS_HEIGHT = 600;

  final WORLD_WIDTH = 2400;
  final WORLD_HEIGHT = 1800;
  final PLAYER_SIZE = 24;
  final PLAYER_SPEED = 300;
  final MIN_ZOOM = 0.25;
  final MAX_ZOOM = 4;
  final ZOOM_STEP = 0.1;

  var camera:Camera2D;
  var followOptions:Dynamic;
  var player:PlayerState;
  var keysDown:Map<String, Bool> = new Map();
  var rand:Void->Float;

  var landmarkData:Array<LandmarkData> = [];
  var stars:Array<ParallaxStar> = [];
  var clouds:Array<ParallaxCloud> = [];
  var mountains:Array<ParallaxMountain> = [];

  var parallaxOffset:Vector2;

  var root:DisplayContainer;
  var starsContainer:DisplayContainer;
  var mountainsContainer:DisplayContainer;
  var cloudsContainer:DisplayContainer;
  var worldContainer:DisplayContainer;
  var hudContainer:DisplayContainer;

  var starsShape:Shape;
  var mountainsShape:Shape;
  var cloudsShape:Shape;
  var gridShape:Shape;
  var borderShape:Shape;
  var playerShape:Shape;
  var visibleBoundsShape:Shape;

  var cameraLabel:DisplayObject;
  var playerLabel:DisplayObject;

  var viewMatrix:Dynamic = {a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: 0.0, ty: 0.0};
  var visibleBounds:Rectangle;

  // Last pointer position, tracked by `onMouseMove`, so `onMouseWheel` can zoom about the cursor as the
  // browser `wheel` handler did with `clientX`/`clientY`.
  var lastMouseX:Float = 400;
  var lastMouseY:Float = 300;

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
    registerRenderer(renderState, ShapeKind, defaultGlShapeRenderer);
    registerRenderer(renderState, TextLabelKind, defaultGlTextLabelRenderer);
    registerGlShapeCommands(defaultGlShapeCommands);
    enableGlBlendModeSupport(renderState);

    final worldBounds = createRectangle(0, 0, WORLD_WIDTH, WORLD_HEIGHT);

    camera = createCamera2D(CANVAS_WIDTH, CANVAS_HEIGHT, {
      x: WORLD_WIDTH * 0.5,
      y: WORLD_HEIGHT * 0.5,
      zoom: 1,
    });

    followOptions = {
      deadzoneHalfWidth: 60,
      deadzoneHalfHeight: 40,
      smoothTime: 0.15,
      worldBounds: worldBounds,
    };

    final playerX = WORLD_WIDTH * 0.5;
    final playerY = WORLD_HEIGHT * 0.5;
    player = {x: playerX, y: playerY};

    rand = seededRandom(42);

    for (i in 0...60) {
      final kind = rand() > 0.5 ? 'rect' : 'circle';
      final size = 20 + rand() * 80;
      landmarkData.push({
        x: 100 + rand() * (WORLD_WIDTH - 200),
        y: 100 + rand() * (WORLD_HEIGHT - 200),
        width: size,
        height: kind == 'circle' ? size : 20 + rand() * 80,
        color: randomHslToRgb(Math.floor(rand() * 360)),
        kind: kind,
      });
    }

    for (i in 0...80) {
      stars.push({
        x: rand() * CANVAS_WIDTH,
        y: rand() * CANVAS_HEIGHT,
        radius: 1 + rand() * 2,
        brightness: 0.3 + rand() * 0.7,
      });
    }

    for (i in 0...12) {
      clouds.push({
        x: rand() * CANVAS_WIDTH,
        y: 50 + rand() * 200,
        width: 80 + rand() * 120,
        height: 30 + rand() * 40,
      });
    }

    for (i in 0...8) {
      mountains.push({
        x: rand() * CANVAS_WIDTH,
        baseY: CANVAS_HEIGHT,
        peakHeight: 100 + rand() * 200,
        width: 120 + rand() * 180,
      });
    }

    parallaxOffset = createVector2();

    root = createDisplayContainer();
    root.scaleX = scale;
    root.scaleY = scale;

    starsContainer = createDisplayContainer();
    addNodeChild(root, starsContainer);

    mountainsContainer = createDisplayContainer();
    addNodeChild(root, mountainsContainer);

    cloudsContainer = createDisplayContainer();
    addNodeChild(root, cloudsContainer);

    worldContainer = createDisplayContainer();
    addNodeChild(root, worldContainer);

    hudContainer = createDisplayContainer();
    addNodeChild(root, hudContainer);

    starsShape = createShape();
    addNodeChild(starsContainer, starsShape);

    mountainsShape = createShape();
    addNodeChild(mountainsContainer, mountainsShape);

    cloudsShape = createShape();
    addNodeChild(cloudsContainer, cloudsShape);

    gridShape = createShape();
    addNodeChild(worldContainer, gridShape);

    borderShape = createShape();
    addNodeChild(worldContainer, borderShape);

    for (lm in landmarkData) {
      final shape = createShape();
      appendShapeBeginFill(shape, lm.color, 0.7);
      if (lm.kind == 'rect') {
        appendShapeRectangle(shape, lm.x - lm.width * 0.5, lm.y - lm.height * 0.5, lm.width, lm.height);
      } else {
        appendShapeCircle(shape, lm.x, lm.y, lm.width * 0.5);
      }
      appendShapeEndFill(shape);
      addNodeChild(worldContainer, shape);
    }

    playerShape = createShape();
    addNodeChild(worldContainer, playerShape);

    visibleBoundsShape = createShape();
    addNodeChild(worldContainer, visibleBoundsShape);

    final hudBg = createShape();
    appendShapeBeginFill(hudBg, 0x000000, 0.5);
    appendShapeRectangle(hudBg, 8, 8, 260, 80);
    appendShapeEndFill(hudBg);
    addNodeChild(hudContainer, hudBg);

    cameraLabel = createTextLabel();
    cameraLabel.data.textFormat = {size: 13, color: 0xffffff, font: 'monospace'};
    cameraLabel.x = 16;
    cameraLabel.y = 16;
    invalidateNodeLocalTransform(cameraLabel);
    addNodeChild(hudContainer, cameraLabel);

    playerLabel = createTextLabel();
    playerLabel.data.textFormat = {size: 13, color: 0xffffff, font: 'monospace'};
    playerLabel.x = 16;
    playerLabel.y = 34;
    invalidateNodeLocalTransform(playerLabel);
    addNodeChild(hudContainer, playerLabel);

    final controlsLabel = createTextLabel();
    controlsLabel.data.text = 'WASD/Arrows: move  Scroll: zoom';
    controlsLabel.data.textFormat = {size: 13, color: 0xffffff, font: 'monospace'};
    controlsLabel.x = 16;
    controlsLabel.y = 52;
    invalidateNodeLocalTransform(controlsLabel);
    addNodeChild(hudContainer, controlsLabel);

    final legendLabel = createTextLabel();
    legendLabel.data.text = 'Green = visible bounds  Red = world border';
    legendLabel.data.textFormat = {size: 13, color: 0xffffff, font: 'monospace'};
    legendLabel.x = 16;
    legendLabel.y = 70;
    invalidateNodeLocalTransform(legendLabel);
    addNodeChild(hudContainer, legendLabel);

    buildGridShape();
    buildBorderShape();

    rebuildStars();
    rebuildMountains();
    rebuildClouds();

    visibleBounds = createRectangle();

    ready = true;
  }

  function seededRandom(seed:Int):Void->Float {
    var s = seed;
    return function():Float {
      s = (s * 16807 + 0) % 2147483647;
      return s / 2147483647;
    };
  }

  function randomHslToRgb(hue:Float):Int {
    final s = 0.6;
    final l = 0.5;
    final c = (1 - Math.abs(2 * l - 1)) * s;
    final x = c * (1 - Math.abs(((hue / 60) % 2) - 1));
    final m = l - c / 2;
    var r = 0.0;
    var g = 0.0;
    var b = 0.0;
    if (hue < 60) {
      r = c;
      g = x;
    } else if (hue < 120) {
      r = x;
      g = c;
    } else if (hue < 180) {
      g = c;
      b = x;
    } else if (hue < 240) {
      g = x;
      b = c;
    } else if (hue < 300) {
      r = x;
      b = c;
    } else {
      r = c;
      b = x;
    }
    final ri = Math.round((r + m) * 255);
    final gi = Math.round((g + m) * 255);
    final bi = Math.round((b + m) * 255);
    return (ri << 16) | (gi << 8) | bi;
  }

  function buildGridShape():Void {
    clearShapeCommands(gridShape);
    appendShapeLineStyle(gridShape, 1, 0x64788c, 0.15);
    final gridSize = 100;
    var x = 0;
    while (x <= WORLD_WIDTH) {
      appendShapeMoveTo(gridShape, x, 0);
      appendShapeLineTo(gridShape, x, WORLD_HEIGHT);
      x += gridSize;
    }
    var y = 0;
    while (y <= WORLD_HEIGHT) {
      appendShapeMoveTo(gridShape, 0, y);
      appendShapeLineTo(gridShape, WORLD_WIDTH, y);
      y += gridSize;
    }
    appendShapeEndFill(gridShape);
    invalidateNodeAppearance(gridShape);
  }

  function buildBorderShape():Void {
    clearShapeCommands(borderShape);
    appendShapeLineStyle(borderShape, 3, 0xc85050, 0.5);
    appendShapeRectangle(borderShape, 0, 0, WORLD_WIDTH, WORLD_HEIGHT);
    appendShapeEndFill(borderShape);
    invalidateNodeAppearance(borderShape);
  }

  function rebuildStars():Void {
    clearShapeCommands(starsShape);
    for (star in stars) {
      appendShapeBeginFill(starsShape, 0xffffd0, star.brightness);
      appendShapeCircle(starsShape, star.x, star.y, star.radius);
      appendShapeEndFill(starsShape);
    }
    invalidateNodeAppearance(starsShape);
  }

  function rebuildMountains():Void {
    clearShapeCommands(mountainsShape);
    for (mt in mountains) {
      appendShapeBeginFill(mountainsShape, 0x3c5064, 0.6);
      appendShapePolygon(mountainsShape, [
        mt.x - mt.width * 0.5,
        mt.baseY,
        mt.x,
        mt.baseY - mt.peakHeight,
        mt.x + mt.width * 0.5,
        mt.baseY,
      ]);
      appendShapeEndFill(mountainsShape);
    }
    invalidateNodeAppearance(mountainsShape);
  }

  function rebuildClouds():Void {
    clearShapeCommands(cloudsShape);
    for (cloud in clouds) {
      appendShapeBeginFill(cloudsShape, 0xc8d2e6, 0.4);
      appendShapeEllipse(
        cloudsShape,
        cloud.x - cloud.width * 0.5,
        cloud.y - cloud.height * 0.5,
        cloud.width,
        cloud.height,
      );
      appendShapeEndFill(cloudsShape);
    }
    invalidateNodeAppearance(cloudsShape);
  }

  // Keyboard controls. In the browser these are `keydown`/`keyup` listeners keyed by `e.key`; here they
  // are Lime's `onKeyDown`/`onKeyUp`, mapped back to the same key strings `updatePlayer` inspects.
  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {
    final name = keyToName(keyCode);
    if (name != null) keysDown.set(name, true);
  }

  override public function onKeyUp(keyCode:KeyCode, modifier:KeyModifier):Void {
    final name = keyToName(keyCode);
    if (name != null) keysDown.remove(name);
  }

  function keyToName(keyCode:KeyCode):Null<String> {
    return switch (keyCode) {
      case LEFT: 'ArrowLeft';
      case RIGHT: 'ArrowRight';
      case UP: 'ArrowUp';
      case DOWN: 'ArrowDown';
      case A: 'a';
      case D: 'd';
      case W: 'w';
      case S: 's';
      default: null;
    };
  }

  override public function onMouseMove(x:Float, y:Float):Void {
    lastMouseX = x;
    lastMouseY = y;
  }

  // Browser `wheel` handler: zoom about the cursor, clamped to `[MIN_ZOOM, MAX_ZOOM]`.
  override public function onMouseWheel(deltaX:Float, deltaY:Float, deltaMode:MouseWheelMode):Void {
    if (!ready) return;
    final screenX = lastMouseX;
    final screenY = lastMouseY;
    final direction = deltaY < 0 ? 1 : -1;
    final newZoom = Math.max(MIN_ZOOM, Math.min(MAX_ZOOM, camera.zoom + direction * ZOOM_STEP * camera.zoom));
    zoomCamera2DAtScreenPoint(camera, screenX, screenY, newZoom);
  }

  function updatePlayer(deltaTime:Float):Void {
    var dx = 0.0;
    var dy = 0.0;
    if (keysDown.exists('ArrowLeft') || keysDown.exists('a')) dx -= 1;
    if (keysDown.exists('ArrowRight') || keysDown.exists('d')) dx += 1;
    if (keysDown.exists('ArrowUp') || keysDown.exists('w')) dy -= 1;
    if (keysDown.exists('ArrowDown') || keysDown.exists('s')) dy += 1;

    if (dx != 0 || dy != 0) {
      final len = Math.sqrt(dx * dx + dy * dy);
      dx /= len;
      dy /= len;
    }

    player.x += dx * PLAYER_SPEED * deltaTime;
    player.y += dy * PLAYER_SPEED * deltaTime;

    player.x = Math.max(PLAYER_SIZE, Math.min(WORLD_WIDTH - PLAYER_SIZE, player.x));
    player.y = Math.max(PLAYER_SIZE, Math.min(WORLD_HEIGHT - PLAYER_SIZE, player.y));
  }

  // Upstream `enterFrame`, driven by Lime's per-frame `update` (deltaTime is milliseconds).
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    final rawDelta = deltaTime / 1000.0;
    final dt = Math.min(rawDelta, 0.1);

    updatePlayer(dt);
    updateCamera2DFollow(camera, player.x, player.y, dt, followOptions);
    getCamera2DViewMatrix(camera, viewMatrix);
    getCamera2DVisibleBounds(camera, visibleBounds);

    getCamera2DParallaxPoint(camera, 0.1, parallaxOffset);
    starsContainer.x = parallaxOffset.x;
    starsContainer.y = parallaxOffset.y;
    invalidateNodeLocalTransform(starsContainer);

    getCamera2DParallaxPoint(camera, 0.4, parallaxOffset);
    mountainsContainer.x = parallaxOffset.x;
    mountainsContainer.y = parallaxOffset.y;
    invalidateNodeLocalTransform(mountainsContainer);

    getCamera2DParallaxPoint(camera, 0.6, parallaxOffset);
    cloudsContainer.x = parallaxOffset.x;
    cloudsContainer.y = parallaxOffset.y;
    invalidateNodeLocalTransform(cloudsContainer);

    worldContainer.scaleX = viewMatrix.a;
    worldContainer.skewY = viewMatrix.b;
    worldContainer.skewX = viewMatrix.c;
    worldContainer.scaleY = viewMatrix.d;
    worldContainer.x = viewMatrix.tx;
    worldContainer.y = viewMatrix.ty;
    invalidateNodeLocalTransform(worldContainer);

    clearShapeCommands(playerShape);
    appendShapeBeginFill(playerShape, 0xffcc33, 1);
    appendShapePolygon(playerShape, [
      player.x,
      player.y - PLAYER_SIZE,
      player.x + PLAYER_SIZE * 0.8,
      player.y + PLAYER_SIZE * 0.6,
      player.x - PLAYER_SIZE * 0.8,
      player.y + PLAYER_SIZE * 0.6,
    ]);
    appendShapeEndFill(playerShape);
    appendShapeLineStyle(playerShape, 2, 0xcc9900, 1);
    appendShapePolygon(playerShape, [
      player.x,
      player.y - PLAYER_SIZE,
      player.x + PLAYER_SIZE * 0.8,
      player.y + PLAYER_SIZE * 0.6,
      player.x - PLAYER_SIZE * 0.8,
      player.y + PLAYER_SIZE * 0.6,
    ]);
    appendShapeEndFill(playerShape);
    invalidateNodeAppearance(playerShape);

    clearShapeCommands(visibleBoundsShape);
    appendShapeLineStyle(visibleBoundsShape, 2, 0x00c864, 0.6);
    appendShapeRectangle(visibleBoundsShape, visibleBounds.x, visibleBounds.y, visibleBounds.width, visibleBounds.height);
    appendShapeEndFill(visibleBoundsShape);
    invalidateNodeAppearance(visibleBoundsShape);

    cameraLabel.data.text = 'Camera3D: (${toFixed(camera.x, 0)}, ${toFixed(camera.y, 0)})  Zoom: ${toFixed(camera.zoom, 2)}';
    invalidateNodeAppearance(cameraLabel);
    playerLabel.data.text = 'Player: (${toFixed(player.x, 0)}, ${toFixed(player.y, 0)})';
    invalidateNodeAppearance(playerLabel);
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
