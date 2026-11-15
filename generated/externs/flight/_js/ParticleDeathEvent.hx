package flight._js;

@:jsRequire("flight")
private extern class ParticleDeathEvent_Ffi {
	@:native("flight_get_particle_death_event_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_particle_death_event_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_death_event_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_particle_death_event_y") static function set_y(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_death_event_z") static function get_z(ptr:Dynamic):Float;
	@:native("flight_set_particle_death_event_z") static function set_z(ptr:Dynamic, value:Float):Float;
}

abstract ParticleDeathEvent(Dynamic) {
	public var x(get, set):Float;

	inline function get_x():Float return ParticleDeathEvent_Ffi.get_x(this);

	inline function set_x(value:Float):Float return ParticleDeathEvent_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return ParticleDeathEvent_Ffi.get_y(this);

	inline function set_y(value:Float):Float return ParticleDeathEvent_Ffi.set_y(this, value);
	public var z(get, set):Float;

	inline function get_z():Float return ParticleDeathEvent_Ffi.get_z(this);

	inline function set_z(value:Float):Float return ParticleDeathEvent_Ffi.set_z(this, value);
}
