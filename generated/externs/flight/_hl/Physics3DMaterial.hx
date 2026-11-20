package flight._hl;

abstract Physics3DMaterial(hl.Bytes) {
	public var density(get, set):Float;

	inline function get_density():Float return this.getF64(0);

	inline function set_density(value:Float):Float { this.setF64(0, value); return value; }
	public var friction(get, set):Float;

	inline function get_friction():Float return this.getF64(8);

	inline function set_friction(value:Float):Float { this.setF64(8, value); return value; }
	public var restitution(get, set):Float;

	inline function get_restitution():Float return this.getF64(16);

	inline function set_restitution(value:Float):Float { this.setF64(16, value); return value; }
}
