package flight._js;

abstract InputKeyRepeatOptions(Dynamic) {
	public var delay(get, set):Float;
	inline function get_delay():Float return untyped this["delay"];
	inline function set_delay(value:Float):Float return untyped this["delay"] = value;
	public var interval(get, set):Float;
	inline function get_interval():Float return untyped this["interval"];
	inline function set_interval(value:Float):Float return untyped this["interval"] = value;
}
