package flight._js;

abstract InputGamepadAxisData(Dynamic) {
	public var axis(get, set):Int;
	inline function get_axis():Int return untyped this["axis"];
	inline function set_axis(value:Int):Int return untyped this["axis"] = value;
	public var gamepad(get, set):Int;
	inline function get_gamepad():Int return untyped this["gamepad"];
	inline function set_gamepad(value:Int):Int return untyped this["gamepad"] = value;
	public var timeStamp(get, set):Float;
	inline function get_timeStamp():Float return untyped this["timeStamp"];
	inline function set_timeStamp(value:Float):Float return untyped this["timeStamp"] = value;
	public var value(get, set):Float;
	inline function get_value():Float return untyped this["value"];
	inline function set_value(value:Float):Float return untyped this["value"] = value;
}
