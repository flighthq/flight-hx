package flight._js;

abstract FlowGuardState(Dynamic) {
	public var enabled(get, set):Bool;
	inline function get_enabled():Bool return untyped this["enabled"];
	inline function set_enabled(value:Bool):Bool return untyped this["enabled"] = value;
	public var transitionDepth(get, set):Int;
	inline function get_transitionDepth():Int return untyped this["transitionDepth"];
	inline function set_transitionDepth(value:Int):Int return untyped this["transitionDepth"] = value;
}
