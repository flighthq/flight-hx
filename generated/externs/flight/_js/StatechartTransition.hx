package flight._js;

abstract StatechartTransition(Dynamic) {
	public var durationMs(get, set):Float;
	inline function get_durationMs():Float return untyped this["durationMs"];
	inline function set_durationMs(value:Float):Float return untyped this["durationMs"] = value;
	public var exitTimeRatio(get, set):Float;
	inline function get_exitTimeRatio():Float return untyped this["exitTimeRatio"];
	inline function set_exitTimeRatio(value:Float):Float return untyped this["exitTimeRatio"] = value;
	public var targetStateIndex(get, set):Int;
	inline function get_targetStateIndex():Int return untyped this["targetStateIndex"];
	inline function set_targetStateIndex(value:Int):Int return untyped this["targetStateIndex"] = value;
}
