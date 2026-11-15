package flight._hl;

abstract CollisionContactPoint2D(hl.Bytes) {
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(0);

	inline function set_x(value:Single):Single { this.setF32(0, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(4);

	inline function set_y(value:Single):Single { this.setF32(4, value); return value; }
	public var depth(get, set):Single;

	inline function get_depth():Single return this.getF32(8);

	inline function set_depth(value:Single):Single { this.setF32(8, value); return value; }
	public var featureId(get, set):haxe.Int64;

	inline function get_featureId():haxe.Int64 return haxe.Int64.make(this.getI32(20), this.getI32(16));

	inline function set_featureId(value:haxe.Int64):haxe.Int64 { { this.setI32(16, value.low); this.setI32(20, value.high); }; return value; }
}
