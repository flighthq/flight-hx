package flight._hl;

abstract StatechartCondition(hl.Bytes) {
	public var inputIndex(get, set):Int;

	inline function get_inputIndex():Int return this.getI32(4);

	inline function set_inputIndex(value:Int):Int { this.setI32(4, value); return value; }
	public var value(get, set):Float;

	inline function get_value():Float return this.getF64(8);

	inline function set_value(value:Float):Float { this.setF64(8, value); return value; }
}
