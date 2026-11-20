package flight._hl;

abstract CollisionTriangleMesh3D(hl.Bytes) {
	public var version(get, set):haxe.Int64;

	inline function get_version():haxe.Int64 return haxe.Int64.make(this.getI32(52), this.getI32(48));

	inline function set_version(value:haxe.Int64):haxe.Int64 { { this.setI32(48, value.low); this.setI32(52, value.high); }; return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(56);

	inline function set_x(value:Float):Float { this.setF64(56, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(64);

	inline function set_y(value:Float):Float { this.setF64(64, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return this.getF64(72);

	inline function set_z(value:Float):Float { this.setF64(72, value); return value; }
	public var rotationX(get, set):Float;

	inline function get_rotationX():Float return this.getF64(80);

	inline function set_rotationX(value:Float):Float { this.setF64(80, value); return value; }
	public var rotationY(get, set):Float;

	inline function get_rotationY():Float return this.getF64(88);

	inline function set_rotationY(value:Float):Float { this.setF64(88, value); return value; }
	public var rotationZ(get, set):Float;

	inline function get_rotationZ():Float return this.getF64(96);

	inline function set_rotationZ(value:Float):Float { this.setF64(96, value); return value; }
	public var rotationW(get, set):Float;

	inline function get_rotationW():Float return this.getF64(104);

	inline function set_rotationW(value:Float):Float { this.setF64(104, value); return value; }
}
