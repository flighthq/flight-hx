package flight._js._fn;

@:jsRequire("flight")
extern class Particleemitter {
	@:native("flight_create_particle_emitter_data")
	public static function createParticleEmitterData():flight._js.ParticleEmitterData;
	@:native("flight_compute_particle_emitter_2d_local_bounds_rectangle")
	public static function computeParticleEmitter2dLocalBoundsRectangle(out:flight._js.Rectangle, source:flight._js.ParticleEmitter2D):Void;
	@:native("flight_create_particle_emitter_2d")
	public static function createParticleEmitter2d():Dynamic;
	@:native("flight_create_particle_emitter_2d_runtime")
	public static function createParticleEmitter2dRuntime():flight._js.Node2DRuntime;
	@:native("flight_create_particle_emitter_3d")
	public static function createParticleEmitter3d():Dynamic;
	@:native("flight_append_particle_emitter_2d_particle")
	public static function appendParticleEmitter2dParticle(target:Dynamic, id:Int, x:Float, y:Float, rotation:Float, scale:Float):Int;
	@:native("flight_clear_particle_emitter_2d")
	public static function clearParticleEmitter2d(target:Dynamic):Void;
	@:native("flight_clone_particle_emitter_2d")
	public static function cloneParticleEmitter2d(source:flight._js.ParticleEmitter2D):Dynamic;
	@:native("flight_clone_particle_emitter_3d")
	public static function cloneParticleEmitter3d(source:flight._js.ParticleEmitter3D):Dynamic;
	@:native("flight_compact_particle_emitter_2d")
	public static function compactParticleEmitter2d(target:Dynamic):Void;
	@:native("flight_emit_particle_burst_2d")
	public static function emitParticleBurst2d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, count:Float, x:Float, y:Float, tint:haxe.Int64):Int;
	@:native("flight_get_particle_emitter_2d_capacity")
	public static function getParticleEmitter2dCapacity(source:Dynamic):Int;
	@:native("flight_get_particle_emitter_2d_particle_alpha")
	public static function getParticleEmitter2dParticleAlpha(source:Dynamic, index:Int):Float;
	@:native("flight_get_particle_emitter_2d_particle_id")
	public static function getParticleEmitter2dParticleId(source:Dynamic, index:Int):Int;
	@:native("flight_get_particle_emitter_2d_particle_velocity")
	public static function getParticleEmitter2dParticleVelocity(out:flight._js.Vector2, source:Dynamic, index:Int):Bool;
	@:native("flight_get_particle_emitter_2d_runtime")
	public static function getParticleEmitter2dRuntime(source:flight._js.ParticleEmitter2D):flight._js.ParticleEmitter2DRuntime;
	@:native("flight_get_particle_emitter_3d_runtime")
	public static function getParticleEmitter3dRuntime(source:Dynamic):flight._js.Node3DRuntime;
	@:native("flight_is_particle_emitter_3d")
	public static function isParticleEmitter3d(node:Dynamic):Bool;
	@:native("flight_remove_particle_emitter_2d_particle")
	public static function removeParticleEmitter2dParticle(target:Dynamic, index:Int):Void;
	@:native("flight_reserve_particle_emitter_2d")
	public static function reserveParticleEmitter2d(target:Dynamic, capacity:Int):Void;
	@:native("flight_set_particle_emitter_2d_local_bounds_rectangle")
	public static function setParticleEmitter2dLocalBoundsRectangle(target:Dynamic, rect:flight._js.Rectangle):Void;
	@:native("flight_set_particle_emitter_2d_particle")
	public static function setParticleEmitter2dParticle(target:Dynamic, index:Int, id:Int, x:Float, y:Float, rotation:Float, scale:Float):Void;
	@:native("flight_set_particle_emitter_2d_particle_alpha")
	public static function setParticleEmitter2dParticleAlpha(target:Dynamic, index:Int, alpha:Float):Void;
	@:native("flight_set_particle_emitter_2d_particle_color")
	public static function setParticleEmitter2dParticleColor(target:Dynamic, index:Int, r:Float, g:Float, b:Float):Void;
	@:native("flight_set_particle_emitter_2d_particle_velocity")
	public static function setParticleEmitter2dParticleVelocity(target:Dynamic, index:Int, vx:Float, vy:Float):Void;
	@:native("flight_append_particle_emitter_3d_particle")
	public static function appendParticleEmitter3dParticle(target:Dynamic, id:Int, x:Float, y:Float, z:Float, rotation:Float, scale:Float):Int;
	@:native("flight_clear_particle_emitter_3d")
	public static function clearParticleEmitter3d(target:Dynamic):Void;
	@:native("flight_compact_particle_emitter_3d")
	public static function compactParticleEmitter3d(target:Dynamic):Void;
	@:native("flight_compute_particle_emitter_3d_local_bounds_aabb")
	public static function computeParticleEmitter3dLocalBoundsAabb(out:flight._js.Aabb, source:Dynamic):Void;
	@:native("flight_emit_particle_burst_3d")
	public static function emitParticleBurst3d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, count:Float, x:Float, y:Float, z:Float, tint:haxe.Int64):Int;
	@:native("flight_get_particle_emitter_3d_capacity")
	public static function getParticleEmitter3dCapacity(source:Dynamic):Int;
	@:native("flight_get_particle_emitter_3d_particle_alpha")
	public static function getParticleEmitter3dParticleAlpha(source:Dynamic, index:Int):Float;
	@:native("flight_get_particle_emitter_3d_particle_id")
	public static function getParticleEmitter3dParticleId(source:Dynamic, index:Int):Int;
	@:native("flight_get_particle_emitter_3d_particle_velocity")
	public static function getParticleEmitter3dParticleVelocity(out:Dynamic, source:Dynamic, index:Int):Bool;
	@:native("flight_remove_particle_emitter_3d_particle")
	public static function removeParticleEmitter3dParticle(target:Dynamic, index:Int):Void;
	@:native("flight_reserve_particle_emitter_3d")
	public static function reserveParticleEmitter3d(target:Dynamic, capacity:Int):Void;
	@:native("flight_set_particle_emitter_3d_particle")
	public static function setParticleEmitter3dParticle(target:Dynamic, index:Int, id:Int, x:Float, y:Float, z:Float, rotation:Float, scale:Float):Void;
	@:native("flight_set_particle_emitter_3d_particle_alpha")
	public static function setParticleEmitter3dParticleAlpha(target:Dynamic, index:Int, alpha:Float):Void;
	@:native("flight_set_particle_emitter_3d_particle_color")
	public static function setParticleEmitter3dParticleColor(target:Dynamic, index:Int, r:Float, g:Float, b:Float):Void;
	@:native("flight_set_particle_emitter_3d_particle_velocity")
	public static function setParticleEmitter3dParticleVelocity(target:Dynamic, index:Int, vx:Float, vy:Float, vz:Float):Void;
	@:native("flight_sort_particle_emitter_3d_by_view_depth")
	public static function sortParticleEmitter3dByViewDepth(emitter:Dynamic, viewMatrix:Dynamic):Void;
	@:native("flight_sort_particle_emitter_3d_indices_by_view_depth")
	public static function sortParticleEmitter3dIndicesByViewDepth(outIndices:Dynamic, outIndicesLen:Int, outViewDepths:Dynamic, outViewDepthsLen:Int, source:Dynamic, positionToView:Dynamic):Bool;
	@:native("flight_prewarm_particle_emitter_2d")
	public static function prewarmParticleEmitter2d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, duration:Float, stepDeltaTime:Float, callbacks:flight._js.ParticleEmitterCallbacks):Void;
	@:native("flight_prewarm_particle_emitter_3d")
	public static function prewarmParticleEmitter3d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, duration:Float, stepDeltaTime:Float, callbacks:flight._js.ParticleEmitterCallbacks):Void;
	@:native("flight_step_particle_emitter_2d")
	public static function stepParticleEmitter2d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, deltaTime:Float, forces:Dynamic, forcesLen:Int, colliders:Dynamic, collidersLen:Int, callbacks:flight._js.ParticleEmitterCallbacks):Void;
	@:native("flight_step_particle_emitter_3d")
	public static function stepParticleEmitter3d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, deltaTime:Float, forces:Dynamic, forcesLen:Int, colliders:Dynamic, collidersLen:Int, callbacks:flight._js.ParticleEmitterCallbacks):Void;
	@:native("flight_is_particle_emitter_2d_complete")
	public static function isParticleEmitter2dComplete(emitter:flight._js.ParticleEmitter2D, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig):Bool;
	@:native("flight_update_particle_emitter_2d")
	public static function updateParticleEmitter2d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, deltaTime:Float, callbacks:flight._js.ParticleEmitterCallbacks):Void;
	@:native("flight_is_particle_emitter_3d_complete")
	public static function isParticleEmitter3dComplete(emitter:flight._js.ParticleEmitter3D, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig):Bool;
	@:native("flight_update_particle_emitter_3d")
	public static function updateParticleEmitter3d(emitter:Dynamic, state:flight._js.ParticleEmitterState, config:flight._js.ParticleEmitterConfig, deltaTime:Float, callbacks:flight._js.ParticleEmitterCallbacks):Void;
	@:native("flight_free_particle_emitter_data")
	public static function freeParticleEmitterData(ptr:flight._js.ParticleEmitterData):Void;
	@:native("flight_free_node2_druntime")
	public static function freeNode2Druntime(ptr:flight._js.Node2DRuntime):Void;
}
