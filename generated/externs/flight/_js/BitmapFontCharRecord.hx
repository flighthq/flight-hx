package flight._js;

abstract BitmapFontCharRecord(Dynamic) {
	public var height(get, set):Int;
	inline function get_height():Int return untyped this["height"];
	inline function set_height(value:Int):Int return untyped this["height"] = value;
	public var id(get, set):Int;
	inline function get_id():Int return untyped this["id"];
	inline function set_id(value:Int):Int return untyped this["id"] = value;
	public var page(get, set):Int;
	inline function get_page():Int return untyped this["page"];
	inline function set_page(value:Int):Int return untyped this["page"] = value;
	public var width(get, set):Int;
	inline function get_width():Int return untyped this["width"];
	inline function set_width(value:Int):Int return untyped this["width"] = value;
	public var x(get, set):Int;
	inline function get_x():Int return untyped this["x"];
	inline function set_x(value:Int):Int return untyped this["x"] = value;
	public var xadvance(get, set):Float;
	inline function get_xadvance():Float return untyped this["xadvance"];
	inline function set_xadvance(value:Float):Float return untyped this["xadvance"] = value;
	public var xoffset(get, set):Int;
	inline function get_xoffset():Int return untyped this["xoffset"];
	inline function set_xoffset(value:Int):Int return untyped this["xoffset"] = value;
	public var y(get, set):Int;
	inline function get_y():Int return untyped this["y"];
	inline function set_y(value:Int):Int return untyped this["y"] = value;
	public var yoffset(get, set):Int;
	inline function get_yoffset():Int return untyped this["yoffset"];
	inline function set_yoffset(value:Int):Int return untyped this["yoffset"] = value;
}
