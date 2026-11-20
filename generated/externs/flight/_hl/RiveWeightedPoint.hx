package flight._hl;

abstract RiveWeightedPoint(hl.Bytes) {
	public var vertex(get, set):Int;

	inline function get_vertex():Int return this.getI32(8);

	inline function set_vertex(value:Int):Int { this.setI32(8, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(16);

	inline function set_x(value:Float):Float { this.setF64(16, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(24);

	inline function set_y(value:Float):Float { this.setF64(24, value); return value; }
}
