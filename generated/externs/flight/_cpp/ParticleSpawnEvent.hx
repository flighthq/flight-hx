package flight._cpp;

private extern class ParticleSpawnEvent_Ffi {
	@:native("flight_get_particle_spawn_event_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_spawn_event_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_spawn_event_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_spawn_event_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_spawn_event_z") static function get_z(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_spawn_event_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_spawn_event_vx") static function get_vx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_spawn_event_vx") static function set_vx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_spawn_event_vy") static function get_vy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_spawn_event_vy") static function set_vy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_spawn_event_vz") static function get_vz(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_spawn_event_vz") static function set_vz(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ParticleSpawnEvent(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return ParticleSpawnEvent_Ffi.get_x(this);

	inline function set_x(value:Single):Single { ParticleSpawnEvent_Ffi.set_x(this, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return ParticleSpawnEvent_Ffi.get_y(this);

	inline function set_y(value:Single):Single { ParticleSpawnEvent_Ffi.set_y(this, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return ParticleSpawnEvent_Ffi.get_z(this);

	inline function set_z(value:Single):Single { ParticleSpawnEvent_Ffi.set_z(this, value); return value; }
	public var vx(get, set):Single;

	inline function get_vx():Single return ParticleSpawnEvent_Ffi.get_vx(this);

	inline function set_vx(value:Single):Single { ParticleSpawnEvent_Ffi.set_vx(this, value); return value; }
	public var vy(get, set):Single;

	inline function get_vy():Single return ParticleSpawnEvent_Ffi.get_vy(this);

	inline function set_vy(value:Single):Single { ParticleSpawnEvent_Ffi.set_vy(this, value); return value; }
	public var vz(get, set):Single;

	inline function get_vz():Single return ParticleSpawnEvent_Ffi.get_vz(this);

	inline function set_vz(value:Single):Single { ParticleSpawnEvent_Ffi.set_vz(this, value); return value; }
}
