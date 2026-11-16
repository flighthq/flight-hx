package flight._hl;

private extern class Physics2DPulleyJoint_Ffi {
	@:hlNative("flight", "flight_get_physics2_dpulley_joint_constant")
	static function get_constant(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dpulley_joint_constant")
	static function set_constant(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_physics2_dpulley_joint_ground_anchor_ax")
	static function get_groundAnchorAx(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dpulley_joint_ground_anchor_ax")
	static function set_groundAnchorAx(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_physics2_dpulley_joint_ground_anchor_ay")
	static function get_groundAnchorAy(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dpulley_joint_ground_anchor_ay")
	static function set_groundAnchorAy(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_physics2_dpulley_joint_ground_anchor_bx")
	static function get_groundAnchorBx(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dpulley_joint_ground_anchor_bx")
	static function set_groundAnchorBx(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_physics2_dpulley_joint_ground_anchor_by")
	static function get_groundAnchorBy(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dpulley_joint_ground_anchor_by")
	static function set_groundAnchorBy(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_physics2_dpulley_joint_ratio")
	static function get_ratio(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_physics2_dpulley_joint_ratio")
	static function set_ratio(ptr:hl.Bytes, value:Single):Single;
}

abstract Physics2DPulleyJoint(hl.Bytes) {
	public var constant(get, set):Single;

	inline function get_constant():Single return Physics2DPulleyJoint_Ffi.get_constant(this);
	inline function set_constant(value:Single):Single { Physics2DPulleyJoint_Ffi.set_constant(this, value); return value; }
	public var groundAnchorAx(get, set):Single;

	inline function get_groundAnchorAx():Single return Physics2DPulleyJoint_Ffi.get_groundAnchorAx(this);
	inline function set_groundAnchorAx(value:Single):Single { Physics2DPulleyJoint_Ffi.set_groundAnchorAx(this, value); return value; }
	public var groundAnchorAy(get, set):Single;

	inline function get_groundAnchorAy():Single return Physics2DPulleyJoint_Ffi.get_groundAnchorAy(this);
	inline function set_groundAnchorAy(value:Single):Single { Physics2DPulleyJoint_Ffi.set_groundAnchorAy(this, value); return value; }
	public var groundAnchorBx(get, set):Single;

	inline function get_groundAnchorBx():Single return Physics2DPulleyJoint_Ffi.get_groundAnchorBx(this);
	inline function set_groundAnchorBx(value:Single):Single { Physics2DPulleyJoint_Ffi.set_groundAnchorBx(this, value); return value; }
	public var groundAnchorBy(get, set):Single;

	inline function get_groundAnchorBy():Single return Physics2DPulleyJoint_Ffi.get_groundAnchorBy(this);
	inline function set_groundAnchorBy(value:Single):Single { Physics2DPulleyJoint_Ffi.set_groundAnchorBy(this, value); return value; }
	public var ratio(get, set):Single;

	inline function get_ratio():Single return Physics2DPulleyJoint_Ffi.get_ratio(this);
	inline function set_ratio(value:Single):Single { Physics2DPulleyJoint_Ffi.set_ratio(this, value); return value; }
}
