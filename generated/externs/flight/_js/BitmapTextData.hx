package flight._js;

abstract BitmapTextData(Dynamic) {
	public var ellipsis(get, set):String;
	inline function get_ellipsis():String return untyped this.ellipsis;
	inline function set_ellipsis(value:String):String return untyped this.ellipsis = value;
	public var letterSpacing(get, set):Float;
	inline function get_letterSpacing():Float return untyped this.letterSpacing;
	inline function set_letterSpacing(value:Float):Float return untyped this.letterSpacing = value;
	public var lineHeight(get, set):Float;
	inline function get_lineHeight():Float return untyped this.lineHeight;
	inline function set_lineHeight(value:Float):Float return untyped this.lineHeight = value;
	public var text(get, set):String;
	inline function get_text():String return untyped this.text;
	inline function set_text(value:String):String return untyped this.text = value;
}
