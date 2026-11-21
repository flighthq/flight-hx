package flight.esm.types.particles;

#if (js && flight_esm)
typedef AttractorForce = { ?falloff:Null<String>, kind:String, ?radius:Null<Float>, strength:Float, x:Float, y:Float, ?z:Null<Float> };

typedef CircleCollider = { kind:String, mode:String, radius:Float, x:Float, y:Float, ?friction:Null<Float>, ?restitution:Null<Float> };

typedef CollisionResponse = { ?friction:Null<Float>, ?restitution:Null<Float> };

typedef ColorKeyframe = { time:Float, r:Float, g:Float, b:Float };

typedef CurlNoiseForce = { kind:String, scale:Float, strength:Float, ?time:Null<Float> };

typedef CurveKeyframe = { time:Float, value:Float };

typedef DragForce = { kind:String, strength:Float };

typedef ForceFalloff = String;

typedef ParticleBlendMode = String;

typedef ParticleBurstEntry = { count:Float, cycles:Float, interval:Float, time:Float };

typedef ParticleBurstSchedule = Array<flight.esm.types.particles.Types.ParticleBurstEntry>;

typedef ParticleCollider = { kind:String, ?friction:Null<Float>, ?restitution:Null<Float> };

typedef ParticleConfigIssue = { field:String, message:String, severity:String };

typedef ParticleCurve = Array<Float>;

typedef ParticleDeathEvent = { x:Float, y:Float, z:Float };

typedef ParticleEmitterConfig = { alphaEnd:Float, alphaStart:Float, blendMode:Null<String>, colorEndB:Float, colorEndG:Float, colorEndR:Float, colorEndVarianceB:Float, colorEndVarianceG:Float, colorEndVarianceR:Float, colorStartB:Float, colorStartG:Float, colorStartR:Float, colorStartVarianceB:Float, colorStartVarianceG:Float, colorStartVarianceR:Float, directionX:Float, directionY:Float, directionZ:Float, gravityX:Float, gravityY:Float, gravityZ:Float, emitterConeAngle:Float, emitterDepth:Float, emitterHeight:Float, emitterRadius:Float, emitterShape:flight.esm.types.particles.Types.ParticleEmitterShape, emitterWidth:Float, burstCount:Float, burstInterval:Float, duration:Float, loop:Bool, frameCount:Float, frameRate:Float, lifetimeMax:Float, lifetimeMin:Float, maxParticles:Float, regionIdMax:Float, regionIdMin:Float, scaleEnd:Float, scaleMax:Float, scaleMin:Float, speedMax:Float, speedMin:Float, spawnRate:Float, spread:Float, rotationSpeedMax:Float, rotationSpeedMin:Float, velocityInheritance:Float, alphaCurve:Null<flight.esm.types.particles.Types.ParticleCurve>, colorCurve:Null<flight.esm.types.particles.Types.ParticleCurve>, scaleCurve:Null<flight.esm.types.particles.Types.ParticleCurve>, worldSpace:Bool };

typedef ParticleEmitterShape = String;

typedef ParticleEmitterSignals = { onEmitterComplete:flight.esm.types.signals.Types.Signal<Void>, onParticleDeath:flight.esm.types.signals.Types.Signal<flight.esm.types.particles.Types.ParticleDeathEvent>, onParticleSpawn:flight.esm.types.signals.Types.Signal<flight.esm.types.particles.Types.ParticleSpawnEvent> };

typedef ParticleEmitterState = { burstTimer:Float, colorBirth:js.lib.Float32Array, colorDeath:js.lib.Float32Array, emitterAge:Float, lifetimes:js.lib.Float32Array, prevX:Float, prevY:Float, prevZ:Float, random:flight.esm.types.math.Types.RandomSource, rotationSpeeds:js.lib.Float32Array, scales:js.lib.Float32Array, spawnAccumulator:Float, velocities:js.lib.Float32Array };

typedef ParticleForce = { kind:String };

typedef ParticleObject = { pivotX:Float, pivotY:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, x:Float, y:Float, alpha:Float, visible:Bool, colorScaleBias:Null<flight.esm.types.adjustments_contract.Types.ColorScaleBias> };

typedef ParticleObjectsState = { burstTimer:Float, emitterAge:Float, lifetimes:js.lib.Float32Array, prevX:Float, prevY:Float, random:flight.esm.types.math.Types.RandomSource, rotationSpeeds:js.lib.Float32Array, scales:js.lib.Float32Array, spawnAccumulator:Float, velocities:js.lib.Float32Array };

typedef ParticleObjectsUpdateOptions = { ?callbacks:Dynamic, ?emitterX:Null<Float>, ?emitterY:Null<Float> };

typedef ParticleSpawnEvent = { vx:Float, vy:Float, vz:Float, x:Float, y:Float, z:Float };

typedef PlaneCollider = { distance:Float, kind:String, nx:Float, ny:Float, ?nz:Null<Float>, ?friction:Null<Float>, ?restitution:Null<Float> };

typedef PointGravityWellForce = { ?falloff:Null<String>, kind:String, ?minRadius:Null<Float>, ?radius:Null<Float>, ?repulse:Null<Bool>, strength:Float, x:Float, y:Float };

typedef RectangleCollider = { height:Float, kind:String, mode:String, width:Float, x:Float, y:Float, ?friction:Null<Float>, ?restitution:Null<Float> };

typedef SphereCollider = { kind:String, mode:String, radius:Float, x:Float, y:Float, z:Float, ?friction:Null<Float>, ?restitution:Null<Float> };

typedef TurbulenceForce = { kind:String, scale:Float, strength:Float };

typedef VortexForce = { ?axisX:Null<Float>, ?axisY:Null<Float>, ?axisZ:Null<Float>, ?falloff:Null<String>, kind:String, ?radius:Null<Float>, strength:Float, x:Float, y:Float, ?z:Null<Float> };

typedef WindForce = { kind:String, x:Float, y:Float, ?z:Null<Float> };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
