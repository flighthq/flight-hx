package flight._js;

@:jsRequire("flight")
private extern class ParticleEmitterData_Ffi {
	@:native("flight_get_particle_emitter_data_particle_count") static function get_particleCount(ptr:Dynamic):Int;
	@:native("flight_set_particle_emitter_data_particle_count") static function set_particleCount(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_particle_emitter_data_world_space") static function get_worldSpace(ptr:Dynamic):Bool;
	@:native("flight_set_particle_emitter_data_world_space") static function set_worldSpace(ptr:Dynamic, value:Bool):Bool;
}

abstract ParticleEmitterData(Dynamic) {
	public var particleCount(get, set):Int;

	inline function get_particleCount():Int return ParticleEmitterData_Ffi.get_particleCount(this);

	inline function set_particleCount(value:Int):Int return ParticleEmitterData_Ffi.set_particleCount(this, value);
	public var worldSpace(get, set):Bool;

	inline function get_worldSpace():Bool return ParticleEmitterData_Ffi.get_worldSpace(this);

	inline function set_worldSpace(value:Bool):Bool return ParticleEmitterData_Ffi.set_worldSpace(this, value);
}
