package flight._js;

abstract RiveStateMachineTransition(Dynamic) {
	public var duration(get, set):Float;
	inline function get_duration():Float return untyped this["duration"];
	inline function set_duration(value:Float):Float return untyped this["duration"] = value;
	public var exitTime(get, set):Float;
	inline function get_exitTime():Float return untyped this["exitTime"];
	inline function set_exitTime(value:Float):Float return untyped this["exitTime"] = value;
	public var flags(get, set):Float;
	inline function get_flags():Float return untyped this["flags"];
	inline function set_flags(value:Float):Float return untyped this["flags"] = value;
	public var toStateId(get, set):Float;
	inline function get_toStateId():Float return untyped this["toStateId"];
	inline function set_toStateId(value:Float):Float return untyped this["toStateId"] = value;
}
