package flight._hl;

abstract ParticleSpawnEvent(hl.Bytes) {
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(0);

	inline function set_x(value:Single):Single { this.setF32(0, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(4);

	inline function set_y(value:Single):Single { this.setF32(4, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return this.getF32(8);

	inline function set_z(value:Single):Single { this.setF32(8, value); return value; }
	public var vx(get, set):Single;

	inline function get_vx():Single return this.getF32(12);

	inline function set_vx(value:Single):Single { this.setF32(12, value); return value; }
	public var vy(get, set):Single;

	inline function get_vy():Single return this.getF32(16);

	inline function set_vy(value:Single):Single { this.setF32(16, value); return value; }
	public var vz(get, set):Single;

	inline function get_vz():Single return this.getF32(20);

	inline function set_vz(value:Single):Single { this.setF32(20, value); return value; }
}
