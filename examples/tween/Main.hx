import flighthq.Sdk;
class Main extends ExampleHost {
  var dots:Array<Dynamic>=[];var time=0.0;var easings:Array<Dynamic>;
  override public function flightReady():Void {final stage=createStage("Tween");easings=[Sdk.easeInQuadratic,Sdk.easeOutQuadratic,Sdk.easeInOutQuadratic,Sdk.easeInCubic,Sdk.easeOutCubic,Sdk.easeInOutCubic,Sdk.easeInSine,Sdk.easeOutSine,Sdk.easeInOutSine,Sdk.easeInExponential,Sdk.easeOutBounce,Sdk.easeOutElastic];for(i in 0...easings.length){final row=Std.int(i/3),col=i%3;addLabel(stage,"easing "+(i+1),col*260+20,row*125+55,12);dots.push(addCircle(stage,col*260+30,row*125+105,8,0x44aaff));}}
  override public function flightUpdate(dt:Float):Void {time=(time+dt*.6)%1;for(i in 0...dots.length){final col=i%3;dots[i].x=col*260+30+easings[i](time)*200;Sdk.invalidateNodeLocalTransform(dots[i]);}}
}
