package flight._cpp;

private extern class FlowGuardState_Ffi {
	@:native("flight_get_flow_guard_state_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_flow_guard_state_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_flow_guard_state_transition_depth") static function get_transitionDepth(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_flow_guard_state_transition_depth") static function set_transitionDepth(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract FlowGuardState(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return FlowGuardState_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { FlowGuardState_Ffi.set_enabled(this, value); return value; }
	public var transitionDepth(get, set):Int;

	inline function get_transitionDepth():Int return FlowGuardState_Ffi.get_transitionDepth(this);

	inline function set_transitionDepth(value:Int):Int { FlowGuardState_Ffi.set_transitionDepth(this, value); return value; }
}
