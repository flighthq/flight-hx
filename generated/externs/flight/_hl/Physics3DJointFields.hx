package flight._hl;

private extern class Physics3DJointFields_Ffi {
	@:hlNative("flight", "flight_field_get_physics3_djoint_fields_kind")
	static function get_kind(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_physics3_djoint_fields_kind")
	static function set_kind(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract Physics3DJointFields(hl.Bytes) {
	public var kind(get, set):String;
	inline function get_kind():String {
		final bytes = Physics3DJointFields_Ffi.get_kind(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_kind(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		Physics3DJointFields_Ffi.set_kind(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var bodyA(get, set):Int;

	inline function get_bodyA():Int return this.getI32(72);

	inline function set_bodyA(value:Int):Int { this.setI32(72, value); return value; }
	public var bodyB(get, set):Int;

	inline function get_bodyB():Int return this.getI32(76);

	inline function set_bodyB(value:Int):Int { this.setI32(76, value); return value; }
	public var localAnchorAx(get, set):Single;

	inline function get_localAnchorAx():Single return this.getF32(80);

	inline function set_localAnchorAx(value:Single):Single { this.setF32(80, value); return value; }
	public var localAnchorAy(get, set):Single;

	inline function get_localAnchorAy():Single return this.getF32(84);

	inline function set_localAnchorAy(value:Single):Single { this.setF32(84, value); return value; }
	public var localAnchorAz(get, set):Single;

	inline function get_localAnchorAz():Single return this.getF32(88);

	inline function set_localAnchorAz(value:Single):Single { this.setF32(88, value); return value; }
	public var localAnchorBx(get, set):Single;

	inline function get_localAnchorBx():Single return this.getF32(92);

	inline function set_localAnchorBx(value:Single):Single { this.setF32(92, value); return value; }
	public var localAnchorBy(get, set):Single;

	inline function get_localAnchorBy():Single return this.getF32(96);

	inline function set_localAnchorBy(value:Single):Single { this.setF32(96, value); return value; }
	public var localAnchorBz(get, set):Single;

	inline function get_localAnchorBz():Single return this.getF32(100);

	inline function set_localAnchorBz(value:Single):Single { this.setF32(100, value); return value; }
	public var collideConnected(get, set):Bool;

	inline function get_collideConnected():Bool return this.getUI8(160) != 0;

	inline function set_collideConnected(value:Bool):Bool { this.setUI8(160, value ? 1 : 0); return value; }
	public var breakForce(get, set):Single;

	inline function get_breakForce():Single return this.getF32(104);

	inline function set_breakForce(value:Single):Single { this.setF32(104, value); return value; }
	public var breakTorque(get, set):Single;

	inline function get_breakTorque():Single return this.getF32(108);

	inline function set_breakTorque(value:Single):Single { this.setF32(108, value); return value; }
	public var broken(get, set):Bool;

	inline function get_broken():Bool return this.getUI8(161) != 0;

	inline function set_broken(value:Bool):Bool { this.setUI8(161, value ? 1 : 0); return value; }
	public var impulse0(get, set):Single;

	inline function get_impulse0():Single return this.getF32(112);

	inline function set_impulse0(value:Single):Single { this.setF32(112, value); return value; }
	public var impulse1(get, set):Single;

	inline function get_impulse1():Single return this.getF32(116);

	inline function set_impulse1(value:Single):Single { this.setF32(116, value); return value; }
	public var impulse2(get, set):Single;

	inline function get_impulse2():Single return this.getF32(120);

	inline function set_impulse2(value:Single):Single { this.setF32(120, value); return value; }
	public var impulse3(get, set):Single;

	inline function get_impulse3():Single return this.getF32(124);

	inline function set_impulse3(value:Single):Single { this.setF32(124, value); return value; }
	public var impulse4(get, set):Single;

	inline function get_impulse4():Single return this.getF32(128);

	inline function set_impulse4(value:Single):Single { this.setF32(128, value); return value; }
	public var impulse5(get, set):Single;

	inline function get_impulse5():Single return this.getF32(132);

	inline function set_impulse5(value:Single):Single { this.setF32(132, value); return value; }
	public var rAx(get, set):Single;

	inline function get_rAx():Single return this.getF32(136);

	inline function set_rAx(value:Single):Single { this.setF32(136, value); return value; }
	public var rAy(get, set):Single;

	inline function get_rAy():Single return this.getF32(140);

	inline function set_rAy(value:Single):Single { this.setF32(140, value); return value; }
	public var rAz(get, set):Single;

	inline function get_rAz():Single return this.getF32(144);

	inline function set_rAz(value:Single):Single { this.setF32(144, value); return value; }
	public var rBx(get, set):Single;

	inline function get_rBx():Single return this.getF32(148);

	inline function set_rBx(value:Single):Single { this.setF32(148, value); return value; }
	public var rBy(get, set):Single;

	inline function get_rBy():Single return this.getF32(152);

	inline function set_rBy(value:Single):Single { this.setF32(152, value); return value; }
	public var rBz(get, set):Single;

	inline function get_rBz():Single return this.getF32(156);

	inline function set_rBz(value:Single):Single { this.setF32(156, value); return value; }
}
