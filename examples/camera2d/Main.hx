// Line-by-line Haxe/Lime port of the upstream `camera2d` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flight.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and Flight's Lime host capabilities are enabled with `HostLime.enableHostLime(this)`.
// Browser input glue is adapted to Lime: `keydown`/`keyup` become `onKeyDown`/`onKeyUp`, and the canvas
// `wheel` handler becomes `onMouseWheel` using the last pointer position tracked by `onMouseMove`.
import flight.hostLime.HostLime;
import flight.Sdk.*;
import flight.types.Camera2D;

import flight.types.DisplayObject;
import flight.types.TextLabel;
import flight.types.Rectangle;
import flight.types.Shape;
import flight.types.Vector2;
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
  var usingCairo = false;

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

  var root:DisplayObject;
  var starsContainer:DisplayObject;
  var mountainsContainer:DisplayObject;
  var cloudsContainer:DisplayObject;
  var worldContainer:DisplayObject;
  var hudContainer:DisplayObject;

  var starsShape:Shape;
  var mountainsShape:Shape;
  var cloudsShape:Shape;
  var gridShape:Shape;
  var borderShape:Shape;
  var playerShape:Shape;
  var visibleBoundsShape:Shape;

  var cameraLabel:TextLabel;
  var playerLabel:TextLabel;

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
    // The render-pipeline seam now takes a host-provided surface creator, an
    // explicit pipeline (from empty registries), and, for canvas, the texture
    // resolvers it feeds. The native creator allocates Cairo scratch surfaces.
    final surfaceCreator = flight.Scene2DCairo.createCairoRenderSurfaceCreator();
    if (usingCairo) {
      final canvas = flight.Scene2DCairo.createCairoSurface(window);
      final surface = createCanvasRenderSurface(surfaceCreator, canvas, {pixelRatio: window.scale});
      renderState = createCanvasRenderState(surface, scene2dCanvasPipeline,
        createCanvasTextureResolvers(surfaceCreator), {
          pixelRatio: window.scale,
          backgroundColor: 0x1a1a2eff,
          sceneGraphSyncPolicy: 'requiresInvalidation',
        });
      registerRenderer(renderState, ShapeKind, defaultCanvasShapeRenderer);
      registerRenderer(renderState, TextLabelKind, defaultCanvasTextLabelRenderer);
      registerCanvasShapeCommands(renderState, defaultCanvasShapeCommands);
      registerCanvasImageTextureResolver(getCanvasRenderStateTextureResolvers(renderState));
      registerCanvasBitmapTextureResolver(getCanvasRenderStateTextureResolvers(renderState));
      enableCanvasBlendMode(renderState);
    } else {
      final canvas = flight.hostLime.GlSurface.createGlSurface(window);
      final context = createGlContextFromCanvasElement(canvas, {contextAttributes: {alpha: false, preserveDrawingBuffer: true}});
      renderState = createGlRenderState(createGlContextState(context), scene2dGlPipeline, {
        pixelRatio: window.scale,
        backgroundColor: 0x1a1a2eff,
        sceneGraphSyncPolicy: 'requiresInvalidation',
      });
      registerGlStandardMaterial(renderState);
      registerStandardGlTextureResolvers(renderState);
      registerRenderer(renderState, ShapeKind, defaultGlShapeRenderer);
      registerRenderer(renderState, TextLabelKind, defaultGlTextLabelRenderer);
      // Upstream f1a7a9a0: the GPU mesh lane covers solid fills and open strokes; closed strokes,
      // gradients, and texture fills draw through an explicit canvas shape rasterizer, whose
      // resolver set is pointed at this state's diagnostics. Without it those shapes silently
      // vanish (this example's GL frame was background-only).
      final shapeRasterizerResolvers = createCanvasTextureResolvers(surfaceCreator);
      connectCanvasTextureResolverMisses(shapeRasterizerResolvers, renderState);
      registerCanvasImageTextureResolver(shapeRasterizerResolvers);
      registerCanvasBitmapTextureResolver(shapeRasterizerResolvers);
      registerCanvasShapeCommands(renderState, defaultCanvasShapeCommands);
      registerCanvasShapeCommands(renderState, defaultCanvasTextureShapeCommands);
      registerGlShapeRasterizer(renderState, createCanvasShapeRasterizer(shapeRasterizerResolvers));
      enableGlBlendModeSupport(renderState);
    }

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

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    starsContainer = createDisplayObject();
    addNodeChild(root, starsContainer);

    mountainsContainer = createDisplayObject();
    addNodeChild(root, mountainsContainer);

    cloudsContainer = createDisplayObject();
    addNodeChild(root, cloudsContainer);

    worldContainer = createDisplayObject();
    addNodeChild(root, worldContainer);

    hudContainer = createDisplayObject();
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
    appendShapeBeginFill(hudBg, 0x000000ff, 0.5);
    appendShapeRectangle(hudBg, 8, 8, 260, 80);
    appendShapeEndFill(hudBg);
    addNodeChild(hudContainer, hudBg);

    cameraLabel = createTextLabel();
    cameraLabel.data.textFormat = {size: 13, color: 0xffffffff, font: 'monospace'};
    cameraLabel.x = 16;
    cameraLabel.y = 16;
    invalidateNodeLocalTransform(cameraLabel);
    addNodeChild(hudContainer, cameraLabel);

    playerLabel = createTextLabel();
    playerLabel.data.textFormat = {size: 13, color: 0xffffffff, font: 'monospace'};
    playerLabel.x = 16;
    playerLabel.y = 34;
    invalidateNodeLocalTransform(playerLabel);
    addNodeChild(hudContainer, playerLabel);

    final controlsLabel = createTextLabel();
    controlsLabel.data.text = 'WASD/Arrows: move  Scroll: zoom';
    controlsLabel.data.textFormat = {size: 13, color: 0xffffffff, font: 'monospace'};
    controlsLabel.x = 16;
    controlsLabel.y = 52;
    invalidateNodeLocalTransform(controlsLabel);
    addNodeChild(hudContainer, controlsLabel);

    final legendLabel = createTextLabel();
    legendLabel.data.text = 'Green = visible bounds  Red = world border';
    legendLabel.data.textFormat = {size: 13, color: 0xffffffff, font: 'monospace'};
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
    // Float state with explicit floor-division modulo: upstream JS numbers are
    // doubles (s * 16807 needs ~45 bits), Int32 targets would wrap, and neko's
    // `%` coerces the float operand back to Int32 — so avoid `%` entirely.
    var s:Float = seed;
    return function():Float {
      s = s * 16807 + 0;
      s -= Math.ffloor(s / 2147483647) * 2147483647;
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
    return (ri << 24) | (gi << 16) | (bi << 8) | 0xFF;
  }

  function buildGridShape():Void {
    clearShapeCommands(gridShape);
    appendShapeLineStyle(gridShape, 1, 0x64788cff, 0.15);
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
    appendShapeLineStyle(borderShape, 3, 0xc85050ff, 0.5);
    appendShapeRectangle(borderShape, 0, 0, WORLD_WIDTH, WORLD_HEIGHT);
    appendShapeEndFill(borderShape);
    invalidateNodeAppearance(borderShape);
  }

  function rebuildStars():Void {
    clearShapeCommands(starsShape);
    for (star in stars) {
      appendShapeBeginFill(starsShape, 0xffffd0ff, star.brightness);
      appendShapeCircle(starsShape, star.x, star.y, star.radius);
      appendShapeEndFill(starsShape);
    }
    invalidateNodeAppearance(starsShape);
  }

  function rebuildMountains():Void {
    clearShapeCommands(mountainsShape);
    for (mt in mountains) {
      appendShapeBeginFill(mountainsShape, 0x3c5064ff, 0.6);
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
      appendShapeBeginFill(cloudsShape, 0xc8d2e6ff, 0.4);
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
    appendShapeBeginFill(playerShape, 0xffcc33ff, 1);
    appendShapePolygon(playerShape, [
      player.x,
      player.y - PLAYER_SIZE,
      player.x + PLAYER_SIZE * 0.8,
      player.y + PLAYER_SIZE * 0.6,
      player.x - PLAYER_SIZE * 0.8,
      player.y + PLAYER_SIZE * 0.6,
    ]);
    appendShapeEndFill(playerShape);
    appendShapeLineStyle(playerShape, 2, 0xcc9900ff, 1);
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
    appendShapeLineStyle(visibleBoundsShape, 2, 0x00c864ff, 0.6);
    appendShapeRectangle(visibleBoundsShape, visibleBounds.x, visibleBounds.y, visibleBounds.width, visibleBounds.height);
    appendShapeEndFill(visibleBoundsShape);
    invalidateNodeAppearance(visibleBoundsShape);

    cameraLabel.data.text = 'Camera3D: (${toFixed(camera.x, 0)}, ${toFixed(camera.y, 0)})  Zoom: ${toFixed(camera.zoom, 2)}';
    invalidateNodeAppearance(cameraLabel);
    playerLabel.data.text = 'Player: (${toFixed(player.x, 0)}, ${toFixed(player.y, 0)})';
    invalidateNodeAppearance(playerLabel);
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
