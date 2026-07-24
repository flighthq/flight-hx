// Line-by-line Haxe/Lime port of the upstream `platformer` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// Every statement of the upstream program is otherwise translated faithfully.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.Camera2D;
import flighthq.types.Collision.CollisionAabb;
import flighthq.types.Collision.CollisionManifold;
import flighthq.types.DisplayObject;
import flighthq.types.Matrix;
import flighthq.types.Shape;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.KeyCode;
import lime.ui.KeyModifier;
import lime.ui.MouseButton;
import lime.ui.Window;

class Main extends Application {
  // `scale` in the upstream render module is `window.devicePixelRatio || 1`; Lime exposes `window.scale`.
  var scale:Float = 1.0;
  var renderState:Dynamic;
  var ready = false;

  final CANVAS_WIDTH = 800;
  final CANVAS_HEIGHT = 500;
  final GRAVITY = 980;
  final JUMP_VELOCITY = -420;
  final MOVE_SPEED = 220;
  final PLAYER_WIDTH = 24;
  final PLAYER_HEIGHT = 32;

  final platformDefs:Array<{x:Int, y:Int, w:Int, h:Int, color:Int}> = [
    {x: -200, y: 400, w: 1600, h: 40, color: 0x4a7c59},
    {x: 100, y: 320, w: 150, h: 16, color: 0x8b6914},
    {x: 350, y: 260, w: 120, h: 16, color: 0x8b6914},
    {x: 550, y: 200, w: 180, h: 16, color: 0x8b6914},
    {x: 780, y: 300, w: 140, h: 16, color: 0x8b6914},
    {x: 980, y: 220, w: 160, h: 16, color: 0x8b6914},
    {x: 50, y: 160, w: 100, h: 16, color: 0x8b6914},
  ];

  var root:DisplayObject;
  var worldContainer:DisplayObject;
  var uiContainer:DisplayObject;

  var camera:Camera2D;
  var viewMatrix:Matrix;

  var playerX = 200.0;
  var playerY = 350.0;
  var velocityX = 0.0;
  var velocityY = 0.0;
  var onGround = false;

  final keys:Map<String, Bool> = new Map();

  var playerShape:Shape;

  var platforms:Array<Platform> = [];

  var titleLabel:DisplayObject;
  var subtitleLabel:DisplayObject;
  var gameOverLabel:DisplayObject;

  var gameState:String = 'title';

  var manifold:CollisionManifold;

  var playerAabb:CollisionAabb;
  var platformAabb:CollisionAabb;

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

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    worldContainer = createDisplayObject();
    addNodeChild(root, worldContainer);

    uiContainer = createDisplayObject();
    addNodeChild(root, uiContainer);

    camera = createCamera2D(CANVAS_WIDTH, CANVAS_HEIGHT);
    viewMatrix = createMatrix();

    playerShape = createShape();
    addNodeChild(worldContainer, playerShape);

    for (def in platformDefs) {
      final shape = createShape();
      appendShapeBeginFill(shape, def.color);
      appendShapeRectangle(shape, def.x, def.y, def.w, def.h);
      appendShapeEndFill(shape);
      invalidateNodeAppearance(shape);
      addNodeChild(worldContainer, shape);
      platforms.push({x: def.x, y: def.y, width: def.w, height: def.h, color: def.color, shape: shape});
    }

    titleLabel = createTextLabel();
    titleLabel.data.text = 'PLATFORMER';
    titleLabel.data.textFormat = {color: 0xffffff, size: 48, font: 'Arial', bold: true, align: 'center'};
    titleLabel.data.width = CANVAS_WIDTH;
    titleLabel.data.height = 100;
    titleLabel.y = 150;
    invalidateNodeAppearance(titleLabel);
    invalidateNodeLocalTransform(titleLabel);
    addNodeChild(uiContainer, titleLabel);

    subtitleLabel = createTextLabel();
    subtitleLabel.data.text = 'Click to Play';
    subtitleLabel.data.textFormat = {color: 0xdddddd, size: 24, font: 'Arial', align: 'center'};
    subtitleLabel.data.width = CANVAS_WIDTH;
    subtitleLabel.data.height = 60;
    subtitleLabel.y = 260;
    invalidateNodeAppearance(subtitleLabel);
    invalidateNodeLocalTransform(subtitleLabel);
    addNodeChild(uiContainer, subtitleLabel);

    gameOverLabel = createTextLabel();
    gameOverLabel.data.text = 'Game Over - Click to Restart';
    gameOverLabel.data.textFormat = {color: 0xff4444, size: 32, font: 'Arial', bold: true, align: 'center'};
    gameOverLabel.data.width = CANVAS_WIDTH;
    gameOverLabel.data.height = 80;
    gameOverLabel.y = 200;
    gameOverLabel.visible = false;
    invalidateNodeAppearance(gameOverLabel);
    invalidateNodeLocalTransform(gameOverLabel);
    addNodeChild(uiContainer, gameOverLabel);

    manifold = createCollisionManifold();

    playerAabb = {minX: 0, minY: 0, maxX: 0, maxY: 0};
    platformAabb = {minX: 0, minY: 0, maxX: 0, maxY: 0};

