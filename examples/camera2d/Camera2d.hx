#if js
import flight._js._fn.Node.addNodeChild;
import flight._js._fn.Node.invalidateNodeLocalTransform;
import flight._js._fn.Path.tessellateStrokePath;
import flight._js._fn.Render.prepareScene2DRender;
import flight._js._fn.Render.registerNodeRenderer;
import flight._js._fn.RenderGl.beginGlRenderPass;
import flight._js._fn.RenderGl.createGlRenderState;
import flight._js._fn.RenderGl.createGlScreenRenderTarget;
import flight._js._fn.RenderGl.endGlRenderPass;
import flight._js._fn.RenderGl.standardGlBlendRealizations;
import flight._js._fn.RenderGl.standardGlTextureResolvers;
import flight._js._fn.Scene2dGl.glMeshShapeRenderer;
import flight._js._fn.Scene2dGl.glScene2DRenderer;
import flight._js._fn.Scene2dGl.registerGlStandardMaterial;
import flight._js._fn.Scene2dGl.renderGlScene2D;
import flight._js._fn.Shape.appendShapeBeginFill;
import flight._js._fn.Shape.appendShapeCircle;
import flight._js._fn.Shape.appendShapeEllipse;
import flight._js._fn.Shape.appendShapeEndFill;
import flight._js._fn.Shape.appendShapeLineStyle;
import flight._js._fn.Shape.appendShapeLineTo;
import flight._js._fn.Shape.appendShapeMoveTo;
import flight._js._fn.Shape.appendShapePolygon;
import flight._js._fn.Shape.appendShapeRectangle;
import flight._js._fn.Types.DisplayObjectKind;
import flight._js._fn.Types.ShapeKind;
import js.Browser;
import js.html.CanvasElement;
import js.html.webgl.WebGL2RenderingContext;
import js.lib.Uint8Array;
#elseif cpp
import flight.Camera2dScene;
#end

interface Camera2dSceneSink {
  function root():Int;
  function createDisplayObject(parent:Int):Int;
  function createShape(parent:Int):Int;
  function beginFill(handle:Int, color:Float, alpha:Float):Void;
  function endFill(handle:Int):Void;
  function lineStyle(handle:Int, thickness:Float, color:Float, alpha:Float):Void;
  function circle(handle:Int, x:Float, y:Float, radius:Float):Void;
  function ellipse(handle:Int, x:Float, y:Float, radiusX:Float, radiusY:Float):Void;
  function rectangle(handle:Int, x:Float, y:Float, width:Float, height:Float):Void;
  function triangle(handle:Int, x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float):Void;
  function moveTo(handle:Int, x:Float, y:Float):Void;
  function lineTo(handle:Int, x:Float, y:Float):Void;
  function setTransform(handle:Int, scaleX:Float, skewY:Float, skewX:Float, scaleY:Float, x:Float, y:Float):Void;
  function renderFrame():Bool;
  function nodeCount():Int;
  function shapeCount():Int;
}

class SeededRandom {
  var state:Float;

  public function new(seed:Int) {
    state = seed;
  }

  public function next():Float {
    state = (state * 16807.0) % 2147483647.0;
    return state / 2147483647.0;
  }
}

class Camera2dSceneAuthor {
  static inline var WIDTH = 800;
  static inline var HEIGHT = 600;
  static inline var WORLD_WIDTH = 2400.0;
  static inline var WORLD_HEIGHT = 1800.0;
  static inline var PLAYER_SIZE = 24.0;

