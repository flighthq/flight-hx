package flight._hl;

abstract InputGamepadAxisData(hl.Bytes) {
	public var axis(get, set):Int;

	inline function get_axis():Int return this.getI32(0);

	inline function set_axis(value:Int):Int { this.setI32(0, value); return value; }
	public var gamepad(get, set):Int;

	inline function get_gamepad():Int return this.getI32(4);

	inline function set_gamepad(value:Int):Int { this.setI32(4, value); return value; }
	public var timeStamp(get, set):Float;

	inline function get_timeStamp():Float return this.getF64(8);

	inline function set_timeStamp(value:Float):Float { this.setF64(8, value); return value; }
	public var value(get, set):Single;

	inline function get_value():Single return this.getF32(16);

	inline function set_value(value:Single):Single { this.setF32(16, value); return value; }
}
