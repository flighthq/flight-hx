package flight._js;

@:jsRequire("flight")
private extern class RiveStateMachineTransition_Ffi {
	@:native("flight_get_rive_state_machine_transition_duration") static function get_duration(ptr:Dynamic):Float;
	@:native("flight_set_rive_state_machine_transition_duration") static function set_duration(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rive_state_machine_transition_exit_time") static function get_exitTime(ptr:Dynamic):Float;
	@:native("flight_set_rive_state_machine_transition_exit_time") static function set_exitTime(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rive_state_machine_transition_flags") static function get_flags(ptr:Dynamic):Float;
	@:native("flight_set_rive_state_machine_transition_flags") static function set_flags(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rive_state_machine_transition_to_state_id") static function get_toStateId(ptr:Dynamic):Float;
	@:native("flight_set_rive_state_machine_transition_to_state_id") static function set_toStateId(ptr:Dynamic, value:Float):Float;
}

abstract RiveStateMachineTransition(Dynamic) {
	public var duration(get, set):Float;

	inline function get_duration():Float return RiveStateMachineTransition_Ffi.get_duration(this);

	inline function set_duration(value:Float):Float return RiveStateMachineTransition_Ffi.set_duration(this, value);
	public var exitTime(get, set):Float;

	inline function get_exitTime():Float return RiveStateMachineTransition_Ffi.get_exitTime(this);

	inline function set_exitTime(value:Float):Float return RiveStateMachineTransition_Ffi.set_exitTime(this, value);
	public var flags(get, set):Float;

	inline function get_flags():Float return RiveStateMachineTransition_Ffi.get_flags(this);

	inline function set_flags(value:Float):Float return RiveStateMachineTransition_Ffi.set_flags(this, value);
	public var toStateId(get, set):Float;

	inline function get_toStateId():Float return RiveStateMachineTransition_Ffi.get_toStateId(this);

	inline function set_toStateId(value:Float):Float return RiveStateMachineTransition_Ffi.set_toStateId(this, value);
}
