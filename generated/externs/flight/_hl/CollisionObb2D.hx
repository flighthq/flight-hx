package flight._hl;

abstract CollisionObb2D(hl.Bytes) {
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(0);

	inline function set_x(value:Single):Single { this.setF32(0, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(4);

	inline function set_y(value:Single):Single { this.setF32(4, value); return value; }
	public var halfW(get, set):Single;

	inline function get_halfW():Single return this.getF32(8);

	inline function set_halfW(value:Single):Single { this.setF32(8, value); return value; }
	public var halfH(get, set):Single;

	inline function get_halfH():Single return this.getF32(12);

	inline function set_halfH(value:Single):Single { this.setF32(12, value); return value; }
	public var rotation(get, set):Single;

	inline function get_rotation():Single return this.getF32(16);

	inline function set_rotation(value:Single):Single { this.setF32(16, value); return value; }
}
