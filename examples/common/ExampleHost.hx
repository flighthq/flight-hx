package;

import flighthq.app.App;
import flighthq.hostLime.LimeApp;
import flighthq.sdk.Sdk;
import flighthq.types.DisplayObject;
import flighthq.types.Shape;
import lime.app.Application;
import lime.graphics.RenderContext;
import lime.ui.Window;

/** Small presentation helpers shared by the mechanically ported Lime examples. */
class ExampleHost extends Application {
  public var renderState(default, null):Dynamic;
  public var root:Dynamic;
  public var backgroundColor:Int = 0x1a1a2eff;

  var ready = false;

  public function new() {
    super();
  }

  override public function onWindowCreate():Void {
    App.setAppBackend(LimeApp.createLimeAppBackend(this));
    switch (window.context.type) {
      case OPENGL, OPENGLES, WEBGL:
        setupFlight();
      default:
        throw 'Flight examples require an OpenGL/WebGL render context.';
    }
  }

  function setupFlight():Void {
    final canvas = new _ExampleGlCanvas(window);
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

  public function flightReady():Void {}

  public function flightUpdate(deltaSeconds:Float):Void {}

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

  function createStage(title:String):DisplayObject {
    final stage = Sdk.createDisplayObject();
    root = stage;
    addLabel(stage, title, 20, 14, 24, 0xffffff);
    return stage;
  }

  function addLabel(parent:DisplayObject, text:String, x:Float, y:Float, size:Float = 14, color:Int = 0xcccccc):DisplayObject {
    final label = Sdk.createTextLabel();
    label.data.text = text;
    label.data.textFormat = {size: size, color: color};
    label.x = x;
    label.y = y;
    Sdk.addNodeChild(parent, label);
    return label;
  }

  function setLabel(label:DisplayObject, text:String):Void {
    untyped label.data.text = text;
    Sdk.invalidateNodeAppearance(label);
  }

  function addRectangle(parent:DisplayObject, x:Float, y:Float, width:Float, height:Float, color:Int, alpha:Float = 1):Shape {
    final shape = Sdk.createShape();
    Sdk.appendShapeBeginFill(shape, color, alpha);
    Sdk.appendShapeRectangle(shape, 0, 0, width, height);
    Sdk.appendShapeEndFill(shape);
    shape.x = x;
    shape.y = y;
    Sdk.addNodeChild(parent, shape);
    return shape;
  }

  function addCircle(parent:DisplayObject, x:Float, y:Float, radius:Float, color:Int, alpha:Float = 1):Shape {
    final shape = Sdk.createShape();
    Sdk.appendShapeBeginFill(shape, color, alpha);
    Sdk.appendShapeCircle(shape, 0, 0, radius);
    Sdk.appendShapeEndFill(shape);
    shape.x = x;
    shape.y = y;
    Sdk.addNodeChild(parent, shape);
    return shape;
  }

  function redrawRectangle(shape:Shape, width:Float, height:Float, color:Int, alpha:Float = 1):Void {
    Sdk.clearShapeCommands(shape);
    Sdk.appendShapeBeginFill(shape, color, alpha);
    Sdk.appendShapeRectangle(shape, 0, 0, width, height);
    Sdk.appendShapeEndFill(shape);
    Sdk.invalidateNodeAppearance(shape);
  }

  function redrawCircle(shape:Shape, radius:Float, color:Int, alpha:Float = 1):Void {
    Sdk.clearShapeCommands(shape);
    Sdk.appendShapeBeginFill(shape, color, alpha);
    Sdk.appendShapeCircle(shape, 0, 0, radius);
    Sdk.appendShapeEndFill(shape);
    Sdk.invalidateNodeAppearance(shape);
  }
}

private class _ExampleGlCanvas {
  public var width(get, never):Int;
  public var height(get, never):Int;

  final window:Window;
  final context:Dynamic;

  public function new(window:Window) {
    this.window = window;
    context = resolveContext(window);
    if (context == null) throw 'Flight examples require a hardware OpenGL/WebGL window.';
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
