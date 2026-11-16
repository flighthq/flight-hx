package flight._js;

abstract Physics2DAbi(Dynamic) {
	public var capabilities(get, set):Int;
	inline function get_capabilities():Int return untyped this["capabilities"];
	inline function set_capabilities(value:Int):Int return untyped this["capabilities"] = value;
	public var version(get, set):Int;
	inline function get_version():Int return untyped this["version"];
	inline function set_version(value:Int):Int return untyped this["version"] = value;
}
