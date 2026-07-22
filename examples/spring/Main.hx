import flighthq.Sdk;
class Main extends ExampleHost {
  var spring:Dynamic;var config:Dynamic;var springShape:Dynamic;var dampShape:Dynamic;var targetX=300.0;var targetY=200.0;var dampX=300.0;var dampY=200.0;
  override public function flightReady():Void {final stage=createStage("Spring");config=Sdk.createSpringConfig(3,.3);spring=Sdk.createSpring2D(300,200);springShape=addCircle(stage,300,200,18,0x44aaff);dampShape=addCircle(stage,300,200,14,0xffaa33);addLabel(stage,"Click to retarget: blue spring, orange exponential damp.",65,360);}
  override public function flightUpdate(dt:Float):Void {Sdk.updateSpring2D(spring,targetX,targetY,config,dt);dampX=Sdk.damp(dampX,targetX,6,dt);dampY=Sdk.damp(dampY,targetY,6,dt);springShape.x=spring.valueX;springShape.y=spring.valueY;dampShape.x=dampX;dampShape.y=dampY;Sdk.invalidateNodeLocalTransform(springShape);Sdk.invalidateNodeLocalTransform(dampShape);}
  override public function onMouseDown(x:Float,y:Float,b:Int):Void {targetX=x;targetY=y;}
}
