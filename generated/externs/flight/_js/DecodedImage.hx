package flight._js;

abstract DecodedImage(Dynamic) {
	public var height(get, set):Int;
	inline function get_height():Int return untyped this["height"];
	inline function set_height(value:Int):Int return untyped this["height"] = value;
	public var width(get, set):Int;
	inline function get_width():Int return untyped this["width"];
	inline function set_width(value:Int):Int return untyped this["width"] = value;
}
