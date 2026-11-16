package flight._js;

abstract RiveFileAsset(Dynamic) {
	public var cdnBaseUrl(get, set):String;
	inline function get_cdnBaseUrl():String return untyped this["cdnBaseUrl"];
	inline function set_cdnBaseUrl(value:String):String return untyped this["cdnBaseUrl"] = value;
	public var height(get, set):Float;
	inline function get_height():Float return untyped this["height"];
	inline function set_height(value:Float):Float return untyped this["height"] = value;
	public var kind(get, set):String;
	inline function get_kind():String return untyped this["kind"];
	inline function set_kind(value:String):String return untyped this["kind"] = value;
	public var name(get, set):String;
	inline function get_name():String return untyped this["name"];
	inline function set_name(value:String):String return untyped this["name"] = value;
	public var width(get, set):Float;
	inline function get_width():Float return untyped this["width"];
	inline function set_width(value:Float):Float return untyped this["width"] = value;
}
