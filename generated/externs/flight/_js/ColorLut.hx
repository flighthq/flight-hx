package flight._js;

abstract ColorLut(Dynamic) {
	public var size(get, set):Int;
	inline function get_size():Int return untyped this["size"];
	inline function set_size(value:Int):Int return untyped this["size"] = value;
}
