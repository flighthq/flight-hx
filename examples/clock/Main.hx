import flighthq.sdk.Sdk;
class Main extends ExampleHost {
  var clock:Dynamic; var a:Dynamic; var b:Dynamic; var rootShape:Dynamic; var shapeA:Dynamic; var shapeB:Dynamic; var info:Dynamic;
  override public function flightReady():Void {
    final stage=createStage("Hierarchical clocks"); clock=Sdk.createClock(); a=Sdk.createChildClock(clock,{scale:1.0}); b=Sdk.createChildClock(clock,{scale:0.5});
    rootShape=addRectangle(stage,365,100,70,70,0x6688ff); shapeA=addCircle(stage,230,310,38,0x44cc88); shapeB=addCircle(stage,570,310,38,0xffaa33);
    info=addLabel(stage,"",220,410); addLabel(stage,"root  /  child 1x  /  child 0.5x",270,460);
  }
  override public function flightUpdate(dt:Float):Void {
    Sdk.advanceClock(clock,dt); rootShape.rotation=clock.elapsed*45; shapeA.rotation=a.elapsed*90; shapeB.rotation=b.elapsed*90;
    Sdk.invalidateNodeLocalTransform(rootShape); Sdk.invalidateNodeLocalTransform(shapeA); Sdk.invalidateNodeLocalTransform(shapeB);
    setLabel(info,"root "+round(clock.elapsed)+"  A "+round(a.elapsed)+"  B "+round(b.elapsed));
  }
  function round(v:Float):Float return Math.round(v*10)/10;
}
