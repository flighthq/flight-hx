package flight._js._fn;

@:jsRequire("@flighthq/particles")
extern class Particles {
	@:native("applyParticleCollisions")
	public static function applyParticleCollisions(transforms:Dynamic, positionsZ:Dynamic, particleCount:Int, state:flight._js.ParticleEmitterState, colliders:Dynamic):Void;
	@:native("applyParticleObjectCollisions")
	public static function applyParticleObjectCollisions(objects:Dynamic, state:flight._js.ParticleObjectsState, colliders:Dynamic):Void;
	@:native("applyParticleForces")
	public static function applyParticleForces(transforms:Dynamic, positionsZ:Dynamic, particleCount:Int, state:flight._js.ParticleEmitterState, forces:Dynamic, deltaTime:Float):Void;
	@:native("applyParticleObjectForces")
	public static function applyParticleObjectForces(objects:Dynamic, state:flight._js.ParticleObjectsState, forces:Dynamic, deltaTime:Float):Void;
	@:native("buildParticleCurve")
	public static function buildParticleCurve(out:Dynamic, f:Dynamic, samples:Int):Void;
	@:native("lerpHsvDirect")
	public static function lerpHsvDirect(out:Dynamic, offset:Int, r0:Float, g0:Float, b0:Float, r1:Float, g1:Float, b1:Float, t:Float):Void;
	@:native("lerpHsvInPlace")
	public static function lerpHsvInPlace(colorsOut:Dynamic, offset:Int, birth:Dynamic, death:Dynamic, t:Float):Void;
	@:native("particleColorCurveFromKeyframes")
	public static function particleColorCurveFromKeyframes(out:Dynamic, keys:Dynamic, samples:Int):Void;
	@:native("particleColorCurveToKeyframes")
	public static function particleColorCurveToKeyframes(out:Dynamic, lut:Dynamic):Void;
	@:native("particleCurveFromKeyframes")
	public static function particleCurveFromKeyframes(out:Dynamic, keys:Dynamic, samples:Int):Void;
	@:native("particleCurveToKeyframes")
	public static function particleCurveToKeyframes(out:Dynamic, lut:Dynamic):Void;
	@:native("sampleParticleColorCurve")
	public static function sampleParticleColorCurve(out:Dynamic, offset:Int, lut:Dynamic, t:Float):Void;
	@:native("sampleParticleCurve")
	public static function sampleParticleCurve(lut:Dynamic, t:Float):Float;
	@:native("createParticleEmitterConfig")
	public static function createParticleEmitterConfig(config:Null<flight._js.ParticleEmitterConfigOptions>):flight._js.ParticleEmitterConfig;
	@:native("createParticleEmitterConfigOptions")
	public static function createParticleEmitterConfigOptions():flight._js.ParticleEmitterConfigOptions;
	@:native("enableParticleEmitterSignals")
	public static function enableParticleEmitterSignals(state:flight._js.ParticleEmitterState):flight._js.ParticleEmitterSignals;
	@:native("getParticleEmitterSignals")
	public static function getParticleEmitterSignals(state:flight._js.ParticleEmitterState):Null<flight._js.ParticleEmitterSignals>;
	@:native("createParticleEmitterState")
	public static function createParticleEmitterState():flight._js.ParticleEmitterState;
	@:native("createParticleObjectsState")
	public static function createParticleObjectsState():flight._js.ParticleObjectsState;
	@:native("stepParticleObjects")
	public static function stepParticleObjects(objects:Dynamic, state:flight._js.ParticleObjectsState, config:flight._js.ParticleEmitterConfig, deltaTime:Float, forces:Null<Dynamic>, colliders:Null<Dynamic>, updateOptions:Null<flight._js.ParticleObjectsUpdateOptions>):Void;
	@:native("particleBlendModeAsStr")
	public static function particleBlendModeAsStr(mode:Dynamic):String;
	@:native("isParticleObjectsComplete")
	public static function isParticleObjectsComplete(objects:Dynamic, state:flight._js.ParticleObjectsState, config:flight._js.ParticleEmitterConfig):Bool;
	@:native("updateParticleObjects")
	public static function updateParticleObjects(objects:Dynamic, state:flight._js.ParticleObjectsState, config:flight._js.ParticleEmitterConfig, deltaTime:Float, options:Null<flight._js.ParticleObjectsUpdateOptions>):Void;
	@:native("normalizeParticleEmitterConfig")
	public static function normalizeParticleEmitterConfig(config:Null<flight._js.ParticleEmitterConfig>):flight._js.ParticleEmitterConfig;
	@:native("validateParticleEmitterConfig")
	public static function validateParticleEmitterConfig(out:Dynamic, config:flight._js.ParticleEmitterConfig):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeParticleEmitterConfig(ptr:flight._js.ParticleEmitterConfig):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeParticleEmitterConfigOptions(ptr:flight._js.ParticleEmitterConfigOptions):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeParticleEmitterSignals(ptr:flight._js.ParticleEmitterSignals):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeParticleEmitterState(ptr:flight._js.ParticleEmitterState):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeParticleObjectsState(ptr:flight._js.ParticleObjectsState):Void {}
}
