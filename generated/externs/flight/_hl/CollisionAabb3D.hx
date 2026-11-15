package flight._hl;

abstract CollisionAabb3D(hl.Bytes) {
	public var minX(get, set):Single;

	inline function get_minX():Single return this.getF32(0);

	inline function set_minX(value:Single):Single { this.setF32(0, value); return value; }
	public var minY(get, set):Single;

	inline function get_minY():Single return this.getF32(4);

	inline function set_minY(value:Single):Single { this.setF32(4, value); return value; }
	public var minZ(get, set):Single;

	inline function get_minZ():Single return this.getF32(8);

	inline function set_minZ(value:Single):Single { this.setF32(8, value); return value; }
	public var maxX(get, set):Single;

	inline function get_maxX():Single return this.getF32(12);

	inline function set_maxX(value:Single):Single { this.setF32(12, value); return value; }
	public var maxY(get, set):Single;

	inline function get_maxY():Single return this.getF32(16);

	inline function set_maxY(value:Single):Single { this.setF32(16, value); return value; }
	public var maxZ(get, set):Single;

	inline function get_maxZ():Single return this.getF32(20);

	inline function set_maxZ(value:Single):Single { this.setF32(20, value); return value; }
}
