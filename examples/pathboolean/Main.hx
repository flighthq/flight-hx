import flighthq.sdk.Sdk;
class Main extends ExampleHost {
  override public function flightReady():Void {
    final stage=createStage("Path boolean");final a=Sdk.createPath();Sdk.appendPathCircle(a,170,150,90);final b=Sdk.createPath();Sdk.appendPathRoundRectangle(b,180,70,150,160,20);
    final paths=[Sdk.unionPaths(a,b),Sdk.intersectPaths(a,b),Sdk.differencePaths(a,b),Sdk.xorPaths(a,b)];final names=["Union","Intersect","Difference","XOR"];
    for(i in 0...4){final shape=Sdk.createShape();Sdk.appendShapeBeginFill(shape,[0x3498db,0x2ecc71,0xe74c3c,0x9b59b6][i],.75);Sdk.appendShapePath(shape,paths[i].commands,paths[i].data,paths[i].winding);Sdk.appendShapeEndFill(shape);shape.x=(i%2)*390;shape.y=Std.int(i/2)*270+20;Sdk.addNodeChild(stage,shape);addLabel(stage,names[i],20+(i%2)*390,45+Std.int(i/2)*270);}
  }
}
