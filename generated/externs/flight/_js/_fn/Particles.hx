package flight._js._fn;

@:jsRequire("flight")
extern class Particles {
	@:native("flight_apply_particle_collisions")
	public static function applyParticleCollisions(transforms:Dynamic, transformsLen:Int, positionsZ:Dynamic, positionsZLen:Int, particleCount:Int, state:flight._js.ParticleEmitterState, colliders:Dynamic, collidersLen:Int):Void;
	@:native("flight_apply_particle_object_collisions")
	public static function applyParticleObjectCollisions(objects:Dynamic, objectsLen:Int, state:flight._js.ParticleObjectsState, colliders:Dynamic, collidersLen:Int):Void;
	@:native("flight_apply_particle_forces")
	public static function applyParticleForces(transforms:Dynamic, transformsLen:Int, positionsZ:Dynamic, positionsZLen:Int, particleCount:Int, state:flight._js.ParticleEmitterState, forces:Dynamic, forcesLen:Int, deltaTime:Float):Void;
	@:native("flight_apply_particle_object_forces")
	public static function applyParticleObjectForces(objects:Dynamic, objectsLen:Int, state:flight._js.ParticleObjectsState, forces:Dynamic, forcesLen:Int, deltaTime:Float):Void;
	@:native("flight_build_particle_curve")
	public static function buildParticleCurve(out:Dynamic, fFn:Dynamic, fCtx:Dynamic, samples:Int):Void;
	@:native("flight_lerp_hsv_direct")
	public static function lerpHsvDirect(out:Dynamic, outLen:Int, offset:Int, r0:Float, g0:Float, b0:Float, r1:Float, g1:Float, b1:Float, t:Float):Void;
	@:native("flight_lerp_hsv_in_place")
	public static function lerpHsvInPlace(colorsOut:Dynamic, colorsOutLen:Int, offset:Int, birth:Dynamic, birthLen:Int, death:Dynamic, deathLen:Int, t:Float):Void;
	@:native("flight_particle_color_curve_from_keyframes")
	public static function particleColorCurveFromKeyframes(out:Dynamic, keys:Dynamic, keysLen:Int, samples:Int):Void;
	@:native("flight_particle_color_curve_to_keyframes")
	public static function particleColorCurveToKeyframes(out:Dynamic, lut:Dynamic, lutLen:Int):Void;
	@:native("flight_particle_curve_from_keyframes")
	public static function particleCurveFromKeyframes(out:Dynamic, keys:Dynamic, keysLen:Int, samples:Int):Void;
	@:native("flight_particle_curve_to_keyframes")
	public static function particleCurveToKeyframes(out:Dynamic, lut:Dynamic, lutLen:Int):Void;
	@:native("flight_sample_particle_color_curve")
	public static function sampleParticleColorCurve(out:Dynamic, outLen:Int, offset:Int, lut:Dynamic, lutLen:Int, t:Float):Void;
	@:native("flight_sample_particle_curve")
	public static function sampleParticleCurve(lut:Dynamic, lutLen:Int, t:Float):Float;
	@:native("flight_create_particle_emitter_config")
	public static function createParticleEmitterConfig(config:flight._js.ParticleEmitterConfigOptions):flight._js.ParticleEmitterConfig;
	@:native("flight_create_particle_emitter_config_options")
	public static function createParticleEmitterConfigOptions():flight._js.ParticleEmitterConfigOptions;
	@:native("flight_enable_particle_emitter_signals")
	public static function enableParticleEmitterSignals(state:flight._js.ParticleEmitterState):flight._js.ParticleEmitterSignals;
	@:native("flight_get_particle_emitter_signals")
	public static function getParticleEmitterSignals(state:flight._js.ParticleEmitterState):Dynamic;
	@:native("flight_create_particle_emitter_state")
	public static function createParticleEmitterState():flight._js.ParticleEmitterState;
	@:native("flight_create_particle_objects_state")
	public static function createParticleObjectsState():flight._js.ParticleObjectsState;
	@:native("flight_step_particle_objects")
	public static function stepParticleObjects(objects:Dynamic, objectsLen:Int, state:flight._js.ParticleObjectsState, config:flight._js.ParticleEmitterConfig, deltaTime:Float, forces:Dynamic, forcesLen:Int, colliders:Dynamic, collidersLen:Int, updateOptions:flight._js.ParticleObjectsUpdateOptions):Void;
	@:native("flight_particle_blend_mode_as_str")
	public static function particleBlendModeAsStr(mode:Int):String;
	@:native("flight_is_particle_objects_complete")
	public static function isParticleObjectsComplete(objects:Dynamic, objectsLen:Int, state:flight._js.ParticleObjectsState, config:flight._js.ParticleEmitterConfig):Bool;
	@:native("flight_update_particle_objects")
	public static function updateParticleObjects(objects:Dynamic, objectsLen:Int, state:flight._js.ParticleObjectsState, config:flight._js.ParticleEmitterConfig, deltaTime:Float, options:flight._js.ParticleObjectsUpdateOptions):Void;
	@:native("flight_normalize_particle_emitter_config")
	public static function normalizeParticleEmitterConfig(config:flight._js.ParticleEmitterConfig):flight._js.ParticleEmitterConfig;
	@:native("flight_validate_particle_emitter_config")
	public static function validateParticleEmitterConfig(out:Dynamic, config:flight._js.ParticleEmitterConfig):Void;
	@:native("flight_free_particle_emitter_config")
	public static function freeParticleEmitterConfig(ptr:flight._js.ParticleEmitterConfig):Void;
	@:native("flight_free_particle_emitter_config_options")
	public static function freeParticleEmitterConfigOptions(ptr:flight._js.ParticleEmitterConfigOptions):Void;
	@:native("flight_free_particle_emitter_signals")
	public static function freeParticleEmitterSignals(ptr:flight._js.ParticleEmitterSignals):Void;
	@:native("flight_free_particle_emitter_state")
	public static function freeParticleEmitterState(ptr:flight._js.ParticleEmitterState):Void;
	@:native("flight_free_particle_objects_state")
	public static function freeParticleObjectsState(ptr:flight._js.ParticleObjectsState):Void;
}
