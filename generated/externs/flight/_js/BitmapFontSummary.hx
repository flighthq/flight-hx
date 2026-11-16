package flight._js;

abstract BitmapFontSummary(Dynamic) {
	public var byteSize(get, set):Int;
	inline function get_byteSize():Int return untyped this.byteSize;
	inline function set_byteSize(value:Int):Int return untyped this.byteSize = value;
	public var glyphCount(get, set):Int;
	inline function get_glyphCount():Int return untyped this.glyphCount;
	inline function set_glyphCount(value:Int):Int return untyped this.glyphCount = value;
	public var kerningPairCount(get, set):Int;
	inline function get_kerningPairCount():Int return untyped this.kerningPairCount;
	inline function set_kerningPairCount(value:Int):Int return untyped this.kerningPairCount = value;
	public var maxCodepoint(get, set):Int;
	inline function get_maxCodepoint():Int return untyped this.maxCodepoint;
	inline function set_maxCodepoint(value:Int):Int return untyped this.maxCodepoint = value;
	public var minCodepoint(get, set):Int;
	inline function get_minCodepoint():Int return untyped this.minCodepoint;
	inline function set_minCodepoint(value:Int):Int return untyped this.minCodepoint = value;
	public var pageCount(get, set):Int;
	inline function get_pageCount():Int return untyped this.pageCount;
	inline function set_pageCount(value:Int):Int return untyped this.pageCount = value;
}
