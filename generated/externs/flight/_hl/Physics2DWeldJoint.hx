package flight._hl;

private extern class Physics2DWeldJoint_Ffi {
	@:hlNative("flight", "flight_get_physics2_dweld_joint_reference_angle")
	static function get_referenceAngle(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_physics2_dweld_joint_reference_angle")
	static function set_referenceAngle(ptr:hl.Bytes, value:Float):Float;
}

abstract Physics2DWeldJoint(hl.Bytes) {
	public var referenceAngle(get, set):Float;

	inline function get_referenceAngle():Float return Physics2DWeldJoint_Ffi.get_referenceAngle(this);

	inline function set_referenceAngle(value:Float):Float { Physics2DWeldJoint_Ffi.set_referenceAngle(this, value); return value; }
}
