// Line-by-line Haxe/Lime port of the upstream `snapshot` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// Every statement of the upstream program is otherwise translated faithfully.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.DisplayObject;
import flighthq.types.Shape;
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

  final CANVAS_WIDTH = 800;
  final CANVAS_HEIGHT = 500;
  final ITEM_COUNT = 6;
  final COLLECT_RADIUS = 30;
  final SLOT_COUNT = 5;
  final INTERPOLATION_DURATION = 1000;

  // Game state is plain data -- snapshot functions operate on this, not on display objects.
  var gameState:Dynamic;

  // Snapshot storage: a ring buffer of up to SLOT_COUNT saved snapshots.
  var snapshots:Array<Dynamic>;
  var nextSlot = 0;

  // Interpolation state: when active, smoothly transitions from a saved snapshot to the current state.
  var interpolating = false;
  var interpStartTime:Float = 0;
  var interpSource:Dynamic = null;
  var interpTarget:Dynamic = null;
  // A mutable working copy that receives interpolated values each frame.
  var interpState:Dynamic;

  // Scene graph: display objects that visualize the game state.
  var root:DisplayObject;
  var playerShape:Shape;
  var itemShapes:Array<Shape>;
  var uiOverlay:Shape;
  var scoreLabel:DisplayObject;
  var helpLabel:DisplayObject;
  var statusLabel:DisplayObject;

  // `performance.now()`-style absolute milliseconds, accumulated from Lime's per-frame delta.
  var nowMs:Float = 0;

  public function new() {
    super();
  }

  function createInitialState():Dynamic {
    final items:Array<Dynamic> = [];
    for (i in 0...ITEM_COUNT) {
      items.push({
        x: 150 + Math.random() * 500,
        y: 80 + Math.random() * 320,
        collected: false,
      });
    }
    return {
      player: {x: CANVAS_WIDTH / 2, y: CANVAS_HEIGHT / 2 - 20, rotation: 0.0, score: 0},
      items: items,
      time: 0.0,
    };
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
      backgroundColor: 0x0a0a14ff,
      contextAttributes: {alpha: false, preserveDrawingBuffer: true},
      sceneGraphSyncPolicy: 'requiresInvalidation',
    });
    registerDefaultGlMaterial(renderState);
    registerRenderer(renderState, ShapeKind, defaultGlShapeRenderer);
    registerRenderer(renderState, TextLabelKind, defaultGlTextLabelRenderer);
    registerGlShapeCommands(defaultGlShapeCommands);
    enableGlBlendModeSupport(renderState);

    gameState = createInitialState();
    snapshots = [for (i in 0...SLOT_COUNT) null];
    interpState = createInitialState();

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    playerShape = createShape();
    addNodeChild(root, playerShape);

    itemShapes = [];
    for (i in 0...ITEM_COUNT) {
      final shape = createShape();
      addNodeChild(root, shape);
      itemShapes.push(shape);
    }

    uiOverlay = createShape();
    addNodeChild(root, uiOverlay);

    scoreLabel = createTextLabel();
    scoreLabel.data.text = 'Score: 0';
    scoreLabel.data.textFormat = {font: 'monospace', size: 16, color: 0xffffff};
    scoreLabel.x = 20;
    scoreLabel.y = 440;
    invalidateNodeLocalTransform(scoreLabel);
    addNodeChild(root, scoreLabel);

    helpLabel = createTextLabel();
    helpLabel.data.text = '[S] Save  [R] Restore  [1-5] Load slot  [I] Interpolate to slot 1';
    helpLabel.data.textFormat = {font: 'monospace', size: 13, color: 0x999999};
    helpLabel.x = 20;
    helpLabel.y = 468;
    invalidateNodeLocalTransform(helpLabel);
    addNodeChild(root, helpLabel);

    statusLabel = createTextLabel();
    statusLabel.data.text = '';
    statusLabel.data.textFormat = {font: 'monospace', size: 14, color: 0x44cc88};
    statusLabel.x = 400;
    statusLabel.y = 440;
    invalidateNodeLocalTransform(statusLabel);
    addNodeChild(root, statusLabel);

    ready = true;
  }

  // Input handling.

  function saveSnapshot():Void {
    final snap = captureSnapshot(gameState);
    snapshots[nextSlot] = snap;
    showStatus('Saved to slot ${nextSlot + 1}');
    nextSlot = (nextSlot + 1) % SLOT_COUNT;
  }

  function restoreSlot(slot:Int):Void {
    final snap = snapshots[slot];
    if (snap == null) {
      showStatus('Slot ${slot + 1} is empty');
      return;
    }
    restoreSnapshot(snap, gameState);
    interpolating = false;
    showStatus('Restored slot ${slot + 1}');
  }

  function startInterpolation():Void {
    final snap = snapshots[0];
    if (snap == null) {
      showStatus('Slot 1 is empty -- save first');
      return;
    }
    if (equalsSnapshot(captureSnapshot(gameState), snap)) {
      showStatus('Already at slot 1');
      return;
    }
    interpSource = captureSnapshot(gameState);
    interpTarget = snap;
    interpolating = true;
    interpStartTime = nowMs;
    showStatus('Interpolating to slot 1...');
  }

  // The upstream `setTimeout` that clears the status after 2s is dropped in the Lime port.
  function showStatus(message:String):Void {
    statusLabel.data.text = message;
  }

  // Keyboard controls. In the browser this is a `keydown` listener; here it is Lime's `onKeyDown`.
  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {
    if (!ready) return;
    switch (keyCode) {
      case S:
        saveSnapshot();
      case R:
        restoreSlot((nextSlot - 1 + SLOT_COUNT) % SLOT_COUNT);
      case NUMBER_1:
        restoreSlot(0);
      case NUMBER_2:
        restoreSlot(1);
      case NUMBER_3:
        restoreSlot(2);
      case NUMBER_4:
        restoreSlot(3);
      case NUMBER_5:
        restoreSlot(4);
      case I:
        startInterpolation();
      default:
    }
  }

  // Drawing helpers: translate game state into shape commands each frame.

  function drawPlayer(shape:Shape, x:Float, y:Float, rotation:Float):Void {
    clearShapeCommands(shape);

    final radians = (rotation * Math.PI) / 180;
    final size = 18;
    final cos = Math.cos(radians);
    final sin = Math.sin(radians);

    // Triangle pointing in the direction of `rotation`.
    final tipX = x + cos * size;
    final tipY = y + sin * size;
    final leftX = x + Math.cos(radians + 2.4) * size;
    final leftY = y + Math.sin(radians + 2.4) * size;
    final rightX = x + Math.cos(radians - 2.4) * size;
    final rightY = y + Math.sin(radians - 2.4) * size;

    appendShapeBeginFill(shape, 0x44aaff);
    appendShapeMoveTo(shape, tipX, tipY);
    appendShapeLineTo(shape, leftX, leftY);
    appendShapeLineTo(shape, rightX, rightY);
    appendShapeLineTo(shape, tipX, tipY);
    appendShapeEndFill(shape);

    invalidateNodeLocalTransform(shape);
  }

  function drawItem(shape:Shape, item:Dynamic):Void {
    clearShapeCommands(shape);
    if (item.collected) {
      invalidateNodeLocalTransform(shape);
      return;
    }
    appendShapeBeginFill(shape, 0xffcc33);
    appendShapeCircle(shape, item.x, item.y, 10);
    appendShapeEndFill(shape);
    invalidateNodeLocalTransform(shape);
  }

  function drawSlotIndicators(shape:Shape):Void {
    clearShapeCommands(shape);
    final startX = 650;
    final y = 450;
    for (i in 0...SLOT_COUNT) {
      final cx = startX + i * 24;
      if (snapshots[i] != null) {
        appendShapeBeginFill(shape, 0x44cc88);
        appendShapeCircle(shape, cx, y, 8);
        appendShapeEndFill(shape);
      } else {
        appendShapeLineStyle(shape, 2, 0x555555);
        appendShapeCircle(shape, cx, y, 8);
      }
      // Slot number label drawn as a small tick mark above.
      appendShapeLineStyle(shape, 1, 0x777777);
      appendShapeMoveTo(shape, cx, y - 14);
      appendShapeLineTo(shape, cx, y - 18);
    }
    invalidateNodeLocalTransform(shape);
  }

  // Simulation: player orbits the center, items get collected on proximity.

  function updateSimulation(dt:Float):Void {
    gameState.time += dt;

    // Player moves in a circular path.
    final orbitSpeed = 0.3;
    final orbitRadius = 120;
    final centerX = CANVAS_WIDTH / 2;
    final centerY = CANVAS_HEIGHT / 2 - 40;
    final angle = gameState.time * orbitSpeed;

    gameState.player.x = centerX + Math.cos(angle) * orbitRadius;
    gameState.player.y = centerY + Math.sin(angle) * orbitRadius;
    gameState.player.rotation = (angle * 180) / Math.PI + 90;

    // Check item collection.
    for (item in (gameState.items : Array<Dynamic>)) {
      if (item.collected) continue;
      final dx = gameState.player.x - item.x;
      final dy = gameState.player.y - item.y;
      if (dx * dx + dy * dy < COLLECT_RADIUS * COLLECT_RADIUS) {
        item.collected = true;
        gameState.player.score += 100;
      }
    }
  }

  // Render loop. Upstream `enterFrame`, driven by Lime's per-frame `update` (deltaTime is milliseconds).
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    nowMs += deltaTime;
    final dt = Math.min(deltaTime / 1000.0, 0.1);

    // Determine which state to render: if interpolating, blend between saved snapshots.
    var renderStateGame:Dynamic = gameState;

    if (!interpolating) {
      updateSimulation(dt);
    } else if (interpSource != null && interpTarget != null) {
      updateSimulation(dt);
      final elapsed = nowMs - interpStartTime;
      final t = Math.min(elapsed / INTERPOLATION_DURATION, 1);
      interpolateSnapshots(interpSource, interpTarget, t, interpState);
      renderStateGame = interpState;
      if (t >= 1) {
        restoreSnapshot(interpTarget, gameState);
        interpolating = false;
        showStatus('Interpolation complete');
      }
    }

    // Draw the current visual state.
    drawPlayer(playerShape, renderStateGame.player.x, renderStateGame.player.y, renderStateGame.player.rotation);
    for (i in 0...ITEM_COUNT) {
      drawItem(itemShapes[i], renderStateGame.items[i]);
    }
    drawSlotIndicators(uiOverlay);

    scoreLabel.data.text = 'Score: ${renderStateGame.player.score}';
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
