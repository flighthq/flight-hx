package flight._hl;

abstract CameraShakeOffset(hl.Bytes) {
	public var rotationX(get, set):Float;

	inline function get_rotationX():Float return this.getF64(16);

	inline function set_rotationX(value:Float):Float { this.setF64(16, value); return value; }
	public var rotationY(get, set):Float;

	inline function get_rotationY():Float return this.getF64(24);

	inline function set_rotationY(value:Float):Float { this.setF64(24, value); return value; }
	public var rotationZ(get, set):Float;

	inline function get_rotationZ():Float return this.getF64(32);

	inline function set_rotationZ(value:Float):Float { this.setF64(32, value); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return this.getF64(40);

	inline function set_x(value:Float):Float { this.setF64(40, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return this.getF64(48);

	inline function set_y(value:Float):Float { this.setF64(48, value); return value; }
	public var z(get, set):Float;

	inline function get_z():Float return this.getF64(56);

	inline function set_z(value:Float):Float { this.setF64(56, value); return value; }
}
