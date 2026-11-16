package flight._cpp;

private extern class Physics2DPulleyJoint_Ffi {
	@:native("flight_get_physics2_dpulley_joint_constant") static function get_constant(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dpulley_joint_constant") static function set_constant(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dpulley_joint_ground_anchor_ax") static function get_groundAnchorAx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dpulley_joint_ground_anchor_ax") static function set_groundAnchorAx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dpulley_joint_ground_anchor_ay") static function get_groundAnchorAy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dpulley_joint_ground_anchor_ay") static function set_groundAnchorAy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dpulley_joint_ground_anchor_bx") static function get_groundAnchorBx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dpulley_joint_ground_anchor_bx") static function set_groundAnchorBx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dpulley_joint_ground_anchor_by") static function get_groundAnchorBy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dpulley_joint_ground_anchor_by") static function set_groundAnchorBy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_dpulley_joint_ratio") static function get_ratio(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_dpulley_joint_ratio") static function set_ratio(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DPulleyJoint(cpp.Star<cpp.Void>) {
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
