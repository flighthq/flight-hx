package flight._cpp;

private extern class RiveStateMachineState_Ffi {
	@:native("flight_get_rive_state_machine_state_animation_id") static function get_animationId(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rive_state_machine_state_animation_id") static function set_animationId(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract RiveStateMachineState(cpp.Star<cpp.Void>) {
	public var animationId(get, set):Single;

	inline function get_animationId():Single return RiveStateMachineState_Ffi.get_animationId(this);

	inline function set_animationId(value:Single):Single return RiveStateMachineState_Ffi.set_animationId(this, value);
}
