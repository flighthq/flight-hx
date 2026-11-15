package flight._hl;

abstract ShapeFillRegion(hl.Bytes) {
	public var alpha(get, set):Single;

	inline function get_alpha():Single return this.getF32(0);

	inline function set_alpha(value:Single):Single { this.setF32(0, value); return value; }
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(4);

	inline function set_color(value:Int):Int { this.setI32(4, value); return value; }
}
