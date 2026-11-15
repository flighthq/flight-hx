package flight._hl;

abstract MorphShapeLineEndpoint(hl.Bytes) {
	public var color(get, set):Int;

	inline function get_color():Int return this.getI32(8);

	inline function set_color(value:Int):Int { this.setI32(8, value); return value; }
	public var thickness(get, set):Float;

	inline function get_thickness():Float return this.getF64(16);

	inline function set_thickness(value:Float):Float { this.setF64(16, value); return value; }
}
