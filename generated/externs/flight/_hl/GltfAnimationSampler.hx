package flight._hl;

abstract GltfAnimationSampler(hl.Bytes) {
	public var input(get, set):Single;

	inline function get_input():Single return this.getF32(24);

	inline function set_input(value:Single):Single { this.setF32(24, value); return value; }
	public var output(get, set):Single;

	inline function get_output():Single return this.getF32(28);

	inline function set_output(value:Single):Single { this.setF32(28, value); return value; }
}
