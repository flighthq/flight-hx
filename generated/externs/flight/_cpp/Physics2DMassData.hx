package flight._cpp;

private extern class Physics2DMassData_Ffi {
	@:native("flight_get_physics2_dmass_data_center_x") static function get_centerX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dmass_data_center_x") static function set_centerX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dmass_data_center_y") static function get_centerY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dmass_data_center_y") static function set_centerY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dmass_data_inertia") static function get_inertia(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dmass_data_inertia") static function set_inertia(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dmass_data_mass") static function get_mass(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dmass_data_mass") static function set_mass(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics2DMassData(cpp.Star<cpp.Void>) {
	public var centerX(get, set):Float;

	inline function get_centerX():Float return Physics2DMassData_Ffi.get_centerX(this);

	inline function set_centerX(value:Float):Float { Physics2DMassData_Ffi.set_centerX(this, value); return value; }
	public var centerY(get, set):Float;

	inline function get_centerY():Float return Physics2DMassData_Ffi.get_centerY(this);

	inline function set_centerY(value:Float):Float { Physics2DMassData_Ffi.set_centerY(this, value); return value; }
	public var inertia(get, set):Float;

	inline function get_inertia():Float return Physics2DMassData_Ffi.get_inertia(this);

	inline function set_inertia(value:Float):Float { Physics2DMassData_Ffi.set_inertia(this, value); return value; }
	public var mass(get, set):Float;

	inline function get_mass():Float return Physics2DMassData_Ffi.get_mass(this);

	inline function set_mass(value:Float):Float { Physics2DMassData_Ffi.set_mass(this, value); return value; }
}
