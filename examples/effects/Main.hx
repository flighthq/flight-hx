// Line-by-line Haxe/Lime port of the upstream `effects` example (`app.ts`), written directly against
// the generated Flight Haxe surface (`flight.*`). It is a standalone `lime.app.Application`: the
// browser `./render` module and its one-shot `render(root, effects)` call are replaced by Lime's
// window/render lifecycle, and the Flight app backend is wired with
// `App.setAppBackend(createLimeAppBackend(this))`. Every statement is otherwise translated faithfully.
import flight.types.DisplayObject;
import flight.App;
import flight.hostLime.LimeApp;
import flight.Sdk.*;

import flight.types.RenderEffect;
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

  var root:DisplayObject;
  // Effect chain: bloom -> vignette -> tone map, plus the GL effect pipeline that applies it.
  var effects:Array<RenderEffect>;
  var pipeline:Dynamic;

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
      final canvas = flight.Scene2DCairo.createCairoSurface(window);
      renderState = createCanvasRenderState(canvas, {
        pixelRatio: window.scale,
        backgroundColor: 0x0a0c14ff,
      });
      registerRenderer(renderState, ShapeKind, defaultCanvasShapeRenderer);
      registerCanvasShapeCommands(renderState, defaultCanvasShapeCommands);
      registerCanvasBloomEffect(renderState);
      registerCanvasVignetteEffect(renderState);
      registerCanvasImageTextureResolver(getCanvasRenderStateTextureResolvers(renderState));
      registerCanvasBitmapTextureResolver(getCanvasRenderStateTextureResolvers(renderState));
      enableCanvasBlendMode(renderState);
    } else {
      final canvas = flight.hostLime.GlSurface.createGlSurface(window);
      renderState = createGlRenderState(canvas, {
        pixelRatio: window.scale,
        backgroundColor: 0x0a0c14ff,
        contextAttributes: {alpha: false, preserveDrawingBuffer: true},
      });
      registerGlStandardMaterial(renderState);
      registerStandardGlTextureResolvers(renderState);
      registerRenderer(renderState, ShapeKind, defaultGlShapeRenderer);
      // Upstream f1a7a9a0: the GPU mesh lane covers solid fills and open strokes; closed strokes,
      // gradients, and texture fills draw through an explicit canvas shape rasterizer, whose
      // resolver set is pointed at this state's diagnostics. Without it those shapes silently
      // vanish (this example's GL frame was background-only).
      final shapeRasterizerResolvers = createCanvasTextureResolvers();
      connectCanvasTextureResolverMisses(shapeRasterizerResolvers, renderState);
      registerCanvasImageTextureResolver(shapeRasterizerResolvers);
      registerCanvasBitmapTextureResolver(shapeRasterizerResolvers);
      registerCanvasShapeCommands(renderState, defaultCanvasShapeCommands);
      registerCanvasShapeCommands(renderState, defaultCanvasTextureShapeCommands);
      registerGlShapeRasterizer(renderState, createCanvasShapeRasterizer(shapeRasterizerResolvers));
      registerGlBloomEffect(renderState);
      registerGlVignetteEffect(renderState);
      registerGlToneMapEffect(renderState);
      enableGlBlendModeSupport(renderState);
    }
    pipeline = usingCairo ? createCanvasRenderEffectPipeline(renderState) : createGlRenderEffectPipeline(renderState);

    root = createDisplayObject();
    root.scaleX = scale;
    root.scaleY = scale;

    // Bright shapes on a dark background — bloom makes them glow, vignette draws focus
    // to the center, and tone mapping compresses highlights.
    final colors = [0xff3366, 0x33ff99, 0x3399ff, 0xffcc33, 0xff66cc];

    for (i in 0...colors.length) {
      final shape = createShape();
      final angle = (i / colors.length) * Math.PI * 2;
      final cx = 400 + Math.cos(angle) * 180;
      final cy = 300 + Math.sin(angle) * 140;

      appendShapeBeginFill(shape, colors[i], 1);
      appendShapeCircle(shape, cx, cy, 60 + i * 8);
      appendShapeEndFill(shape);
      addNodeChild(root, shape);
    }

    // Center diamond shape.
    final center = createShape();
    appendShapeBeginFill(center, 0xffffff, 1);
    appendShapeRectangle(center, 350, 250, 100, 100);
    appendShapeEndFill(center);
    center.rotation = 45;
    center.pivotX = 400;
    center.pivotY = 300;
    invalidateNodeLocalTransform(center);
    addNodeChild(root, center);

    // Effect chain: bloom -> vignette -> tone map.
    effects = [
      createBloomEffect({threshold: 0.5, intensity: 1.2}),
      createVignetteEffect({intensity: 0.8}),
      createToneMapEffect({"operator": 'aces', exposure: 1.2}),
    ];

    ready = true;
  }

  override public function onKeyDown(keyCode:KeyCode, modifier:KeyModifier):Void {}

  // The upstream program renders once; Lime re-renders every frame with no per-frame state changes.
  override public function update(deltaTime:Int):Void {}

  // Upstream `render(root, effects)`, driven by Lime's per-frame `render`.
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
      beginCanvasRenderEffectPipeline(renderState, pipeline);
      renderCanvasBackground(renderState);
      renderCanvasScene2D(renderState, root);
      endCanvasRenderEffectPipeline(renderState, pipeline, cast effects);
    } else {
      beginGlRenderEffectPipeline(renderState, pipeline);
      renderGlBackground(renderState);
      renderGlScene2D(renderState, root);
      endGlRenderEffectPipeline(renderState, pipeline, cast effects);
    }
  }
}
