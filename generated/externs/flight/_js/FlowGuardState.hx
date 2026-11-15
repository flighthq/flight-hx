package flight._js;

@:jsRequire("flight")
private extern class FlowGuardState_Ffi {
	@:native("flight_get_flow_guard_state_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_flow_guard_state_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_flow_guard_state_transition_depth") static function get_transitionDepth(ptr:Dynamic):Int;
	@:native("flight_set_flow_guard_state_transition_depth") static function set_transitionDepth(ptr:Dynamic, value:Int):Int;
}

abstract FlowGuardState(Dynamic) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return FlowGuardState_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return FlowGuardState_Ffi.set_enabled(this, value);
	public var transitionDepth(get, set):Int;

	inline function get_transitionDepth():Int return FlowGuardState_Ffi.get_transitionDepth(this);

	inline function set_transitionDepth(value:Int):Int return FlowGuardState_Ffi.set_transitionDepth(this, value);
}
