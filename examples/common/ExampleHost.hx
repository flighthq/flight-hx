package;

import flighthq.Sdk;
import flighthq.Types.DisplayObject;
import flighthq.Types.Shape;
import flighthq.HostLime;

/** Small presentation helpers shared by the mechanically ported Lime examples. */
class ExampleHost extends HostLime {
  public function new() {
    super();
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
