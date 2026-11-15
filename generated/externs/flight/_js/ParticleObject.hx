package flight._js;

@:jsRequire("flight")
private extern class ParticleObject_Ffi {
	@:native("flight_get_particle_object_alpha") static function get_alpha(ptr:Dynamic):Float;
	@:native("flight_set_particle_object_alpha") static function set_alpha(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_object_rotation") static function get_rotation(ptr:Dynamic):Float;
	@:native("flight_set_particle_object_rotation") static function set_rotation(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_object_scale_x") static function get_scaleX(ptr:Dynamic):Float;
	@:native("flight_set_particle_object_scale_x") static function set_scaleX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_object_scale_y") static function get_scaleY(ptr:Dynamic):Float;
	@:native("flight_set_particle_object_scale_y") static function set_scaleY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_object_visible") static function get_visible(ptr:Dynamic):Bool;
	@:native("flight_set_particle_object_visible") static function set_visible(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_particle_object_x") static function get_x(ptr:Dynamic):Float;
	@:native("flight_set_particle_object_x") static function set_x(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_particle_object_y") static function get_y(ptr:Dynamic):Float;
	@:native("flight_set_particle_object_y") static function set_y(ptr:Dynamic, value:Float):Float;
}

abstract ParticleObject(Dynamic) {
	public var alpha(get, set):Float;

	inline function get_alpha():Float return ParticleObject_Ffi.get_alpha(this);

	inline function set_alpha(value:Float):Float return ParticleObject_Ffi.set_alpha(this, value);
	public var rotation(get, set):Float;

	inline function get_rotation():Float return ParticleObject_Ffi.get_rotation(this);

	inline function set_rotation(value:Float):Float return ParticleObject_Ffi.set_rotation(this, value);
	public var scaleX(get, set):Float;

	inline function get_scaleX():Float return ParticleObject_Ffi.get_scaleX(this);

	inline function set_scaleX(value:Float):Float return ParticleObject_Ffi.set_scaleX(this, value);
	public var scaleY(get, set):Float;

	inline function get_scaleY():Float return ParticleObject_Ffi.get_scaleY(this);

	inline function set_scaleY(value:Float):Float return ParticleObject_Ffi.set_scaleY(this, value);
	public var visible(get, set):Bool;

	inline function get_visible():Bool return ParticleObject_Ffi.get_visible(this);

	inline function set_visible(value:Bool):Bool return ParticleObject_Ffi.set_visible(this, value);
	public var x(get, set):Float;

	inline function get_x():Float return ParticleObject_Ffi.get_x(this);

	inline function set_x(value:Float):Float return ParticleObject_Ffi.set_x(this, value);
	public var y(get, set):Float;

	inline function get_y():Float return ParticleObject_Ffi.get_y(this);

	inline function set_y(value:Float):Float return ParticleObject_Ffi.set_y(this, value);
}
