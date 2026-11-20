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
	public var deltaX(get, set):Float;

	inline function get_deltaX():Float return this.getF64(16);

	inline function set_deltaX(value:Float):Float { this.setF64(16, value); return value; }
	public var deltaY(get, set):Float;

	inline function get_deltaY():Float return this.getF64(24);

	inline function set_deltaY(value:Float):Float { this.setF64(24, value); return value; }
	public var height(get, set):Float;

	inline function get_height():Float return this.getF64(32);

	inline function set_height(value:Float):Float { this.setF64(32, value); return value; }
	public var isPrimary(get, set):Bool;

	inline function get_isPrimary():Bool return this.getUI8(40) != 0;

	inline function set_isPrimary(value:Bool):Bool { this.setUI8(40, value ? 1 : 0); return value; }
	public var metaKey(get, set):Bool;

	inline function get_metaKey():Bool return this.getUI8(41) != 0;

	inline function set_metaKey(value:Bool):Bool { this.setUI8(41, value ? 1 : 0); return value; }
	public var pointerId(get, set):Int;

	inline function get_pointerId():Int return this.getI32(44);

	inline function set_pointerId(value:Int):Int { this.setI32(44, value); return value; }
	public var pressure(get, set):Single;

	inline function get_pressure():Single return this.getF32(52);

	inline function set_pressure(value:Single):Single { this.setF32(52, value); return value; }
	public var shiftKey(get, set):Bool;

	inline function get_shiftKey():Bool return this.getUI8(56) != 0;

	inline function set_shiftKey(value:Bool):Bool { this.setUI8(56, value ? 1 : 0); return value; }
	public var tiltX(get, set):Single;

	inline function get_tiltX():Single return this.getF32(60);

	inline function set_tiltX(value:Single):Single { this.setF32(60, value); return value; }
	public var tiltY(get, set):Single;

	inline function get_tiltY():Single return this.getF32(64);

	inline function set_tiltY(value:Single):Single { this.setF32(64, value); return value; }
	public var timeStamp(get, set):Float;

	inline function get_timeStamp():Float return this.getF64(72);

	inline function set_timeStamp(value:Float):Float { this.setF64(72, value); return value; }
	public var twist(get, set):Single;

	inline function get_twist():Single return this.getF32(80);

	inline function set_twist(value:Single):Single { this.setF32(80, value); return value; }
	public var width(get, set):Float;

	inline function get_width():Float return this.getF64(88);

	inline function set_width(value:Float):Float { this.setF64(88, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(96);

	inline function set_x(value:Float):Float { this.setF64(96, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(104);

	inline function set_y(value:Float):Float { this.setF64(104, value); return value; }
}
