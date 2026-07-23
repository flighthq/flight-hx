package flighthq.hostLime;

#if lime
import flighthq.AppApi;
import flighthq.Sdk;
import flighthq.Types.AppBackend;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.Window;

/**
 * A Lime application that hosts and renders a Flight scene.
 *
 * Subclass it, build the scene in `flightReady`, advance it in
 * `flightUpdate`, and assign the scene root to `root`.
 */
class LimeApp extends Application {
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
    AppApi.setAppBackend(createLimeAppBackend());
    switch (window.context.type) {
      case OPENGL, OPENGLES, WEBGL:
        setupFlight();
      default:
        throw 'flighthq.hostLime.LimeApp requires an OpenGL/WebGL render context.';
    }
  }

  /**
   * Creates Flight's application backend for the current Lime application.
   *
   * Lime supplies application identity and process/window lifecycle while the
   * web backend retains Flight's documented sentinels for unsupported desktop
   * integration such as dock menus, login items, and recent documents.
   */
  public static function createLimeAppBackend():AppBackend {
    final backend = AppApi.createWebAppBackend();
    final application = Application.current;
    if (application == null) return backend;

    backend.focus = function():Void {
      if (application.window != null) application.window.focus();
    };
    backend.getName = function():String {
      return getMetadata(application, 'title');
    };
    backend.getVersion = function():String {
      return getMetadata(application, 'version');
    };
    backend.quit = function():Void {
      if (application.window != null) application.window.close();
    };
    backend.showApp = function():Bool {
      if (application.window == null) return false;
      application.window.focus();
      return true;
    };
    return backend;
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
    Sdk.registerRenderer(renderState, Sdk.BitmapKind, Sdk.defaultGlBitmapRenderer);
    Sdk.registerRenderer(renderState, Sdk.ParticleEmitterKind, Sdk.defaultGlParticleEmitterRenderer);
    Sdk.registerRenderer(renderState, Sdk.QuadBatchKind, Sdk.defaultGlQuadBatchRenderer);
    Sdk.registerRenderer(renderState, Sdk.RichTextKind, Sdk.defaultGlRichTextRenderer);
    Sdk.registerRenderer(renderState, Sdk.Scale9ShapeKind, Sdk.defaultGlScale9ShapeRenderer);
    Sdk.registerRenderer(renderState, Sdk.SpriteKind, Sdk.defaultGlSpriteRenderer);
    Sdk.registerRenderer(renderState, Sdk.TilemapKind, Sdk.defaultGlTilemapRenderer);
    Sdk.registerRenderer(renderState, Sdk.VideoKind, Sdk.defaultGlVideoRenderer);
    Sdk.registerGlShapeCommands(Sdk.defaultGlShapeCommands);
    Sdk.enableGlBlendModeSupport(renderState);
    ready = true;
    flightReady();
  }

  /** Called once after the GL context and Flight renderer are ready. */
  public function flightReady():Void {}

  /** Called once per frame with the elapsed time in seconds. */
  public function flightUpdate(deltaSeconds:Float):Void {}

  /**
   * Override for a specialized GL pass such as effects or a 3D scene. The
   * default implementation renders the display-object `root`.
   */
  public function flightRender(context:RenderContext):Void {
    if (root == null) return;
    if (!Sdk.prepareDisplayObjectRender(renderState, root)) return;
    Sdk.renderGlBackground(renderState);
    Sdk.renderGlDisplayObject(renderState, root);
  }

  override public function update(deltaTime:Int):Void {
    if (ready) flightUpdate(deltaTime / 1000.0);
  }

  override public function render(context:RenderContext):Void {
    if (ready) flightRender(context);
  }

  static function getMetadata(application:Application, field:String):String {
    final config = Reflect.field(application, 'config');
    final meta = config == null ? null : Reflect.field(config, 'meta');
    final value = meta == null ? null : Reflect.field(meta, field);
    return value == null ? '' : Std.string(value);
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
