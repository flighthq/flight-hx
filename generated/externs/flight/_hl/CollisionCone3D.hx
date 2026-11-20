package flight._hl;

abstract CollisionCone3D(hl.Bytes) {
	public var x0(get, set):Float;

	inline function get_x0():Float return this.getF64(0);

	inline function set_x0(value:Float):Float { this.setF64(0, value); return value; }
	public var y0(get, set):Float;

	inline function get_y0():Float return this.getF64(8);

	inline function set_y0(value:Float):Float { this.setF64(8, value); return value; }
	public var z0(get, set):Float;

	inline function get_z0():Float return this.getF64(16);

	inline function set_z0(value:Float):Float { this.setF64(16, value); return value; }
	public var x1(get, set):Float;

	inline function get_x1():Float return this.getF64(24);

	inline function set_x1(value:Float):Float { this.setF64(24, value); return value; }
	public var y1(get, set):Float;

	inline function get_y1():Float return this.getF64(32);

	inline function set_y1(value:Float):Float { this.setF64(32, value); return value; }
	public var z1(get, set):Float;

	inline function get_z1():Float return this.getF64(40);

	inline function set_z1(value:Float):Float { this.setF64(40, value); return value; }
	public var radius(get, set):Float;

	inline function get_radius():Float return this.getF64(48);

	inline function set_radius(value:Float):Float { this.setF64(48, value); return value; }
}