  public static function build(sink:Camera2dSceneSink):Void {
    final random = new SeededRandom(42);
    final landmarks:Array<{circle:Bool, size:Float, x:Float, y:Float, height:Float, color:Float}> = [];
    for (_ in 0...60) {
      final circle = random.next() <= 0.5;
      final size = 20.0 + random.next() * 80.0;
      final x = 100.0 + random.next() * (WORLD_WIDTH - 200.0);
      final y = 100.0 + random.next() * (WORLD_HEIGHT - 200.0);
      final height = circle ? size : 20.0 + random.next() * 80.0;
      final color = hsl(Math.floor(random.next() * 360.0));
      landmarks.push({circle: circle, size: size, x: x, y: y, height: height, color: color});
    }
    final stars:Array<{x:Float, y:Float, radius:Float, brightness:Float}> = [];
    for (_ in 0...80) {
      stars.push({
        x: random.next() * WIDTH,
        y: random.next() * HEIGHT,
        radius: 1.0 + random.next() * 2.0,
        brightness: 0.3 + random.next() * 0.7,
      });
    }
    final clouds:Array<{x:Float, y:Float, width:Float, height:Float}> = [];
    for (_ in 0...12) {
      clouds.push({
        x: random.next() * WIDTH,
        y: 50.0 + random.next() * 200.0,
        width: 80.0 + random.next() * 120.0,
        height: 30.0 + random.next() * 40.0,
      });
    }
    final mountains:Array<{x:Float, peakHeight:Float, width:Float}> = [];
    for (_ in 0...8) {
      mountains.push({
        x: random.next() * WIDTH,
        peakHeight: 100.0 + random.next() * 200.0,
        width: 120.0 + random.next() * 180.0,
      });
    }

    final root = sink.root();
    final starsContainer = sink.createDisplayObject(root);
    final mountainsContainer = sink.createDisplayObject(root);
    final cloudsContainer = sink.createDisplayObject(root);
    final worldContainer = sink.createDisplayObject(root);

    final starsShape = sink.createShape(starsContainer);
    for (star in stars) {
      sink.beginFill(starsShape, 4294955263.0, star.brightness);
      sink.circle(starsShape, star.x, star.y, star.radius);
      sink.endFill(starsShape);
    }

    final mountainsShape = sink.createShape(mountainsContainer);
    for (mountain in mountains) {
      sink.beginFill(mountainsShape, 1011901695.0, 0.6);
      sink.triangle(
        mountainsShape,
        mountain.x - mountain.width * 0.5,
        HEIGHT,
        mountain.x,
        HEIGHT - mountain.peakHeight,
        mountain.x + mountain.width * 0.5,
        HEIGHT
      );
      sink.endFill(mountainsShape);
    }

    final cloudsShape = sink.createShape(cloudsContainer);
    for (cloud in clouds) {
      sink.beginFill(cloudsShape, 3369264895.0, 0.4);
      sink.ellipse(cloudsShape, cloud.x, cloud.y, cloud.width * 0.5, cloud.height * 0.5);
      sink.endFill(cloudsShape);
    }

    final gridShape = sink.createShape(worldContainer);
    sink.lineStyle(gridShape, 1.0, 1685622015.0, 0.15);
    var grid = 0;
    while (grid <= WORLD_WIDTH) {
      sink.moveTo(gridShape, grid, 0.0);
      sink.lineTo(gridShape, grid, WORLD_HEIGHT);
      grid += 100;
    }
    grid = 0;
    while (grid <= WORLD_HEIGHT) {
      sink.moveTo(gridShape, 0.0, grid);
      sink.lineTo(gridShape, WORLD_WIDTH, grid);
      grid += 100;
    }
    sink.endFill(gridShape);

    final borderShape = sink.createShape(worldContainer);
    sink.lineStyle(borderShape, 3.0, 3360706815.0, 0.5);
    sink.rectangle(borderShape, 0.0, 0.0, WORLD_WIDTH, WORLD_HEIGHT);
    sink.endFill(borderShape);

    for (landmark in landmarks) {
      final shape = sink.createShape(worldContainer);
      sink.beginFill(shape, landmark.color, 0.7);
      if (landmark.circle) {
        sink.circle(shape, landmark.x, landmark.y, landmark.size * 0.5);
      } else {
        sink.rectangle(
          shape,
          landmark.x - landmark.size * 0.5,
          landmark.y - landmark.height * 0.5,
          landmark.size,
          landmark.height
        );
      }
      sink.endFill(shape);
    }

    final playerShape = sink.createShape(worldContainer);
    sink.beginFill(playerShape, 4291572735.0, 1.0);
    sink.triangle(
      playerShape,
      WORLD_WIDTH * 0.5,
      WORLD_HEIGHT * 0.5 - PLAYER_SIZE,
      WORLD_WIDTH * 0.5 + PLAYER_SIZE * 0.8,
      WORLD_HEIGHT * 0.5 + PLAYER_SIZE * 0.6,
      WORLD_WIDTH * 0.5 - PLAYER_SIZE * 0.8,
      WORLD_HEIGHT * 0.5 + PLAYER_SIZE * 0.6
    );
    sink.endFill(playerShape);
    sink.lineStyle(playerShape, 2.0, 3432579327.0, 1.0);
    sink.triangle(
      playerShape,
      WORLD_WIDTH * 0.5,
      WORLD_HEIGHT * 0.5 - PLAYER_SIZE,
      WORLD_WIDTH * 0.5 + PLAYER_SIZE * 0.8,
      WORLD_HEIGHT * 0.5 + PLAYER_SIZE * 0.6,
      WORLD_WIDTH * 0.5 - PLAYER_SIZE * 0.8,
      WORLD_HEIGHT * 0.5 + PLAYER_SIZE * 0.6
    );
    sink.endFill(playerShape);

    final boundsShape = sink.createShape(worldContainer);
    sink.lineStyle(boundsShape, 2.0, 13133055.0, 0.6);
    sink.rectangle(boundsShape, 800.0, 600.0, WIDTH, HEIGHT);
    sink.endFill(boundsShape);

    // These values are the generated Camera2D view/parallax outputs for a camera centered at
    // (1200, 900), a viewport of 800x600, and zoom 1. Keeping them in the authored Haxe command
    // stream makes both adapters exercise the same graph and transform invalidation path.
    sink.setTransform(starsContainer, 1.0, 0.0, 0.0, 1.0, -120.0, -90.0);
    sink.setTransform(mountainsContainer, 1.0, 0.0, 0.0, 1.0, -480.0, -360.0);
    sink.setTransform(cloudsContainer, 1.0, 0.0, 0.0, 1.0, -720.0, -540.0);
    sink.setTransform(worldContainer, 1.0, 0.0, 0.0, 1.0, -800.0, -600.0);
  }

