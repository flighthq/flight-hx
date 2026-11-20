package flight._hl;

private extern class Physics3DJointFields_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_physics3_djoint_fields_kind")
	static function get_kind(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_physics3_djoint_fields_kind")
	static function set_kind(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Physics3DJointFields(hl.Bytes) {
	public var kind(get, set):String;
	inline function get_kind():String { var raw = Physics3DJointFields_Ffi.get_kind(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Physics3DJointFields_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Physics3DJointFields_Ffi.set_kind(this, raw); return value; }
	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return this.getI32(232);

	inline function set_bodyA(value:Int):Int { this.setI32(232, value); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return this.getI32(236);

	inline function set_bodyB(value:Int):Int { this.setI32(236, value); return value; }
	public var localAnchorAx(get, set):Float;

	inline function get_localAnchorAx():Float return this.getF64(64);

	inline function set_localAnchorAx(value:Float):Float { this.setF64(64, value); return value; }
	public var localAnchorAy(get, set):Float;

	inline function get_localAnchorAy():Float return this.getF64(72);

	inline function set_localAnchorAy(value:Float):Float { this.setF64(72, value); return value; }
	public var localAnchorAz(get, set):Float;

	inline function get_localAnchorAz():Float return this.getF64(80);

	inline function set_localAnchorAz(value:Float):Float { this.setF64(80, value); return value; }
	public var localAnchorBx(get, set):Float;

	inline function get_localAnchorBx():Float return this.getF64(88);

	inline function set_localAnchorBx(value:Float):Float { this.setF64(88, value); return value; }
	public var localAnchorBy(get, set):Float;

	inline function get_localAnchorBy():Float return this.getF64(96);

	inline function set_localAnchorBy(value:Float):Float { this.setF64(96, value); return value; }
	public var localAnchorBz(get, set):Float;

	inline function get_localAnchorBz():Float return this.getF64(104);

	inline function set_localAnchorBz(value:Float):Float { this.setF64(104, value); return value; }
	public var collideConnected(get, set):Bool;

	inline function get_collideConnected():Bool return this.getUI8(240) != 0;

	inline function set_collideConnected(value:Bool):Bool { this.setUI8(240, value ? 1 : 0); return value; }
	public var breakForce(get, set):Float;

	inline function get_breakForce():Float return this.getF64(112);

	inline function set_breakForce(value:Float):Float { this.setF64(112, value); return value; }
	public var breakTorque(get, set):Float;

	inline function get_breakTorque():Float return this.getF64(120);

	inline function set_breakTorque(value:Float):Float { this.setF64(120, value); return value; }
	public var broken(get, set):Bool;

	inline function get_broken():Bool return this.getUI8(241) != 0;

	inline function set_broken(value:Bool):Bool { this.setUI8(241, value ? 1 : 0); return value; }
	public var impulse0(get, set):Float;

	inline function get_impulse0():Float return this.getF64(128);

	inline function set_impulse0(value:Float):Float { this.setF64(128, value); return value; }
	public var impulse1(get, set):Float;

	inline function get_impulse1():Float return this.getF64(136);

	inline function set_impulse1(value:Float):Float { this.setF64(136, value); return value; }
	public var impulse2(get, set):Float;

	inline function get_impulse2():Float return this.getF64(144);

	inline function set_impulse2(value:Float):Float { this.setF64(144, value); return value; }
	public var impulse3(get, set):Float;

	inline function get_impulse3():Float return this.getF64(152);

	inline function set_impulse3(value:Float):Float { this.setF64(152, value); return value; }
	public var impulse4(get, set):Float;

	inline function get_impulse4():Float return this.getF64(160);

	inline function set_impulse4(value:Float):Float { this.setF64(160, value); return value; }
	public var impulse5(get, set):Float;

	inline function get_impulse5():Float return this.getF64(168);

	inline function set_impulse5(value:Float):Float { this.setF64(168, value); return value; }
	public var rAx(get, set):Float;

	inline function get_rAx():Float return this.getF64(176);

	inline function set_rAx(value:Float):Float { this.setF64(176, value); return value; }
	public var rAy(get, set):Float;

	inline function get_rAy():Float return this.getF64(184);

	inline function set_rAy(value:Float):Float { this.setF64(184, value); return value; }
	public var rAz(get, set):Float;

	inline function get_rAz():Float return this.getF64(192);

	inline function set_rAz(value:Float):Float { this.setF64(192, value); return value; }
	public var rBx(get, set):Float;

	inline function get_rBx():Float return this.getF64(200);

	inline function set_rBx(value:Float):Float { this.setF64(200, value); return value; }
	public var rBy(get, set):Float;

	inline function get_rBy():Float return this.getF64(208);

	inline function set_rBy(value:Float):Float { this.setF64(208, value); return value; }
	public var rBz(get, set):Float;

	inline function get_rBz():Float return this.getF64(216);

	inline function set_rBz(value:Float):Float { this.setF64(216, value); return value; }
}
