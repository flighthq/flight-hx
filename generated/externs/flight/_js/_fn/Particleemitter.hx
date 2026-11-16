package flight._js._fn;

@:jsRequire("@flighthq/particleemitter")
extern class Particleemitter {
	@:native("createParticleEmitterData")
	public static function createParticleEmitterData():flight._js.ParticleEmitterData;
	@:native("computeParticleEmitter2DLocalBoundsRectangle")
	public static function computeParticleEmitter2dLocalBoundsRectangle(out:flight._js.Rectangle, source:flight._js.ParticleEmitter2D):Void;
	@:native("createParticleEmitter2D")
	public static function createParticleEmitter2d():Dynamic;
	@:native("createParticleEmitter2DRuntime")
	public static function createParticleEmitter2dRuntime():flight._js.Node2DRuntime;
	@:native("createParticleEmitter3D")
	public static function createParticleEmitter3d():Dynamic;
	@:native("appendParticleEmitter2DParticle")
	public static function appendParticleEmitter2dParticle(target:Dynamic, id:Int, x:Float, y:Float, rotation:Float, scale:Float):Int;
	@:native("clearParticleEmitter2D")
	public static function clearParticleEmitter2d(target:Dynamic):Void;
	@:native("cloneParticleEmitter2D")
	public static function cloneParticleEmitter2d(source:flight._js.ParticleEmitter2D):Dynamic;
	@:native("cloneParticleEmitter3D")
	public static function cloneParticleEmitter3d(source:flight._js.ParticleEmitter3D):Dynamic;
	@:native("compactParticleEmitter2D")
	public static function compactParticleEmitter2d(target:Dynamic):Void;
	@:native("emitParticleBurst2D")
	public static function emitParticleBurst2d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, count:Float, x:Float, y:Float, tint:Null<Int>):Int;
	@:native("getParticleEmitter2DCapacity")
	public static function getParticleEmitter2dCapacity(source:Dynamic):Int;
	@:native("getParticleEmitter2DParticleAlpha")
	public static function getParticleEmitter2dParticleAlpha(source:Dynamic, index:Int):Float;
	@:native("getParticleEmitter2DParticleId")
	public static function getParticleEmitter2dParticleId(source:Dynamic, index:Int):Int;
	@:native("getParticleEmitter2DParticleVelocity")
	public static function getParticleEmitter2dParticleVelocity(out:flight._js.Vector2, source:Dynamic, index:Int):Bool;
	@:native("getParticleEmitter2DRuntime")
	public static function getParticleEmitter2dRuntime(source:flight._js.ParticleEmitter2D):flight._js.ParticleEmitter2DRuntime;
	@:native("getParticleEmitter3DRuntime")
	public static function getParticleEmitter3dRuntime(source:Dynamic):flight._js.Node3DRuntime;
	@:native("isParticleEmitter3D")
	public static function isParticleEmitter3d(node:Dynamic):Bool;
	@:native("removeParticleEmitter2DParticle")
	public static function removeParticleEmitter2dParticle(target:Dynamic, index:Int):Void;
	@:native("reserveParticleEmitter2D")
	public static function reserveParticleEmitter2d(target:Dynamic, capacity:Int):Void;
	@:native("setParticleEmitter2DLocalBoundsRectangle")
	public static function setParticleEmitter2dLocalBoundsRectangle(target:Dynamic, rect:flight._js.Rectangle):Void;
	@:native("setParticleEmitter2DParticle")
	public static function setParticleEmitter2dParticle(target:Dynamic, index:Int, id:Int, x:Float, y:Float, rotation:Float, scale:Float):Void;
	@:native("setParticleEmitter2DParticleAlpha")
	public static function setParticleEmitter2dParticleAlpha(target:Dynamic, index:Int, alpha:Float):Void;
	@:native("setParticleEmitter2DParticleColor")
	public static function setParticleEmitter2dParticleColor(target:Dynamic, index:Int, r:Float, g:Float, b:Float):Void;
	@:native("setParticleEmitter2DParticleVelocity")
	public static function setParticleEmitter2dParticleVelocity(target:Dynamic, index:Int, vx:Float, vy:Float):Void;
	@:native("appendParticleEmitter3DParticle")
	public static function appendParticleEmitter3dParticle(target:Dynamic, id:Int, x:Float, y:Float, z:Float, rotation:Float, scale:Float):Int;
	@:native("clearParticleEmitter3D")
	public static function clearParticleEmitter3d(target:Dynamic):Void;
	@:native("compactParticleEmitter3D")
	public static function compactParticleEmitter3d(target:Dynamic):Void;
	@:native("computeParticleEmitter3DLocalBoundsAabb")
	public static function computeParticleEmitter3dLocalBoundsAabb(out:flight._js.Aabb, source:Dynamic):Void;
	@:native("emitParticleBurst3D")
	public static function emitParticleBurst3d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, count:Float, x:Float, y:Float, z:Float, tint:Null<Int>):Int;
	@:native("getParticleEmitter3DCapacity")
	public static function getParticleEmitter3dCapacity(source:Dynamic):Int;
	@:native("getParticleEmitter3DParticleAlpha")
	public static function getParticleEmitter3dParticleAlpha(source:Dynamic, index:Int):Float;
	@:native("getParticleEmitter3DParticleId")
	public static function getParticleEmitter3dParticleId(source:Dynamic, index:Int):Int;
	@:native("getParticleEmitter3DParticleVelocity")
	public static function getParticleEmitter3dParticleVelocity(out:Dynamic, source:Dynamic, index:Int):Bool;
	@:native("removeParticleEmitter3DParticle")
	public static function removeParticleEmitter3dParticle(target:Dynamic, index:Int):Void;
	@:native("reserveParticleEmitter3D")
	public static function reserveParticleEmitter3d(target:Dynamic, capacity:Int):Void;
	@:native("setParticleEmitter3DParticle")
	public static function setParticleEmitter3dParticle(target:Dynamic, index:Int, id:Int, x:Float, y:Float, z:Float, rotation:Float, scale:Float):Void;
	@:native("setParticleEmitter3DParticleAlpha")
	public static function setParticleEmitter3dParticleAlpha(target:Dynamic, index:Int, alpha:Float):Void;
	@:native("setParticleEmitter3DParticleColor")
	public static function setParticleEmitter3dParticleColor(target:Dynamic, index:Int, r:Float, g:Float, b:Float):Void;
	@:native("setParticleEmitter3DParticleVelocity")
	public static function setParticleEmitter3dParticleVelocity(target:Dynamic, index:Int, vx:Float, vy:Float, vz:Float):Void;
	@:native("sortParticleEmitter3DByViewDepth")
	public static function sortParticleEmitter3dByViewDepth(emitter:Dynamic, viewMatrix:Dynamic):Void;
	@:native("sortParticleEmitter3DIndicesByViewDepth")
	public static function sortParticleEmitter3dIndicesByViewDepth(outIndices:Dynamic, outViewDepths:Dynamic, source:Dynamic, positionToView:Dynamic):Bool;
	@:native("prewarmParticleEmitter2D")
	public static function prewarmParticleEmitter2d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, duration:Float, stepDeltaTime:Float, callbacks:Null<flight._js.ParticleEmitterCallbacks>):Void;
	@:native("prewarmParticleEmitter3D")
	public static function prewarmParticleEmitter3d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, duration:Float, stepDeltaTime:Float, callbacks:Null<flight._js.ParticleEmitterCallbacks>):Void;
	@:native("stepParticleEmitter2D")
	public static function stepParticleEmitter2d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, deltaTime:Float, forces:Null<Dynamic>, colliders:Null<Dynamic>, callbacks:Null<flight._js.ParticleEmitterCallbacks>):Void;
	@:native("stepParticleEmitter3D")
	public static function stepParticleEmitter3d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, deltaTime:Float, forces:Null<Dynamic>, colliders:Null<Dynamic>, callbacks:Null<flight._js.ParticleEmitterCallbacks>):Void;
	@:native("isParticleEmitter2DComplete")
	public static function isParticleEmitter2dComplete(emitter:flight._js.ParticleEmitter2D, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig):Bool;
	@:native("updateParticleEmitter2D")
	public static function updateParticleEmitter2d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, deltaTime:Float, callbacks:Null<flight._js.ParticleEmitterCallbacks>):Void;
	@:native("isParticleEmitter3DComplete")
	public static function isParticleEmitter3dComplete(emitter:flight._js.ParticleEmitter3D, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig):Bool;
	@:native("updateParticleEmitter3D")
	public static function updateParticleEmitter3d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, deltaTime:Float, callbacks:Null<flight._js.ParticleEmitterCallbacks>):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeParticleEmitterData(ptr:flight._js.ParticleEmitterData):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeNode2Druntime(ptr:flight._js.Node2DRuntime):Void {}
}
