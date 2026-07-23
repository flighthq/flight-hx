import flighthq.sdk.Sdk;
class Main extends ExampleHost {
  var sprites:Array<Dynamic>=[];var frame=0.0;
  var players:Array<Dynamic>=[];
  override public function flightReady():Void {final stage=createStage("Spritesheet");final spin=Sdk.createSpritesheetAnimation({frameDuration:80,frames:[0,1,2,3,4,5,6,7,8,9,10,11],loop:true});for(i in 0...3){final player=Sdk.createSpritesheetPlayer();player.speed=i+1;Sdk.playSpritesheetAnimation(player,spin);players.push(player);final s=addRectangle(stage,140+i*250,190,100,100,[0xffcc33,0x44aaff,0xcc4488][i]);sprites.push(s);addLabel(stage,[ "1x spin","2x spin","ping-pong" ][i],140+i*250,330);}addLabel(stage,"Procedural frames replace the browser-generated atlas.",180,430);}
  override public function flightUpdate(dt:Float):Void {frame+=dt*8;for(i in 0...sprites.length){Sdk.updateSpritesheetPlayer(players[i],dt*1000);sprites[i].rotation=frame*(i+1)*12;sprites[i].scaleX=.75+Math.sin(frame*.2+i)*.2;sprites[i].scaleY=sprites[i].scaleX;Sdk.invalidateNodeLocalTransform(sprites[i]);}}
}
