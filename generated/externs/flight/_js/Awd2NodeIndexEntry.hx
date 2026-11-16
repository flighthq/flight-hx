package flight._js;

abstract Awd2NodeIndexEntry(Dynamic) {
	public var key(get, set):Int;
	inline function get_key():Int return untyped this["key"];
	inline function set_key(value:Int):Int return untyped this["key"] = value;
	public var value(get, set):Int;
	inline function get_value():Int return untyped this["value"];
	inline function set_value(value:Int):Int return untyped this["value"] = value;
}
