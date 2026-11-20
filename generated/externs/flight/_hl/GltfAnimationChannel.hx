package flight._hl;

abstract GltfAnimationChannel(hl.Bytes) {
	public var sampler(get, set):Float;

	inline function get_sampler():Float return this.getF64(8);

	inline function set_sampler(value:Float):Float { this.setF64(8, value); return value; }
}
