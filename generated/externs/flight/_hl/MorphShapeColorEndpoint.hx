package flight._hl;

abstract MorphShapeColorEndpoint(hl.Bytes) {
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(8);

	inline function set_color(value:Int):Int { this.setI32(8, value); return value; }
}
