package flight._js;

abstract GltfBuffer(Dynamic) {
	public var byteLength(get, set):Float;
	inline function get_byteLength():Float return untyped this["byteLength"];
	inline function set_byteLength(value:Float):Float return untyped this["byteLength"] = value;
}
