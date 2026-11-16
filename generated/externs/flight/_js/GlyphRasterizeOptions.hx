package flight._js;

abstract GlyphRasterizeOptions(Dynamic) {
	public var fontFamily(get, set):String;
	inline function get_fontFamily():String return untyped this["fontFamily"];
	inline function set_fontFamily(value:String):String return untyped this["fontFamily"] = value;
	public var fontSize(get, set):Float;
	inline function get_fontSize():Float return untyped this["fontSize"];
	inline function set_fontSize(value:Float):Float return untyped this["fontSize"] = value;
}
