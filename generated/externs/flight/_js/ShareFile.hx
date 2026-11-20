package flight._js;

abstract ShareFile(Dynamic) {
	public var name(get, set):String;
	inline function get_name():String return untyped this.name;
	inline function set_name(value:String):String return untyped this.name = value;
	public var mimeType(get, set):String;
	inline function get_mimeType():String return untyped this.mimeType;
	inline function set_mimeType(value:String):String return untyped this.mimeType = value;
	public var dataUrl(get, set):String;
	inline function get_dataUrl():String return untyped this.dataUrl;
	inline function set_dataUrl(value:String):String return untyped this.dataUrl = value;
}
