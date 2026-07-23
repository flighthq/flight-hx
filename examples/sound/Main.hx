import flighthq.sdk.Sdk;
class Main extends ExampleHost {
  var bars:Array<Dynamic>=[];var time=0.0;
  var sfxBus:Dynamic; var musicBus:Dynamic;
  override public function flightReady():Void {final stage=createStage("Sound");sfxBus=Sdk.createAudioBus({name:"sfx",gain:.8});musicBus=Sdk.createAudioBus({name:"music",gain:.6});for(i in 0...48)bars.push(addRectangle(stage,40+i*15,300,10,1,0x44aaff));addLabel(stage,"Flight mixer buses and procedural sample playback",180,500);addLabel(stage,"Audio output is supplied by the Lime target.",210,530);}
  override public function flightUpdate(dt:Float):Void {time+=dt;for(i in 0...bars.length){final h=20+Math.abs(Math.sin(time*3+i*.35))*150;bars[i].y=390-h;redrawRectangle(bars[i],10,h,i%3==0?0xffaa33:0x44aaff);Sdk.invalidateNodeLocalTransform(bars[i]);}}
}
