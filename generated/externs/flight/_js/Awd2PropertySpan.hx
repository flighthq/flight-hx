package flight._js;

abstract Awd2PropertySpan(Dynamic) {
	public var length(get, set):Int;
	inline function get_length():Int return untyped this["length"];
	inline function set_length(value:Int):Int return untyped this["length"] = value;
	public var offset(get, set):Int;
	inline function get_offset():Int return untyped this["offset"];
	inline function set_offset(value:Int):Int return untyped this["offset"] = value;
}
