package flight._cpp;

private extern class Physics2DWeldJoint_Ffi {
	@:native("flight_get_physics2_dweld_joint_reference_angle") static function get_referenceAngle(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dweld_joint_reference_angle") static function set_referenceAngle(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DWeldJoint(cpp.Star<cpp.Void>) {
	public var referenceAngle(get, set):Single;

	inline function get_referenceAngle():Single return Physics2DWeldJoint_Ffi.get_referenceAngle(this);

	inline function set_referenceAngle(value:Single):Single return Physics2DWeldJoint_Ffi.set_referenceAngle(this, value);
}
