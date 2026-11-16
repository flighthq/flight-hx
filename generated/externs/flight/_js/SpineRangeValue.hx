package flight._js;

abstract SpineRangeValue(Dynamic) {
	public var high(get, set):Float;
	inline function get_high():Float return untyped this["high"];
	inline function set_high(value:Float):Float return untyped this["high"] = value;
	public var low(get, set):Float;
	inline function get_low():Float return untyped this["low"];
	inline function set_low(value:Float):Float return untyped this["low"] = value;
}
