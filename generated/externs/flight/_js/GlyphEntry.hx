package flight._js;

abstract GlyphEntry(Dynamic) {
	public var advance(get, set):Float;
	inline function get_advance():Float return untyped this.advance;
	inline function set_advance(value:Float):Float return untyped this.advance = value;
	public var bearingX(get, set):Int;
	inline function get_bearingX():Int return untyped this.bearingX;
	inline function set_bearingX(value:Int):Int return untyped this.bearingX = value;
	public var bearingY(get, set):Int;
	inline function get_bearingY():Int return untyped this.bearingY;
	inline function set_bearingY(value:Int):Int return untyped this.bearingY = value;
	public var height(get, set):Int;
	inline function get_height():Int return untyped this.height;
	inline function set_height(value:Int):Int return untyped this.height = value;
	public var page(get, set):Int;
	inline function get_page():Int return untyped this.page;
	inline function set_page(value:Int):Int return untyped this.page = value;
	public var width(get, set):Int;
	inline function get_width():Int return untyped this.width;
	inline function set_width(value:Int):Int return untyped this.width = value;
	public var x(get, set):Int;
	inline function get_x():Int return untyped this.x;
	inline function set_x(value:Int):Int return untyped this.x = value;
	public var y(get, set):Int;
	inline function get_y():Int return untyped this.y;
	inline function set_y(value:Int):Int return untyped this.y = value;
}
