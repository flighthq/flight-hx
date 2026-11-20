package flight._hl;

abstract CollisionSphere3D(hl.Bytes) {
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(0);

	inline function set_x(value:Float):Float { this.setF64(0, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(8);

	inline function set_y(value:Float):Float { this.setF64(8, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return this.getF64(16);

	inline function set_z(value:Float):Float { this.setF64(16, value); return value; }
	public var radius(get, set):Float;

	inline function get_radius():Float return this.getF64(24);

	inline function set_radius(value:Float):Float { this.setF64(24, value); return value; }
}
