package flight._js;

abstract UnityBurst(Dynamic) {
	public var count(get, set):Float;
	inline function get_count():Float return untyped this["count"];
	inline function set_count(value:Float):Float return untyped this["count"] = value;
	public var cycleCount(get, set):Float;
	inline function get_cycleCount():Float return untyped this["cycleCount"];
	inline function set_cycleCount(value:Float):Float return untyped this["cycleCount"] = value;
	public var repeatInterval(get, set):Float;
	inline function get_repeatInterval():Float return untyped this["repeatInterval"];
	inline function set_repeatInterval(value:Float):Float return untyped this["repeatInterval"] = value;
	public var time(get, set):Float;
	inline function get_time():Float return untyped this["time"];
	inline function set_time(value:Float):Float return untyped this["time"] = value;
}
