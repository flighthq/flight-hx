package flight._hl;

abstract Velocity2D(hl.Bytes) {
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(0);

	inline function set_x(value:Float):Float { this.setF64(0, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(8);

	inline function set_y(value:Float):Float { this.setF64(8, value); return value; }
}
