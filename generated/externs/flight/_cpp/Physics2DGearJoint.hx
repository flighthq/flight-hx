package flight._cpp;

private extern class Physics2DGearJoint_Ffi {
	@:native("flight_get_physics2_dgear_joint_axis_ax") static function get_axisAx(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dgear_joint_axis_ax") static function set_axisAx(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dgear_joint_axis_ay") static function get_axisAy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dgear_joint_axis_ay") static function set_axisAy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dgear_joint_axis_bx") static function get_axisBx(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dgear_joint_axis_bx") static function set_axisBx(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dgear_joint_axis_by") static function get_axisBy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dgear_joint_axis_by") static function set_axisBy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dgear_joint_constant") static function get_constant(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dgear_joint_constant") static function set_constant(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics2_dgear_joint_ratio") static function get_ratio(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics2_dgear_joint_ratio") static function set_ratio(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics2DGearJoint(cpp.Star<cpp.Void>) {
	public var axisAx(get, set):Float;

	inline function get_axisAx():Float return Physics2DGearJoint_Ffi.get_axisAx(this);

	inline function set_axisAx(value:Float):Float { Physics2DGearJoint_Ffi.set_axisAx(this, value); return value; }
	public var axisAy(get, set):Float;

	inline function get_axisAy():Float return Physics2DGearJoint_Ffi.get_axisAy(this);

	inline function set_axisAy(value:Float):Float { Physics2DGearJoint_Ffi.set_axisAy(this, value); return value; }
	public var axisBx(get, set):Float;

	inline function get_axisBx():Float return Physics2DGearJoint_Ffi.get_axisBx(this);

	inline function set_axisBx(value:Float):Float { Physics2DGearJoint_Ffi.set_axisBx(this, value); return value; }
	public var axisBy(get, set):Float;

	inline function get_axisBy():Float return Physics2DGearJoint_Ffi.get_axisBy(this);

	inline function set_axisBy(value:Float):Float { Physics2DGearJoint_Ffi.set_axisBy(this, value); return value; }
	public var constant(get, set):Float;

	inline function get_constant():Float return Physics2DGearJoint_Ffi.get_constant(this);

	inline function set_constant(value:Float):Float { Physics2DGearJoint_Ffi.set_constant(this, value); return value; }
	public var ratio(get, set):Float;

	inline function get_ratio():Float return Physics2DGearJoint_Ffi.get_ratio(this);

	inline function set_ratio(value:Float):Float { Physics2DGearJoint_Ffi.set_ratio(this, value); return value; }
}
