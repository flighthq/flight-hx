// Line-by-line Haxe/Lime port of the upstream `spring` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flight.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and `requestAnimationFrame` loop are replaced by Lime's window/render
// lifecycle, and Flight's Lime host capabilities are enabled with `HostLime.enableHostLime(this)`.
// Click-to-retarget is Lime's `onMouseDown`; the HTML preset buttons are browser glue, adapted here to
// the number keys 1..5 (`onKeyDown`) so the `createSpringConfig` preset call sites are preserved.
import flight.hostLime.HostLime;
import flight.Sdk.*;
import flight.types.DisplayObject;
import flight.types.Shape;
import flight.types.Spring2D;
import flight.types.SpringConfig;
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

  final STAGE_WIDTH = 600;
  final STAGE_HEIGHT = 400;
  final CIRCLE_RADIUS = 18;
  final DAMP_LAMBDA = 6;

  var root:DisplayObject;

  // Spring configuration — starts with a bouncy underdamped preset.
  var springConfig:SpringConfig;

  // Spring-driven circle (blue).
  var spring2D:Spring2D;
  var springCircle:Shape;

  // Damp-driven circle (orange) — first-order, no overshoot.
  var dampX:Float;
  var dampY:Float;
  var dampCircle:Shape;

  // Target marker (small crosshair).
  var targetX:Float;
  var targetY:Float;
  var targetMarker:Shape;

  var legend:Shape;

  // The upstream HTML preset buttons; adapted to number keys 1..5.
  final presets:Array<{label:String, frequency:Float, dampingRatio:Float}> = [
    {dampingRatio: 0.3, frequency: 3, label: 'Underdamped (bouncy)'},
    {dampingRatio: 1, frequency: 3, label: 'Critically damped'},
    {dampingRatio: 3, frequency: 3, label: 'Overdamped (sluggish)'},
    {dampingRatio: 0.15, frequency: 5, label: 'Very bouncy'},
    {dampingRatio: 0.6, frequency: 8, label: 'Snappy'},
  ];

  // Stand-in for the DOM `info.textContent` readout; browser-only in the upstream.
  var info = '';

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
      registerRenderer(renderState, ShapeKind, defaultCanvasShapeRenderer);
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
      registerRenderer(renderState, ShapeKind, defaultGlShapeRenderer);
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

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    springConfig = createSpringConfig(3, 0.3);

    spring2D = createSpring2D(STAGE_WIDTH / 2, STAGE_HEIGHT / 2);
    springCircle = createShape();
    appendShapeBeginFill(springCircle, 0x2196f3ff);
    appendShapeCircle(springCircle, 0, 0, CIRCLE_RADIUS);
    appendShapeEndFill(springCircle);
    springCircle.x = spring2D.x.value;
    springCircle.y = spring2D.y.value;
    invalidateNodeLocalTransform(springCircle);
    addNodeChild(root, springCircle);

    dampX = STAGE_WIDTH / 2;
    dampY = STAGE_HEIGHT / 2;
    dampCircle = createShape();
    appendShapeBeginFill(dampCircle, 0xff9800ff);
    appendShapeCircle(dampCircle, 0, 0, CIRCLE_RADIUS);
    appendShapeEndFill(dampCircle);
    dampCircle.x = dampX;
    dampCircle.y = dampY;
    invalidateNodeLocalTransform(dampCircle);
    addNodeChild(root, dampCircle);

    targetX = STAGE_WIDTH / 2;
    targetY = STAGE_HEIGHT / 2;
    targetMarker = createShape();
    addNodeChild(root, targetMarker);

    redrawTargetMarker();

    // Legend — small colored squares with labels drawn as shapes (no font dependency).
    legend = createShape();
    final legendY = STAGE_HEIGHT - 28;
    appendShapeBeginFill(legend, 0x2196f3ff);
    appendShapeRectangle(legend, 12, legendY, 12, 12);
    appendShapeEndFill(legend);
    appendShapeBeginFill(legend, 0xff9800ff);
    appendShapeRectangle(legend, 110, legendY, 12, 12);
    appendShapeEndFill(legend);
    addNodeChild(root, legend);

    updateInfo();

    ready = true;
  }

  function redrawTargetMarker():Void {
    clearShapeCommands(targetMarker);
    final arm = 10;
    appendShapeLineStyle(targetMarker, 1.5, 0x999999ff);
    appendShapeMoveTo(targetMarker, targetX - arm, targetY);
    appendShapeLineTo(targetMarker, targetX + arm, targetY);
    appendShapeMoveTo(targetMarker, targetX, targetY - arm);
    appendShapeLineTo(targetMarker, targetX, targetY + arm);
    invalidateNodeRender(targetMarker);
  }

  function updateInfo():Void {
    info = 'frequency: ${springConfig.frequency} Hz  damping: ${springConfig.dampingRatio}';
  }

  // Click to set a new target.
  override public function onMouseDown(x:Float, y:Float, button:Int):Void {
    if (!ready) return;
    targetX = x;
    targetY = y;
    redrawTargetMarker();
  }

  // Preset selection — the upstream's HTML buttons, one per number key.
  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {
    if (!ready) return;
    final index = switch (keyCode) {
      case NUMBER_1: 0;
      case NUMBER_2: 1;
      case NUMBER_3: 2;
      case NUMBER_4: 3;
      case NUMBER_5: 4;
      default: -1;
    };
    if (index < 0) return;
    final preset = presets[index];
    springConfig = createSpringConfig(preset.frequency, preset.dampingRatio);
    updateInfo();
  }

  // Upstream `enterFrame`, driven by Lime's per-frame `update` (deltaTime is milliseconds).
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    final delta = Math.min(deltaTime / 1000.0, 0.1);

    // Advance the spring toward the target.
    updateSpring2D(spring2D, targetX, targetY, springConfig, delta);
    springCircle.x = spring2D.x.value;
    springCircle.y = spring2D.y.value;
    invalidateNodeLocalTransform(springCircle);

    // Advance the damp toward the target (first-order exponential approach).
    dampX = damp(dampX, targetX, DAMP_LAMBDA, delta);
    dampY = damp(dampY, targetY, DAMP_LAMBDA, delta);
    dampCircle.x = dampX;
    dampCircle.y = dampY;
    invalidateNodeLocalTransform(dampCircle);
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
}
