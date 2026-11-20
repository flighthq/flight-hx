package flight._hl;

abstract CollisionBox3D(hl.Bytes) {
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(0);

	inline function set_x(value:Float):Float { this.setF64(0, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(8);

	inline function set_y(value:Float):Float { this.setF64(8, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return this.getF64(16);

	inline function set_z(value:Float):Float { this.setF64(16, value); return value; }
	public var halfX(get, set):Float;

	inline function get_halfX():Float return this.getF64(24);

	inline function set_halfX(value:Float):Float { this.setF64(24, value); return value; }
	public var halfY(get, set):Float;

	inline function get_halfY():Float return this.getF64(32);

	inline function set_halfY(value:Float):Float { this.setF64(32, value); return value; }
	public var halfZ(get, set):Float;

	inline function get_halfZ():Float return this.getF64(40);

	inline function set_halfZ(value:Float):Float { this.setF64(40, value); return value; }
	public var rotationX(get, set):Float;

	inline function get_rotationX():Float return this.getF64(48);

	inline function set_rotationX(value:Float):Float { this.setF64(48, value); return value; }
	public var rotationY(get, set):Float;

	inline function get_rotationY():Float return this.getF64(56);

	inline function set_rotationY(value:Float):Float { this.setF64(56, value); return value; }
	public var rotationZ(get, set):Float;

	inline function get_rotationZ():Float return this.getF64(64);

	inline function set_rotationZ(value:Float):Float { this.setF64(64, value); return value; }
	public var rotationW(get, set):Float;

	inline function get_rotationW():Float return this.getF64(72);

	inline function set_rotationW(value:Float):Float { this.setF64(72, value); return value; }
}
