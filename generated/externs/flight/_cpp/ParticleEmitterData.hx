package flight._cpp;

private extern class ParticleEmitterData_Ffi {
	@:native("flight_get_particle_emitter_data_particle_count") static function get_particleCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_particle_emitter_data_particle_count") static function set_particleCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_particle_emitter_data_world_space") static function get_worldSpace(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_particle_emitter_data_world_space") static function set_worldSpace(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract ParticleEmitterData(cpp.Star<cpp.Void>) {
	public var particleCount(get, set):Int;

	inline function get_particleCount():Int return ParticleEmitterData_Ffi.get_particleCount(this);

	inline function set_particleCount(value:Int):Int { ParticleEmitterData_Ffi.set_particleCount(this, value); return value; }
	public var worldSpace(get, set):Bool;

	inline function get_worldSpace():Bool return ParticleEmitterData_Ffi.get_worldSpace(this);

	inline function set_worldSpace(value:Bool):Bool { ParticleEmitterData_Ffi.set_worldSpace(this, value); return value; }
}
