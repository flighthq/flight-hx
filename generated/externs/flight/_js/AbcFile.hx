package flight._js;

abstract AbcFile(Dynamic) {
	public var majorVersion(get, set):Int;
	inline function get_majorVersion():Int return untyped this["majorVersion"];
	inline function set_majorVersion(value:Int):Int return untyped this["majorVersion"] = value;
	public var minorVersion(get, set):Int;
	inline function get_minorVersion():Int return untyped this["minorVersion"];
	inline function set_minorVersion(value:Int):Int return untyped this["minorVersion"] = value;
}
