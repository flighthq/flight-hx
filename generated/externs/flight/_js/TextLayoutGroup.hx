package flight._js;

abstract TextLayoutGroup(Dynamic) {
	public var ascent(get, set):Float;
	inline function get_ascent():Float return untyped this["ascent"];
	inline function set_ascent(value:Float):Float return untyped this["ascent"] = value;
	public var descent(get, set):Float;
	inline function get_descent():Float return untyped this["descent"];
	inline function set_descent(value:Float):Float return untyped this["descent"] = value;
	public var endIndex(get, set):Int;
	inline function get_endIndex():Int return untyped this["endIndex"];
	inline function set_endIndex(value:Int):Int return untyped this["endIndex"] = value;
	public var height(get, set):Float;
	inline function get_height():Float return untyped this["height"];
	inline function set_height(value:Float):Float return untyped this["height"] = value;
	public var leading(get, set):Float;
	inline function get_leading():Float return untyped this["leading"];
	inline function set_leading(value:Float):Float return untyped this["leading"] = value;
	public var lineIndex(get, set):Int;
	inline function get_lineIndex():Int return untyped this["lineIndex"];
	inline function set_lineIndex(value:Int):Int return untyped this["lineIndex"] = value;
	public var offsetX(get, set):Float;
	inline function get_offsetX():Float return untyped this["offsetX"];
	inline function set_offsetX(value:Float):Float return untyped this["offsetX"] = value;
	public var offsetY(get, set):Float;
	inline function get_offsetY():Float return untyped this["offsetY"];
	inline function set_offsetY(value:Float):Float return untyped this["offsetY"] = value;
	public var startIndex(get, set):Int;
	inline function get_startIndex():Int return untyped this["startIndex"];
	inline function set_startIndex(value:Int):Int return untyped this["startIndex"] = value;
	public var width(get, set):Float;
	inline function get_width():Float return untyped this["width"];
	inline function set_width(value:Float):Float return untyped this["width"] = value;
}
