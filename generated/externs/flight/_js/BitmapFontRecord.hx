package flight._js;

abstract BitmapFontRecord(Dynamic) {
	public var base(get, set):Float;
	inline function get_base():Float return untyped this["base"];
	inline function set_base(value:Float):Float return untyped this["base"] = value;
	public var lineHeight(get, set):Float;
	inline function get_lineHeight():Float return untyped this["lineHeight"];
	inline function set_lineHeight(value:Float):Float return untyped this["lineHeight"] = value;
}
