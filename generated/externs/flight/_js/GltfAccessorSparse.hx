package flight._js;

abstract GltfAccessorSparse(Dynamic) {
	public var count(get, set):Float;
	inline function get_count():Float return untyped this["count"];
	inline function set_count(value:Float):Float return untyped this["count"] = value;
}
