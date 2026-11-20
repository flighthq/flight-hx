package flight._hl._fn;

extern class Particleemitter {
	@:hlNative("flight", "flight_compute_particle_emitter_2d_local_bounds_rectangle")
	public static function computeParticleEmitter2dLocalBoundsRectangle(out:flight._hl.Rectangle, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_create_particle_emitter_2d")
	public static function createParticleEmitter2d():flight._hl.FlightNode;
	@:hlNative("flight", "flight_create_particle_emitter_3d")
	public static function createParticleEmitter3d():flight._hl.FlightNode;
	@:hlNative("flight", "flight_append_particle_emitter_2d_particle")
	public static function appendParticleEmitter2dParticle(target:flight._hl.FlightNode, id:Int, x:Single, y:Single, rotation:Single, scale:Single):Int;
	@:hlNative("flight", "flight_clear_particle_emitter_2d")
	public static function clearParticleEmitter2d(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_clone_particle_emitter_2d")
	public static function cloneParticleEmitter2d(source:flight._hl.FlightNode):flight._hl.FlightNode;
	@:hlNative("flight", "flight_clone_particle_emitter_3d")
	public static function cloneParticleEmitter3d(source:flight._hl.FlightNode):flight._hl.FlightNode;
	@:hlNative("flight", "flight_compact_particle_emitter_2d")
	public static function compactParticleEmitter2d(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_emit_particle_burst_2d")
	public static function emitParticleBurst2d(emitter:flight._hl.FlightNode, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, count:Single, x:Single, y:Single, tint:haxe.Int64):Int;
	@:hlNative("flight", "flight_get_particle_emitter_2d_capacity")
	public static function getParticleEmitter2dCapacity(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_particle_emitter_2d_particle_alpha")
	public static function getParticleEmitter2dParticleAlpha(source:flight._hl.FlightNode, index:Int):Single;
	@:hlNative("flight", "flight_get_particle_emitter_2d_particle_id")
	public static function getParticleEmitter2dParticleId(source:flight._hl.FlightNode, index:Int):Int;
	@:hlNative("flight", "flight_get_particle_emitter_2d_particle_velocity")
	public static function getParticleEmitter2dParticleVelocity(out:flight._hl.Vector2, source:flight._hl.FlightNode, index:Int):Bool;
	@:hlNative("flight", "flight_is_particle_emitter_3d")
	public static function isParticleEmitter3d(node:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_remove_particle_emitter_2d_particle")
	public static function removeParticleEmitter2dParticle(target:flight._hl.FlightNode, index:Int):Void;
	@:hlNative("flight", "flight_reserve_particle_emitter_2d")
	public static function reserveParticleEmitter2d(target:flight._hl.FlightNode, capacity:Int):Void;
	@:hlNative("flight", "flight_set_particle_emitter_2d_local_bounds_rectangle")
	public static function setParticleEmitter2dLocalBoundsRectangle(target:flight._hl.FlightNode, rect:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_set_particle_emitter_2d_particle")
	public static function setParticleEmitter2dParticle(target:flight._hl.FlightNode, index:Int, id:Int, x:Single, y:Single, rotation:Single, scale:Single):Void;
	@:hlNative("flight", "flight_set_particle_emitter_2d_particle_alpha")
	public static function setParticleEmitter2dParticleAlpha(target:flight._hl.FlightNode, index:Int, alpha:Single):Void;
	@:hlNative("flight", "flight_set_particle_emitter_2d_particle_color")
	public static function setParticleEmitter2dParticleColor(target:flight._hl.FlightNode, index:Int, r:Single, g:Single, b:Single):Void;
	@:hlNative("flight", "flight_set_particle_emitter_2d_particle_velocity")
	public static function setParticleEmitter2dParticleVelocity(target:flight._hl.FlightNode, index:Int, vx:Single, vy:Single):Void;
	@:hlNative("flight", "flight_append_particle_emitter_3d_particle")
	public static function appendParticleEmitter3dParticle(target:flight._hl.FlightNode, id:Int, x:Single, y:Single, z:Single, rotation:Single, scale:Single):Int;
	@:hlNative("flight", "flight_clear_particle_emitter_3d")
	public static function clearParticleEmitter3d(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_compact_particle_emitter_3d")
	public static function compactParticleEmitter3d(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_compute_particle_emitter_3d_local_bounds_aabb")
	public static function computeParticleEmitter3dLocalBoundsAabb(out:flight._hl.Aabb, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_emit_particle_burst_3d")
	public static function emitParticleBurst3d(emitter:flight._hl.FlightNode, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, count:Single, x:Single, y:Single, z:Single, tint:haxe.Int64):Int;
	@:hlNative("flight", "flight_get_particle_emitter_3d_capacity")
	public static function getParticleEmitter3dCapacity(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_particle_emitter_3d_particle_alpha")
	public static function getParticleEmitter3dParticleAlpha(source:flight._hl.FlightNode, index:Int):Single;
	@:hlNative("flight", "flight_get_particle_emitter_3d_particle_id")
	public static function getParticleEmitter3dParticleId(source:flight._hl.FlightNode, index:Int):Int;
	@:hlNative("flight", "flight_get_particle_emitter_3d_particle_velocity")
	public static function getParticleEmitter3dParticleVelocity(out:hl.Bytes, source:flight._hl.FlightNode, index:Int):Bool;
	@:hlNative("flight", "flight_remove_particle_emitter_3d_particle")
	public static function removeParticleEmitter3dParticle(target:flight._hl.FlightNode, index:Int):Void;
	@:hlNative("flight", "flight_reserve_particle_emitter_3d")
	public static function reserveParticleEmitter3d(target:flight._hl.FlightNode, capacity:Int):Void;
	@:hlNative("flight", "flight_set_particle_emitter_3d_particle")
	public static function setParticleEmitter3dParticle(target:flight._hl.FlightNode, index:Int, id:Int, x:Single, y:Single, z:Single, rotation:Single, scale:Single):Void;
	@:hlNative("flight", "flight_set_particle_emitter_3d_particle_alpha")
	public static function setParticleEmitter3dParticleAlpha(target:flight._hl.FlightNode, index:Int, alpha:Single):Void;
	@:hlNative("flight", "flight_set_particle_emitter_3d_particle_color")
	public static function setParticleEmitter3dParticleColor(target:flight._hl.FlightNode, index:Int, r:Single, g:Single, b:Single):Void;
	@:hlNative("flight", "flight_set_particle_emitter_3d_particle_velocity")
	public static function setParticleEmitter3dParticleVelocity(target:flight._hl.FlightNode, index:Int, vx:Single, vy:Single, vz:Single):Void;
	@:hlNative("flight", "flight_sort_particle_emitter_3d_indices_by_view_depth")
	public static function sortParticleEmitter3dIndicesByViewDepth(outIndices:hl.Bytes, outIndicesLen:Int, outViewDepths:hl.Bytes, outViewDepthsLen:Int, source:flight._hl.FlightNode, positionToView:hl.Bytes):Bool;
	@:hlNative("flight", "flight_prewarm_particle_emitter_2d")
	public static function prewarmParticleEmitter2d(emitter:flight._hl.FlightNode, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, duration:Single, stepDeltaTime:Single, callbacks:flight._hl.ParticleEmitterCallbacks):Void;
	@:hlNative("flight", "flight_prewarm_particle_emitter_3d")
	public static function prewarmParticleEmitter3d(emitter:flight._hl.FlightNode, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, duration:Single, stepDeltaTime:Single, callbacks:flight._hl.ParticleEmitterCallbacks):Void;
	@:hlNative("flight", "flight_step_particle_emitter_2d")
	public static function stepParticleEmitter2d(emitter:flight._hl.FlightNode, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, deltaTime:Single, forces:hl.Bytes, forcesLen:Int, colliders:hl.Bytes, collidersLen:Int, callbacks:flight._hl.ParticleEmitterCallbacks):Void;
	@:hlNative("flight", "flight_step_particle_emitter_3d")
	public static function stepParticleEmitter3d(emitter:flight._hl.FlightNode, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, deltaTime:Single, forces:hl.Bytes, forcesLen:Int, colliders:hl.Bytes, collidersLen:Int, callbacks:flight._hl.ParticleEmitterCallbacks):Void;
	@:hlNative("flight", "flight_is_particle_emitter_2d_complete")
	public static function isParticleEmitter2dComplete(emitter:flight._hl.FlightNode, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig):Bool;
	@:hlNative("flight", "flight_update_particle_emitter_2d")
	public static function updateParticleEmitter2d(emitter:flight._hl.FlightNode, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, deltaTime:Single, callbacks:flight._hl.ParticleEmitterCallbacks):Void;
	@:hlNative("flight", "flight_is_particle_emitter_3d_complete")
	public static function isParticleEmitter3dComplete(emitter:flight._hl.FlightNode, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig):Bool;
	@:hlNative("flight", "flight_update_particle_emitter_3d")
	public static function updateParticleEmitter3d(emitter:flight._hl.FlightNode, state:flight._hl.ParticleEmitterState, config:flight._hl.ParticleEmitterConfig, deltaTime:Single, callbacks:flight._hl.ParticleEmitterCallbacks):Void;
}
