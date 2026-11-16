package flight._cpp;

private extern class Physics3DGeneric6DofJoint_Ffi {
	@:native("flight_get_physics3_dgeneric6_dof_joint_lower_linear_x") static function get_lowerLinearX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dgeneric6_dof_joint_lower_linear_x") static function set_lowerLinearX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dgeneric6_dof_joint_lower_linear_y") static function get_lowerLinearY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dgeneric6_dof_joint_lower_linear_y") static function set_lowerLinearY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dgeneric6_dof_joint_lower_linear_z") static function get_lowerLinearZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dgeneric6_dof_joint_lower_linear_z") static function set_lowerLinearZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dgeneric6_dof_joint_upper_linear_x") static function get_upperLinearX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dgeneric6_dof_joint_upper_linear_x") static function set_upperLinearX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dgeneric6_dof_joint_upper_linear_y") static function get_upperLinearY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dgeneric6_dof_joint_upper_linear_y") static function set_upperLinearY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dgeneric6_dof_joint_upper_linear_z") static function get_upperLinearZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dgeneric6_dof_joint_upper_linear_z") static function set_upperLinearZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dgeneric6_dof_joint_lower_angular_x") static function get_lowerAngularX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dgeneric6_dof_joint_lower_angular_x") static function set_lowerAngularX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dgeneric6_dof_joint_lower_angular_y") static function get_lowerAngularY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dgeneric6_dof_joint_lower_angular_y") static function set_lowerAngularY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dgeneric6_dof_joint_lower_angular_z") static function get_lowerAngularZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dgeneric6_dof_joint_lower_angular_z") static function set_lowerAngularZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dgeneric6_dof_joint_upper_angular_x") static function get_upperAngularX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dgeneric6_dof_joint_upper_angular_x") static function set_upperAngularX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dgeneric6_dof_joint_upper_angular_y") static function get_upperAngularY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dgeneric6_dof_joint_upper_angular_y") static function set_upperAngularY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dgeneric6_dof_joint_upper_angular_z") static function get_upperAngularZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dgeneric6_dof_joint_upper_angular_z") static function set_upperAngularZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dgeneric6_dof_joint_enable_limit_spring") static function get_enableLimitSpring(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_dgeneric6_dof_joint_enable_limit_spring") static function set_enableLimitSpring(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_dgeneric6_dof_joint_limit_frequency_hz") static function get_limitFrequencyHz(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dgeneric6_dof_joint_limit_frequency_hz") static function set_limitFrequencyHz(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics3_dgeneric6_dof_joint_limit_damping_ratio") static function get_limitDampingRatio(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics3_dgeneric6_dof_joint_limit_damping_ratio") static function set_limitDampingRatio(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics3DGeneric6DofJoint(cpp.Star<cpp.Void>) {
	public var lowerLinearX(get, set):Single;

	inline function get_lowerLinearX():Single return Physics3DGeneric6DofJoint_Ffi.get_lowerLinearX(this);

	inline function set_lowerLinearX(value:Single):Single { Physics3DGeneric6DofJoint_Ffi.set_lowerLinearX(this, value); return value; }
	public var lowerLinearY(get, set):Single;

	inline function get_lowerLinearY():Single return Physics3DGeneric6DofJoint_Ffi.get_lowerLinearY(this);

	inline function set_lowerLinearY(value:Single):Single { Physics3DGeneric6DofJoint_Ffi.set_lowerLinearY(this, value); return value; }
	public var lowerLinearZ(get, set):Single;

	inline function get_lowerLinearZ():Single return Physics3DGeneric6DofJoint_Ffi.get_lowerLinearZ(this);

	inline function set_lowerLinearZ(value:Single):Single { Physics3DGeneric6DofJoint_Ffi.set_lowerLinearZ(this, value); return value; }
	public var upperLinearX(get, set):Single;

	inline function get_upperLinearX():Single return Physics3DGeneric6DofJoint_Ffi.get_upperLinearX(this);

	inline function set_upperLinearX(value:Single):Single { Physics3DGeneric6DofJoint_Ffi.set_upperLinearX(this, value); return value; }
	public var upperLinearY(get, set):Single;

	inline function get_upperLinearY():Single return Physics3DGeneric6DofJoint_Ffi.get_upperLinearY(this);

	inline function set_upperLinearY(value:Single):Single { Physics3DGeneric6DofJoint_Ffi.set_upperLinearY(this, value); return value; }
	public var upperLinearZ(get, set):Single;

	inline function get_upperLinearZ():Single return Physics3DGeneric6DofJoint_Ffi.get_upperLinearZ(this);

	inline function set_upperLinearZ(value:Single):Single { Physics3DGeneric6DofJoint_Ffi.set_upperLinearZ(this, value); return value; }
	public var lowerAngularX(get, set):Single;

	inline function get_lowerAngularX():Single return Physics3DGeneric6DofJoint_Ffi.get_lowerAngularX(this);

	inline function set_lowerAngularX(value:Single):Single { Physics3DGeneric6DofJoint_Ffi.set_lowerAngularX(this, value); return value; }
	public var lowerAngularY(get, set):Single;

	inline function get_lowerAngularY():Single return Physics3DGeneric6DofJoint_Ffi.get_lowerAngularY(this);

	inline function set_lowerAngularY(value:Single):Single { Physics3DGeneric6DofJoint_Ffi.set_lowerAngularY(this, value); return value; }
	public var lowerAngularZ(get, set):Single;

	inline function get_lowerAngularZ():Single return Physics3DGeneric6DofJoint_Ffi.get_lowerAngularZ(this);

	inline function set_lowerAngularZ(value:Single):Single { Physics3DGeneric6DofJoint_Ffi.set_lowerAngularZ(this, value); return value; }
	public var upperAngularX(get, set):Single;

	inline function get_upperAngularX():Single return Physics3DGeneric6DofJoint_Ffi.get_upperAngularX(this);

	inline function set_upperAngularX(value:Single):Single { Physics3DGeneric6DofJoint_Ffi.set_upperAngularX(this, value); return value; }
	public var upperAngularY(get, set):Single;

	inline function get_upperAngularY():Single return Physics3DGeneric6DofJoint_Ffi.get_upperAngularY(this);

	inline function set_upperAngularY(value:Single):Single { Physics3DGeneric6DofJoint_Ffi.set_upperAngularY(this, value); return value; }
	public var upperAngularZ(get, set):Single;

	inline function get_upperAngularZ():Single return Physics3DGeneric6DofJoint_Ffi.get_upperAngularZ(this);

	inline function set_upperAngularZ(value:Single):Single { Physics3DGeneric6DofJoint_Ffi.set_upperAngularZ(this, value); return value; }
	public var enableLimitSpring(get, set):Bool;

	inline function get_enableLimitSpring():Bool return Physics3DGeneric6DofJoint_Ffi.get_enableLimitSpring(this);

	inline function set_enableLimitSpring(value:Bool):Bool { Physics3DGeneric6DofJoint_Ffi.set_enableLimitSpring(this, value); return value; }
	public var limitFrequencyHz(get, set):Single;

	inline function get_limitFrequencyHz():Single return Physics3DGeneric6DofJoint_Ffi.get_limitFrequencyHz(this);

	inline function set_limitFrequencyHz(value:Single):Single { Physics3DGeneric6DofJoint_Ffi.set_limitFrequencyHz(this, value); return value; }
	public var limitDampingRatio(get, set):Single;

	inline function get_limitDampingRatio():Single return Physics3DGeneric6DofJoint_Ffi.get_limitDampingRatio(this);

	inline function set_limitDampingRatio(value:Single):Single { Physics3DGeneric6DofJoint_Ffi.set_limitDampingRatio(this, value); return value; }
}
