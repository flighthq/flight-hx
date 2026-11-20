package flight._js;

abstract ScreenMode(Dynamic) {
	public var width(get, set):Float;
	inline function get_width():Float return untyped this.width;
	inline function set_width(value:Float):Float return untyped this.width = value;
	public var height(get, set):Float;
	inline function get_height():Float return untyped this.height;
	inline function set_height(value:Float):Float return untyped this.height = value;
	public var refreshRate(get, set):Float;
	inline function get_refreshRate():Float return untyped this.refreshRate;
	inline function set_refreshRate(value:Float):Float return untyped this.refreshRate = value;
	public var colorDepth(get, set):Float;
	inline function get_colorDepth():Float return untyped this.colorDepth;
	inline function set_colorDepth(value:Float):Float return untyped this.colorDepth = value;
	public var pixelFormat(get, set):String;
	inline function get_pixelFormat():String return untyped this.pixelFormat;
	inline function set_pixelFormat(value:String):String return untyped this.pixelFormat = value;
}
