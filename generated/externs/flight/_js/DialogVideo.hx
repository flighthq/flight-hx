package flight._js;

abstract DialogVideo(Dynamic) {
	public var dataUrl(get, set):String;
	inline function get_dataUrl():String return untyped this.dataUrl;
	inline function set_dataUrl(value:String):String return untyped this.dataUrl = value;
	public var duration(get, set):Float;
	inline function get_duration():Float return untyped this.duration;
	inline function set_duration(value:Float):Float return untyped this.duration = value;
	public var mimeType(get, set):String;
	inline function get_mimeType():String return untyped this.mimeType;
	inline function set_mimeType(value:String):String return untyped this.mimeType = value;
}
