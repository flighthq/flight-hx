package flight._js;

@:jsRequire("flight")
private extern class StatechartTransition_Ffi {
	@:native("flight_get_statechart_transition_duration_ms") static function get_durationMs(ptr:Dynamic):Float;
	@:native("flight_set_statechart_transition_duration_ms") static function set_durationMs(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_statechart_transition_exit_time_ratio") static function get_exitTimeRatio(ptr:Dynamic):Float;
	@:native("flight_set_statechart_transition_exit_time_ratio") static function set_exitTimeRatio(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_statechart_transition_target_state_index") static function get_targetStateIndex(ptr:Dynamic):Int;
	@:native("flight_set_statechart_transition_target_state_index") static function set_targetStateIndex(ptr:Dynamic, value:Int):Int;
}

abstract StatechartTransition(Dynamic) {
	public var durationMs(get, set):Float;

	inline function get_durationMs():Float return StatechartTransition_Ffi.get_durationMs(this);

	inline function set_durationMs(value:Float):Float return StatechartTransition_Ffi.set_durationMs(this, value);
	public var exitTimeRatio(get, set):Float;

	inline function get_exitTimeRatio():Float return StatechartTransition_Ffi.get_exitTimeRatio(this);

	inline function set_exitTimeRatio(value:Float):Float return StatechartTransition_Ffi.set_exitTimeRatio(this, value);
	public var targetStateIndex(get, set):Int;

	inline function get_targetStateIndex():Int return StatechartTransition_Ffi.get_targetStateIndex(this);

	inline function set_targetStateIndex(value:Int):Int return StatechartTransition_Ffi.set_targetStateIndex(this, value);
}
