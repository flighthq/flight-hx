package flight._hl;

abstract CameraShakeOffset(hl.Bytes) {
	public var rotationX(get, set):Single;

	inline function get_rotationX():Single return this.getF32(16);

	inline function set_rotationX(value:Single):Single { this.setF32(16, value); return value; }
	public var rotationY(get, set):Single;

	inline function get_rotationY():Single return this.getF32(20);

	inline function set_rotationY(value:Single):Single { this.setF32(20, value); return value; }
	public var rotationZ(get, set):Single;

	inline function get_rotationZ():Single return this.getF32(24);

	inline function set_rotationZ(value:Single):Single { this.setF32(24, value); return value; }
	public var x(get, set):Single;

	inline function get_x():Single return this.getF32(28);

	inline function set_x(value:Single):Single { this.setF32(28, value); return value; }
	public var y(get, set):Single;

	inline function get_y():Single return this.getF32(32);

	inline function set_y(value:Single):Single { this.setF32(32, value); return value; }
	public var z(get, set):Single;

	inline function get_z():Single return this.getF32(36);

	inline function set_z(value:Single):Single { this.setF32(36, value); return value; }
}
