package flight._hl;

abstract Physics3DMassData(hl.Bytes) {
	public var mass(get, set):Single;

	inline function get_mass():Single return this.getF32(16);

	inline function set_mass(value:Single):Single { this.setF32(16, value); return value; }
	public var inertiaXx(get, set):Single;

	inline function get_inertiaXx():Single return this.getF32(20);

	inline function set_inertiaXx(value:Single):Single { this.setF32(20, value); return value; }
	public var inertiaYy(get, set):Single;

	inline function get_inertiaYy():Single return this.getF32(24);

	inline function set_inertiaYy(value:Single):Single { this.setF32(24, value); return value; }
	public var inertiaZz(get, set):Single;

	inline function get_inertiaZz():Single return this.getF32(28);

	inline function set_inertiaZz(value:Single):Single { this.setF32(28, value); return value; }
	public var inertiaXy(get, set):Single;

	inline function get_inertiaXy():Single return this.getF32(32);

	inline function set_inertiaXy(value:Single):Single { this.setF32(32, value); return value; }
	public var inertiaXz(get, set):Single;

	inline function get_inertiaXz():Single return this.getF32(36);

	inline function set_inertiaXz(value:Single):Single { this.setF32(36, value); return value; }
	public var inertiaYz(get, set):Single;

	inline function get_inertiaYz():Single return this.getF32(40);

	inline function set_inertiaYz(value:Single):Single { this.setF32(40, value); return value; }
	public var centerX(get, set):Single;

	inline function get_centerX():Single return this.getF32(44);

	inline function set_centerX(value:Single):Single { this.setF32(44, value); return value; }
	public var centerY(get, set):Single;

	inline function get_centerY():Single return this.getF32(48);

	inline function set_centerY(value:Single):Single { this.setF32(48, value); return value; }
	public var centerZ(get, set):Single;

	inline function get_centerZ():Single return this.getF32(52);

	inline function set_centerZ(value:Single):Single { this.setF32(52, value); return value; }
}
