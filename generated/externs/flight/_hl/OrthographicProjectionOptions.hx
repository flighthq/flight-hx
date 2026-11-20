package flight._hl;

abstract OrthographicProjectionOptions(hl.Bytes) {
	public var halfHeight(get, set):Float;

	inline function get_halfHeight():Float return this.getF64(0);

	inline function set_halfHeight(value:Float):Float { this.setF64(0, value); return value; }
	public var halfWidth(get, set):Float;

	inline function get_halfWidth():Float return this.getF64(8);

	inline function set_halfWidth(value:Float):Float { this.setF64(8, value); return value; }
}
