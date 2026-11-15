package flight._hl;

abstract Physics2DMassData(hl.Bytes) {
	public var centerX(get, set):Single;

	inline function get_centerX():Single return this.getF32(0);

	inline function set_centerX(value:Single):Single { this.setF32(0, value); return value; }
	public var centerY(get, set):Single;

	inline function get_centerY():Single return this.getF32(4);

	inline function set_centerY(value:Single):Single { this.setF32(4, value); return value; }
	public var inertia(get, set):Single;

	inline function get_inertia():Single return this.getF32(8);

	inline function set_inertia(value:Single):Single { this.setF32(8, value); return value; }
	public var mass(get, set):Single;

	inline function get_mass():Single return this.getF32(12);

	inline function set_mass(value:Single):Single { this.setF32(12, value); return value; }
}
