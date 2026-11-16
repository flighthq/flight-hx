package flight._cpp;

private extern class Physics2DMassData_Ffi {
	@:native("flight_get_physics2_dmass_data_center_x") static function get_centerX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dmass_data_center_x") static function set_centerX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dmass_data_center_y") static function get_centerY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dmass_data_center_y") static function set_centerY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dmass_data_inertia") static function get_inertia(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dmass_data_inertia") static function set_inertia(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dmass_data_mass") static function get_mass(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dmass_data_mass") static function set_mass(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DMassData(cpp.Star<cpp.Void>) {
	public var centerX(get, set):Single;

	inline function get_centerX():Single return Physics2DMassData_Ffi.get_centerX(this);

	inline function set_centerX(value:Single):Single { Physics2DMassData_Ffi.set_centerX(this, value); return value; }
	public var centerY(get, set):Single;

	inline function get_centerY():Single return Physics2DMassData_Ffi.get_centerY(this);

	inline function set_centerY(value:Single):Single { Physics2DMassData_Ffi.set_centerY(this, value); return value; }
	public var inertia(get, set):Single;

	inline function get_inertia():Single return Physics2DMassData_Ffi.get_inertia(this);

	inline function set_inertia(value:Single):Single { Physics2DMassData_Ffi.set_inertia(this, value); return value; }
	public var mass(get, set):Single;

	inline function get_mass():Single return Physics2DMassData_Ffi.get_mass(this);

	inline function set_mass(value:Single):Single { Physics2DMassData_Ffi.set_mass(this, value); return value; }
}
