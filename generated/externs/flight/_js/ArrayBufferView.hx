package flight._js;

abstract ArrayBufferView(Dynamic) {
	public var byteOffset(get, set):Int;
	inline function get_byteOffset():Int return untyped this["byteOffset"];
	inline function set_byteOffset(value:Int):Int return untyped this["byteOffset"] = value;
	public var byteLength(get, set):Int;
	inline function get_byteLength():Int return untyped this["byteLength"];
	inline function set_byteLength(value:Int):Int return untyped this["byteLength"] = value;
}
