package flight._hl;

abstract ColladaPerspectiveCameraDefinition(hl.Bytes) {
	public var aspect(get, set):Float;

	inline function get_aspect():Float return this.getF64(24);

	inline function set_aspect(value:Float):Float { this.setF64(24, value); return value; }
	public var far(get, set):Float;

	inline function get_far():Float return this.getF64(32);

	inline function set_far(value:Float):Float { this.setF64(32, value); return value; }
	public var fovY(get, set):Float;

	inline function get_fovY():Float return this.getF64(40);

	inline function set_fovY(value:Float):Float { this.setF64(40, value); return value; }
	public var near(get, set):Float;

	inline function get_near():Float return this.getF64(48);

	inline function set_near(value:Float):Float { this.setF64(48, value); return value; }
}
