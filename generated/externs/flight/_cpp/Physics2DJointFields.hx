package flight._cpp;

private extern class Physics2DJointFields_Ffi {
	@:native("flight_get_physics2_djoint_fields_body_a") static function get_bodyA(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_djoint_fields_body_a") static function set_bodyA(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_djoint_fields_body_b") static function get_bodyB(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics2_djoint_fields_body_b") static function set_bodyB(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics2_djoint_fields_break_force") static function get_breakForce(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_djoint_fields_break_force") static function set_breakForce(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_djoint_fields_break_torque") static function get_breakTorque(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_djoint_fields_break_torque") static function set_breakTorque(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_djoint_fields_collide_connected") static function get_collideConnected(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics2_djoint_fields_collide_connected") static function set_collideConnected(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics2_djoint_fields_impulse0") static function get_impulse0(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_djoint_fields_impulse0") static function set_impulse0(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_djoint_fields_impulse1") static function get_impulse1(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_djoint_fields_impulse1") static function set_impulse1(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_djoint_fields_impulse2") static function get_impulse2(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_djoint_fields_impulse2") static function set_impulse2(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_djoint_fields_local_anchor_ax") static function get_localAnchorAx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_djoint_fields_local_anchor_ax") static function set_localAnchorAx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_djoint_fields_local_anchor_ay") static function get_localAnchorAy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_djoint_fields_local_anchor_ay") static function set_localAnchorAy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_djoint_fields_local_anchor_bx") static function get_localAnchorBx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_djoint_fields_local_anchor_bx") static function set_localAnchorBx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_djoint_fields_local_anchor_by") static function get_localAnchorBy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_djoint_fields_local_anchor_by") static function set_localAnchorBy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_djoint_fields_r_ax") static function get_rAx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_djoint_fields_r_ax") static function set_rAx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_djoint_fields_r_ay") static function get_rAy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_djoint_fields_r_ay") static function set_rAy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_djoint_fields_r_bx") static function get_rBx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_djoint_fields_r_bx") static function set_rBx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_physics2_djoint_fields_r_by") static function get_rBy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_physics2_djoint_fields_r_by") static function set_rBy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Physics2DJointFields(cpp.Star<cpp.Void>) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return Physics2DJointFields_Ffi.get_bodyA(this);

	inline function set_bodyA(value:Int):Int return Physics2DJointFields_Ffi.set_bodyA(this, value);
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return Physics2DJointFields_Ffi.get_bodyB(this);

	inline function set_bodyB(value:Int):Int return Physics2DJointFields_Ffi.set_bodyB(this, value);
	public var breakForce(get, set):Single;

	inline function get_breakForce():Single return Physics2DJointFields_Ffi.get_breakForce(this);

	inline function set_breakForce(value:Single):Single return Physics2DJointFields_Ffi.set_breakForce(this, value);
	public var breakTorque(get, set):Single;

	inline function get_breakTorque():Single return Physics2DJointFields_Ffi.get_breakTorque(this);

	inline function set_breakTorque(value:Single):Single return Physics2DJointFields_Ffi.set_breakTorque(this, value);
	public var collideConnected(get, set):Bool;

	inline function get_collideConnected():Bool return Physics2DJointFields_Ffi.get_collideConnected(this);

	inline function set_collideConnected(value:Bool):Bool return Physics2DJointFields_Ffi.set_collideConnected(this, value);
	public var impulse0(get, set):Single;

	inline function get_impulse0():Single return Physics2DJointFields_Ffi.get_impulse0(this);

	inline function set_impulse0(value:Single):Single return Physics2DJointFields_Ffi.set_impulse0(this, value);
	public var impulse1(get, set):Single;

	inline function get_impulse1():Single return Physics2DJointFields_Ffi.get_impulse1(this);

	inline function set_impulse1(value:Single):Single return Physics2DJointFields_Ffi.set_impulse1(this, value);
	public var impulse2(get, set):Single;

	inline function get_impulse2():Single return Physics2DJointFields_Ffi.get_impulse2(this);

	inline function set_impulse2(value:Single):Single return Physics2DJointFields_Ffi.set_impulse2(this, value);
	public var localAnchorAx(get, set):Single;

	inline function get_localAnchorAx():Single return Physics2DJointFields_Ffi.get_localAnchorAx(this);

	inline function set_localAnchorAx(value:Single):Single return Physics2DJointFields_Ffi.set_localAnchorAx(this, value);
	public var localAnchorAy(get, set):Single;

	inline function get_localAnchorAy():Single return Physics2DJointFields_Ffi.get_localAnchorAy(this);

	inline function set_localAnchorAy(value:Single):Single return Physics2DJointFields_Ffi.set_localAnchorAy(this, value);
	public var localAnchorBx(get, set):Single;

	inline function get_localAnchorBx():Single return Physics2DJointFields_Ffi.get_localAnchorBx(this);

	inline function set_localAnchorBx(value:Single):Single return Physics2DJointFields_Ffi.set_localAnchorBx(this, value);
	public var localAnchorBy(get, set):Single;

	inline function get_localAnchorBy():Single return Physics2DJointFields_Ffi.get_localAnchorBy(this);

	inline function set_localAnchorBy(value:Single):Single return Physics2DJointFields_Ffi.set_localAnchorBy(this, value);
	public var rAx(get, set):Single;

	inline function get_rAx():Single return Physics2DJointFields_Ffi.get_rAx(this);

	inline function set_rAx(value:Single):Single return Physics2DJointFields_Ffi.set_rAx(this, value);
	public var rAy(get, set):Single;

	inline function get_rAy():Single return Physics2DJointFields_Ffi.get_rAy(this);

	inline function set_rAy(value:Single):Single return Physics2DJointFields_Ffi.set_rAy(this, value);
	public var rBx(get, set):Single;

	inline function get_rBx():Single return Physics2DJointFields_Ffi.get_rBx(this);

	inline function set_rBx(value:Single):Single return Physics2DJointFields_Ffi.set_rBx(this, value);
	public var rBy(get, set):Single;

	inline function get_rBy():Single return Physics2DJointFields_Ffi.get_rBy(this);

	inline function set_rBy(value:Single):Single return Physics2DJointFields_Ffi.set_rBy(this, value);
}
