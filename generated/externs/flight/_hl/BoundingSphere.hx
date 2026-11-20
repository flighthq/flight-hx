package flight._hl;

abstract BoundingSphere(hl.Bytes) {
	public var radius(get, set):Float;

	inline function get_radius():Float return this.getF64(56);

	inline function set_radius(value:Float):Float { this.setF64(56, value); return value; }
}
