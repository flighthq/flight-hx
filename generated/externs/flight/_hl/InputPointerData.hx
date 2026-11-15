package flight._hl;

abstract InputPointerData(hl.Bytes) {
	public var altKey(get, set):Bool;

	inline function get_altKey():Bool return this.getUI8(0) != 0;

	inline function set_altKey(value:Bool):Bool { this.setUI8(0, value ? 1 : 0); return value; }
	public var button(get, set):Int;

	inline function get_button():Int return this.getI32(4);

	inline function set_button(value:Int):Int { this.setI32(4, value); return value; }
	public var buttons(get, set):Int;

	inline function get_buttons():Int return this.getI32(8);

	inline function set_buttons(value:Int):Int { this.setI32(8, value); return value; }
	public var ctrlKey(get, set):Bool;

	inline function get_ctrlKey():Bool return this.getUI8(12) != 0;

	inline function set_ctrlKey(value:Bool):Bool { this.setUI8(12, value ? 1 : 0); return value; }
	public var deltaX(get, set):Single;

	inline function get_deltaX():Single return this.getF32(16);

	inline function set_deltaX(value:Single):Single { this.setF32(16, value); return value; }
	public var deltaY(get, set):Single;

	inline function get_deltaY():Single return this.getF32(20);

	inline function set_deltaY(value:Single):Single { this.setF32(20, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(24);

	inline function set_height(value:Single):Single { this.setF32(24, value); return value; }
	public var isPrimary(get, set):Bool;

	inline function get_isPrimary():Bool return this.getUI8(28) != 0;

	inline function set_isPrimary(value:Bool):Bool { this.setUI8(28, value ? 1 : 0); return value; }
	public var metaKey(get, set):Bool;

	inline function get_metaKey():Bool return this.getUI8(29) != 0;

	inline function set_metaKey(value:Bool):Bool { this.setUI8(29, value ? 1 : 0); return value; }
	public var pointerId(get, set):Int;

	inline function get_pointerId():Int return this.getI32(32);

	inline function set_pointerId(value:Int):Int { this.setI32(32, value); return value; }
	public var pressure(get, set):Single;

	inline function get_pressure():Single return this.getF32(40);

	inline function set_pressure(value:Single):Single { this.setF32(40, value); return value; }
	public var shiftKey(get, set):Bool;

	inline function get_shiftKey():Bool return this.getUI8(44) != 0;

	inline function set_shiftKey(value:Bool):Bool { this.setUI8(44, value ? 1 : 0); return value; }
	public var tiltX(get, set):Single;

	inline function get_tiltX():Single return this.getF32(48);

	inline function set_tiltX(value:Single):Single { this.setF32(48, value); return value; }
	public var tiltY(get, set):Single;

	inline function get_tiltY():Single return this.getF32(52);

	inline function set_tiltY(value:Single):Single { this.setF32(52, value); return value; }
	public var timeStamp(get, set):Float;

	inline function get_timeStamp():Float return this.getF64(56);

	inline function set_timeStamp(value:Float):Float { this.setF64(56, value); return value; }
	public var twist(get, set):Single;

	inline function get_twist():Single return this.getF32(64);

	inline function set_twist(value:Single):Single { this.setF32(64, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(72);

	inline function set_width(value:Single):Single { this.setF32(72, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(76);

	inline function set_x(value:Single):Single { this.setF32(76, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(80);

	inline function set_y(value:Single):Single { this.setF32(80, value); return value; }
}
