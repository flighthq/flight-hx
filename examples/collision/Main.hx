import flighthq.sdk.Sdk;
class Main extends ExampleHost {
  var a:Dynamic={centerX:300.0,centerY:280.0,radius:70.0}; var b:Dynamic={centerX:500.0,centerY:280.0,radius:90.0};
  var shapeA:Dynamic; var shapeB:Dynamic; var time=0.0; var manifold:Dynamic;
  override public function flightReady():Void {
    final stage=createStage("Collision"); manifold=Sdk.createCollisionManifold(); shapeA=addCircle(stage,a.centerX,a.centerY,a.radius,0x4488cc); shapeB=addCircle(stage,b.centerX,b.centerY,b.radius,0x4488cc);
    addLabel(stage,"Collision manifold turns both circles red.",180,500);
  }
  override public function flightUpdate(dt:Float):Void {
    time+=dt; a.centerX=400+Math.sin(time)*180; shapeA.x=a.centerX; final hit=Sdk.testCircleCircleCollision(a,b,manifold);
    redrawCircle(shapeA,a.radius,hit?0xcc4444:0x4488cc); redrawCircle(shapeB,b.radius,hit?0xcc4444:0x4488cc); Sdk.invalidateNodeLocalTransform(shapeA);
  }
}
