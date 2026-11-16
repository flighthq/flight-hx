package flight._js;

abstract ImageUrlOriginContext(Dynamic) {
	public var href(get, set):String;
	inline function get_href():String return untyped this["href"];
	inline function set_href(value:String):String return untyped this["href"] = value;
	public var origin(get, set):String;
	inline function get_origin():String return untyped this["origin"];
	inline function set_origin(value:String):String return untyped this["origin"] = value;
}
