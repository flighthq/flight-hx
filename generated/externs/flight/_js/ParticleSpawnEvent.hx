package flight._js;

@:jsRequire("flight")
private extern class ParticleSpawnEvent_Ffi {
	@:native("flight_get_particle_spawn_event_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_particle_spawn_event_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_spawn_event_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_particle_spawn_event_y") static function set_y(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_spawn_event_z") static function get_z(ptr:Dynamic):Float;
	@:native("flight_set_particle_spawn_event_z") static function set_z(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_spawn_event_vx") static function get_vx(ptr:Dynamic):Float;
	@:native("flight_set_particle_spawn_event_vx") static function set_vx(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_spawn_event_vy") static function get_vy(ptr:Dynamic):Float;
	@:native("flight_set_particle_spawn_event_vy") static function set_vy(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_spawn_event_vz") static function get_vz(ptr:Dynamic):Float;
	@:native("flight_set_particle_spawn_event_vz") static function set_vz(ptr:Dynamic, value:Float):Float;
}

abstract ParticleSpawnEvent(Dynamic) {
	public var x(get, set):Float;

	inline function get_x():Float return ParticleSpawnEvent_Ffi.get_x(this);

	inline function set_x(value:Float):Float return ParticleSpawnEvent_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return ParticleSpawnEvent_Ffi.get_y(this);

	inline function set_y(value:Float):Float return ParticleSpawnEvent_Ffi.set_y(this, value);
	public var z(get, set):Float;

	inline function get_z():Float return ParticleSpawnEvent_Ffi.get_z(this);

	inline function set_z(value:Float):Float return ParticleSpawnEvent_Ffi.set_z(this, value);
	public var vx(get, set):Float;

	inline function get_vx():Float return ParticleSpawnEvent_Ffi.get_vx(this);

	inline function set_vx(value:Float):Float return ParticleSpawnEvent_Ffi.set_vx(this, value);
	public var vy(get, set):Float;

	inline function get_vy():Float return ParticleSpawnEvent_Ffi.get_vy(this);

	inline function set_vy(value:Float):Float return ParticleSpawnEvent_Ffi.set_vy(this, value);
	public var vz(get, set):Float;

	inline function get_vz():Float return ParticleSpawnEvent_Ffi.get_vz(this);

	inline function set_vz(value:Float):Float return ParticleSpawnEvent_Ffi.set_vz(this, value);
}
