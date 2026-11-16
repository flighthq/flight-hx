package flight._hl;

abstract Md5Vertex(hl.Bytes) {
	public var countWeights(get, set):Int;

	inline function get_countWeights():Int return this.getI32(0);

	inline function set_countWeights(value:Int):Int { this.setI32(0, value); return value; }
	public var startWeight(get, set):Int;

	inline function get_startWeight():Int return this.getI32(4);

	inline function set_startWeight(value:Int):Int { this.setI32(4, value); return value; }
	public var u(get, set):Single;

	inline function get_u():Single return this.getF32(8);

	inline function set_u(value:Single):Single { this.setF32(8, value); return value; }
	public var v(get, set):Single;

	inline function get_v():Single return this.getF32(12);

	inline function set_v(value:Single):Single { this.setF32(12, value); return value; }
}
