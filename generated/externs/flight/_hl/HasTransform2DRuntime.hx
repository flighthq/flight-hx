package flight._hl;

abstract HasTransform2DRuntime(hl.Bytes) {
	public var rotationAngle(get, set):Float;

	inline function get_rotationAngle():Float return this.getF64(72);

	inline function set_rotationAngle(value:Float):Float { this.setF64(72, value); return value; }
	public var rotationCosine(get, set):Float;

	inline function get_rotationCosine():Float return this.getF64(80);

	inline function set_rotationCosine(value:Float):Float { this.setF64(80, value); return value; }
	public var rotationSine(get, set):Float;

	inline function get_rotationSine():Float return this.getF64(88);

	inline function set_rotationSine(value:Float):Float { this.setF64(88, value); return value; }
}
