package flight._js;

abstract GltfAnimationChannel(Dynamic) {
	public var sampler(get, set):Float;
	inline function get_sampler():Float return untyped this.sampler;
	inline function set_sampler(value:Float):Float return untyped this.sampler = value;
}
