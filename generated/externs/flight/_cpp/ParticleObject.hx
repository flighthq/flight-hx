package flight._cpp;

private extern class ParticleObject_Ffi {
	@:native("flight_get_particle_object_alpha") static function get_alpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_object_alpha") static function set_alpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_object_rotation") static function get_rotation(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_object_rotation") static function set_rotation(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_object_scale_x") static function get_scaleX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_object_scale_x") static function set_scaleX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_object_scale_y") static function get_scaleY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_object_scale_y") static function set_scaleY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_object_visible") static function get_visible(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_particle_object_visible") static function set_visible(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_particle_object_x") static function get_x(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_object_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_particle_object_y") static function get_y(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_particle_object_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ParticleObject(cpp.Star<cpp.Void>) {
	public var alpha(get, set):Single;

	inline function get_alpha():Single return ParticleObject_Ffi.get_alpha(this);

	inline function set_alpha(value:Single):Single return ParticleObject_Ffi.set_alpha(this, value);
	public var rotation(get, set):Single;

	inline function get_rotation():Single return ParticleObject_Ffi.get_rotation(this);

	inline function set_rotation(value:Single):Single return ParticleObject_Ffi.set_rotation(this, value);
	public var scaleX(get, set):Single;

	inline function get_scaleX():Single return ParticleObject_Ffi.get_scaleX(this);

	inline function set_scaleX(value:Single):Single return ParticleObject_Ffi.set_scaleX(this, value);
	public var scaleY(get, set):Single;

	inline function get_scaleY():Single return ParticleObject_Ffi.get_scaleY(this);

	inline function set_scaleY(value:Single):Single return ParticleObject_Ffi.set_scaleY(this, value);
	public var visible(get, set):Bool;

	inline function get_visible():Bool return ParticleObject_Ffi.get_visible(this);

	inline function set_visible(value:Bool):Bool return ParticleObject_Ffi.set_visible(this, value);
	public var x(get, set):Single;

	inline function get_x():Single return ParticleObject_Ffi.get_x(this);

	inline function set_x(value:Single):Single return ParticleObject_Ffi.set_x(this, value);
	public var y(get, set):Single;

	inline function get_y():Single return ParticleObject_Ffi.get_y(this);

	inline function set_y(value:Single):Single return ParticleObject_Ffi.set_y(this, value);
}
