package flight._js;

abstract TextLayoutResult(Dynamic) {
	public var numLines(get, set):Int;
	inline function get_numLines():Int return untyped this["numLines"];
	inline function set_numLines(value:Int):Int return untyped this["numLines"] = value;
	public var textHeight(get, set):Float;
	inline function get_textHeight():Float return untyped this["textHeight"];
	inline function set_textHeight(value:Float):Float return untyped this["textHeight"] = value;
	public var textWidth(get, set):Float;
	inline function get_textWidth():Float return untyped this["textWidth"];
	inline function set_textWidth(value:Float):Float return untyped this["textWidth"] = value;
}
