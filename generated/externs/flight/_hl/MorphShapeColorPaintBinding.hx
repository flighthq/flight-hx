package flight._hl;

abstract MorphShapeColorPaintBinding(hl.Bytes) {
	public var commandIndex(get, set):Int;

	inline function get_commandIndex():Int return this.getI32(0);

	inline function set_commandIndex(value:Int):Int { this.setI32(0, value); return value; }
	public var endAlpha(get, set):Single;

	inline function get_endAlpha():Single return this.getF32(8);

	inline function set_endAlpha(value:Single):Single { this.setF32(8, value); return value; }
	public var endColor(get, set):Int;

	inline function get_endColor():Int return this.getI32(12);

	inline function set_endColor(value:Int):Int { this.setI32(12, value); return value; }
	public var startAlpha(get, set):Single;

	inline function get_startAlpha():Single return this.getF32(16);

	inline function set_startAlpha(value:Single):Single { this.setF32(16, value); return value; }
	public var startColor(get, set):Int;

	inline function get_startColor():Int return this.getI32(20);

	inline function set_startColor(value:Int):Int { this.setI32(20, value); return value; }
}
