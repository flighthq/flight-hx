package flight._hl;

abstract Physics2DMaterial(hl.Bytes) {
	public var density(get, set):Single;

	inline function get_density():Single return this.getF32(0);

	inline function set_density(value:Single):Single { this.setF32(0, value); return value; }
	public var friction(get, set):Single;

	inline function get_friction():Single return this.getF32(4);

	inline function set_friction(value:Single):Single { this.setF32(4, value); return value; }
	public var restitution(get, set):Single;

	inline function get_restitution():Single return this.getF32(8);

	inline function set_restitution(value:Single):Single { this.setF32(8, value); return value; }
}
