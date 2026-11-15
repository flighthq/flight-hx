package flight._js;

@:jsRequire("flight")
private extern class Physics2DWeldJoint_Ffi {
	@:native("flight_get_physics2_dweld_joint_reference_angle") static function get_referenceAngle(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dweld_joint_reference_angle") static function set_referenceAngle(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DWeldJoint(Dynamic) {
	public var referenceAngle(get, set):Float;

	inline function get_referenceAngle():Float return Physics2DWeldJoint_Ffi.get_referenceAngle(this);

	inline function set_referenceAngle(value:Float):Float return Physics2DWeldJoint_Ffi.set_referenceAngle(this, value);
}
