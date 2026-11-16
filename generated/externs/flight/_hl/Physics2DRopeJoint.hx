package flight._hl;

private extern class Physics2DRopeJoint_Ffi {
	@:hlNative("flight", "flight_get_physics2_drope_joint_max_length")
	static function get_maxLength(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_drope_joint_max_length")
	static function set_maxLength(ptr:hl.Bytes, value:Single):Single;
}

abstract Physics2DRopeJoint(hl.Bytes) {
	public var maxLength(get, set):Single;

	inline function get_maxLength():Single return Physics2DRopeJoint_Ffi.get_maxLength(this);
	inline function set_maxLength(value:Single):Single { Physics2DRopeJoint_Ffi.set_maxLength(this, value); return value; }
}
