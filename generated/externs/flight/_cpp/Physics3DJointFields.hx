package flight._cpp;

private extern class Physics3DJointFields_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_physics3_djoint_fields_kind") static function get_kind(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_physics3_djoint_fields_kind") static function set_kind(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_physics3_djoint_fields_body_a") static function get_bodyA(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_djoint_fields_body_a") static function set_bodyA(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_djoint_fields_body_b") static function get_bodyB(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_physics3_djoint_fields_body_b") static function set_bodyB(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_physics3_djoint_fields_local_anchor_ax") static function get_localAnchorAx(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_local_anchor_ax") static function set_localAnchorAx(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_local_anchor_ay") static function get_localAnchorAy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_local_anchor_ay") static function set_localAnchorAy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_local_anchor_az") static function get_localAnchorAz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_local_anchor_az") static function set_localAnchorAz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_local_anchor_bx") static function get_localAnchorBx(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_local_anchor_bx") static function set_localAnchorBx(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_local_anchor_by") static function get_localAnchorBy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_local_anchor_by") static function set_localAnchorBy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_local_anchor_bz") static function get_localAnchorBz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_local_anchor_bz") static function set_localAnchorBz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_collide_connected") static function get_collideConnected(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_djoint_fields_collide_connected") static function set_collideConnected(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_djoint_fields_break_force") static function get_breakForce(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_break_force") static function set_breakForce(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_break_torque") static function get_breakTorque(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_break_torque") static function set_breakTorque(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_broken") static function get_broken(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_physics3_djoint_fields_broken") static function set_broken(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_physics3_djoint_fields_impulse0") static function get_impulse0(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_impulse0") static function set_impulse0(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_impulse1") static function get_impulse1(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_impulse1") static function set_impulse1(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_impulse2") static function get_impulse2(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_impulse2") static function set_impulse2(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_impulse3") static function get_impulse3(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_impulse3") static function set_impulse3(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_impulse4") static function get_impulse4(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_impulse4") static function set_impulse4(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_impulse5") static function get_impulse5(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_impulse5") static function set_impulse5(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_r_ax") static function get_rAx(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_r_ax") static function set_rAx(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_r_ay") static function get_rAy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_r_ay") static function set_rAy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_r_az") static function get_rAz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_r_az") static function set_rAz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_r_bx") static function get_rBx(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_r_bx") static function set_rBx(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_r_by") static function get_rBy(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_r_by") static function set_rBy(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_physics3_djoint_fields_r_bz") static function get_rBz(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_physics3_djoint_fields_r_bz") static function set_rBz(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Physics3DJointFields(cpp.Star<cpp.Void>) {
	public var kind(get, set):String;
	inline function get_kind():String { var raw = Physics3DJointFields_Ffi.get_kind(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Physics3DJointFields_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:cpp.ConstCharStar = cast value; Physics3DJointFields_Ffi.set_kind(this, raw); return value; }
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return Physics3DJointFields_Ffi.get_bodyA(this);

	inline function set_bodyA(value:Int):Int { Physics3DJointFields_Ffi.set_bodyA(this, value); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return Physics3DJointFields_Ffi.get_bodyB(this);

	inline function set_bodyB(value:Int):Int { Physics3DJointFields_Ffi.set_bodyB(this, value); return value; }
	public var localAnchorAx(get, set):Float;

	inline function get_localAnchorAx():Float return Physics3DJointFields_Ffi.get_localAnchorAx(this);

	inline function set_localAnchorAx(value:Float):Float { Physics3DJointFields_Ffi.set_localAnchorAx(this, value); return value; }
	public var localAnchorAy(get, set):Float;

	inline function get_localAnchorAy():Float return Physics3DJointFields_Ffi.get_localAnchorAy(this);

	inline function set_localAnchorAy(value:Float):Float { Physics3DJointFields_Ffi.set_localAnchorAy(this, value); return value; }
	public var localAnchorAz(get, set):Float;

	inline function get_localAnchorAz():Float return Physics3DJointFields_Ffi.get_localAnchorAz(this);

	inline function set_localAnchorAz(value:Float):Float { Physics3DJointFields_Ffi.set_localAnchorAz(this, value); return value; }
	public var localAnchorBx(get, set):Float;

	inline function get_localAnchorBx():Float return Physics3DJointFields_Ffi.get_localAnchorBx(this);

	inline function set_localAnchorBx(value:Float):Float { Physics3DJointFields_Ffi.set_localAnchorBx(this, value); return value; }
	public var localAnchorBy(get, set):Float;

	inline function get_localAnchorBy():Float return Physics3DJointFields_Ffi.get_localAnchorBy(this);

	inline function set_localAnchorBy(value:Float):Float { Physics3DJointFields_Ffi.set_localAnchorBy(this, value); return value; }
	public var localAnchorBz(get, set):Float;

	inline function get_localAnchorBz():Float return Physics3DJointFields_Ffi.get_localAnchorBz(this);

	inline function set_localAnchorBz(value:Float):Float { Physics3DJointFields_Ffi.set_localAnchorBz(this, value); return value; }
	public var collideConnected(get, set):Bool;

	inline function get_collideConnected():Bool return Physics3DJointFields_Ffi.get_collideConnected(this);

	inline function set_collideConnected(value:Bool):Bool { Physics3DJointFields_Ffi.set_collideConnected(this, value); return value; }
	public var breakForce(get, set):Float;

	inline function get_breakForce():Float return Physics3DJointFields_Ffi.get_breakForce(this);

	inline function set_breakForce(value:Float):Float { Physics3DJointFields_Ffi.set_breakForce(this, value); return value; }
	public var breakTorque(get, set):Float;

	inline function get_breakTorque():Float return Physics3DJointFields_Ffi.get_breakTorque(this);

	inline function set_breakTorque(value:Float):Float { Physics3DJointFields_Ffi.set_breakTorque(this, value); return value; }
	public var broken(get, set):Bool;

	inline function get_broken():Bool return Physics3DJointFields_Ffi.get_broken(this);

	inline function set_broken(value:Bool):Bool { Physics3DJointFields_Ffi.set_broken(this, value); return value; }
	public var impulse0(get, set):Float;

	inline function get_impulse0():Float return Physics3DJointFields_Ffi.get_impulse0(this);

	inline function set_impulse0(value:Float):Float { Physics3DJointFields_Ffi.set_impulse0(this, value); return value; }
	public var impulse1(get, set):Float;

	inline function get_impulse1():Float return Physics3DJointFields_Ffi.get_impulse1(this);

	inline function set_impulse1(value:Float):Float { Physics3DJointFields_Ffi.set_impulse1(this, value); return value; }
	public var impulse2(get, set):Float;

	inline function get_impulse2():Float return Physics3DJointFields_Ffi.get_impulse2(this);

	inline function set_impulse2(value:Float):Float { Physics3DJointFields_Ffi.set_impulse2(this, value); return value; }
	public var impulse3(get, set):Float;

	inline function get_impulse3():Float return Physics3DJointFields_Ffi.get_impulse3(this);

	inline function set_impulse3(value:Float):Float { Physics3DJointFields_Ffi.set_impulse3(this, value); return value; }
	public var impulse4(get, set):Float;

	inline function get_impulse4():Float return Physics3DJointFields_Ffi.get_impulse4(this);

	inline function set_impulse4(value:Float):Float { Physics3DJointFields_Ffi.set_impulse4(this, value); return value; }
	public var impulse5(get, set):Float;

	inline function get_impulse5():Float return Physics3DJointFields_Ffi.get_impulse5(this);

	inline function set_impulse5(value:Float):Float { Physics3DJointFields_Ffi.set_impulse5(this, value); return value; }
	public var rAx(get, set):Float;

	inline function get_rAx():Float return Physics3DJointFields_Ffi.get_rAx(this);

	inline function set_rAx(value:Float):Float { Physics3DJointFields_Ffi.set_rAx(this, value); return value; }
	public var rAy(get, set):Float;

	inline function get_rAy():Float return Physics3DJointFields_Ffi.get_rAy(this);

	inline function set_rAy(value:Float):Float { Physics3DJointFields_Ffi.set_rAy(this, value); return value; }
	public var rAz(get, set):Float;

	inline function get_rAz():Float return Physics3DJointFields_Ffi.get_rAz(this);

	inline function set_rAz(value:Float):Float { Physics3DJointFields_Ffi.set_rAz(this, value); return value; }
	public var rBx(get, set):Float;

	inline function get_rBx():Float return Physics3DJointFields_Ffi.get_rBx(this);

	inline function set_rBx(value:Float):Float { Physics3DJointFields_Ffi.set_rBx(this, value); return value; }
	public var rBy(get, set):Float;

	inline function get_rBy():Float return Physics3DJointFields_Ffi.get_rBy(this);

	inline function set_rBy(value:Float):Float { Physics3DJointFields_Ffi.set_rBy(this, value); return value; }
	public var rBz(get, set):Float;

	inline function get_rBz():Float return Physics3DJointFields_Ffi.get_rBz(this);

	inline function set_rBz(value:Float):Float { Physics3DJointFields_Ffi.set_rBz(this, value); return value; }
}
