package flight._cpp;

private extern class Physics3DMassData_Ffi {
	@:native("flight_get_physics3_dmass_data_mass") static function get_mass(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dmass_data_mass") static function set_mass(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dmass_data_inertia_xx") static function get_inertiaXx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dmass_data_inertia_xx") static function set_inertiaXx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dmass_data_inertia_yy") static function get_inertiaYy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dmass_data_inertia_yy") static function set_inertiaYy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dmass_data_inertia_zz") static function get_inertiaZz(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dmass_data_inertia_zz") static function set_inertiaZz(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dmass_data_inertia_xy") static function get_inertiaXy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dmass_data_inertia_xy") static function set_inertiaXy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dmass_data_inertia_xz") static function get_inertiaXz(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dmass_data_inertia_xz") static function set_inertiaXz(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dmass_data_inertia_yz") static function get_inertiaYz(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dmass_data_inertia_yz") static function set_inertiaYz(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dmass_data_center_x") static function get_centerX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dmass_data_center_x") static function set_centerX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dmass_data_center_y") static function get_centerY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dmass_data_center_y") static function set_centerY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dmass_data_center_z") static function get_centerZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dmass_data_center_z") static function set_centerZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics3DMassData(cpp.Star<cpp.Void>) {
	public var mass(get, set):Single;

	inline function get_mass():Single return Physics3DMassData_Ffi.get_mass(this);

	inline function set_mass(value:Single):Single { Physics3DMassData_Ffi.set_mass(this, value); return value; }
	public var inertiaXx(get, set):Single;

	inline function get_inertiaXx():Single return Physics3DMassData_Ffi.get_inertiaXx(this);

	inline function set_inertiaXx(value:Single):Single { Physics3DMassData_Ffi.set_inertiaXx(this, value); return value; }
	public var inertiaYy(get, set):Single;

	inline function get_inertiaYy():Single return Physics3DMassData_Ffi.get_inertiaYy(this);

	inline function set_inertiaYy(value:Single):Single { Physics3DMassData_Ffi.set_inertiaYy(this, value); return value; }
	public var inertiaZz(get, set):Single;

	inline function get_inertiaZz():Single return Physics3DMassData_Ffi.get_inertiaZz(this);

	inline function set_inertiaZz(value:Single):Single { Physics3DMassData_Ffi.set_inertiaZz(this, value); return value; }
	public var inertiaXy(get, set):Single;

	inline function get_inertiaXy():Single return Physics3DMassData_Ffi.get_inertiaXy(this);

	inline function set_inertiaXy(value:Single):Single { Physics3DMassData_Ffi.set_inertiaXy(this, value); return value; }
	public var inertiaXz(get, set):Single;

	inline function get_inertiaXz():Single return Physics3DMassData_Ffi.get_inertiaXz(this);

	inline function set_inertiaXz(value:Single):Single { Physics3DMassData_Ffi.set_inertiaXz(this, value); return value; }
	public var inertiaYz(get, set):Single;

	inline function get_inertiaYz():Single return Physics3DMassData_Ffi.get_inertiaYz(this);

	inline function set_inertiaYz(value:Single):Single { Physics3DMassData_Ffi.set_inertiaYz(this, value); return value; }
	public var centerX(get, set):Single;

	inline function get_centerX():Single return Physics3DMassData_Ffi.get_centerX(this);

	inline function set_centerX(value:Single):Single { Physics3DMassData_Ffi.set_centerX(this, value); return value; }
	public var centerY(get, set):Single;

	inline function get_centerY():Single return Physics3DMassData_Ffi.get_centerY(this);

	inline function set_centerY(value:Single):Single { Physics3DMassData_Ffi.set_centerY(this, value); return value; }
	public var centerZ(get, set):Single;

	inline function get_centerZ():Single return Physics3DMassData_Ffi.get_centerZ(this);

	inline function set_centerZ(value:Single):Single { Physics3DMassData_Ffi.set_centerZ(this, value); return value; }
}
