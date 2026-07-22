import flighthq.Sdk;
class Main extends ExampleHost {
  var frames:Array<Dynamic>=[];var time=0.0;
  var videos:Array<Dynamic>=[];
  override public function flightReady():Void {final stage=createStage("Video");for(i in 0...3){videos.push(Sdk.createVideo());frames.push(addRectangle(stage,45+i*250,140,210,160,[0x334466,0x663344,0x336644][i]));}addLabel(stage,"Three synchronized video nodes with independent transforms.",110,360);addLabel(stage,"Lime supplies the platform media source.",220,400);}
  override public function flightUpdate(dt:Float):Void {time+=dt;for(i in 0...frames.length){final color=Std.int((Math.sin(time*2+i)+1)*70);redrawRectangle(frames[i],210,160,(color<<16)|((120+i*30)<<8)|180);}}
}
