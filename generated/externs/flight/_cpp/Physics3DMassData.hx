package flight._cpp;

private extern class Physics3DMassData_Ffi {
	@:native("flight_get_physics3_dmass_data_mass") static function get_mass(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dmass_data_mass") static function set_mass(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dmass_data_inertia_xx") static function get_inertiaXx(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dmass_data_inertia_xx") static function set_inertiaXx(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dmass_data_inertia_yy") static function get_inertiaYy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dmass_data_inertia_yy") static function set_inertiaYy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dmass_data_inertia_zz") static function get_inertiaZz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dmass_data_inertia_zz") static function set_inertiaZz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dmass_data_inertia_xy") static function get_inertiaXy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dmass_data_inertia_xy") static function set_inertiaXy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dmass_data_inertia_xz") static function get_inertiaXz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dmass_data_inertia_xz") static function set_inertiaXz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dmass_data_inertia_yz") static function get_inertiaYz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dmass_data_inertia_yz") static function set_inertiaYz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dmass_data_center_x") static function get_centerX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dmass_data_center_x") static function set_centerX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dmass_data_center_y") static function get_centerY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dmass_data_center_y") static function set_centerY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_dmass_data_center_z") static function get_centerZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_dmass_data_center_z") static function set_centerZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics3DMassData(cpp.Star<cpp.Void>) {
	public var mass(get, set):Float;

	inline function get_mass():Float return Physics3DMassData_Ffi.get_mass(this);

	inline function set_mass(value:Float):Float { Physics3DMassData_Ffi.set_mass(this, value); return value; }
	public var inertiaXx(get, set):Float;

	inline function get_inertiaXx():Float return Physics3DMassData_Ffi.get_inertiaXx(this);

	inline function set_inertiaXx(value:Float):Float { Physics3DMassData_Ffi.set_inertiaXx(this, value); return value; }
	public var inertiaYy(get, set):Float;

	inline function get_inertiaYy():Float return Physics3DMassData_Ffi.get_inertiaYy(this);

	inline function set_inertiaYy(value:Float):Float { Physics3DMassData_Ffi.set_inertiaYy(this, value); return value; }
	public var inertiaZz(get, set):Float;

	inline function get_inertiaZz():Float return Physics3DMassData_Ffi.get_inertiaZz(this);

	inline function set_inertiaZz(value:Float):Float { Physics3DMassData_Ffi.set_inertiaZz(this, value); return value; }
	public var inertiaXy(get, set):Float;

	inline function get_inertiaXy():Float return Physics3DMassData_Ffi.get_inertiaXy(this);

	inline function set_inertiaXy(value:Float):Float { Physics3DMassData_Ffi.set_inertiaXy(this, value); return value; }
	public var inertiaXz(get, set):Float;

	inline function get_inertiaXz():Float return Physics3DMassData_Ffi.get_inertiaXz(this);

	inline function set_inertiaXz(value:Float):Float { Physics3DMassData_Ffi.set_inertiaXz(this, value); return value; }
	public var inertiaYz(get, set):Float;

	inline function get_inertiaYz():Float return Physics3DMassData_Ffi.get_inertiaYz(this);

	inline function set_inertiaYz(value:Float):Float { Physics3DMassData_Ffi.set_inertiaYz(this, value); return value; }
	public var centerX(get, set):Float;

	inline function get_centerX():Float return Physics3DMassData_Ffi.get_centerX(this);

	inline function set_centerX(value:Float):Float { Physics3DMassData_Ffi.set_centerX(this, value); return value; }
	public var centerY(get, set):Float;

	inline function get_centerY():Float return Physics3DMassData_Ffi.get_centerY(this);

	inline function set_centerY(value:Float):Float { Physics3DMassData_Ffi.set_centerY(this, value); return value; }
	public var centerZ(get, set):Float;

	inline function get_centerZ():Float return Physics3DMassData_Ffi.get_centerZ(this);

	inline function set_centerZ(value:Float):Float { Physics3DMassData_Ffi.set_centerZ(this, value); return value; }
}
