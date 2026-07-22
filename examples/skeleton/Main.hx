import flighthq.Sdk;
class Main extends ExampleHost {
  var joints:Array<Dynamic>=[];var time=0.0;
  var skeleton:Dynamic;
  override public function flightReady():Void {final stage=createStage("Skeleton");final sceneJoints=[for(i in 0...6) Sdk.createSceneNode(Sdk.SceneNodeKind)];skeleton=Sdk.createSkeleton3D(sceneJoints);var parent:Dynamic=stage;for(i in 0...6){final joint=addRectangle(parent,i==0?400:45,i==0?180:0,55,12,0x44aaff);joint.pivotX=0;joint.pivotY=6;joints.push(joint);parent=joint;}addLabel(stage,"A six-joint articulated chain.",250,500);}
  override public function flightUpdate(dt:Float):Void {time+=dt;for(i in 0...joints.length){joints[i].rotation=Math.sin(time*2+i*.7)*25;Sdk.invalidateNodeLocalTransform(joints[i]);}}
}
