import flighthq.Sdk;
class Main extends ExampleHost {
  var sparks:Array<Dynamic>=[];var flakes:Array<Dynamic>=[];var time=0.0;
  var fire:Dynamic; var snow:Dynamic; var fireState:Dynamic; var snowState:Dynamic; var fireConfig:Dynamic; var snowConfig:Dynamic;
  override public function flightReady():Void {
    final stage=createStage("Particles"); fire=Sdk.createParticleEmitter(); snow=Sdk.createParticleEmitter(); fireState=Sdk.createParticleEmitterState(); snowState=Sdk.createParticleEmitterState(); fireConfig=Sdk.createParticleEmitterConfig({spawnRate:300,maxParticles:3000,lifetimeMin:.2,lifetimeMax:.55}); snowConfig=Sdk.createParticleEmitterConfig({spawnRate:80,maxParticles:1000,lifetimeMin:3,lifetimeMax:6}); for(i in 0...100)sparks.push(addCircle(stage,210,420,2+(i%3),0xff8833));for(i in 0...80)flakes.push(addCircle(stage,(i*83)%390+400,(i*47)%450+40,2,0xddeeff));
    addLabel(stage,"Fire and snow emitter configurations",250,540);
  }
  override public function flightUpdate(dt:Float):Void {time+=dt;Sdk.updateParticleEmitter(fire,fireState,fireConfig,dt);Sdk.updateParticleEmitter(snow,snowState,snowConfig,dt);for(i in 0...sparks.length){final p=sparks[i];final age=(time+i*.023)%2;p.x=210+Math.sin(i*7.1)*age*70;p.y=430-age*180;Sdk.invalidateNodeLocalTransform(p);}for(i in 0...flakes.length){final p=flakes[i];p.y+=30*dt;if(p.y>500)p.y=40;Sdk.invalidateNodeLocalTransform(p);}}
}
