// Line-by-line Haxe/Lime port of the upstream `clock` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flighthq.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and the Flight app backend is wired with `App.setAppBackend(createLimeAppBackend(this))`.
// Every statement of the upstream program is otherwise translated faithfully.
import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk.*;
import flighthq.types.Clock;
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

  var root:DisplayObject;
  var rootClock:Clock;
  var childClockA:Clock;
  var childClockB:Clock;

  var rootShape:Shape;
  var childShapeA:Shape;
  var childShapeB:Shape;

  final ROOT_X = 400;
  final ROOT_Y = 120;
  final CHILD_A_X = 220;
  final CHILD_A_Y = 300;
  final CHILD_B_X = 580;
  final CHILD_B_Y = 300;

  var rootInfoLabel:DisplayObject;
  var childANameLabel:DisplayObject;
  var childAInfoLabel:DisplayObject;
  var childBNameLabel:DisplayObject;
  var childBInfoLabel:DisplayObject;
  var rootPausedLabel:DisplayObject;
  var childAPausedLabel:DisplayObject;
  var childBPausedLabel:DisplayObject;

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

    // Create the clock hierarchy: one root clock with two child clocks.
    rootClock = createClock();
    childClockA = createChildClock(rootClock, {scale: 1});
    childClockB = createChildClock(rootClock, {scale: 0.5});

    // Each clock drives a spinning shape. The shapes are drawn centered at origin and positioned via
    // the display object's x/y. Rotation is updated each frame from the clock's elapsed time.

    // Root clock shape: a square.
    rootShape = createShape();
    drawSquare(rootShape, 60, 0x4488cc);
    rootShape.x = ROOT_X;
    rootShape.y = ROOT_Y;
    invalidateNodeLocalTransform(rootShape);
    addNodeChild(root, rootShape);

    // Child A shape: a triangle.
    childShapeA = createShape();
    drawTriangle(childShapeA, 50, 0x44cc88);
    childShapeA.x = CHILD_A_X;
    childShapeA.y = CHILD_A_Y;
    invalidateNodeLocalTransform(childShapeA);
    addNodeChild(root, childShapeA);

    // Child B shape: a circle with a notch to show rotation.
    childShapeB = createShape();
    drawNotchedCircle(childShapeB, 30, 0xcc8844);
    childShapeB.x = CHILD_B_X;
    childShapeB.y = CHILD_B_Y;
    invalidateNodeLocalTransform(childShapeB);
    addNodeChild(root, childShapeB);

    // Hierarchy lines connecting root to children.
    final hierarchyLines = createShape();
    appendShapeLineStyle(hierarchyLines, 2, 0x555555);
    appendShapeMoveTo(hierarchyLines, ROOT_X, ROOT_Y + 30);
    appendShapeLineTo(hierarchyLines, CHILD_A_X, CHILD_A_Y - 40);
    appendShapeMoveTo(hierarchyLines, ROOT_X, ROOT_Y + 30);
    appendShapeLineTo(hierarchyLines, CHILD_B_X, CHILD_B_Y - 40);
    addNodeChild(root, hierarchyLines);

    // HUD labels.
    final titleLabel = createLabel('Hierarchical Clocks', 20, 10, 24, 0xffffff);
    addNodeChild(root, titleLabel);

    // Root clock labels.
    final rootNameLabel = createLabel('Root Clock', ROOT_X - 40, ROOT_Y - 55, 14, 0xaaaaaa);
    addNodeChild(root, rootNameLabel);
    rootInfoLabel = createLabel('', ROOT_X - 80, ROOT_Y + 40, 12, 0x8888aa);
    addNodeChild(root, rootInfoLabel);

    // Child A labels.
    childANameLabel = createLabel('Child A (1x)', CHILD_A_X - 45, CHILD_A_Y - 55, 14, 0xaaaaaa);
    addNodeChild(root, childANameLabel);
    childAInfoLabel = createLabel('', CHILD_A_X - 80, CHILD_A_Y + 45, 12, 0x88aa88);
    addNodeChild(root, childAInfoLabel);

    // Child B labels.
    childBNameLabel = createLabel('Child B (0.5x)', CHILD_B_X - 50, CHILD_B_Y - 55, 14, 0xaaaaaa);
    addNodeChild(root, childBNameLabel);
    childBInfoLabel = createLabel('', CHILD_B_X - 80, CHILD_B_Y + 45, 12, 0xaa8844);
    addNodeChild(root, childBInfoLabel);

    // Controls label.
    final controlsLabel = createLabel('P root pause    1/2 toggle child pause    Left/Right child A scale    Up/Down child B scale',
      20, 470, 13, 0x888888);
    addNodeChild(root, controlsLabel);

    // Paused overlay indicators (shown when a clock is paused).
    rootPausedLabel = createLabel('PAUSED', ROOT_X - 25, ROOT_Y - 8, 14, 0xff4444);
    rootPausedLabel.visible = false;
    addNodeChild(root, rootPausedLabel);
    childAPausedLabel = createLabel('PAUSED', CHILD_A_X - 25, CHILD_A_Y - 8, 14, 0xff4444);
    childAPausedLabel.visible = false;
    addNodeChild(root, childAPausedLabel);
    childBPausedLabel = createLabel('PAUSED', CHILD_B_X - 25, CHILD_B_Y - 8, 14, 0xff4444);
    childBPausedLabel.visible = false;
    addNodeChild(root, childBPausedLabel);

    ready = true;
  }

  function drawSquare(shape:Shape, size:Float, color:Int):Void {
    clearShapeCommands(shape);
    final half = size / 2;
    appendShapeBeginFill(shape, color);
    appendShapeRectangle(shape, -half, -half, size, size);
    appendShapeEndFill(shape);
  }

  function drawTriangle(shape:Shape, size:Float, color:Int):Void {
    clearShapeCommands(shape);
    final half = size / 2;
    final h = (size * Math.sqrt(3)) / 2;
    appendShapeBeginFill(shape, color);
    appendShapeMoveTo(shape, 0, -h / 2);
    appendShapeLineTo(shape, half, h / 2);
    appendShapeLineTo(shape, -half, h / 2);
    appendShapeLineTo(shape, 0, -h / 2);
    appendShapeEndFill(shape);
  }

  function drawNotchedCircle(shape:Shape, radius:Float, color:Int):Void {
    clearShapeCommands(shape);
    appendShapeBeginFill(shape, color);
    appendShapeCircle(shape, 0, 0, radius);
    appendShapeEndFill(shape);
    // Draw a line from center to edge as a rotation indicator.
    appendShapeLineStyle(shape, 3, 0xffffff);
    appendShapeMoveTo(shape, 0, 0);
    appendShapeLineTo(shape, radius, 0);
  }

  function createLabel(text:String, x:Float, y:Float, size:Float, color:Int):DisplayObject {
    final label = createTextLabel();
    label.data.text = text;
    label.data.textFormat = {size: size, color: color};
    label.x = x;
    label.y = y;
    invalidateNodeLocalTransform(label);
    return label;
  }

  function updateLabel(label:DisplayObject, text:String):Void {
    label.data.text = text;
    invalidateNodeAppearance(label);
  }

  // Keyboard controls. In the browser this is a `keydown` listener; here it is Lime's `onKeyDown`.
  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {
    if (!ready) return;
    switch (keyCode) {
      case P:
        if (rootClock.paused) resumeClock(rootClock) else pauseClock(rootClock);
      case NUMBER_1:
        if (childClockA.paused) resumeClock(childClockA) else pauseClock(childClockA);
      case NUMBER_2:
        if (childClockB.paused) resumeClock(childClockB) else pauseClock(childClockB);
      case LEFT:
        setClockScale(childClockA, Math.max(childClockA.scale - 0.25, 0));
      case RIGHT:
        setClockScale(childClockA, Math.min(childClockA.scale + 0.25, 4));
      case DOWN:
        setClockScale(childClockB, Math.max(childClockB.scale - 0.25, 0));
      case UP:
        setClockScale(childClockB, Math.min(childClockB.scale + 0.25, 4));
      default:
    }
  }

  function formatTime(seconds:Float):String {
    return toFixed(seconds, 1) + 's';
  }

  // Upstream `enterFrame`, driven by Lime's per-frame `update` (deltaTime is milliseconds).
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    final rawDelta = deltaTime / 1000.0;

    // Advance the root clock; children are advanced recursively.
    advanceClock(rootClock, rawDelta);

    // Rotate each shape proportionally to its clock's elapsed time.
    final degreesPerSecond = 90;
    rootShape.rotation = rootClock.elapsed * degreesPerSecond;
    invalidateNodeLocalTransform(rootShape);
    childShapeA.rotation = childClockA.elapsed * degreesPerSecond;
    invalidateNodeLocalTransform(childShapeA);
    childShapeB.rotation = childClockB.elapsed * degreesPerSecond;
    invalidateNodeLocalTransform(childShapeB);

    // Update info labels.
    updateLabel(rootInfoLabel, 'elapsed ' + formatTime(rootClock.elapsed) + '  dt ' + toFixed(rootClock.deltaTime, 3) + '  scale '
      + toFixed(rootClock.scale, 2));
    updateLabel(childAInfoLabel, 'elapsed ' + formatTime(childClockA.elapsed) + '  dt ' + toFixed(childClockA.deltaTime, 3) + '  scale '
      + toFixed(childClockA.scale, 2) + '  eff ' + toFixed(getClockEffectiveScale(childClockA), 2));
    updateLabel(childBInfoLabel, 'elapsed ' + formatTime(childClockB.elapsed) + '  dt ' + toFixed(childClockB.deltaTime, 3) + '  scale '
      + toFixed(childClockB.scale, 2) + '  eff ' + toFixed(getClockEffectiveScale(childClockB), 2));

    // Update name labels with current scale.
    updateLabel(childANameLabel, 'Child A (' + toFixed(childClockA.scale, 2) + 'x)');
    updateLabel(childBNameLabel, 'Child B (' + toFixed(childClockB.scale, 2) + 'x)');

    // Show/hide paused overlays.
    rootPausedLabel.visible = rootClock.paused;
    invalidateNodeAppearance(rootPausedLabel);
    childAPausedLabel.visible = isClockEffectivelyPaused(childClockA);
    invalidateNodeAppearance(childAPausedLabel);
    childBPausedLabel.visible = isClockEffectivelyPaused(childClockB);
    invalidateNodeAppearance(childBPausedLabel);
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
