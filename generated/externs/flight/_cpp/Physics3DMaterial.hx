package flight._cpp;

private extern class Physics3DMaterial_Ffi {
	@:native("flight_get_physics3_dmaterial_density") static function get_density(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dmaterial_density") static function set_density(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dmaterial_friction") static function get_friction(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dmaterial_friction") static function set_friction(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dmaterial_restitution") static function get_restitution(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dmaterial_restitution") static function set_restitution(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics3DMaterial(cpp.Star<cpp.Void>) {
	public var density(get, set):Single;

	inline function get_density():Single return Physics3DMaterial_Ffi.get_density(this);

	inline function set_density(value:Single):Single { Physics3DMaterial_Ffi.set_density(this, value); return value; }
	public var friction(get, set):Single;

	inline function get_friction():Single return Physics3DMaterial_Ffi.get_friction(this);

	inline function set_friction(value:Single):Single { Physics3DMaterial_Ffi.set_friction(this, value); return value; }
	public var restitution(get, set):Single;

	inline function get_restitution():Single return Physics3DMaterial_Ffi.get_restitution(this);

	inline function set_restitution(value:Single):Single { Physics3DMaterial_Ffi.set_restitution(this, value); return value; }
}