  static function hsl(hue:Float):Float {
    final saturation = 0.6;
    final lightness = 0.5;
    final chroma = (1.0 - Math.abs(2.0 * lightness - 1.0)) * saturation;
    final intermediate = chroma * (1.0 - Math.abs((hue / 60.0) % 2.0 - 1.0));
    final match = lightness - chroma * 0.5;
    var red = 0.0;
    var green = 0.0;
    var blue = 0.0;
    if (hue < 60.0) {
      red = chroma;
      green = intermediate;
    } else if (hue < 120.0) {
      red = intermediate;
      green = chroma;
    } else if (hue < 180.0) {
      green = chroma;
      blue = intermediate;
    } else if (hue < 240.0) {
      green = intermediate;
      blue = chroma;
    } else if (hue < 300.0) {
      red = chroma;
      blue = intermediate;
    } else {
      red = chroma;
      blue = intermediate;
    }
    final r = Math.round((red + match) * 255.0);
    final g = Math.round((green + match) * 255.0);
    final b = Math.round((blue + match) * 255.0);
    return r * 65536.0 + g * 256.0 + b;
  }
}

#if cpp
class NativeCamera2dSceneSink implements Camera2dSceneSink {
  final scene:cpp.Pointer<Camera2dScene>;

  public function new() {
    scene = Camera2dScene.create(800, 600);
    if (scene == null) throw 'could not create flight-cpp Camera2D scene';
  }

