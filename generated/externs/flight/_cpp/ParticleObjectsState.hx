package flight._cpp;

private extern class ParticleObjectsState_Ffi {
	@:native("flight_get_particle_objects_state_burst_timer") static function get_burstTimer(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_objects_state_burst_timer") static function set_burstTimer(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_objects_state_emitter_age") static function get_emitterAge(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_objects_state_emitter_age") static function set_emitterAge(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_objects_state_prev_x") static function get_prevX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_objects_state_prev_x") static function set_prevX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_objects_state_prev_y") static function get_prevY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_objects_state_prev_y") static function set_prevY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_objects_state_spawn_accumulator") static function get_spawnAccumulator(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_objects_state_spawn_accumulator") static function set_spawnAccumulator(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ParticleObjectsState(cpp.Star<cpp.Void>) {
	public var burstTimer(get, set):Single;

	inline function get_burstTimer():Single return ParticleObjectsState_Ffi.get_burstTimer(this);

	inline function set_burstTimer(value:Single):Single { ParticleObjectsState_Ffi.set_burstTimer(this, value); return value; }
	public var emitterAge(get, set):Single;

	inline function get_emitterAge():Single return ParticleObjectsState_Ffi.get_emitterAge(this);

	inline function set_emitterAge(value:Single):Single { ParticleObjectsState_Ffi.set_emitterAge(this, value); return value; }
	public var prevX(get, set):Single;

	inline function get_prevX():Single return ParticleObjectsState_Ffi.get_prevX(this);

	inline function set_prevX(value:Single):Single { ParticleObjectsState_Ffi.set_prevX(this, value); return value; }
	public var prevY(get, set):Single;

	inline function get_prevY():Single return ParticleObjectsState_Ffi.get_prevY(this);

	inline function set_prevY(value:Single):Single { ParticleObjectsState_Ffi.set_prevY(this, value); return value; }
	public var spawnAccumulator(get, set):Single;

	inline function get_spawnAccumulator():Single return ParticleObjectsState_Ffi.get_spawnAccumulator(this);

	inline function set_spawnAccumulator(value:Single):Single { ParticleObjectsState_Ffi.set_spawnAccumulator(this, value); return value; }
}
