package flight._js;

abstract BitmapFontKerningPair(Dynamic) {
	public var left(get, set):Int;
	inline function get_left():Int return untyped this["left"];
	inline function set_left(value:Int):Int return untyped this["left"] = value;
	public var right(get, set):Int;
	inline function get_right():Int return untyped this["right"];
	inline function set_right(value:Int):Int return untyped this["right"] = value;
}
