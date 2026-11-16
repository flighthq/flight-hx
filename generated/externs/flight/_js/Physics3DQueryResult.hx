package flight._js;

abstract Physics3DQueryResult(Dynamic) {
	public var hitCount(get, set):Int;
	inline function get_hitCount():Int return untyped this["hitCount"];
	inline function set_hitCount(value:Int):Int return untyped this["hitCount"] = value;
}