  public function dispose():Void Camera2dScene.destroy(scene);
  public function root():Int return Camera2dScene.root(scene);
  public function createDisplayObject(parent:Int):Int return Camera2dScene.createDisplayObject(scene, parent);
  public function createShape(parent:Int):Int return Camera2dScene.createShape(scene, parent);
  public function beginFill(handle:Int, color:Float, alpha:Float):Void Camera2dScene.beginFill(scene, handle, color, alpha);
  public function endFill(handle:Int):Void Camera2dScene.endFill(scene, handle);
  public function lineStyle(handle:Int, thickness:Float, color:Float, alpha:Float):Void Camera2dScene.lineStyle(scene, handle, thickness, color, alpha);
  public function circle(handle:Int, x:Float, y:Float, radius:Float):Void Camera2dScene.circle(scene, handle, x, y, radius);
  public function ellipse(handle:Int, x:Float, y:Float, radiusX:Float, radiusY:Float):Void Camera2dScene.ellipse(scene, handle, x, y, radiusX, radiusY);
  public function rectangle(handle:Int, x:Float, y:Float, width:Float, height:Float):Void Camera2dScene.rectangle(scene, handle, x, y, width, height);
  public function triangle(handle:Int, x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float):Void Camera2dScene.triangle(scene, handle, x0, y0, x1, y1, x2, y2);
  public function moveTo(handle:Int, x:Float, y:Float):Void Camera2dScene.moveTo(scene, handle, x, y);
  public function lineTo(handle:Int, x:Float, y:Float):Void Camera2dScene.lineTo(scene, handle, x, y);
  public function setTransform(handle:Int, scaleX:Float, skewY:Float, skewX:Float, scaleY:Float, x:Float, y:Float):Void Camera2dScene.setTransform(scene, handle, scaleX, skewY, skewX, scaleY, x, y);
  public function renderFrame():Bool return Camera2dScene.renderFrame(scene);
  public function nodeCount():Int return Camera2dScene.nodeCount(scene);
  public function shapeCount():Int return Camera2dScene.shapeCount(scene);
  public function verifiedFrames():Int return Camera2dScene.verifiedFrames(scene);
  public function maximumCoverage():Int return Camera2dScene.maximumCoverage(scene);
}
#elseif js
class WebCamera2dSceneSink implements Camera2dSceneSink {
  final canvas:CanvasElement;
  final gl:WebGL2RenderingContext;
  final state:flight.GlRenderState;
  final target:flight.GlScreenRenderTarget;
  final nodes:Array<Dynamic> = [];
  final shapes:Map<Int, flight.Shape> = [];
  public var maximumCoverage(default, null) = 0;

  public function new() {
    canvas = Browser.document.createCanvasElement();
    canvas.width = 800;
    canvas.height = 600;
    Browser.document.body.appendChild(canvas);
    gl = canvas.getContextWebGL2({alpha: false, preserveDrawingBuffer: true});
    if (gl == null) throw 'could not create WebGL2 context';
    state = createGlRenderState(gl, {
      pixelRatio: 1.0,
      sceneGraphSyncPolicy: cast 'requiresInvalidation',
      blendRealizations: standardGlBlendRealizations,
      textureResolvers: standardGlTextureResolvers,
      strokeTessellator: tessellateStrokePath,
    });
    registerNodeRenderer(state, DisplayObjectKind, cast glScene2DRenderer);
    registerNodeRenderer(state, ShapeKind, cast glMeshShapeRenderer);
    registerGlStandardMaterial(state);
    target = createGlScreenRenderTarget(gl);
    nodes.push(flight._js._fn.Scene2d.createDisplayObject());
  }

  public function root():Int return 0;

  public function createDisplayObject(parent:Int):Int {
    final value = flight._js._fn.Scene2d.createDisplayObject();
    addNodeChild(nodes[parent], value);
    nodes.push(value);
    return nodes.length - 1;
  }

  public function createShape(parent:Int):Int {
    final value = flight._js._fn.Shape.createShape();
    addNodeChild(nodes[parent], value);
    nodes.push(value);
    final handle = nodes.length - 1;
    shapes.set(handle, value);
    return handle;
  }

  inline function shape(handle:Int):flight.Shape return shapes[handle];

