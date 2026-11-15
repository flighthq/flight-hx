package flight._cpp;

private extern class Physics2DGearJoint_Ffi {
	@:native("flight_get_physics2_dgear_joint_axis_ax") static function get_axisAx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dgear_joint_axis_ax") static function set_axisAx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dgear_joint_axis_ay") static function get_axisAy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dgear_joint_axis_ay") static function set_axisAy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dgear_joint_axis_bx") static function get_axisBx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dgear_joint_axis_bx") static function set_axisBx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dgear_joint_axis_by") static function get_axisBy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dgear_joint_axis_by") static function set_axisBy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dgear_joint_constant") static function get_constant(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dgear_joint_constant") static function set_constant(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dgear_joint_ratio") static function get_ratio(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dgear_joint_ratio") static function set_ratio(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DGearJoint(cpp.Star<cpp.Void>) {
	public var axisAx(get, set):Single;

	inline function get_axisAx():Single return Physics2DGearJoint_Ffi.get_axisAx(this);

	inline function set_axisAx(value:Single):Single return Physics2DGearJoint_Ffi.set_axisAx(this, value);
	public var axisAy(get, set):Single;

	inline function get_axisAy():Single return Physics2DGearJoint_Ffi.get_axisAy(this);

	inline function set_axisAy(value:Single):Single return Physics2DGearJoint_Ffi.set_axisAy(this, value);
	public var axisBx(get, set):Single;

	inline function get_axisBx():Single return Physics2DGearJoint_Ffi.get_axisBx(this);

	inline function set_axisBx(value:Single):Single return Physics2DGearJoint_Ffi.set_axisBx(this, value);
	public var axisBy(get, set):Single;

	inline function get_axisBy():Single return Physics2DGearJoint_Ffi.get_axisBy(this);

	inline function set_axisBy(value:Single):Single return Physics2DGearJoint_Ffi.set_axisBy(this, value);
	public var constant(get, set):Single;

	inline function get_constant():Single return Physics2DGearJoint_Ffi.get_constant(this);

	inline function set_constant(value:Single):Single return Physics2DGearJoint_Ffi.set_constant(this, value);
	public var ratio(get, set):Single;

	inline function get_ratio():Single return Physics2DGearJoint_Ffi.get_ratio(this);

	inline function set_ratio(value:Single):Single return Physics2DGearJoint_Ffi.set_ratio(this, value);
}
