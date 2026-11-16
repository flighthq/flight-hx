package flight._js;

abstract BitmapMismatch(Dynamic) {
	public var mismatchedPixels(get, set):Int;
	inline function get_mismatchedPixels():Int return untyped this["mismatchedPixels"];
	inline function set_mismatchedPixels(value:Int):Int return untyped this["mismatchedPixels"] = value;
	public var totalPixels(get, set):Int;
	inline function get_totalPixels():Int return untyped this["totalPixels"];
	inline function set_totalPixels(value:Int):Int return untyped this["totalPixels"] = value;
	public var fraction(get, set):Float;
	inline function get_fraction():Float return untyped this["fraction"];
	inline function set_fraction(value:Float):Float return untyped this["fraction"] = value;
	public var maxChannelDelta(get, set):Int;
	inline function get_maxChannelDelta():Int return untyped this["maxChannelDelta"];
	inline function set_maxChannelDelta(value:Int):Int return untyped this["maxChannelDelta"] = value;
}
