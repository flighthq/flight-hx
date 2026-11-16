package flight._js;

abstract MorphShapeGradientEndpointExplanation(Dynamic) {
	public var endStopCount(get, set):Int;
	inline function get_endStopCount():Int return untyped this["endStopCount"];
	inline function set_endStopCount(value:Int):Int return untyped this["endStopCount"] = value;
	public var startStopCount(get, set):Int;
	inline function get_startStopCount():Int return untyped this["startStopCount"];
	inline function set_startStopCount(value:Int):Int return untyped this["startStopCount"] = value;
	public var supported(get, set):Bool;
	inline function get_supported():Bool return untyped this["supported"];
	inline function set_supported(value:Bool):Bool return untyped this["supported"] = value;
}
