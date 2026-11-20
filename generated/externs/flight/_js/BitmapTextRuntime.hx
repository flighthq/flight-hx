package flight._js;

abstract BitmapTextRuntime(Dynamic) {
	public var glyphLayoutVersion(get, set):Float;
	inline function get_glyphLayoutVersion():Float return untyped this.glyphLayoutVersion;
	inline function set_glyphLayoutVersion(value:Float):Float return untyped this.glyphLayoutVersion = value;
	public var lineCount(get, set):Int;
	inline function get_lineCount():Int return untyped this.lineCount;
	inline function set_lineCount(value:Int):Int return untyped this.lineCount = value;
	public var truncated(get, set):Bool;
	inline function get_truncated():Bool return untyped this.truncated;
	inline function set_truncated(value:Bool):Bool return untyped this.truncated = value;
}
