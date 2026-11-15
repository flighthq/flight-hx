package flight._cpp;

private extern class ParticleEmitterState_Ffi {
	@:native("flight_get_particle_emitter_state_burst_timer") static function get_burstTimer(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_emitter_state_burst_timer") static function set_burstTimer(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_emitter_state_emitter_age") static function get_emitterAge(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_emitter_state_emitter_age") static function set_emitterAge(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_emitter_state_prev_x") static function get_prevX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_emitter_state_prev_x") static function set_prevX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_emitter_state_prev_y") static function get_prevY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_emitter_state_prev_y") static function set_prevY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_emitter_state_prev_z") static function get_prevZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_emitter_state_prev_z") static function set_prevZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_emitter_state_spawn_accumulator") static function get_spawnAccumulator(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_emitter_state_spawn_accumulator") static function set_spawnAccumulator(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ParticleEmitterState(cpp.Star<cpp.Void>) {
	public var burstTimer(get, set):Single;

	inline function get_burstTimer():Single return ParticleEmitterState_Ffi.get_burstTimer(this);

	inline function set_burstTimer(value:Single):Single return ParticleEmitterState_Ffi.set_burstTimer(this, value);
	public var emitterAge(get, set):Single;

	inline function get_emitterAge():Single return ParticleEmitterState_Ffi.get_emitterAge(this);

	inline function set_emitterAge(value:Single):Single return ParticleEmitterState_Ffi.set_emitterAge(this, value);
	public var prevX(get, set):Single;

	inline function get_prevX():Single return ParticleEmitterState_Ffi.get_prevX(this);

	inline function set_prevX(value:Single):Single return ParticleEmitterState_Ffi.set_prevX(this, value);
	public var prevY(get, set):Single;

	inline function get_prevY():Single return ParticleEmitterState_Ffi.get_prevY(this);

	inline function set_prevY(value:Single):Single return ParticleEmitterState_Ffi.set_prevY(this, value);
	public var prevZ(get, set):Single;

	inline function get_prevZ():Single return ParticleEmitterState_Ffi.get_prevZ(this);

	inline function set_prevZ(value:Single):Single return ParticleEmitterState_Ffi.set_prevZ(this, value);
	public var spawnAccumulator(get, set):Single;

	inline function get_spawnAccumulator():Single return ParticleEmitterState_Ffi.get_spawnAccumulator(this);

	inline function set_spawnAccumulator(value:Single):Single return ParticleEmitterState_Ffi.set_spawnAccumulator(this, value);
}
