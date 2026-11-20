package flight._js;

abstract GlyphAtlasEntryExplanation(Dynamic) {
	public var renderable(get, set):Bool;
	inline function get_renderable():Bool return untyped this.renderable;
	inline function set_renderable(value:Bool):Bool return untyped this.renderable = value;
	public var glyphWidth(get, set):Int;
	inline function get_glyphWidth():Int return untyped this.glyphWidth;
	inline function set_glyphWidth(value:Int):Int return untyped this.glyphWidth = value;
	public var glyphHeight(get, set):Int;
	inline function get_glyphHeight():Int return untyped this.glyphHeight;
	inline function set_glyphHeight(value:Int):Int return untyped this.glyphHeight = value;
	public var usableWidth(get, set):Int;
	inline function get_usableWidth():Int return untyped this.usableWidth;
	inline function set_usableWidth(value:Int):Int return untyped this.usableWidth = value;
	public var usableHeight(get, set):Int;
	inline function get_usableHeight():Int return untyped this.usableHeight;
	inline function set_usableHeight(value:Int):Int return untyped this.usableHeight = value;
}
