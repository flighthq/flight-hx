// Line-by-line Haxe/Lime port of the upstream `tween` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flight.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and the `requestAnimationFrame`/`stepApplicationLoop` loop are replaced
// by Lime's window/render lifecycle, and Flight's Lime host capabilities are enabled with
// `HostLime.enableHostLime(this)`. Every statement is otherwise translated faithfully.
import flight.hostLime.HostLime;
import flight.Sdk.*;
import flight.types.DisplayObject;
import flight.types.EasingFunction;
import flight.types.Shape;
import flight.types.TweenManager;
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

  final CANVAS_WIDTH = 800;
  final CANVAS_HEIGHT = 600;
  final COLUMNS = 3;
  final ROWS = 5;
  final CELL_WIDTH = 800 / 3;
  final CELL_HEIGHT = 600 / 5;
  final CIRCLE_RADIUS = 8;
  final TWEEN_DURATION = 1500;
  final TRACK_MARGIN = 20;
  final FRAME_DELTA = 1000 / 60;

  var easings:Array<{name:String, ease:EasingFunction}>;
  var manager:TweenManager;
  var root:DisplayObject;
  // Upstream drives frames through a Flight `Application`; the browser `requestAnimationFrame` loop
  // becomes Lime's per-frame `update`.
  var app:flight.types.Application;
  var frame = 0;

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
      renderState = createCanvasRenderState(createCanvasRenderSurface(surfaceCreator, canvas, {pixelRatio: window.scale}), createCanvasPipeline(createEmptyCanvasRegistries()), createCanvasTextureResolvers(surfaceCreator), {
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
      renderState = createGlRenderState(createGlContextState(createGlContextFromCanvasElement(canvas, {contextAttributes: {alpha: false, preserveDrawingBuffer: true}})), createGlPipeline(createEmptyGlRegistries()), {
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

    easings = [
      {name: 'easeInQuadratic', ease: easeInQuadratic},
      {name: 'easeOutQuadratic', ease: easeOutQuadratic},
      {name: 'easeInOutQuadratic', ease: easeInOutQuadratic},
      {name: 'easeInCubic', ease: easeInCubic},
      {name: 'easeOutCubic', ease: easeOutCubic},
      {name: 'easeInOutCubic', ease: easeInOutCubic},
      {name: 'easeInSine', ease: easeInSine},
      {name: 'easeOutSine', ease: easeOutSine},
      {name: 'easeInOutSine', ease: easeInOutSine},
      {name: 'easeInExponential', ease: easeInExponential},
      {name: 'easeOutExponential', ease: easeOutExponential},
      {name: 'easeInOutExponential', ease: easeInOutExponential},
      {name: 'easeInElastic', ease: easeInElastic},
      {name: 'easeOutElastic', ease: easeOutElastic},
      {name: 'easeOutBounce', ease: easeOutBounce},
    ];

    manager = createTweenManager();
    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    for (i in 0...easings.length) {
      final col = i % COLUMNS;
      final row = Std.int(i / COLUMNS);
      final cellX = col * CELL_WIDTH;
      final cellY = row * CELL_HEIGHT;

      final label = createTextLabel();
      label.data.text = easings[i].name;
      label.data.textFormat = {size: 13, color: 0xcccccc};
      label.x = cellX + 10;
      label.y = cellY + 8;
      invalidateNodeLocalTransform(label);
      addNodeChild(root, label);

      final trackStartX = cellX + TRACK_MARGIN;
      final trackEndX = cellX + CELL_WIDTH - TRACK_MARGIN;
      final trackY = cellY + CELL_HEIGHT * 0.62;

      final circle = createShape();
      appendShapeBeginFill(circle, 0x44aaee);
      appendShapeCircle(circle, 0, 0, CIRCLE_RADIUS);
      appendShapeEndFill(circle);
      circle.x = trackStartX;
      circle.y = trackY;
      invalidateNodeLocalTransform(circle);
      addNodeChild(root, circle);

      startTween(circle, trackStartX, trackEndX, easings[i].ease);
    }

    app = createApplication();
    connectSignal(app.onUpdate, function(delta) {
      updateTweens(manager, delta);
    });
    connectSignal(app.onRender, function() {
      // Upstream calls `render(root)` here; the actual GL draw happens in Lime's `render(context)`.
    });

    ready = true;
  }

  function startTween(circle:Shape, startX:Float, endX:Float, ease:EasingFunction):Void {
    circle.x = startX;
    invalidateNodeLocalTransform(circle);
    final tween = createTween(manager, circle, TWEEN_DURATION, cast {x: endX}, {ease: ease});
    connectSignal(tween.onComplete, function() {
      startTween(circle, startX, endX, ease);
    });
    connectSignal(tween.onUpdate, function() {
      invalidateNodeRender(circle);
    });
  }

  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {}

  // Upstream `enterFrame` stepped the Flight application loop; Lime drives it per frame.
  override public function update(deltaTime:Int):Void {
    if (!ready) return;
    stepApplicationLoop(app, frame == 0 ? 0 : FRAME_DELTA);
    frame++;
  }

  // Upstream `render(root)` (via `app.onRender`), driven by Lime's per-frame `render`.
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
