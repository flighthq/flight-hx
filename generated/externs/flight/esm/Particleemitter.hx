package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/particleemitter")
extern class Particleemitter {
  public static final ParticleEmitter2DKind:String;
  public static final ParticleEmitter3DKind:String;
  public static function appendParticleEmitter2DParticle(target:flight.esm.types.particleemitter.Types.ParticleEmitter2D, id:Float, x:Float, y:Float, rotation:Float, scale:Float):Float;
  public static function appendParticleEmitter3DParticle(target:flight.esm.types.particleemitter.Types.ParticleEmitter3D, id:Float, x:Float, y:Float, z:Float, rotation:Float, scale:Float):Float;
  public static function clearParticleEmitter2D(target:flight.esm.types.particleemitter.Types.ParticleEmitter2D):Void;
  public static function clearParticleEmitter3D(target:flight.esm.types.particleemitter.Types.ParticleEmitter3D):Void;
  public static function cloneParticleEmitter2D(source:flight.esm.types.particleemitter.Types.ParticleEmitter2D):flight.esm.types.particleemitter.Types.ParticleEmitter2D;
  public static function cloneParticleEmitter3D(source:flight.esm.types.particleemitter.Types.ParticleEmitter3D):flight.esm.types.particleemitter.Types.ParticleEmitter3D;
  public static function compactParticleEmitter2D(target:flight.esm.types.particleemitter.Types.ParticleEmitter2D):Void;
  public static function compactParticleEmitter3D(target:flight.esm.types.particleemitter.Types.ParticleEmitter3D):Void;
  public static function computeParticleEmitter2DLocalBoundsRectangle(out:flight.esm.types.geometry.Types.Rectangle, source:flight.esm.types.particleemitter.Types.ParticleEmitter2D):Void;
  public static function computeParticleEmitter3DLocalBoundsAabb(out:flight.esm.types.geometry.Types.AabbLike, source:flight.esm.types.particleemitter.Types.ParticleEmitter3D):Void;
  public static function createParticleEmitter2D():flight.esm.types.particleemitter.Types.ParticleEmitter2D;
  public static function createParticleEmitter3D():flight.esm.types.particleemitter.Types.ParticleEmitter3D;
  public static function emitParticleBurst2D(emitter:flight.esm.types.particleemitter.Types.ParticleEmitter2D, state:flight.esm.types.particles.Types.ParticleEmitterState, config:flight.esm.types.particles.Types.ParticleEmitterConfig, count:Float, x:Float, y:Float, ?tint:Null<Float>):Float;
  public static function emitParticleBurst3D(emitter:flight.esm.types.particleemitter.Types.ParticleEmitter3D, state:flight.esm.types.particles.Types.ParticleEmitterState, config:flight.esm.types.particles.Types.ParticleEmitterConfig, count:Float, x:Float, y:Float, z:Float, ?tint:Null<Float>):Float;
  public static function getParticleEmitter2DCapacity(source:flight.esm.types.particleemitter.Types.ParticleEmitter2D):Float;
  public static function getParticleEmitter2DParticleAlpha(source:flight.esm.types.particleemitter.Types.ParticleEmitter2D, index:Float):Float;
  public static function getParticleEmitter2DParticleId(source:flight.esm.types.particleemitter.Types.ParticleEmitter2D, index:Float):Float;
  public static function getParticleEmitter2DParticleVelocity(out:flight.esm.types.geometry.Types.Vector2Like, source:flight.esm.types.particleemitter.Types.ParticleEmitter2D, index:Float):Bool;
  public static function getParticleEmitter3DCapacity(source:flight.esm.types.particleemitter.Types.ParticleEmitter3D):Float;
  public static function getParticleEmitter3DParticleAlpha(source:flight.esm.types.particleemitter.Types.ParticleEmitter3D, index:Float):Float;
  public static function getParticleEmitter3DParticleId(source:flight.esm.types.particleemitter.Types.ParticleEmitter3D, index:Float):Float;
  public static function getParticleEmitter3DParticleVelocity(out:flight.esm.types.geometry.Types.Vector3Like, source:flight.esm.types.particleemitter.Types.ParticleEmitter3D, index:Float):Bool;
  public static function isParticleEmitter2DComplete(emitter:flight.esm.types.particleemitter.Types.ParticleEmitter2D, state:flight.esm.types.particles.Types.ParticleEmitterState, config:flight.esm.types.particles.Types.ParticleEmitterConfig):Bool;
  public static function isParticleEmitter3D(node:Dynamic):Bool;
  public static function isParticleEmitter3DComplete(emitter:flight.esm.types.particleemitter.Types.ParticleEmitter3D, state:flight.esm.types.particles.Types.ParticleEmitterState, config:flight.esm.types.particles.Types.ParticleEmitterConfig):Bool;
  public static function prewarmParticleEmitter2D(emitter:flight.esm.types.particleemitter.Types.ParticleEmitter2D, state:flight.esm.types.particles.Types.ParticleEmitterState, config:flight.esm.types.particles.Types.ParticleEmitterConfig, duration:Float, ?stepDeltaTime:Float, ?callbacks:Null<flight.esm.types.particleemitter.Types.ParticleEmitterCallbacks>):Void;
  public static function prewarmParticleEmitter3D(emitter:flight.esm.types.particleemitter.Types.ParticleEmitter3D, state:flight.esm.types.particles.Types.ParticleEmitterState, config:flight.esm.types.particles.Types.ParticleEmitterConfig, duration:Float, ?stepDeltaTime:Float, ?callbacks:Null<flight.esm.types.particleemitter.Types.ParticleEmitterCallbacks>):Void;
  public static function removeParticleEmitter2DParticle(target:flight.esm.types.particleemitter.Types.ParticleEmitter2D, index:Float):Void;
  public static function removeParticleEmitter3DParticle(target:flight.esm.types.particleemitter.Types.ParticleEmitter3D, index:Float):Void;
  public static function reserveParticleEmitter2D(target:flight.esm.types.particleemitter.Types.ParticleEmitter2D, capacity:Float):Void;
  public static function reserveParticleEmitter3D(target:flight.esm.types.particleemitter.Types.ParticleEmitter3D, capacity:Float):Void;
  public static function setParticleEmitter2DLocalBoundsRectangle(target:flight.esm.types.particleemitter.Types.ParticleEmitter2D, rect:flight.esm.types.geometry.Types.Rectangle):Void;
  public static function setParticleEmitter2DParticle(target:flight.esm.types.particleemitter.Types.ParticleEmitter2D, index:Float, id:Float, x:Float, y:Float, rotation:Float, scale:Float):Void;
  public static function setParticleEmitter2DParticleAlpha(target:flight.esm.types.particleemitter.Types.ParticleEmitter2D, index:Float, alpha:Float):Void;
  public static function setParticleEmitter2DParticleColor(target:flight.esm.types.particleemitter.Types.ParticleEmitter2D, index:Float, r:Float, g:Float, b:Float):Void;
  public static function setParticleEmitter2DParticleVelocity(target:flight.esm.types.particleemitter.Types.ParticleEmitter2D, index:Float, vx:Float, vy:Float):Void;
  public static function setParticleEmitter3DParticle(target:flight.esm.types.particleemitter.Types.ParticleEmitter3D, index:Float, id:Float, x:Float, y:Float, z:Float, rotation:Float, scale:Float):Void;
  public static function setParticleEmitter3DParticleAlpha(target:flight.esm.types.particleemitter.Types.ParticleEmitter3D, index:Float, alpha:Float):Void;
  public static function setParticleEmitter3DParticleColor(target:flight.esm.types.particleemitter.Types.ParticleEmitter3D, index:Float, r:Float, g:Float, b:Float):Void;
  public static function setParticleEmitter3DParticleVelocity(target:flight.esm.types.particleemitter.Types.ParticleEmitter3D, index:Float, vx:Float, vy:Float, vz:Float):Void;
  public static function sortParticleEmitter3DIndicesByViewDepth(outIndices:js.lib.Uint32Array, outViewDepths:js.lib.Float64Array, source:flight.esm.types.particleemitter.Types.ParticleEmitter3D, positionToView:flight.esm.types.geometry.Types.Matrix4Like):Bool;
  public static function stepParticleEmitter2D(emitter:flight.esm.types.particleemitter.Types.ParticleEmitter2D, state:flight.esm.types.particles.Types.ParticleEmitterState, config:flight.esm.types.particles.Types.ParticleEmitterConfig, deltaTime:Float, ?forces:Null<Array<flight.esm.types.particles.Types.ParticleForce>>, ?colliders:Null<Array<flight.esm.types.particles.Types.ParticleCollider>>, ?callbacks:Null<flight.esm.types.particleemitter.Types.ParticleEmitterCallbacks>):Void;
  public static function stepParticleEmitter3D(emitter:flight.esm.types.particleemitter.Types.ParticleEmitter3D, state:flight.esm.types.particles.Types.ParticleEmitterState, config:flight.esm.types.particles.Types.ParticleEmitterConfig, deltaTime:Float, ?forces:Null<Array<flight.esm.types.particles.Types.ParticleForce>>, ?colliders:Null<Array<flight.esm.types.particles.Types.ParticleCollider>>, ?callbacks:Null<flight.esm.types.particleemitter.Types.ParticleEmitterCallbacks>):Void;
  public static function updateParticleEmitter2D(emitter:flight.esm.types.particleemitter.Types.ParticleEmitter2D, state:flight.esm.types.particles.Types.ParticleEmitterState, config:flight.esm.types.particles.Types.ParticleEmitterConfig, deltaTime:Float, ?callbacks:Null<flight.esm.types.particleemitter.Types.ParticleEmitterCallbacks>):Void;
  public static function updateParticleEmitter3D(emitter:flight.esm.types.particleemitter.Types.ParticleEmitter3D, state:flight.esm.types.particles.Types.ParticleEmitterState, config:flight.esm.types.particles.Types.ParticleEmitterConfig, deltaTime:Float, ?callbacks:Null<flight.esm.types.particleemitter.Types.ParticleEmitterCallbacks>):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
