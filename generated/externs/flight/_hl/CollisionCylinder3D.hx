package flight._hl;

abstract CollisionCylinder3D(hl.Bytes) {
	public var x0(get, set):Single;

	inline function get_x0():Single return this.getF32(0);

	inline function set_x0(value:Single):Single { this.setF32(0, value); return value; }
	public var y0(get, set):Single;

	inline function get_y0():Single return this.getF32(4);

	inline function set_y0(value:Single):Single { this.setF32(4, value); return value; }
	public var z0(get, set):Single;

	inline function get_z0():Single return this.getF32(8);

	inline function set_z0(value:Single):Single { this.setF32(8, value); return value; }
	public var x1(get, set):Single;

	inline function get_x1():Single return this.getF32(12);

	inline function set_x1(value:Single):Single { this.setF32(12, value); return value; }
	public var y1(get, set):Single;

	inline function get_y1():Single return this.getF32(16);

	inline function set_y1(value:Single):Single { this.setF32(16, value); return value; }
	public var z1(get, set):Single;

	inline function get_z1():Single return this.getF32(20);

	inline function set_z1(value:Single):Single { this.setF32(20, value); return value; }
	public var radius(get, set):Single;

	inline function get_radius():Single return this.getF32(24);

	inline function set_radius(value:Single):Single { this.setF32(24, value); return value; }
}
