package flight._js;

abstract BitmapFontParseExplanation(Dynamic) {
	public var charCount(get, set):Int;
	inline function get_charCount():Int return untyped this["charCount"];
	inline function set_charCount(value:Int):Int return untyped this["charCount"] = value;
	public var kerningCount(get, set):Int;
	inline function get_kerningCount():Int return untyped this["kerningCount"];
	inline function set_kerningCount(value:Int):Int return untyped this["kerningCount"] = value;
	public var pageCount(get, set):Int;
	inline function get_pageCount():Int return untyped this["pageCount"];
	inline function set_pageCount(value:Int):Int return untyped this["pageCount"] = value;
	public var success(get, set):Bool;
	inline function get_success():Bool return untyped this["success"];
	inline function set_success(value:Bool):Bool return untyped this["success"] = value;
}
