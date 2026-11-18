package flight._cpp._fn;

extern class Particles {
	@:native("flight_apply_particle_collisions")
	public static function applyParticleCollisions(transforms:cpp.Star<cpp.Void>, transformsLen:Int, positionsZ:cpp.Star<cpp.Void>, positionsZLen:Int, particleCount:Int, state:flight._cpp.ParticleEmitterState, colliders:cpp.Star<cpp.Void>, collidersLen:Int):Void;
	@:native("flight_apply_particle_object_collisions")
	public static function applyParticleObjectCollisions(objects:cpp.Star<cpp.Void>, objectsLen:Int, state:flight._cpp.ParticleObjectsState, colliders:cpp.Star<cpp.Void>, collidersLen:Int):Void;
	@:native("flight_apply_particle_forces")
	public static function applyParticleForces(transforms:cpp.Star<cpp.Void>, transformsLen:Int, positionsZ:cpp.Star<cpp.Void>, positionsZLen:Int, particleCount:Int, state:flight._cpp.ParticleEmitterState, forces:cpp.Star<cpp.Void>, forcesLen:Int, deltaTime:Single):Void;
	@:native("flight_apply_particle_object_forces")
	public static function applyParticleObjectForces(objects:cpp.Star<cpp.Void>, objectsLen:Int, state:flight._cpp.ParticleObjectsState, forces:cpp.Star<cpp.Void>, forcesLen:Int, deltaTime:Single):Void;
	@:native("flight_build_particle_curve")
	public static function buildParticleCurve(out:cpp.Star<cpp.Void>, fFn:cpp.Star<cpp.Void>, fCtx:cpp.Star<cpp.Void>, samples:Int):Void;
	@:native("flight_lerp_hsv_direct")
	public static function lerpHsvDirect(out:cpp.Star<cpp.Void>, outLen:Int, offset:Int, r0:Single, g0:Single, b0:Single, r1:Single, g1:Single, b1:Single, t:Single):Void;
	@:native("flight_lerp_hsv_in_place")
	public static function lerpHsvInPlace(colorsOut:cpp.Star<cpp.Void>, colorsOutLen:Int, offset:Int, birth:cpp.Star<cpp.Void>, birthLen:Int, death:cpp.Star<cpp.Void>, deathLen:Int, t:Single):Void;
	@:native("flight_particle_color_curve_from_keyframes")
	public static function particleColorCurveFromKeyframes(out:cpp.Star<cpp.Void>, keys:cpp.Star<cpp.Void>, keysLen:Int, samples:Int):Void;
	@:native("flight_particle_color_curve_to_keyframes")
	public static function particleColorCurveToKeyframes(out:cpp.Star<cpp.Void>, lut:cpp.Star<cpp.Void>, lutLen:Int):Void;
	@:native("flight_particle_curve_from_keyframes")
	public static function particleCurveFromKeyframes(out:cpp.Star<cpp.Void>, keys:cpp.Star<cpp.Void>, keysLen:Int, samples:Int):Void;
	@:native("flight_particle_curve_to_keyframes")
	public static function particleCurveToKeyframes(out:cpp.Star<cpp.Void>, lut:cpp.Star<cpp.Void>, lutLen:Int):Void;
	@:native("flight_sample_particle_color_curve")
	public static function sampleParticleColorCurve(out:cpp.Star<cpp.Void>, outLen:Int, offset:Int, lut:cpp.Star<cpp.Void>, lutLen:Int, t:Single):Void;
	@:native("flight_sample_particle_curve")
	public static function sampleParticleCurve(lut:cpp.Star<cpp.Void>, lutLen:Int, t:Single):Single;
	@:native("flight_create_particle_emitter_config")
	public static function createParticleEmitterConfig(config:flight._cpp.ParticleEmitterConfigOptions):flight._cpp.ParticleEmitterConfig;
	@:native("flight_enable_particle_emitter_signals")
	public static function enableParticleEmitterSignals(state:flight._cpp.ParticleEmitterState):flight._cpp.ParticleEmitterSignals;
	@:native("flight_get_particle_emitter_signals")
	public static function getParticleEmitterSignals(state:flight._cpp.ParticleEmitterState):flight._cpp.ParticleEmitterSignals;
	@:native("flight_create_particle_emitter_state")
	public static function createParticleEmitterState():flight._cpp.ParticleEmitterState;
	@:native("flight_create_particle_objects_state")
	public static function createParticleObjectsState():flight._cpp.ParticleObjectsState;
	@:native("flight_step_particle_objects")
	public static function stepParticleObjects(objects:cpp.Star<cpp.Void>, objectsLen:Int, state:flight._cpp.ParticleObjectsState, config:flight._cpp.ParticleEmitterConfig, deltaTime:Single, forces:cpp.Star<cpp.Void>, forcesLen:Int, colliders:cpp.Star<cpp.Void>, collidersLen:Int, updateOptions:flight._cpp.ParticleObjectsUpdateOptions):Void;
	@:native("flight_is_particle_objects_complete")
	public static function isParticleObjectsComplete(objects:cpp.Star<cpp.Void>, objectsLen:Int, state:flight._cpp.ParticleObjectsState, config:flight._cpp.ParticleEmitterConfig):Bool;
	@:native("flight_update_particle_objects")
	public static function updateParticleObjects(objects:cpp.Star<cpp.Void>, objectsLen:Int, state:flight._cpp.ParticleObjectsState, config:flight._cpp.ParticleEmitterConfig, deltaTime:Single, options:flight._cpp.ParticleObjectsUpdateOptions):Void;
	@:native("flight_normalize_particle_emitter_config")
	public static function normalizeParticleEmitterConfig(config:flight._cpp.ParticleEmitterConfig):flight._cpp.ParticleEmitterConfig;
	@:native("flight_validate_particle_emitter_config")
	public static function validateParticleEmitterConfig(out:cpp.Star<cpp.Void>, config:flight._cpp.ParticleEmitterConfig):Void;
	@:native("flight_free_particle_emitter_config")
	public static function freeParticleEmitterConfig(ptr:flight._cpp.ParticleEmitterConfig):Void;
	@:native("flight_free_particle_emitter_signals")
	public static function freeParticleEmitterSignals(ptr:flight._cpp.ParticleEmitterSignals):Void;
	@:native("flight_free_particle_emitter_state")
	public static function freeParticleEmitterState(ptr:flight._cpp.ParticleEmitterState):Void;
	@:native("flight_free_particle_objects_state")
	public static function freeParticleObjectsState(ptr:flight._cpp.ParticleObjectsState):Void;
}
