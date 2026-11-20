package flight._cpp._fn;

extern class Particleemitter {
	@:native("flight_compute_particle_emitter_2d_local_bounds_rectangle")
	public static function computeParticleEmitter2dLocalBoundsRectangle(out:flight._cpp.Rectangle, source:flight._cpp.FlightNode):Void;
	@:native("flight_create_particle_emitter_2d")
	public static function createParticleEmitter2d():flight._cpp.FlightNode;
	@:native("flight_create_particle_emitter_3d")
	public static function createParticleEmitter3d():flight._cpp.FlightNode;
	@:native("flight_append_particle_emitter_2d_particle")
	public static function appendParticleEmitter2dParticle(target:flight._cpp.FlightNode, id:Int, x:Single, y:Single, rotation:Single, scale:Single):Int;
	@:native("flight_clear_particle_emitter_2d")
	public static function clearParticleEmitter2d(target:flight._cpp.FlightNode):Void;
	@:native("flight_clone_particle_emitter_2d")
	public static function cloneParticleEmitter2d(source:flight._cpp.FlightNode):flight._cpp.FlightNode;
	@:native("flight_clone_particle_emitter_3d")
	public static function cloneParticleEmitter3d(source:flight._cpp.FlightNode):flight._cpp.FlightNode;
	@:native("flight_compact_particle_emitter_2d")
	public static function compactParticleEmitter2d(target:flight._cpp.FlightNode):Void;
	@:native("flight_emit_particle_burst_2d")
	public static function emitParticleBurst2d(emitter:flight._cpp.FlightNode, state:flight._cpp.ParticleEmitterState, config:flight._cpp.ParticleEmitterConfig, count:Single, x:Single, y:Single, tint:haxe.Int64):Int;
	@:native("flight_get_particle_emitter_2d_capacity")
	public static function getParticleEmitter2dCapacity(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_particle_emitter_2d_particle_alpha")
	public static function getParticleEmitter2dParticleAlpha(source:flight._cpp.FlightNode, index:Int):Single;
	@:native("flight_get_particle_emitter_2d_particle_id")
	public static function getParticleEmitter2dParticleId(source:flight._cpp.FlightNode, index:Int):Int;
	@:native("flight_get_particle_emitter_2d_particle_velocity")
	public static function getParticleEmitter2dParticleVelocity(out:flight._cpp.Vector2, source:flight._cpp.FlightNode, index:Int):Bool;
	@:native("flight_is_particle_emitter_3d")
	public static function isParticleEmitter3d(node:flight._cpp.FlightNode):Bool;
	@:native("flight_remove_particle_emitter_2d_particle")
	public static function removeParticleEmitter2dParticle(target:flight._cpp.FlightNode, index:Int):Void;
	@:native("flight_reserve_particle_emitter_2d")
	public static function reserveParticleEmitter2d(target:flight._cpp.FlightNode, capacity:Int):Void;
	@:native("flight_set_particle_emitter_2d_local_bounds_rectangle")
	public static function setParticleEmitter2dLocalBoundsRectangle(target:flight._cpp.FlightNode, rect:flight._cpp.Rectangle):Void;
	@:native("flight_set_particle_emitter_2d_particle")
	public static function setParticleEmitter2dParticle(target:flight._cpp.FlightNode, index:Int, id:Int, x:Single, y:Single, rotation:Single, scale:Single):Void;
	@:native("flight_set_particle_emitter_2d_particle_alpha")
	public static function setParticleEmitter2dParticleAlpha(target:flight._cpp.FlightNode, index:Int, alpha:Single):Void;
	@:native("flight_set_particle_emitter_2d_particle_color")
	public static function setParticleEmitter2dParticleColor(target:flight._cpp.FlightNode, index:Int, r:Single, g:Single, b:Single):Void;
	@:native("flight_set_particle_emitter_2d_particle_velocity")
	public static function setParticleEmitter2dParticleVelocity(target:flight._cpp.FlightNode, index:Int, vx:Single, vy:Single):Void;
	@:native("flight_append_particle_emitter_3d_particle")
	public static function appendParticleEmitter3dParticle(target:flight._cpp.FlightNode, id:Int, x:Single, y:Single, z:Single, rotation:Single, scale:Single):Int;
	@:native("flight_clear_particle_emitter_3d")
	public static function clearParticleEmitter3d(target:flight._cpp.FlightNode):Void;
	@:native("flight_compact_particle_emitter_3d")
	public static function compactParticleEmitter3d(target:flight._cpp.FlightNode):Void;
	@:native("flight_compute_particle_emitter_3d_local_bounds_aabb")
	public static function computeParticleEmitter3dLocalBoundsAabb(out:flight._cpp.Aabb, source:flight._cpp.FlightNode):Void;
	@:native("flight_emit_particle_burst_3d")
	public static function emitParticleBurst3d(emitter:flight._cpp.FlightNode, state:flight._cpp.ParticleEmitterState, config:flight._cpp.ParticleEmitterConfig, count:Single, x:Single, y:Single, z:Single, tint:haxe.Int64):Int;
	@:native("flight_get_particle_emitter_3d_capacity")
	public static function getParticleEmitter3dCapacity(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_particle_emitter_3d_particle_alpha")
	public static function getParticleEmitter3dParticleAlpha(source:flight._cpp.FlightNode, index:Int):Single;
	@:native("flight_get_particle_emitter_3d_particle_id")
	public static function getParticleEmitter3dParticleId(source:flight._cpp.FlightNode, index:Int):Int;
	@:native("flight_get_particle_emitter_3d_particle_velocity")
	public static function getParticleEmitter3dParticleVelocity(out:cpp.Star<cpp.Void>, source:flight._cpp.FlightNode, index:Int):Bool;
	@:native("flight_remove_particle_emitter_3d_particle")
	public static function removeParticleEmitter3dParticle(target:flight._cpp.FlightNode, index:Int):Void;
	@:native("flight_reserve_particle_emitter_3d")
	public static function reserveParticleEmitter3d(target:flight._cpp.FlightNode, capacity:Int):Void;
	@:native("flight_set_particle_emitter_3d_particle")
	public static function setParticleEmitter3dParticle(target:flight._cpp.FlightNode, index:Int, id:Int, x:Single, y:Single, z:Single, rotation:Single, scale:Single):Void;
	@:native("flight_set_particle_emitter_3d_particle_alpha")
	public static function setParticleEmitter3dParticleAlpha(target:flight._cpp.FlightNode, index:Int, alpha:Single):Void;
	@:native("flight_set_particle_emitter_3d_particle_color")
	public static function setParticleEmitter3dParticleColor(target:flight._cpp.FlightNode, index:Int, r:Single, g:Single, b:Single):Void;
	@:native("flight_set_particle_emitter_3d_particle_velocity")
	public static function setParticleEmitter3dParticleVelocity(target:flight._cpp.FlightNode, index:Int, vx:Single, vy:Single, vz:Single):Void;
	@:native("flight_sort_particle_emitter_3d_indices_by_view_depth")
	public static function sortParticleEmitter3dIndicesByViewDepth(outIndices:cpp.Star<cpp.Void>, outIndicesLen:Int, outViewDepths:cpp.Star<cpp.Void>, outViewDepthsLen:Int, source:flight._cpp.FlightNode, positionToView:cpp.Star<cpp.Void>):Bool;
	@:native("flight_prewarm_particle_emitter_2d")
	public static function prewarmParticleEmitter2d(emitter:flight._cpp.FlightNode, state:flight._cpp.ParticleEmitterState, config:flight._cpp.ParticleEmitterConfig, duration:Single, stepDeltaTime:Single, callbacks:flight._cpp.ParticleEmitterCallbacks):Void;
	@:native("flight_prewarm_particle_emitter_3d")
	public static function prewarmParticleEmitter3d(emitter:flight._cpp.FlightNode, state:flight._cpp.ParticleEmitterState, config:flight._cpp.ParticleEmitterConfig, duration:Single, stepDeltaTime:Single, callbacks:flight._cpp.ParticleEmitterCallbacks):Void;
	@:native("flight_step_particle_emitter_2d")
	public static function stepParticleEmitter2d(emitter:flight._cpp.FlightNode, state:flight._cpp.ParticleEmitterState, config:flight._cpp.ParticleEmitterConfig, deltaTime:Single, forces:cpp.Star<cpp.Void>, forcesLen:Int, colliders:cpp.Star<cpp.Void>, collidersLen:Int, callbacks:flight._cpp.ParticleEmitterCallbacks):Void;
	@:native("flight_step_particle_emitter_3d")
	public static function stepParticleEmitter3d(emitter:flight._cpp.FlightNode, state:flight._cpp.ParticleEmitterState, config:flight._cpp.ParticleEmitterConfig, deltaTime:Single, forces:cpp.Star<cpp.Void>, forcesLen:Int, colliders:cpp.Star<cpp.Void>, collidersLen:Int, callbacks:flight._cpp.ParticleEmitterCallbacks):Void;
	@:native("flight_is_particle_emitter_2d_complete")
	public static function isParticleEmitter2dComplete(emitter:flight._cpp.FlightNode, state:flight._cpp.ParticleEmitterState, config:flight._cpp.ParticleEmitterConfig):Bool;
	@:native("flight_update_particle_emitter_2d")
	public static function updateParticleEmitter2d(emitter:flight._cpp.FlightNode, state:flight._cpp.ParticleEmitterState, config:flight._cpp.ParticleEmitterConfig, deltaTime:Single, callbacks:flight._cpp.ParticleEmitterCallbacks):Void;
	@:native("flight_is_particle_emitter_3d_complete")
	public static function isParticleEmitter3dComplete(emitter:flight._cpp.FlightNode, state:flight._cpp.ParticleEmitterState, config:flight._cpp.ParticleEmitterConfig):Bool;
	@:native("flight_update_particle_emitter_3d")
	public static function updateParticleEmitter3d(emitter:flight._cpp.FlightNode, state:flight._cpp.ParticleEmitterState, config:flight._cpp.ParticleEmitterConfig, deltaTime:Single, callbacks:flight._cpp.ParticleEmitterCallbacks):Void;
}
