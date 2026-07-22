package flighthq.lime;

import lime.app.Application;
import lime.graphics.RenderContext;
import flighthq.Sdk;

/**
 * A Lime application that hosts a Flight scene: it opens Lime's window, binds
 * Flight's WebGL renderer to the window's GL context (via `LimeGlCanvas`), and
 * pumps Flight's per-frame update and render from Lime's own loop.
 *
 * Subclass it, build your Flight scene in `flightReady`, advance it in
 * `flightUpdate`, and assign the scene's root display object to `root`. Input is
 * plain Lime: override `onKeyDown`, `onMouseDown`, etc. as usual.
 *
 * ```haxe
 * class Main extends flighthq.lime.LimeHost {
 *   var rootClock:Dynamic;
 *   override function flightReady() {
 *     root = Sdk.createDisplayObject();
 *     rootClock = ClockApi.createClock();
 *     // ... build shapes, add children to root ...
 *   }
 *   override function flightUpdate(dt:Float) {
 *     ClockApi.advanceClock(rootClock, dt);
 *     // ... update transforms, invalidate ...
 *   }
 * }
 * ```
 *
 * NOTE: written against Lime's API without a Lime toolchain to compile against;
 * verify when you build with `lime build`.
 */
class LimeHost extends Application {
  /** The Flight GL render state, available after `flightReady` is called. */
  public var renderState(default, null):Dynamic;

  /** The Flight display-object root the host renders each frame. */
  public var root:Dynamic;

  /** Background clear color as Flight's 0xRRGGBBAA. */
  public var backgroundColor:Int = 0x1a1a2eff;

  var canvas:LimeGlCanvas;
  var ready:Bool = false;

  public function new() {
    super();
  }

  override public function onWindowCreate():Void {
    switch (window.context.type) {
      case OPENGL, OPENGLES, WEBGL:
        setupFlight();
      default:
        throw "flighthq.lime.LimeHost requires an OpenGL/WebGL render context.";
    }
  }

  function setupFlight():Void {
    canvas = new LimeGlCanvas(window);
    renderState = Sdk.createGlRenderState(canvas, {
      pixelRatio: window.scale,
      backgroundColor: backgroundColor,
      contextAttributes: {alpha: false, preserveDrawingBuffer: true},
      sceneGraphSyncPolicy: "requiresInvalidation",
    });
    // Register the default GL renderers, matching the upstream WebGL example setup.
    Sdk.registerDefaultGlMaterial(renderState);
    Sdk.registerRenderer(renderState, Sdk.ShapeKind, Sdk.defaultGlShapeRenderer);
    Sdk.registerRenderer(renderState, Sdk.TextLabelKind, Sdk.defaultGlTextLabelRenderer);
    Sdk.registerGlShapeCommands(Sdk.defaultGlShapeCommands);
    ready = true;
    flightReady();
  }

  /** Override to build the Flight scene and assign `root`. Called once, when the GL context is ready. */
  public function flightReady():Void {}

  /** Override to advance the scene each frame; `deltaSeconds` is time since the previous frame. */
  public function flightUpdate(deltaSeconds:Float):Void {}

  override public function update(deltaTime:Int):Void {
    if (ready) flightUpdate(deltaTime / 1000.0);
  }

  override public function render(context:RenderContext):Void {
    if (!ready || root == null) return;
    if (!Sdk.prepareDisplayObjectRender(renderState, root)) return;
    Sdk.renderGlBackground(renderState);
    Sdk.renderGlDisplayObject(renderState, root);
  }
}
