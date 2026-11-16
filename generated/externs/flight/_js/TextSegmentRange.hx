package flight._js;

abstract TextSegmentRange(Dynamic) {
	public var start(get, set):Int;
	inline function get_start():Int return untyped this["start"];
	inline function set_start(value:Int):Int return untyped this["start"] = value;
	public var end(get, set):Int;
	inline function get_end():Int return untyped this["end"];
	inline function set_end(value:Int):Int return untyped this["end"] = value;
}
