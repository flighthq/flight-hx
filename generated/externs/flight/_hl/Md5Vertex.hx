package flight._hl;

abstract Md5Vertex(hl.Bytes) {
	public var countWeights(get, set):Int;

	inline function get_countWeights():Int return this.getI32(16);

	inline function set_countWeights(value:Int):Int { this.setI32(16, value); return value; }
	public var startWeight(get, set):Int;

	inline function get_startWeight():Int return this.getI32(20);

	inline function set_startWeight(value:Int):Int { this.setI32(20, value); return value; }
	public var u(get, set):Float;

	inline function get_u():Float return this.getF64(0);

	inline function set_u(value:Float):Float { this.setF64(0, value); return value; }
	public var v(get, set):Float;

	inline function get_v():Float return this.getF64(8);

	inline function set_v(value:Float):Float { this.setF64(8, value); return value; }
}
