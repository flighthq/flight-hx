package flight._hl;

abstract Woff2Triplet(hl.Bytes) {
	public var dx(get, set):Single;

	inline function get_dx():Single return this.getF32(8);

	inline function set_dx(value:Single):Single { this.setF32(8, value); return value; }
	public var dy(get, set):Single;

	inline function get_dy():Single return this.getF32(12);

	inline function set_dy(value:Single):Single { this.setF32(12, value); return value; }
	public var used(get, set):Int;

	inline function get_used():Int return this.getI32(0);

	inline function set_used(value:Int):Int { this.setI32(0, value); return value; }
}
