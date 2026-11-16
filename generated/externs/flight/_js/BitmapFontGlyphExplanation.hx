package flight._js;

abstract BitmapFontGlyphExplanation(Dynamic) {
	public var glyphHeight(get, set):Int;
	inline function get_glyphHeight():Int return untyped this.glyphHeight;
	inline function set_glyphHeight(value:Int):Int return untyped this.glyphHeight = value;
	public var glyphWidth(get, set):Int;
	inline function get_glyphWidth():Int return untyped this.glyphWidth;
	inline function set_glyphWidth(value:Int):Int return untyped this.glyphWidth = value;
	public var page(get, set):Int;
	inline function get_page():Int return untyped this.page;
	inline function set_page(value:Int):Int return untyped this.page = value;
	public var pageCount(get, set):Int;
	inline function get_pageCount():Int return untyped this.pageCount;
	inline function set_pageCount(value:Int):Int return untyped this.pageCount = value;
	public var renderable(get, set):Bool;
	inline function get_renderable():Bool return untyped this.renderable;
	inline function set_renderable(value:Bool):Bool return untyped this.renderable = value;
}
