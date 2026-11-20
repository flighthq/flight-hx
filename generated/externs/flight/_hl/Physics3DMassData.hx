package flight._hl;

abstract Physics3DMassData(hl.Bytes) {
	public var mass(get, set):Float;

	inline function get_mass():Float return this.getF64(16);

	inline function set_mass(value:Float):Float { this.setF64(16, value); return value; }
	public var inertiaXx(get, set):Float;

	inline function get_inertiaXx():Float return this.getF64(24);

	inline function set_inertiaXx(value:Float):Float { this.setF64(24, value); return value; }
	public var inertiaYy(get, set):Float;

	inline function get_inertiaYy():Float return this.getF64(32);

	inline function set_inertiaYy(value:Float):Float { this.setF64(32, value); return value; }
	public var inertiaZz(get, set):Float;

	inline function get_inertiaZz():Float return this.getF64(40);

	inline function set_inertiaZz(value:Float):Float { this.setF64(40, value); return value; }
	public var inertiaXy(get, set):Float;

	inline function get_inertiaXy():Float return this.getF64(48);

	inline function set_inertiaXy(value:Float):Float { this.setF64(48, value); return value; }
	public var inertiaXz(get, set):Float;

	inline function get_inertiaXz():Float return this.getF64(56);

	inline function set_inertiaXz(value:Float):Float { this.setF64(56, value); return value; }
	public var inertiaYz(get, set):Float;

	inline function get_inertiaYz():Float return this.getF64(64);

	inline function set_inertiaYz(value:Float):Float { this.setF64(64, value); return value; }
	public var centerX(get, set):Float;

	inline function get_centerX():Float return this.getF64(72);

	inline function set_centerX(value:Float):Float { this.setF64(72, value); return value; }
	public var centerY(get, set):Float;

	inline function get_centerY():Float return this.getF64(80);

	inline function set_centerY(value:Float):Float { this.setF64(80, value); return value; }
	public var centerZ(get, set):Float;

	inline function get_centerZ():Float return this.getF64(88);

	inline function set_centerZ(value:Float):Float { this.setF64(88, value); return value; }
}
