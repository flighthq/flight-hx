package flight._hl;

abstract CollisionSphere3D(hl.Bytes) {
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(0);

	inline function set_x(value:Single):Single { this.setF32(0, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(4);

	inline function set_y(value:Single):Single { this.setF32(4, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return this.getF32(8);

	inline function set_z(value:Single):Single { this.setF32(8, value); return value; }
	public var radius(get, set):Single;

	inline function get_radius():Single return this.getF32(12);

	inline function set_radius(value:Single):Single { this.setF32(12, value); return value; }
}
