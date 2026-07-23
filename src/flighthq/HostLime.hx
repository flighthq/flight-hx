package flighthq;

#if lime
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.Window;

/**
 * A Lime application that hosts a Flight scene and renders it through Flight's
 * WebGL renderer. Subclass it, build the scene in `flightReady`, advance it in
 * `flightUpdate`, and assign the scene root to `root`.
 */
class HostLime extends Application {
  /** The Flight GL render state, available before `flightReady` is called. */
  public var renderState(default, null):Dynamic;

  /** The Flight display-object root rendered each frame. */
  public var root:Dynamic;

  /** Background clear color as Flight's `0xRRGGBBAA`. */
  public var backgroundColor:Int = 0x1a1a2eff;

  var ready = false;

  public function new() {
    super();
  }

  override public function onWindowCreate():Void {
    switch (window.context.type) {
      case OPENGL, OPENGLES, WEBGL:
        setupFlight();
      default:
        throw 'flighthq.HostLime requires an OpenGL/WebGL render context.';
    }
  }

  function setupFlight():Void {
    final canvas = new _LimeGlCanvas(window);
    renderState = Sdk.createGlRenderState(canvas, {
      pixelRatio: window.scale,
      backgroundColor: backgroundColor,
      contextAttributes: {alpha: false, preserveDrawingBuffer: true},
      sceneGraphSyncPolicy: 'requiresInvalidation',
    });
    Sdk.registerDefaultGlMaterial(renderState);
    Sdk.registerRenderer(renderState, Sdk.ShapeKind, Sdk.defaultGlShapeRenderer);
    Sdk.registerRenderer(renderState, Sdk.TextLabelKind, Sdk.defaultGlTextLabelRenderer);
    Sdk.registerGlShapeCommands(Sdk.defaultGlShapeCommands);
    ready = true;
    flightReady();
  }

  /** Called once after the GL context and Flight renderer are ready. */
  public function flightReady():Void {}

  /** Called once per frame with the elapsed time in seconds. */
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

private class _LimeGlCanvas {
  public var width(get, never):Int;
  public var height(get, never):Int;

  final window:Window;
  final context:Dynamic;

  public function new(window:Window) {
    this.window = window;
    context = resolveContext(window);
    if (context == null) {
      throw 'The Lime window has no WebGL/OpenGL render context; request a hardware window in project.xml.';
    }
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
#end
