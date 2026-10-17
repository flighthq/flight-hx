#if (js && flight_esm)
package flight._js;

import flight._js._fn.Bitmap.createBitmap;
import flight._js._fn.Node.addNodeChild;
import flight._js._fn.Node.invalidateNodeLocalTransform;
import flight._js._fn.Path.tessellateStrokePath;
import flight._js._fn.Render.disposeScene2DRender;
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
import flight._js._fn.Scene2dGl.glSpriteRenderer;
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
import flight._js._fn.Texture.createTexture2D;
import flight._js._fn.Types.DisplayObjectKind;
import flight._js._fn.Types.ShapeKind;
import flight._js._fn.Types.SpriteKind;
import js.Browser;
import js.html.CanvasElement;
import js.html.webgl.WebGL2RenderingContext;
import js.lib.Uint8Array;

/** Current Flight ESM implementation of the public, ownership-aware Scene2D session. */
class Scene2dApp {
  final canvas:CanvasElement;
  final gl:WebGL2RenderingContext;
  final state:flight.GlRenderState;
  final target:flight.GlScreenRenderTarget;
  final rootNode:flight.DisplayObject;
  final width:Int;
  final height:Int;
  final solidTextures:Map<String, flight.Texture2D> = [];
  var nodes = 1;
  var shapes = 0;
  var sprites = 0;
  var frames = 0;
  var coverage = 0;
  var disposed = false;

  public function new(width:Int, height:Int) {
    this.width = width;
    this.height = height;
    canvas = Browser.document.createCanvasElement();
    canvas.width = width;
    canvas.height = height;
    canvas.title = 'flight-hx Scene2D';
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
    registerNodeRenderer(state, SpriteKind, cast glSpriteRenderer);
    registerGlStandardMaterial(state);
    target = createGlScreenRenderTarget(gl);
    rootNode = flight._js._fn.Scene2d.createDisplayObject();
  }

  public function dispose():Void {
    if (disposed) return;
    disposed = true;
    disposeScene2DRender(state, rootNode);
    canvas.remove();
  }

  public inline function root():flight.DisplayObject return rootNode;

  public function createDisplayObject(parent:flight.Scene2dNode):flight.DisplayObject {
    final value = flight._js._fn.Scene2d.createDisplayObject();
    addNodeChild(parent, value);
    nodes++;
    return value;
  }

  public function createShape(parent:flight.Scene2dNode):flight.Shape {
    final value = flight._js._fn.Shape.createShape();
    addNodeChild(parent, value);
    nodes++;
    shapes++;
    return value;
  }

  public function createSolidSprite(
    parent:flight.Scene2dNode,
    color:Float,
    x:Float,
    y:Float,
    width:Float,
    height:Float,
    alpha:Float
  ):flight.Sprite {
    final value = flight._js._fn.Scene2d.createSprite();
    value.data.texture = solidTexture(color);
    value.x = x;
    value.y = y;
    value.scaleX = width;
    value.scaleY = height;
    value.alpha = alpha;
    addNodeChild(parent, value);
    nodes++;
    sprites++;
    return value;
  }

  function solidTexture(color:Float):flight.Texture2D {
    final key = Std.string(color);
    var texture = solidTextures[key];
    if (texture == null) {
      texture = createTexture2D({source: createBitmap(1.0, 1.0, color)});
      solidTextures[key] = texture;
    }
    return texture;
  }

  public inline function beginFill(shape:flight.Shape, color:Float, alpha:Float):Void
    appendShapeBeginFill(shape, color, alpha);
  public inline function endFill(shape:flight.Shape):Void appendShapeEndFill(shape);
  public inline function lineStyle(shape:flight.Shape, thickness:Float, color:Float, alpha:Float):Void
    appendShapeLineStyle(shape, thickness, color, alpha);
  public inline function circle(shape:flight.Shape, x:Float, y:Float, radius:Float):Void
    appendShapeCircle(shape, x, y, radius);
  public inline function ellipse(shape:flight.Shape, x:Float, y:Float, radiusX:Float, radiusY:Float):Void
    appendShapeEllipse(shape, x, y, radiusX, radiusY);
  public inline function rectangle(shape:flight.Shape, x:Float, y:Float, width:Float, height:Float):Void
    appendShapeRectangle(shape, x, y, width, height);
  public inline function triangle(
    shape:flight.Shape,
    x0:Float,
    y0:Float,
    x1:Float,
    y1:Float,
    x2:Float,
    y2:Float
  ):Void appendShapePolygon(shape, [x0, y0, x1, y1, x2, y2]);
  public inline function moveTo(shape:flight.Shape, x:Float, y:Float):Void appendShapeMoveTo(shape, x, y);
  public inline function lineTo(shape:flight.Shape, x:Float, y:Float):Void appendShapeLineTo(shape, x, y);

  public function setTransform(
    node:flight.Scene2dNode,
    scaleX:Float,
    skewY:Float,
    skewX:Float,
    scaleY:Float,
    x:Float,
    y:Float
  ):Void {
    node.scaleX = scaleX;
    node.skewY = skewY;
    node.skewX = skewX;
    node.scaleY = scaleY;
    node.x = x;
    node.y = y;
    invalidateNodeLocalTransform(node);
  }

  public function renderFrame():Bool {
    // False means an already-prepared graph had no dirty work, not that preparation failed.
    prepareScene2DRender(state, rootNode);
    final pass = beginGlRenderPass(
      state,
      target,
      {color: [0x1a / 0xff, 0x1a / 0xff, 0x2e / 0xff, 1.0]}
    );
    renderGlScene2D(pass, rootNode);
    endGlRenderPass(pass);
    if (gl.getError() != 0) return false;

    gl.finish();
    final pixels = new Uint8Array(width * height * 4);
    gl.readPixels(
      0,
      0,
      width,
      height,
      WebGL2RenderingContext.RGBA,
      WebGL2RenderingContext.UNSIGNED_BYTE,
      pixels
    );
    if (gl.getError() != 0) return false;
    var frameCoverage = 0;
    var index = 0;
    while (index < pixels.length) {
      if (pixels[index] != 0x1a || pixels[index + 1] != 0x1a || pixels[index + 2] != 0x2e) {
        frameCoverage++;
      }
      index += 4;
    }
    coverage = Std.int(Math.max(coverage, frameCoverage));
    final center = ((height - 1 - Std.int(height / 2)) * width + Std.int(width / 2)) * 4;
    final valid = frameCoverage >= 5000 && pixels[center] >= 240 &&
      pixels[center + 1] >= 180 && pixels[center + 1] <= 220 &&
      pixels[center + 2] >= 35 && pixels[center + 2] <= 70;
    if (valid) frames++;
    return valid;
  }

  public inline function nodeCount():Int return nodes;
  public inline function shapeCount():Int return shapes;
  public inline function spriteCount():Int return sprites;
  public inline function verifiedFrames():Int return frames;
  public inline function maximumCoverage():Int return coverage;
  public function successMessage():String
    return 'CAMERA2D_WEB_OK nodes=$nodes shapes=$shapes sprites=$sprites coverage=$coverage';
}
#end
