package flight._js;

@:jsRequire("flight")
private extern class Physics2DMassData_Ffi {
	@:native("flight_get_physics2_dmass_data_center_x") static function get_centerX(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmass_data_center_x") static function set_centerX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dmass_data_center_y") static function get_centerY(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmass_data_center_y") static function set_centerY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dmass_data_inertia") static function get_inertia(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmass_data_inertia") static function set_inertia(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dmass_data_mass") static function get_mass(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dmass_data_mass") static function set_mass(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DMassData(Dynamic) {
	public var centerX(get, set):Float;

	inline function get_centerX():Float return Physics2DMassData_Ffi.get_centerX(this);

	inline function set_centerX(value:Float):Float return Physics2DMassData_Ffi.set_centerX(this, value);
	public var centerY(get, set):Float;

	inline function get_centerY():Float return Physics2DMassData_Ffi.get_centerY(this);

	inline function set_centerY(value:Float):Float return Physics2DMassData_Ffi.set_centerY(this, value);
	public var inertia(get, set):Float;

	inline function get_inertia():Float return Physics2DMassData_Ffi.get_inertia(this);

	inline function set_inertia(value:Float):Float return Physics2DMassData_Ffi.set_inertia(this, value);
	public var mass(get, set):Float;

	inline function get_mass():Float return Physics2DMassData_Ffi.get_mass(this);

	inline function set_mass(value:Float):Float return Physics2DMassData_Ffi.set_mass(this, value);
}
