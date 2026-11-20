package flight._js;

abstract ParsedProtocolUrl(Dynamic) {
	public var scheme(get, set):String;
	inline function get_scheme():String return untyped this.scheme;
	inline function set_scheme(value:String):String return untyped this.scheme = value;
	public var host(get, set):String;
	inline function get_host():String return untyped this.host;
	inline function set_host(value:String):String return untyped this.host = value;
	public var path(get, set):String;
	inline function get_path():String return untyped this.path;
	inline function set_path(value:String):String return untyped this.path = value;
}
