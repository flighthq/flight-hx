package flight._hl;

abstract GltfAnimationSampler(hl.Bytes) {
	public var input(get, set):Float;

	inline function get_input():Float return this.getF64(24);

	inline function set_input(value:Float):Float { this.setF64(24, value); return value; }
	public var output(get, set):Float;

	inline function get_output():Float return this.getF64(32);

	inline function set_output(value:Float):Float { this.setF64(32, value); return value; }
}
