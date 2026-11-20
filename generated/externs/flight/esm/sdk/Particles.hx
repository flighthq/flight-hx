package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/particles")
extern class Particles {
  public static final AttractorForceKind:String;
  public static final CircleColliderKind:String;
  public static final CurlNoiseForceKind:String;
  public static final DragForceKind:String;
  public static final PlaneColliderKind:String;
  public static final PointGravityWellForceKind:String;
  public static final RectangleColliderKind:String;
  public static final SphereColliderKind:String;
  public static final TurbulenceForceKind:String;
  public static final VortexForceKind:String;
  public static final WindForceKind:String;
  public static function applyParticleCollisions(emitter:flight.esm.types.particles_contract.Types.ParticleEmitterCollisionTarget, state:flight.esm.types.particles.Types.ParticleEmitterState, colliders:Array<flight.esm.types.particles.Types.ParticleCollider>):Void;
  public static function applyParticleForces(emitter:flight.esm.types.particles_contract.Types.ParticleEmitterLike, state:flight.esm.types.particles.Types.ParticleEmitterState, forces:Array<flight.esm.types.particles.Types.ParticleForce>, deltaTime:Float):Void;
  public static function applyParticleObjectCollisions(objects:Array<flight.esm.types.particles.Types.ParticleObject>, state:flight.esm.types.particles.Types.ParticleObjectsState, colliders:Array<flight.esm.types.particles.Types.ParticleCollider>):Void;
  public static function applyParticleObjectForces(objects:Array<flight.esm.types.particles.Types.ParticleObject>, state:flight.esm.types.particles.Types.ParticleObjectsState, forces:Array<flight.esm.types.particles.Types.ParticleForce>, deltaTime:Float):Void;
  public static function buildParticleColorCurve(f:((t:Float) -> Array<Float>), ?samples:Float):Array<Float>;
  public static function buildParticleCurve(f:((t:Float) -> Float), ?samples:Float):Array<Float>;
  public static function createParticleEmitterConfig(?config:Dynamic):flight.esm.types.particles.Types.ParticleEmitterConfig;
  public static function createParticleEmitterState(?random:flight.esm.types.math.Types.RandomSource):flight.esm.types.particles.Types.ParticleEmitterState;
  public static function createParticleObjectsState(capacity:Float, ?random:flight.esm.types.math.Types.RandomSource):flight.esm.types.particles.Types.ParticleObjectsState;
  public static function enableParticleEmitterSignals(state:Dynamic):flight.esm.types.particles.Types.ParticleEmitterSignals;
  public static function getParticleEmitterSignals(state:Dynamic):Null<flight.esm.types.particles.Types.ParticleEmitterSignals>;
  public static function isParticleObjectsComplete(objects:Array<flight.esm.types.particles.Types.ParticleObject>, state:flight.esm.types.particles.Types.ParticleObjectsState, config:flight.esm.types.particles.Types.ParticleEmitterConfig):Bool;
  public static function lerpHsvDirect(out:js.lib.Float32Array, offset:Float, r0:Float, g0:Float, b0:Float, r1:Float, g1:Float, b1:Float, t:Float):Void;
  public static function lerpHsvInPlace(colorsOut:js.lib.Float32Array, offset:Float, birth:Dynamic, death:Dynamic, t:Float):Void;
  public static function normalizeParticleEmitterConfig(?config:Dynamic):flight.esm.types.particles.Types.ParticleEmitterConfig;
  public static function particleColorCurveFromKeyframes(keys:Array<flight.esm.types.particles.Types.ColorKeyframe>, ?samples:Float):Array<Float>;
  public static function particleColorCurveToKeyframes(lut:flight.esm.types.particles.Types.ParticleCurve):Array<flight.esm.types.particles.Types.ColorKeyframe>;
  public static function particleCurveFromKeyframes(keys:Array<flight.esm.types.particles.Types.CurveKeyframe>, ?samples:Float):Array<Float>;
  public static function particleCurveToKeyframes(lut:flight.esm.types.particles.Types.ParticleCurve):Array<flight.esm.types.particles.Types.CurveKeyframe>;
  public static function sampleParticleColorCurve(out:Dynamic, offset:Float, lut:flight.esm.types.particles.Types.ParticleCurve, t:Float):Void;
  public static function sampleParticleCurve(lut:flight.esm.types.particles.Types.ParticleCurve, t:Float):Float;
  public static function stepParticleObjects(objects:Array<flight.esm.types.particles.Types.ParticleObject>, state:flight.esm.types.particles.Types.ParticleObjectsState, config:flight.esm.types.particles.Types.ParticleEmitterConfig, deltaTime:Float, ?forces:Null<Array<flight.esm.types.particles.Types.ParticleForce>>, ?colliders:Null<Array<flight.esm.types.particles.Types.ParticleCollider>>, ?updateOptions:Null<flight.esm.types.particles.Types.ParticleObjectsUpdateOptions>):Void;
  public static function updateParticleObjects(objects:Array<flight.esm.types.particles.Types.ParticleObject>, state:flight.esm.types.particles.Types.ParticleObjectsState, config:flight.esm.types.particles.Types.ParticleEmitterConfig, deltaTime:Float, ?options:Null<flight.esm.types.particles.Types.ParticleObjectsUpdateOptions>):Void;
  public static function validateParticleEmitterConfig(config:flight.esm.types.particles.Types.ParticleEmitterConfig):Array<flight.esm.types.particles.Types.ParticleConfigIssue>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
