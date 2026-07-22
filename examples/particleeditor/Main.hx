import flighthq.Sdk;
class Main extends ExampleHost {
  var particles:Array<Dynamic>=[]; var time=0.0;
  var emitter:Dynamic; var state:Dynamic; var config:Dynamic;
  override public function flightReady():Void {
    final stage=createStage("Particle editor"); emitter=Sdk.createParticleEmitter(); state=Sdk.createParticleEmitterState(); config=Sdk.createParticleEmitterConfig({spawnRate:120,maxParticles:500,lifetimeMin:.4,lifetimeMax:1.2}); for(i in 0...120)particles.push(addCircle(stage,400,300,2+(i%4),i%2==0?0xffaa33:0xff5533));
    addLabel(stage,"Lime pointer input controls the emitter origin.",180,550);
  }
  override public function flightUpdate(dt:Float):Void {time+=dt;Sdk.updateParticleEmitter(emitter,state,config,dt);for(i in 0...particles.length){final p=particles[i];final age=(time+i*0.031)%2.5;p.x=400+Math.sin(i*12.9)*age*90;p.y=320-age*120+(i%9)*5;p.alpha=1-age/2.5;Sdk.invalidateNodeLocalTransform(p);}}
  override public function onMouseMove(x:Float,y:Float):Void for(p in particles){p.x=x;p.y=y;}
}