    ready = true;
  }

  // Browser `document` keydown/keyup listeners store `keys[e.code]`; Lime's `onKeyDown`/`onKeyUp` supply
  // a `KeyCode`, mapped back to the upstream `e.code` string so the `keys` lookups stay faithful.
  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {
    final code = keyCodeToCode(keyCode);
    if (code != '') keys[code] = true;
  }

  override public function onKeyUp(keyCode:KeyCode, modifier:KeyModifier):Void {
    final code = keyCodeToCode(keyCode);
    if (code != '') keys[code] = false;
  }

  function keyCodeToCode(keyCode:KeyCode):String {
    return switch (keyCode) {
      case LEFT: 'ArrowLeft';
      case RIGHT: 'ArrowRight';
      case UP: 'ArrowUp';
      case A: 'KeyA';
      case D: 'KeyD';
      case W: 'KeyW';
      case SPACE: 'Space';
      default: '';
    };
  }

  // Browser `document` click listener; Lime's `onMouseDown`.
  override public function onMouseDown(x:Float, y:Float, button:MouseButton):Void {
    if (gameState == 'title') {
      startGame();
    } else if (gameState == 'gameover') {
      startGame();
    }
  }

  function startGame():Void {
    gameState = 'playing';
    playerX = 200;
    playerY = 350;
    velocityX = 0;
    velocityY = 0;
    onGround = false;

    titleLabel.visible = false;
    invalidateNodeAppearance(titleLabel);
    subtitleLabel.visible = false;
    invalidateNodeAppearance(subtitleLabel);
    gameOverLabel.visible = false;
    invalidateNodeAppearance(gameOverLabel);

    worldContainer.visible = true;
    invalidateNodeAppearance(worldContainer);
  }

  function triggerGameOver():Void {
    gameState = 'gameover';
    gameOverLabel.visible = true;
    invalidateNodeAppearance(gameOverLabel);
  }

  function updateGame(dt:Float):Void {
    velocityX = 0;

    if (keys['ArrowLeft'] == true || keys['KeyA'] == true) {
      velocityX = -MOVE_SPEED;
    }
    if (keys['ArrowRight'] == true || keys['KeyD'] == true) {
      velocityX = MOVE_SPEED;
    }
    if ((keys['ArrowUp'] == true || keys['KeyW'] == true || keys['Space'] == true) && onGround) {
      velocityY = JUMP_VELOCITY;
      onGround = false;
    }

    velocityY += GRAVITY * dt;

    playerX += velocityX * dt;
    playerY += velocityY * dt;

    onGround = false;

    playerAabb.minX = playerX;
    playerAabb.minY = playerY;
    playerAabb.maxX = playerX + PLAYER_WIDTH;
    playerAabb.maxY = playerY + PLAYER_HEIGHT;

    for (plat in platforms) {
      platformAabb.minX = plat.x;
      platformAabb.minY = plat.y;
      platformAabb.maxX = plat.x + plat.width;
      platformAabb.maxY = plat.y + plat.height;

      if (testAabbAabbCollision(playerAabb, platformAabb, manifold)) {
        playerX += manifold.normalX * manifold.depth;
        playerY += manifold.normalY * manifold.depth;

        if (manifold.normalY < -0.5) {
          velocityY = 0;
          onGround = true;
        } else if (manifold.normalY > 0.5) {
          velocityY = 0;
        }

        playerAabb.minX = playerX;
        playerAabb.minY = playerY;
        playerAabb.maxX = playerX + PLAYER_WIDTH;
        playerAabb.maxY = playerY + PLAYER_HEIGHT;
      }
    }

    if (playerY > 600) {
      triggerGameOver();
    }

    updateCamera2DFollow(camera, playerX + PLAYER_WIDTH / 2, playerY + PLAYER_HEIGHT / 2, dt, {
      smoothTime: 0.15,
    });

    getCamera2DViewMatrix(camera, viewMatrix);

    worldContainer.x = viewMatrix.tx;
    worldContainer.y = viewMatrix.ty;
    worldContainer.scaleX = viewMatrix.a;
    worldContainer.scaleY = viewMatrix.d;
    invalidateNodeLocalTransform(worldContainer);

    drawPlayer();
  }

  function drawPlayer():Void {
    clearShapeCommands(playerShape);
    appendShapeBeginFill(playerShape, 0xdd3333);
    appendShapeRectangle(playerShape, playerX, playerY, PLAYER_WIDTH, PLAYER_HEIGHT);
    appendShapeEndFill(playerShape);
    invalidateNodeAppearance(playerShape);
  }

  // Upstream `enterFrame`, driven by Lime's per-frame `update` (deltaTime is milliseconds).
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    final rawDelta = deltaTime / 1000.0;
    final dt = deltaTime == 0 ? 1 / 60 : Math.min(rawDelta, 0.05);

    if (gameState == 'playing') {
      updateGame(dt);
    }
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

// Upstream `Platform` interface.
private typedef Platform = {
  var x:Float;
  var y:Float;
  var width:Float;
  var height:Float;
  var color:Int;
  var shape:Shape;
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
