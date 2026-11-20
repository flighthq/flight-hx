package flight._cpp;

private extern class Physics2DMaterial_Ffi {
	@:native("flight_get_physics2_dmaterial_density") static function get_density(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dmaterial_density") static function set_density(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dmaterial_friction") static function get_friction(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dmaterial_friction") static function set_friction(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dmaterial_restitution") static function get_restitution(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dmaterial_restitution") static function set_restitution(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics2DMaterial(cpp.Star<cpp.Void>) {
	public var density(get, set):Float;

	inline function get_density():Float return Physics2DMaterial_Ffi.get_density(this);

	inline function set_density(value:Float):Float { Physics2DMaterial_Ffi.set_density(this, value); return value; }
	public var friction(get, set):Float;

	inline function get_friction():Float return Physics2DMaterial_Ffi.get_friction(this);

	inline function set_friction(value:Float):Float { Physics2DMaterial_Ffi.set_friction(this, value); return value; }
	public var restitution(get, set):Float;

	inline function get_restitution():Float return Physics2DMaterial_Ffi.get_restitution(this);

	inline function set_restitution(value:Float):Float { Physics2DMaterial_Ffi.set_restitution(this, value); return value; }
}
