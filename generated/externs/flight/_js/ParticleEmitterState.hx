package flight._js;

@:jsRequire("flight")
private extern class ParticleEmitterState_Ffi {
	@:native("flight_get_particle_emitter_state_burst_timer") static function get_burstTimer(ptr:Dynamic):Float;
	@:native("flight_set_particle_emitter_state_burst_timer") static function set_burstTimer(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_emitter_state_emitter_age") static function get_emitterAge(ptr:Dynamic):Float;
	@:native("flight_set_particle_emitter_state_emitter_age") static function set_emitterAge(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_emitter_state_prev_x") static function get_prevX(ptr:Dynamic):Float;
	@:native("flight_set_particle_emitter_state_prev_x") static function set_prevX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_emitter_state_prev_y") static function get_prevY(ptr:Dynamic):Float;
	@:native("flight_set_particle_emitter_state_prev_y") static function set_prevY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_emitter_state_prev_z") static function get_prevZ(ptr:Dynamic):Float;
	@:native("flight_set_particle_emitter_state_prev_z") static function set_prevZ(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_emitter_state_spawn_accumulator") static function get_spawnAccumulator(ptr:Dynamic):Float;
	@:native("flight_set_particle_emitter_state_spawn_accumulator") static function set_spawnAccumulator(ptr:Dynamic, value:Float):Float;
}

abstract ParticleEmitterState(Dynamic) {
	public var burstTimer(get, set):Float;

	inline function get_burstTimer():Float return ParticleEmitterState_Ffi.get_burstTimer(this);

	inline function set_burstTimer(value:Float):Float return ParticleEmitterState_Ffi.set_burstTimer(this, value);
	public var emitterAge(get, set):Float;

	inline function get_emitterAge():Float return ParticleEmitterState_Ffi.get_emitterAge(this);

	inline function set_emitterAge(value:Float):Float return ParticleEmitterState_Ffi.set_emitterAge(this, value);
	public var prevX(get, set):Float;

	inline function get_prevX():Float return ParticleEmitterState_Ffi.get_prevX(this);

	inline function set_prevX(value:Float):Float return ParticleEmitterState_Ffi.set_prevX(this, value);
	public var prevY(get, set):Float;

	inline function get_prevY():Float return ParticleEmitterState_Ffi.get_prevY(this);

	inline function set_prevY(value:Float):Float return ParticleEmitterState_Ffi.set_prevY(this, value);
	public var prevZ(get, set):Float;

	inline function get_prevZ():Float return ParticleEmitterState_Ffi.get_prevZ(this);

	inline function set_prevZ(value:Float):Float return ParticleEmitterState_Ffi.set_prevZ(this, value);
	public var spawnAccumulator(get, set):Float;

	inline function get_spawnAccumulator():Float return ParticleEmitterState_Ffi.get_spawnAccumulator(this);

	inline function set_spawnAccumulator(value:Float):Float return ParticleEmitterState_Ffi.set_spawnAccumulator(this, value);
}
