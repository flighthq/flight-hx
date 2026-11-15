package flight._js;

@:jsRequire("flight")
private extern class Physics2DPulleyJoint_Ffi {
	@:native("flight_get_physics2_dpulley_joint_constant") static function get_constant(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dpulley_joint_constant") static function set_constant(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dpulley_joint_ground_anchor_ax") static function get_groundAnchorAx(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dpulley_joint_ground_anchor_ax") static function set_groundAnchorAx(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dpulley_joint_ground_anchor_ay") static function get_groundAnchorAy(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dpulley_joint_ground_anchor_ay") static function set_groundAnchorAy(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dpulley_joint_ground_anchor_bx") static function get_groundAnchorBx(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dpulley_joint_ground_anchor_bx") static function set_groundAnchorBx(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dpulley_joint_ground_anchor_by") static function get_groundAnchorBy(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dpulley_joint_ground_anchor_by") static function set_groundAnchorBy(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_dpulley_joint_ratio") static function get_ratio(ptr:Dynamic):Float;
	@:native("flight_set_physics2_dpulley_joint_ratio") static function set_ratio(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DPulleyJoint(Dynamic) {
	public var constant(get, set):Float;

	inline function get_constant():Float return Physics2DPulleyJoint_Ffi.get_constant(this);

	inline function set_constant(value:Float):Float return Physics2DPulleyJoint_Ffi.set_constant(this, value);
	public var groundAnchorAx(get, set):Float;

	inline function get_groundAnchorAx():Float return Physics2DPulleyJoint_Ffi.get_groundAnchorAx(this);

	inline function set_groundAnchorAx(value:Float):Float return Physics2DPulleyJoint_Ffi.set_groundAnchorAx(this, value);
	public var groundAnchorAy(get, set):Float;

	inline function get_groundAnchorAy():Float return Physics2DPulleyJoint_Ffi.get_groundAnchorAy(this);

	inline function set_groundAnchorAy(value:Float):Float return Physics2DPulleyJoint_Ffi.set_groundAnchorAy(this, value);
	public var groundAnchorBx(get, set):Float;

	inline function get_groundAnchorBx():Float return Physics2DPulleyJoint_Ffi.get_groundAnchorBx(this);

	inline function set_groundAnchorBx(value:Float):Float return Physics2DPulleyJoint_Ffi.set_groundAnchorBx(this, value);
	public var groundAnchorBy(get, set):Float;

	inline function get_groundAnchorBy():Float return Physics2DPulleyJoint_Ffi.get_groundAnchorBy(this);

	inline function set_groundAnchorBy(value:Float):Float return Physics2DPulleyJoint_Ffi.set_groundAnchorBy(this, value);
	public var ratio(get, set):Float;

	inline function get_ratio():Float return Physics2DPulleyJoint_Ffi.get_ratio(this);

	inline function set_ratio(value:Float):Float return Physics2DPulleyJoint_Ffi.set_ratio(this, value);
}
