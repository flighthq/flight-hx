package flight._hl;

abstract Physics3DContactPoint(hl.Bytes) {
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(24);

	inline function set_x(value:Single):Single { this.setF32(24, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(28);

	inline function set_y(value:Single):Single { this.setF32(28, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return this.getF32(32);

	inline function set_z(value:Single):Single { this.setF32(32, value); return value; }
	public var depth(get, set):Single;

	inline function get_depth():Single return this.getF32(36);

	inline function set_depth(value:Single):Single { this.setF32(36, value); return value; }
	public var featureId(get, set):haxe.Int64;

	inline function get_featureId():haxe.Int64 return haxe.Int64.make(this.getI32(20), this.getI32(16));

	inline function set_featureId(value:haxe.Int64):haxe.Int64 { { this.setI32(16, value.low); this.setI32(20, value.high); }; return value; }
	public var rAx(get, set):Single;

	inline function get_rAx():Single return this.getF32(40);

	inline function set_rAx(value:Single):Single { this.setF32(40, value); return value; }
	public var rAy(get, set):Single;

	inline function get_rAy():Single return this.getF32(44);

	inline function set_rAy(value:Single):Single { this.setF32(44, value); return value; }
	public var rAz(get, set):Single;

	inline function get_rAz():Single return this.getF32(48);

	inline function set_rAz(value:Single):Single { this.setF32(48, value); return value; }
	public var rBx(get, set):Single;

	inline function get_rBx():Single return this.getF32(52);

	inline function set_rBx(value:Single):Single { this.setF32(52, value); return value; }
	public var rBy(get, set):Single;

	inline function get_rBy():Single return this.getF32(56);

	inline function set_rBy(value:Single):Single { this.setF32(56, value); return value; }
	public var rBz(get, set):Single;

	inline function get_rBz():Single return this.getF32(60);

	inline function set_rBz(value:Single):Single { this.setF32(60, value); return value; }
}
