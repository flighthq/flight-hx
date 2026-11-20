package flight._hl;

abstract Physics2DMassData(hl.Bytes) {
	public var centerX(get, set):Float;

	inline function get_centerX():Float return this.getF64(0);

	inline function set_centerX(value:Float):Float { this.setF64(0, value); return value; }
	public var centerY(get, set):Float;

	inline function get_centerY():Float return this.getF64(8);

	inline function set_centerY(value:Float):Float { this.setF64(8, value); return value; }
	public var inertia(get, set):Float;

	inline function get_inertia():Float return this.getF64(16);

	inline function set_inertia(value:Float):Float { this.setF64(16, value); return value; }
	public var mass(get, set):Float;

	inline function get_mass():Float return this.getF64(24);

	inline function set_mass(value:Float):Float { this.setF64(24, value); return value; }
}
