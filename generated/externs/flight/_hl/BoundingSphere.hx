package flight._hl;

abstract BoundingSphere(hl.Bytes) {
	public var radius(get, set):Single;

	inline function get_radius():Single return this.getF32(48);

	inline function set_radius(value:Single):Single { this.setF32(48, value); return value; }
}
