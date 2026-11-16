package flight._js;

abstract BitmapRegion(Dynamic) {
	public var x(get, set):Int;
	inline function get_x():Int return untyped this["x"];
	inline function set_x(value:Int):Int return untyped this["x"] = value;
	public var y(get, set):Int;
	inline function get_y():Int return untyped this["y"];
	inline function set_y(value:Int):Int return untyped this["y"] = value;
	public var width(get, set):Int;
	inline function get_width():Int return untyped this["width"];
	inline function set_width(value:Int):Int return untyped this["width"] = value;
	public var height(get, set):Int;
	inline function get_height():Int return untyped this["height"];
	inline function set_height(value:Int):Int return untyped this["height"] = value;
}
