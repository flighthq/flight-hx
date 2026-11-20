package flight._hl;

abstract TextLayoutResult(hl.Bytes) {
	public var numLines(get, set):Int;

	inline function get_numLines():Int return this.getI32(160);

	inline function set_numLines(value:Int):Int { this.setI32(160, value); return value; }
	public var textHeight(get, set):Single;

	inline function get_textHeight():Single return this.getF32(168);

	inline function set_textHeight(value:Single):Single { this.setF32(168, value); return value; }
	public var textWidth(get, set):Single;

	inline function get_textWidth():Single return this.getF32(172);

	inline function set_textWidth(value:Single):Single { this.setF32(172, value); return value; }
}
