import flighthq.sdk.Sdk;
class Main extends ExampleHost {
  var stack:Dynamic; var label:Dynamic; var timer=0.0; var menu:Dynamic; var play:Dynamic;
  override public function flightReady():Void {
    final stage=createStage("Flow states"); stack=Sdk.createFlowStack(); label=addLabel(stage,"",230,170,36,0x44cc88);
    menu={name:"Menu",onEnter:function() setLabel(label,"MENU"),onUpdate:function(dt:Float){}};
    play={name:"Play",onEnter:function() setLabel(label,"PLAY"),onUpdate:function(dt:Float){}};
    Sdk.pushFlowState(stack,menu); addLabel(stage,"The stack replaces Menu with Play every two seconds.",95,300);
  }
  override public function flightUpdate(dt:Float):Void {
    timer+=dt; Sdk.updateFlowStack(stack,dt); if(timer>2){timer=0; Sdk.replaceFlowState(stack,Sdk.getActiveFlowState(stack)==menu?play:menu);}
  }
}
