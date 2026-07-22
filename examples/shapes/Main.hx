import flighthq.Sdk;
class Main extends ExampleHost {
  override public function flightReady():Void {
    final stage=createStage("Shapes");final shape=Sdk.createShape();Sdk.appendShapeBeginFill(shape,0x44aaff);Sdk.appendShapeRoundRectangle(shape,60,100,180,120,24,24);Sdk.appendShapeEndFill(shape);
    Sdk.appendShapeLineStyle(shape,8,0xffcc33);Sdk.appendShapeMoveTo(shape,300,200);Sdk.appendShapeCubicCurveTo(shape,380,40,520,360,700,150);Sdk.appendShapeBeginFill(shape,0xcc4488,.8);Sdk.appendShapeCircle(shape,400,400,75);Sdk.appendShapeEndFill(shape);Sdk.addNodeChild(stage,shape);
  }
}
