package flight._js;

abstract GltfNodePunctualLight(Dynamic) {
	public var light(get, set):Float;
	inline function get_light():Float return untyped this.light;
	inline function set_light(value:Float):Float return untyped this.light = value;
}
