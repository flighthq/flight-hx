package flight._hl._fn;

extern class Particles {
	@:hlNative("flight", "flight_apply_particle_collisions")
	public static function applyParticleCollisions(transforms:hl.Bytes, transformsLen:Int, positionsZ:hl.Bytes, positionsZLen:Int, particleCount:Int, state:flight._hl.ParticleEmitterState, colliders:hl.Bytes, collidersLen:Int):Void;
	@:hlNative("flight", "flight_apply_particle_object_collisions")
	public static function applyParticleObjectCollisions(objects:hl.Bytes, objectsLen:Int, state:flight._hl.ParticleObjectsState, colliders:hl.Bytes, collidersLen:Int):Void;
	@:hlNative("flight", "flight_apply_particle_forces")
	public static function applyParticleForces(transforms:hl.Bytes, transformsLen:Int, positionsZ:hl.Bytes, positionsZLen:Int, particleCount:Int, state:flight._hl.ParticleEmitterState, forces:hl.Bytes, forcesLen:Int, deltaTime:Single):Void;
	@:hlNative("flight", "flight_apply_particle_object_forces")
	public static function applyParticleObjectForces(objects:hl.Bytes, objectsLen:Int, state:flight._hl.ParticleObjectsState, forces:hl.Bytes, forcesLen:Int, deltaTime:Single):Void;
	@:hlNative("flight", "flight_build_particle_curve")
	public static function buildParticleCurve(out:Dynamic, fFn:Dynamic, fCtx:Dynamic):Void;
	@:hlNative("flight", "flight_lerp_hsv_direct")
	public static function lerpHsvDirect(out:hl.Bytes, outLen:Int, offset:Int, r0:Single, g0:Single, b0:Single, r1:Single, g1:Single, b1:Single, t:Single):Void;
	@:hlNative("flight", "flight_lerp_hsv_in_place")
	public static function lerpHsvInPlace(colorsOut:hl.Bytes, colorsOutLen:Int, offset:Int, birth:hl.Bytes, birthLen:Int, death:hl.Bytes, deathLen:Int, t:Single):Void;
	@:hlNative("flight", "flight_particle_color_curve_from_keyframes")
	public static function particleColorCurveFromKeyframes(out:Dynamic, keys:hl.Bytes, keysLen:Int, samples:Int):Void;
	@:hlNative("flight", "flight_particle_color_curve_to_keyframes")
	public static function particleColorCurveToKeyframes(out:Dynamic, lut:hl.Bytes, lutLen:Int):Void;
	@:hlNative("flight", "flight_particle_curve_from_keyframes")
	public static function particleCurveFromKeyframes(out:Dynamic, keys:hl.Bytes, keysLen:Int, samples:Int):Void;
	@:hlNative("flight", "flight_particle_curve_to_keyframes")
	public static function particleCurveToKeyframes(out:Dynamic, lut:hl.Bytes, lutLen:Int):Void;
	@:hlNative("flight", "flight_sample_particle_color_curve")
	public static function sampleParticleColorCurve(out:hl.Bytes, outLen:Int, offset:Int, lut:hl.Bytes, lutLen:Int, t:Single):Void;
	@:hlNative("flight", "flight_sample_particle_curve")
	public static function sampleParticleCurve(lut:hl.Bytes, lutLen:Int, t:Single):Single;
	@:hlNative("flight", "flight_create_particle_emitter_config")
	public static function createParticleEmitterConfig(config:flight._hl.ParticleEmitterConfigOptions):flight._hl.ParticleEmitterConfig;
	@:hlNative("flight", "flight_create_particle_emitter_config_options")
	public static function createParticleEmitterConfigOptions():flight._hl.ParticleEmitterConfigOptions;
	@:hlNative("flight", "flight_enable_particle_emitter_signals")
	public static function enableParticleEmitterSignals(state:flight._hl.ParticleEmitterState):flight._hl.ParticleEmitterSignals;
	@:hlNative("flight", "flight_get_particle_emitter_signals")
	public static function getParticleEmitterSignals(state:flight._hl.ParticleEmitterState):Dynamic;
	@:hlNative("flight", "flight_create_particle_emitter_state")
	public static function createParticleEmitterState():flight._hl.ParticleEmitterState;
	@:hlNative("flight", "flight_create_particle_objects_state")
	public static function createParticleObjectsState():flight._hl.ParticleObjectsState;
	@:hlNative("flight", "flight_step_particle_objects")
	public static function stepParticleObjects(objects:hl.Bytes, objectsLen:Int, state:flight._hl.ParticleObjectsState, config:flight._hl.ParticleEmitterConfig, deltaTime:Single, forces:hl.Bytes, forcesLen:Int, colliders:hl.Bytes, collidersLen:Int, updateOptions:flight._hl.ParticleObjectsUpdateOptions):Void;
	@:hlNative("flight", "flight_particle_blend_mode_as_str")
	public static function particleBlendModeAsStr(mode:Int):hl.Bytes;
	@:hlNative("flight", "flight_is_particle_objects_complete")
	public static function isParticleObjectsComplete(objects:hl.Bytes, objectsLen:Int, state:flight._hl.ParticleObjectsState, config:flight._hl.ParticleEmitterConfig):Bool;
	@:hlNative("flight", "flight_update_particle_objects")
	public static function updateParticleObjects(objects:hl.Bytes, objectsLen:Int, state:flight._hl.ParticleObjectsState, config:flight._hl.ParticleEmitterConfig, deltaTime:Single, options:flight._hl.ParticleObjectsUpdateOptions):Void;
	@:hlNative("flight", "flight_normalize_particle_emitter_config")
	public static function normalizeParticleEmitterConfig(config:flight._hl.ParticleEmitterConfig):flight._hl.ParticleEmitterConfig;
	@:hlNative("flight", "flight_validate_particle_emitter_config")
	public static function validateParticleEmitterConfig(out:Dynamic, config:flight._hl.ParticleEmitterConfig):Void;
	@:hlNative("flight", "flight_free_particle_emitter_config")
	public static function freeParticleEmitterConfig(ptr:flight._hl.ParticleEmitterConfig):Void;
	@:hlNative("flight", "flight_free_particle_emitter_config_options")
	public static function freeParticleEmitterConfigOptions(ptr:flight._hl.ParticleEmitterConfigOptions):Void;
	@:hlNative("flight", "flight_free_particle_emitter_signals")
	public static function freeParticleEmitterSignals(ptr:flight._hl.ParticleEmitterSignals):Void;
	@:hlNative("flight", "flight_free_particle_emitter_state")
	public static function freeParticleEmitterState(ptr:flight._hl.ParticleEmitterState):Void;
	@:hlNative("flight", "flight_free_particle_objects_state")
	public static function freeParticleObjectsState(ptr:flight._hl.ParticleObjectsState):Void;
}
