package flight._hl;

abstract SvgGradient(hl.Bytes) {
	public var cx(get, set):Float;

	inline function get_cx():Float return this.getF64(0);

	inline function set_cx(value:Float):Float { this.setF64(0, value); return value; }
	public var cy(get, set):Float;

	inline function get_cy():Float return this.getF64(8);

	inline function set_cy(value:Float):Float { this.setF64(8, value); return value; }
	public var fx(get, set):Float;

	inline function get_fx():Float return this.getF64(16);

	inline function set_fx(value:Float):Float { this.setF64(16, value); return value; }
	public var fy(get, set):Float;

	inline function get_fy():Float return this.getF64(24);

	inline function set_fy(value:Float):Float { this.setF64(24, value); return value; }
	public var radius(get, set):Float;

	inline function get_radius():Float return this.getF64(40);

	inline function set_radius(value:Float):Float { this.setF64(40, value); return value; }
	public var x1(get, set):Float;

	inline function get_x1():Float return this.getF64(160);

	inline function set_x1(value:Float):Float { this.setF64(160, value); return value; }
	public var x2(get, set):Float;

	inline function get_x2():Float return this.getF64(168);

	inline function set_x2(value:Float):Float { this.setF64(168, value); return value; }
	public var y1(get, set):Float;

	inline function get_y1():Float return this.getF64(176);

	inline function set_y1(value:Float):Float { this.setF64(176, value); return value; }
	public var y2(get, set):Float;

	inline function get_y2():Float return this.getF64(184);

	inline function set_y2(value:Float):Float { this.setF64(184, value); return value; }
}
