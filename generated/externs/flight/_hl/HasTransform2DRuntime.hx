package flight._hl;

abstract HasTransform2DRuntime(hl.Bytes) {
	public var rotationAngle(get, set):Single;

	inline function get_rotationAngle():Single return this.getF32(48);

	inline function set_rotationAngle(value:Single):Single { this.setF32(48, value); return value; }
	public var rotationCosine(get, set):Single;

	inline function get_rotationCosine():Single return this.getF32(52);

	inline function set_rotationCosine(value:Single):Single { this.setF32(52, value); return value; }
	public var rotationSine(get, set):Single;

	inline function get_rotationSine():Single return this.getF32(56);

	inline function set_rotationSine(value:Single):Single { this.setF32(56, value); return value; }
}
