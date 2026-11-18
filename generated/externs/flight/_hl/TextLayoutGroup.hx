package flight._hl;

abstract TextLayoutGroup(hl.Bytes) {
	public var ascent(get, set):Single;

	inline function get_ascent():Single return this.getF32(72);

	inline function set_ascent(value:Single):Single { this.setF32(72, value); return value; }
	public var descent(get, set):Single;

	inline function get_descent():Single return this.getF32(76);

	inline function set_descent(value:Single):Single { this.setF32(76, value); return value; }
	public var endIndex(get, set):Int;

	inline function get_endIndex():Int return this.getI32(48);

	inline function set_endIndex(value:Int):Int { this.setI32(48, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return this.getF32(80);

	inline function set_height(value:Single):Single { this.setF32(80, value); return value; }
	public var leading(get, set):Single;

	inline function get_leading():Single return this.getF32(84);

	inline function set_leading(value:Single):Single { this.setF32(84, value); return value; }
	public var lineIndex(get, set):Int;

	inline function get_lineIndex():Int return this.getI32(56);

	inline function set_lineIndex(value:Int):Int { this.setI32(56, value); return value; }
	public var offsetX(get, set):Single;

	inline function get_offsetX():Single return this.getF32(88);

	inline function set_offsetX(value:Single):Single { this.setF32(88, value); return value; }
	public var offsetY(get, set):Single;

	inline function get_offsetY():Single return this.getF32(92);

	inline function set_offsetY(value:Single):Single { this.setF32(92, value); return value; }
	public var startIndex(get, set):Int;

	inline function get_startIndex():Int return this.getI32(64);

	inline function set_startIndex(value:Int):Int { this.setI32(64, value); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return this.getF32(96);

	inline function set_width(value:Single):Single { this.setF32(96, value); return value; }
}
