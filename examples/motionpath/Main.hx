import flighthq.sdk.Sdk;
class Main extends ExampleHost {
  var motion:Dynamic; var arrow:Dynamic; final point={x:0.0,y:0.0}; final tangent={x:0.0,y:0.0};
  override public function flightReady():Void {
    final stage=createStage("Motion path"); final path=Sdk.createPath(); Sdk.appendPathMoveTo(path,70,300); Sdk.appendPathCubicCurveTo(path,220,40,580,540,730,220);
    motion=Sdk.createMotionPath(path,160,"pingpong"); final track=Sdk.createShape(); Sdk.appendShapeLineStyle(track,3,0x335577); Sdk.appendShapeMoveTo(track,70,300);
    Sdk.appendShapeCubicCurveTo(track,220,40,580,540,730,220); Sdk.addNodeChild(stage,track); arrow=addCircle(stage,70,300,14,0xffcc33);
  }
  override public function flightUpdate(dt:Float):Void {
    Sdk.updateMotionPath(motion,dt); Sdk.getMotionPathPosition(motion,point,tangent); arrow.x=point.x;arrow.y=point.y;arrow.rotation=Sdk.getMotionPathHeading(motion)*Sdk.RAD_TO_DEG;Sdk.invalidateNodeLocalTransform(arrow);
  }
}
