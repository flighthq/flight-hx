#if cpp
package flight._cpp;

/** flight-cpp implementation of the public Scene2D session. */
class Scene2dApp {
  final scene:cpp.Pointer<Camera2dScene>;
  var disposed = false;

  public function new(width:Int, height:Int) {
    scene = Camera2dScene.create(width, height);
    if (scene == null) throw 'could not create flight-cpp Scene2D session';
  }

  public function dispose():Void {
    if (disposed) return;
    disposed = true;
    Camera2dScene.destroy(scene);
  }

  public inline function root():flight.DisplayObject return cast Camera2dScene.root(scene);
  public inline function createDisplayObject(parent:flight.Scene2dNode):flight.DisplayObject
    return cast Camera2dScene.createDisplayObject(scene, parent);
  public inline function createShape(parent:flight.Scene2dNode):flight.Shape
    return cast Camera2dScene.createShape(scene, parent);
  public inline function createSolidSprite(
    parent:flight.Scene2dNode,
    color:Float,
    x:Float,
    y:Float,
    width:Float,
    height:Float,
    alpha:Float
  ):flight.Sprite return cast Camera2dScene.createSolidSprite(
    scene,
    parent,
    color,
    x,
    y,
    width,
    height,
    alpha
  );

  public inline function beginFill(shape:flight.Shape, color:Float, alpha:Float):Void
    Camera2dScene.beginFill(scene, shape, color, alpha);
  public inline function endFill(shape:flight.Shape):Void Camera2dScene.endFill(scene, shape);
  public inline function lineStyle(shape:flight.Shape, thickness:Float, color:Float, alpha:Float):Void
    Camera2dScene.lineStyle(scene, shape, thickness, color, alpha);
  public inline function circle(shape:flight.Shape, x:Float, y:Float, radius:Float):Void
    Camera2dScene.circle(scene, shape, x, y, radius);
  public inline function ellipse(shape:flight.Shape, x:Float, y:Float, radiusX:Float, radiusY:Float):Void
    Camera2dScene.ellipse(scene, shape, x, y, radiusX, radiusY);
  public inline function rectangle(shape:flight.Shape, x:Float, y:Float, width:Float, height:Float):Void
    Camera2dScene.rectangle(scene, shape, x, y, width, height);
  public inline function triangle(
    shape:flight.Shape,
    x0:Float,
    y0:Float,
    x1:Float,
    y1:Float,
    x2:Float,
    y2:Float
  ):Void Camera2dScene.triangle(scene, shape, x0, y0, x1, y1, x2, y2);
  public inline function moveTo(shape:flight.Shape, x:Float, y:Float):Void
    Camera2dScene.moveTo(scene, shape, x, y);
  public inline function lineTo(shape:flight.Shape, x:Float, y:Float):Void
    Camera2dScene.lineTo(scene, shape, x, y);
  public inline function setTransform(
    node:flight.Scene2dNode,
    scaleX:Float,
    skewY:Float,
    skewX:Float,
    scaleY:Float,
    x:Float,
    y:Float
  ):Void Camera2dScene.setTransform(scene, node, scaleX, skewY, skewX, scaleY, x, y);

  public inline function renderFrame():Bool return Camera2dScene.renderFrame(scene);
  public inline function nodeCount():Int return Camera2dScene.nodeCount(scene);
  public inline function shapeCount():Int return Camera2dScene.shapeCount(scene);
  public inline function spriteCount():Int return Camera2dScene.spriteCount(scene);
  public inline function verifiedFrames():Int return Camera2dScene.verifiedFrames(scene);
  public inline function maximumCoverage():Int return Camera2dScene.maximumCoverage(scene);
  public function successMessage():String return 'CAMERA2D_NATIVE_OK nodes=${nodeCount()} ' +
    'shapes=${shapeCount()} sprites=${spriteCount()} coverage=${maximumCoverage()}';
}
#end
