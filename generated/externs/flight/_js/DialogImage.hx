package flight._js;

abstract DialogImage(Dynamic) {
	public var dataUrl(get, set):String;
	inline function get_dataUrl():String return untyped this.dataUrl;
	inline function set_dataUrl(value:String):String return untyped this.dataUrl = value;
	public var height(get, set):Float;
	inline function get_height():Float return untyped this.height;
	inline function set_height(value:Float):Float return untyped this.height = value;
	public var mimeType(get, set):String;
	inline function get_mimeType():String return untyped this.mimeType;
	inline function set_mimeType(value:String):String return untyped this.mimeType = value;
	public var width(get, set):Float;
	inline function get_width():Float return untyped this.width;
	inline function set_width(value:Float):Float return untyped this.width = value;
}
