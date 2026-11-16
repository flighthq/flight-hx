package flight._js;

abstract GltfBufferView(Dynamic) {
	public var buffer(get, set):Float;
	inline function get_buffer():Float return untyped this["buffer"];
	inline function set_buffer(value:Float):Float return untyped this["buffer"] = value;
	public var byteLength(get, set):Float;
	inline function get_byteLength():Float return untyped this["byteLength"];
	inline function set_byteLength(value:Float):Float return untyped this["byteLength"] = value;
}
