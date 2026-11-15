package flight._hl;

abstract RiveWeightedPoint(hl.Bytes) {
	public var vertex(get, set):Int;

	inline function get_vertex():Int return this.getI32(8);

	inline function set_vertex(value:Int):Int { this.setI32(8, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(16);

	inline function set_x(value:Single):Single { this.setF32(16, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(20);

	inline function set_y(value:Single):Single { this.setF32(20, value); return value; }
}
