package flight._hl;

abstract CollisionTimeOfImpact3D(hl.Bytes) {
	public var fraction(get, set):Single;

	inline function get_fraction():Single return this.getF32(0);

	inline function set_fraction(value:Single):Single { this.setF32(0, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(4);

	inline function set_x(value:Single):Single { this.setF32(4, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(8);

	inline function set_y(value:Single):Single { this.setF32(8, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return this.getF32(12);

	inline function set_z(value:Single):Single { this.setF32(12, value); return value; }
	public var normalX(get, set):Single;

	inline function get_normalX():Single return this.getF32(16);

	inline function set_normalX(value:Single):Single { this.setF32(16, value); return value; }
	public var normalY(get, set):Single;

	inline function get_normalY():Single return this.getF32(20);

	inline function set_normalY(value:Single):Single { this.setF32(20, value); return value; }
	public var normalZ(get, set):Single;

	inline function get_normalZ():Single return this.getF32(24);

	inline function set_normalZ(value:Single):Single { this.setF32(24, value); return value; }
}
