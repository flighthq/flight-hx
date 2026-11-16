package flight._hl;

private extern class Physics2DWeldJoint_Ffi {
	@:hlNative("flight", "flight_get_physics2_dweld_joint_reference_angle")
	static function get_referenceAngle(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dweld_joint_reference_angle")
	static function set_referenceAngle(ptr:hl.Bytes, value:Single):Single;
}

abstract Physics2DWeldJoint(hl.Bytes) {
	public var referenceAngle(get, set):Single;

	inline function get_referenceAngle():Single return Physics2DWeldJoint_Ffi.get_referenceAngle(this);
	inline function set_referenceAngle(value:Single):Single { Physics2DWeldJoint_Ffi.set_referenceAngle(this, value); return value; }
}
