package flight._js;

@:jsRequire("flight")
private extern class Physics2DJointFields_Ffi {
	@:native("flight_get_physics2_djoint_fields_body_a") static function get_bodyA(ptr:Dynamic):Int;
	@:native("flight_set_physics2_djoint_fields_body_a") static function set_bodyA(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_djoint_fields_body_b") static function get_bodyB(ptr:Dynamic):Int;
	@:native("flight_set_physics2_djoint_fields_body_b") static function set_bodyB(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_physics2_djoint_fields_break_force") static function get_breakForce(ptr:Dynamic):Float;
	@:native("flight_set_physics2_djoint_fields_break_force") static function set_breakForce(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_djoint_fields_break_torque") static function get_breakTorque(ptr:Dynamic):Float;
	@:native("flight_set_physics2_djoint_fields_break_torque") static function set_breakTorque(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_djoint_fields_collide_connected") static function get_collideConnected(ptr:Dynamic):Bool;
	@:native("flight_set_physics2_djoint_fields_collide_connected") static function set_collideConnected(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_physics2_djoint_fields_impulse0") static function get_impulse0(ptr:Dynamic):Float;
	@:native("flight_set_physics2_djoint_fields_impulse0") static function set_impulse0(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_djoint_fields_impulse1") static function get_impulse1(ptr:Dynamic):Float;
	@:native("flight_set_physics2_djoint_fields_impulse1") static function set_impulse1(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_djoint_fields_impulse2") static function get_impulse2(ptr:Dynamic):Float;
	@:native("flight_set_physics2_djoint_fields_impulse2") static function set_impulse2(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_djoint_fields_local_anchor_ax") static function get_localAnchorAx(ptr:Dynamic):Float;
	@:native("flight_set_physics2_djoint_fields_local_anchor_ax") static function set_localAnchorAx(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_djoint_fields_local_anchor_ay") static function get_localAnchorAy(ptr:Dynamic):Float;
	@:native("flight_set_physics2_djoint_fields_local_anchor_ay") static function set_localAnchorAy(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_djoint_fields_local_anchor_bx") static function get_localAnchorBx(ptr:Dynamic):Float;
	@:native("flight_set_physics2_djoint_fields_local_anchor_bx") static function set_localAnchorBx(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_djoint_fields_local_anchor_by") static function get_localAnchorBy(ptr:Dynamic):Float;
	@:native("flight_set_physics2_djoint_fields_local_anchor_by") static function set_localAnchorBy(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_djoint_fields_r_ax") static function get_rAx(ptr:Dynamic):Float;
	@:native("flight_set_physics2_djoint_fields_r_ax") static function set_rAx(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_djoint_fields_r_ay") static function get_rAy(ptr:Dynamic):Float;
	@:native("flight_set_physics2_djoint_fields_r_ay") static function set_rAy(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_djoint_fields_r_bx") static function get_rBx(ptr:Dynamic):Float;
	@:native("flight_set_physics2_djoint_fields_r_bx") static function set_rBx(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_physics2_djoint_fields_r_by") static function get_rBy(ptr:Dynamic):Float;
	@:native("flight_set_physics2_djoint_fields_r_by") static function set_rBy(ptr:Dynamic, value:Float):Float;
}

abstract Physics2DJointFields(Dynamic) {
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return Physics2DJointFields_Ffi.get_bodyA(this);

	inline function set_bodyA(value:Int):Int return Physics2DJointFields_Ffi.set_bodyA(this, value);
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return Physics2DJointFields_Ffi.get_bodyB(this);

	inline function set_bodyB(value:Int):Int return Physics2DJointFields_Ffi.set_bodyB(this, value);
	public var breakForce(get, set):Float;

	inline function get_breakForce():Float return Physics2DJointFields_Ffi.get_breakForce(this);

	inline function set_breakForce(value:Float):Float return Physics2DJointFields_Ffi.set_breakForce(this, value);
	public var breakTorque(get, set):Float;

	inline function get_breakTorque():Float return Physics2DJointFields_Ffi.get_breakTorque(this);

	inline function set_breakTorque(value:Float):Float return Physics2DJointFields_Ffi.set_breakTorque(this, value);
	public var collideConnected(get, set):Bool;

	inline function get_collideConnected():Bool return Physics2DJointFields_Ffi.get_collideConnected(this);

	inline function set_collideConnected(value:Bool):Bool return Physics2DJointFields_Ffi.set_collideConnected(this, value);
	public var impulse0(get, set):Float;

	inline function get_impulse0():Float return Physics2DJointFields_Ffi.get_impulse0(this);

	inline function set_impulse0(value:Float):Float return Physics2DJointFields_Ffi.set_impulse0(this, value);
	public var impulse1(get, set):Float;

	inline function get_impulse1():Float return Physics2DJointFields_Ffi.get_impulse1(this);

	inline function set_impulse1(value:Float):Float return Physics2DJointFields_Ffi.set_impulse1(this, value);
	public var impulse2(get, set):Float;

	inline function get_impulse2():Float return Physics2DJointFields_Ffi.get_impulse2(this);

	inline function set_impulse2(value:Float):Float return Physics2DJointFields_Ffi.set_impulse2(this, value);
	public var localAnchorAx(get, set):Float;

	inline function get_localAnchorAx():Float return Physics2DJointFields_Ffi.get_localAnchorAx(this);

	inline function set_localAnchorAx(value:Float):Float return Physics2DJointFields_Ffi.set_localAnchorAx(this, value);
	public var localAnchorAy(get, set):Float;

	inline function get_localAnchorAy():Float return Physics2DJointFields_Ffi.get_localAnchorAy(this);

	inline function set_localAnchorAy(value:Float):Float return Physics2DJointFields_Ffi.set_localAnchorAy(this, value);
	public var localAnchorBx(get, set):Float;

	inline function get_localAnchorBx():Float return Physics2DJointFields_Ffi.get_localAnchorBx(this);

	inline function set_localAnchorBx(value:Float):Float return Physics2DJointFields_Ffi.set_localAnchorBx(this, value);
	public var localAnchorBy(get, set):Float;

	inline function get_localAnchorBy():Float return Physics2DJointFields_Ffi.get_localAnchorBy(this);

	inline function set_localAnchorBy(value:Float):Float return Physics2DJointFields_Ffi.set_localAnchorBy(this, value);
	public var rAx(get, set):Float;

	inline function get_rAx():Float return Physics2DJointFields_Ffi.get_rAx(this);

	inline function set_rAx(value:Float):Float return Physics2DJointFields_Ffi.set_rAx(this, value);
	public var rAy(get, set):Float;

	inline function get_rAy():Float return Physics2DJointFields_Ffi.get_rAy(this);

	inline function set_rAy(value:Float):Float return Physics2DJointFields_Ffi.set_rAy(this, value);
	public var rBx(get, set):Float;

	inline function get_rBx():Float return Physics2DJointFields_Ffi.get_rBx(this);

	inline function set_rBx(value:Float):Float return Physics2DJointFields_Ffi.set_rBx(this, value);
	public var rBy(get, set):Float;

	inline function get_rBy():Float return Physics2DJointFields_Ffi.get_rBy(this);

	inline function set_rBy(value:Float):Float return Physics2DJointFields_Ffi.set_rBy(this, value);
}
