package flight._hl._fn;

extern class Particleemitter {
	@:hlNative("flight", "flight_create_particle_emitter_data")
	public static function createParticleEmitterData():flight._hl.ParticleEmitterData;
	@:hlNative("flight", "flight_compute_particle_emitter_2d_local_bounds_rectangle")
	public static function computeParticleEmitter2dLocalBoundsRectangle(out:flight._hl.Rectangle, source:flight._hl.ParticleEmitter2D):Void;
	@:hlNative("flight", "flight_create_particle_emitter_2d")
	public static function createParticleEmitter2d():hl.Bytes;
	@:hlNative("flight", "flight_create_particle_emitter_2d_runtime")
	public static function createParticleEmitter2dRuntime():flight._hl.Node2DRuntime;
	@:hlNative("flight", "flight_create_particle_emitter_3d")
	public static function createParticleEmitter3d():hl.Bytes;
	@:hlNative("flight", "flight_append_particle_emitter_2d_particle")
	public static function appendParticleEmitter2dParticle(target:hl.Bytes, id:Int, x:Single, y:Single, rotation:Single, scale:Single):Int;
	@:hlNative("flight", "flight_clear_particle_emitter_2d")
	public static function clearParticleEmitter2d(target:hl.Bytes):Void;
	@:hlNative("flight", "flight_clone_particle_emitter_2d")
	public static function cloneParticleEmitter2d(source:flight._hl.ParticleEmitter2D):hl.Bytes;
	@:hlNative("flight", "flight_clone_particle_emitter_3d")
	public static function cloneParticleEmitter3d(source:flight._hl.ParticleEmitter3D):hl.Bytes;
	@:hlNative("flight", "flight_compact_particle_emitter_2d")
	public static function compactParticleEmitter2d(target:hl.Bytes):Void;
	@:hlNative("flight", "flight_emit_particle_burst_2d")
	public static function emitParticleBurst2d(emitter:hl.Bytes, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, count:Single, x:Single, y:Single, tint:haxe.Int64):Int;
	@:hlNative("flight", "flight_get_particle_emitter_2d_capacity")
	public static function getParticleEmitter2dCapacity(source:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_particle_emitter_2d_particle_alpha")
	public static function getParticleEmitter2dParticleAlpha(source:hl.Bytes, index:Int):Single;
	@:hlNative("flight", "flight_get_particle_emitter_2d_particle_id")
	public static function getParticleEmitter2dParticleId(source:hl.Bytes, index:Int):Int;
	@:hlNative("flight", "flight_get_particle_emitter_2d_particle_velocity")
	public static function getParticleEmitter2dParticleVelocity(out:flight._hl.Vector2, source:hl.Bytes, index:Int):Bool;
	@:hlNative("flight", "flight_get_particle_emitter_2d_runtime")
	public static function getParticleEmitter2dRuntime(source:flight._hl.ParticleEmitter2D):flight._hl.ParticleEmitter2DRuntime;
	@:hlNative("flight", "flight_get_particle_emitter_3d_runtime")
	public static function getParticleEmitter3dRuntime(source:hl.Bytes):flight._hl.Node3DRuntime;
	@:hlNative("flight", "flight_is_particle_emitter_3d")
	public static function isParticleEmitter3d(node:hl.Bytes):Bool;
	@:hlNative("flight", "flight_remove_particle_emitter_2d_particle")
	public static function removeParticleEmitter2dParticle(target:hl.Bytes, index:Int):Void;
	@:hlNative("flight", "flight_reserve_particle_emitter_2d")
	public static function reserveParticleEmitter2d(target:hl.Bytes, capacity:Int):Void;
	@:hlNative("flight", "flight_set_particle_emitter_2d_local_bounds_rectangle")
	public static function setParticleEmitter2dLocalBoundsRectangle(target:hl.Bytes, rect:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_set_particle_emitter_2d_particle")
	public static function setParticleEmitter2dParticle(target:hl.Bytes, index:Int, id:Int, x:Single, y:Single, rotation:Single, scale:Single):Void;
	@:hlNative("flight", "flight_set_particle_emitter_2d_particle_alpha")
	public static function setParticleEmitter2dParticleAlpha(target:hl.Bytes, index:Int, alpha:Single):Void;
	@:hlNative("flight", "flight_set_particle_emitter_2d_particle_color")
	public static function setParticleEmitter2dParticleColor(target:hl.Bytes, index:Int, r:Single, g:Single, b:Single):Void;
	@:hlNative("flight", "flight_set_particle_emitter_2d_particle_velocity")
	public static function setParticleEmitter2dParticleVelocity(target:hl.Bytes, index:Int, vx:Single, vy:Single):Void;
	@:hlNative("flight", "flight_append_particle_emitter_3d_particle")
	public static function appendParticleEmitter3dParticle(target:hl.Bytes, id:Int, x:Single, y:Single, z:Single, rotation:Single, scale:Single):Int;
	@:hlNative("flight", "flight_clear_particle_emitter_3d")
	public static function clearParticleEmitter3d(target:hl.Bytes):Void;
	@:hlNative("flight", "flight_compact_particle_emitter_3d")
	public static function compactParticleEmitter3d(target:hl.Bytes):Void;
	@:hlNative("flight", "flight_compute_particle_emitter_3d_local_bounds_aabb")
	public static function computeParticleEmitter3dLocalBoundsAabb(out:flight._hl.Aabb, source:hl.Bytes):Void;
	@:hlNative("flight", "flight_emit_particle_burst_3d")
	public static function emitParticleBurst3d(emitter:hl.Bytes, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, count:Single, x:Single, y:Single, z:Single, tint:haxe.Int64):Int;
	@:hlNative("flight", "flight_get_particle_emitter_3d_capacity")
	public static function getParticleEmitter3dCapacity(source:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_particle_emitter_3d_particle_alpha")
	public static function getParticleEmitter3dParticleAlpha(source:hl.Bytes, index:Int):Single;
	@:hlNative("flight", "flight_get_particle_emitter_3d_particle_id")
	public static function getParticleEmitter3dParticleId(source:hl.Bytes, index:Int):Int;
	@:hlNative("flight", "flight_get_particle_emitter_3d_particle_velocity")
	public static function getParticleEmitter3dParticleVelocity(out:hl.Bytes, source:hl.Bytes, index:Int):Bool;
	@:hlNative("flight", "flight_remove_particle_emitter_3d_particle")
	public static function removeParticleEmitter3dParticle(target:hl.Bytes, index:Int):Void;
	@:hlNative("flight", "flight_reserve_particle_emitter_3d")
	public static function reserveParticleEmitter3d(target:hl.Bytes, capacity:Int):Void;
	@:hlNative("flight", "flight_set_particle_emitter_3d_particle")
	public static function setParticleEmitter3dParticle(target:hl.Bytes, index:Int, id:Int, x:Single, y:Single, z:Single, rotation:Single, scale:Single):Void;
	@:hlNative("flight", "flight_set_particle_emitter_3d_particle_alpha")
	public static function setParticleEmitter3dParticleAlpha(target:hl.Bytes, index:Int, alpha:Single):Void;
	@:hlNative("flight", "flight_set_particle_emitter_3d_particle_color")
	public static function setParticleEmitter3dParticleColor(target:hl.Bytes, index:Int, r:Single, g:Single, b:Single):Void;
	@:hlNative("flight", "flight_set_particle_emitter_3d_particle_velocity")
	public static function setParticleEmitter3dParticleVelocity(target:hl.Bytes, index:Int, vx:Single, vy:Single, vz:Single):Void;
	@:hlNative("flight", "flight_sort_particle_emitter_3d_by_view_depth")
	public static function sortParticleEmitter3dByViewDepth(emitter:hl.Bytes, viewMatrix:hl.Bytes):Void;
	@:hlNative("flight", "flight_sort_particle_emitter_3d_indices_by_view_depth")
	public static function sortParticleEmitter3dIndicesByViewDepth(outIndices:hl.Bytes, outIndicesLen:Int, outViewDepths:hl.Bytes, outViewDepthsLen:Int, source:hl.Bytes, positionToView:hl.Bytes):Bool;
	@:hlNative("flight", "flight_prewarm_particle_emitter_2d")
	public static function prewarmParticleEmitter2d(emitter:hl.Bytes, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, duration:Single, stepDeltaTime:Single, callbacks:flight._hl.ParticleEmitterCallbacks):Void;
	@:hlNative("flight", "flight_prewarm_particle_emitter_3d")
	public static function prewarmParticleEmitter3d(emitter:hl.Bytes, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, duration:Single, stepDeltaTime:Single, callbacks:flight._hl.ParticleEmitterCallbacks):Void;
	@:hlNative("flight", "flight_step_particle_emitter_2d")
	public static function stepParticleEmitter2d(emitter:hl.Bytes, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, deltaTime:Single, forces:hl.Bytes, forcesLen:Int, colliders:hl.Bytes, collidersLen:Int, callbacks:flight._hl.ParticleEmitterCallbacks):Void;
	@:hlNative("flight", "flight_step_particle_emitter_3d")
	public static function stepParticleEmitter3d(emitter:hl.Bytes, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, deltaTime:Single, forces:hl.Bytes, forcesLen:Int, colliders:hl.Bytes, collidersLen:Int, callbacks:flight._hl.ParticleEmitterCallbacks):Void;
	@:hlNative("flight", "flight_is_particle_emitter_2d_complete")
	public static function isParticleEmitter2dComplete(emitter:flight._hl.ParticleEmitter2D, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig):Bool;
	@:hlNative("flight", "flight_update_particle_emitter_2d")
	public static function updateParticleEmitter2d(emitter:hl.Bytes, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, deltaTime:Single, callbacks:flight._hl.ParticleEmitterCallbacks):Void;
	@:hlNative("flight", "flight_is_particle_emitter_3d_complete")
	public static function isParticleEmitter3dComplete(emitter:flight._hl.ParticleEmitter3D, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig):Bool;
	@:hlNative("flight", "flight_update_particle_emitter_3d")
	public static function updateParticleEmitter3d(emitter:hl.Bytes, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, deltaTime:Single, callbacks:flight._hl.ParticleEmitterCallbacks):Void;
	@:hlNative("flight", "flight_free_particle_emitter_data")
	public static function freeParticleEmitterData(ptr:flight._hl.ParticleEmitterData):Void;
	@:hlNative("flight", "flight_free_node2_druntime")
	public static function freeNode2Druntime(ptr:flight._hl.Node2DRuntime):Void;
}
