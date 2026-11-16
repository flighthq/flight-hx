package flight._js;

abstract CurveKeyframe(Dynamic) {
	public var time(get, set):Float;
	inline function get_time():Float return untyped this["time"];
	inline function set_time(value:Float):Float return untyped this["time"] = value;
	public var value(get, set):Float;
	inline function get_value():Float return untyped this["value"];
	inline function set_value(value:Float):Float return untyped this["value"] = value;
}
