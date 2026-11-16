package flight._cpp;

private extern class RiveStateMachineTransition_Ffi {
	@:native("flight_get_rive_state_machine_transition_duration") static function get_duration(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rive_state_machine_transition_duration") static function set_duration(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rive_state_machine_transition_exit_time") static function get_exitTime(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rive_state_machine_transition_exit_time") static function set_exitTime(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rive_state_machine_transition_flags") static function get_flags(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rive_state_machine_transition_flags") static function set_flags(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rive_state_machine_transition_to_state_id") static function get_toStateId(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rive_state_machine_transition_to_state_id") static function set_toStateId(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract RiveStateMachineTransition(cpp.Star<cpp.Void>) {
	public var duration(get, set):Single;

	inline function get_duration():Single return RiveStateMachineTransition_Ffi.get_duration(this);

	inline function set_duration(value:Single):Single { RiveStateMachineTransition_Ffi.set_duration(this, value); return value; }
	public var exitTime(get, set):Single;

	inline function get_exitTime():Single return RiveStateMachineTransition_Ffi.get_exitTime(this);

	inline function set_exitTime(value:Single):Single { RiveStateMachineTransition_Ffi.set_exitTime(this, value); return value; }
	public var flags(get, set):Single;

	inline function get_flags():Single return RiveStateMachineTransition_Ffi.get_flags(this);

	inline function set_flags(value:Single):Single { RiveStateMachineTransition_Ffi.set_flags(this, value); return value; }
	public var toStateId(get, set):Single;

	inline function get_toStateId():Single return RiveStateMachineTransition_Ffi.get_toStateId(this);

	inline function set_toStateId(value:Single):Single { RiveStateMachineTransition_Ffi.set_toStateId(this, value); return value; }
}
