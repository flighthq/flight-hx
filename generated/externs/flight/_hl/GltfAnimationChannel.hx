package flight._hl;

abstract GltfAnimationChannel(hl.Bytes) {
	public var sampler(get, set):Single;

	inline function get_sampler():Single return this.getF32(8);

	inline function set_sampler(value:Single):Single { this.setF32(8, value); return value; }
}