  public function beginFill(handle:Int, color:Float, alpha:Float):Void appendShapeBeginFill(shape(handle), color, alpha);
  public function endFill(handle:Int):Void appendShapeEndFill(shape(handle));
  public function lineStyle(handle:Int, thickness:Float, color:Float, alpha:Float):Void appendShapeLineStyle(shape(handle), thickness, color, alpha);
  public function circle(handle:Int, x:Float, y:Float, radius:Float):Void appendShapeCircle(shape(handle), x, y, radius);
  public function ellipse(handle:Int, x:Float, y:Float, radiusX:Float, radiusY:Float):Void appendShapeEllipse(shape(handle), x, y, radiusX, radiusY);
  public function rectangle(handle:Int, x:Float, y:Float, width:Float, height:Float):Void appendShapeRectangle(shape(handle), x, y, width, height);
  public function triangle(handle:Int, x0:Float, y0:Float, x1:Float, y1:Float, x2:Float, y2:Float):Void appendShapePolygon(shape(handle), [x0, y0, x1, y1, x2, y2]);
  public function moveTo(handle:Int, x:Float, y:Float):Void appendShapeMoveTo(shape(handle), x, y);
  public function lineTo(handle:Int, x:Float, y:Float):Void appendShapeLineTo(shape(handle), x, y);

  public function setTransform(handle:Int, scaleX:Float, skewY:Float, skewX:Float, scaleY:Float, x:Float, y:Float):Void {
    final node:Dynamic = nodes[handle];
    node.scaleX = scaleX;
    node.skewY = skewY;
    node.skewX = skewX;
    node.scaleY = scaleY;
    node.x = x;
    node.y = y;
    invalidateNodeLocalTransform(node);
  }

  public function renderFrame():Bool {
    // False means that an already-prepared graph had no dirty work, not that preparation failed.
    prepareScene2DRender(state, nodes[0]);
    final pass = beginGlRenderPass(state, target, {color: [0x1a / 0xff, 0x1a / 0xff, 0x2e / 0xff, 1.0]});
    renderGlScene2D(pass, nodes[0]);
    endGlRenderPass(pass);
    if (gl.getError() != 0) return false;

    gl.finish();
    final pixels = new Uint8Array(800 * 600 * 4);
    gl.readPixels(
      0,
      0,
      800,
      600,
      WebGL2RenderingContext.RGBA,
      WebGL2RenderingContext.UNSIGNED_BYTE,
      pixels
    );
    if (gl.getError() != 0) return false;
    var coverage = 0;
    var index = 0;
    while (index < pixels.length) {
      if (pixels[index] != 0x1a || pixels[index + 1] != 0x1a || pixels[index + 2] != 0x2e) coverage++;
      index += 4;
    }
    maximumCoverage = Std.int(Math.max(maximumCoverage, coverage));
    final center = ((600 - 1 - 300) * 800 + 400) * 4;
    return coverage >= 5000 && pixels[center] >= 240 && pixels[center + 1] >= 180 &&
      pixels[center + 1] <= 220 && pixels[center + 2] >= 35 && pixels[center + 2] <= 70;
  }

  public function nodeCount():Int return nodes.length;
  public function shapeCount():Int return Lambda.count(shapes);
}
#end

class Camera2d {
  static function main():Void {
    #if cpp
    final sink = new NativeCamera2dSceneSink();
    Camera2dSceneAuthor.build(sink);
    if (sink.nodeCount() != 72 || sink.shapeCount() != 67) throw 'unexpected Camera2D graph inventory';
    for (frame in 0...3) {
      if (!sink.renderFrame()) {
        throw 'flight-cpp Scene2D GL frame $frame failed (coverage ${sink.maximumCoverage()})';
      }
    }
    if (sink.verifiedFrames() != 3) throw 'flight-cpp did not verify all Camera2D frames';
    Sys.println('CAMERA2D_NATIVE_OK nodes=${sink.nodeCount()} shapes=${sink.shapeCount()} coverage=${sink.maximumCoverage()}');
    sink.dispose();
    #elseif js
    final sink = new WebCamera2dSceneSink();
    Camera2dSceneAuthor.build(sink);
    if (sink.nodeCount() != 72 || sink.shapeCount() != 67) throw 'unexpected Camera2D graph inventory';
    for (_ in 0...3) if (!sink.renderFrame()) throw 'Flight ESM Scene2D GL frame failed';
    Browser.console.log('CAMERA2D_WEB_OK nodes=${sink.nodeCount()} shapes=${sink.shapeCount()} coverage=${sink.maximumCoverage}');
    #else
    #error "Camera2d requires cpp or js + flight_esm"
    #end
  }
}
