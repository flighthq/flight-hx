package flight._cpp;

private extern class ParticleDeathEvent_Ffi {
	@:native("flight_get_particle_death_event_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_death_event_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_death_event_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_death_event_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_death_event_z") static function get_z(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_death_event_z") static function set_z(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ParticleDeathEvent(cpp.Star<cpp.Void>) {
	public var x(get, set):Single;

	inline function get_x():Single return ParticleDeathEvent_Ffi.get_x(this);

	inline function set_x(value:Single):Single return ParticleDeathEvent_Ffi.set_x(this, value);
	public var y(get, set):Single;

	inline function get_y():Single return ParticleDeathEvent_Ffi.get_y(this);

	inline function set_y(value:Single):Single return ParticleDeathEvent_Ffi.set_y(this, value);
	public var z(get, set):Single;

	inline function get_z():Single return ParticleDeathEvent_Ffi.get_z(this);

	inline function set_z(value:Single):Single return ParticleDeathEvent_Ffi.set_z(this, value);
}
