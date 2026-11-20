package flight._js;

abstract GlyphAtlasOptions(Dynamic) {
	public var fontFamily(get, set):String;
	inline function get_fontFamily():String return untyped this.fontFamily;
	inline function set_fontFamily(value:String):String return untyped this.fontFamily = value;
	public var fontSize(get, set):Float;
	inline function get_fontSize():Float return untyped this.fontSize;
	inline function set_fontSize(value:Float):Float return untyped this.fontSize = value;
	public var height(get, set):Int;
	inline function get_height():Int return untyped this.height;
	inline function set_height(value:Int):Int return untyped this.height = value;
	public var width(get, set):Int;
	inline function get_width():Int return untyped this.width;
	inline function set_width(value:Int):Int return untyped this.width = value;
}
