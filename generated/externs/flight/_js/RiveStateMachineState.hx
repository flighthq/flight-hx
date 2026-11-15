package flight._js;

@:jsRequire("flight")
private extern class RiveStateMachineState_Ffi {
	@:native("flight_get_rive_state_machine_state_animation_id") static function get_animationId(ptr:Dynamic):Float;
	@:native("flight_set_rive_state_machine_state_animation_id") static function set_animationId(ptr:Dynamic, value:Float):Float;
}

abstract RiveStateMachineState(Dynamic) {
	public var animationId(get, set):Float;

	inline function get_animationId():Float return RiveStateMachineState_Ffi.get_animationId(this);

	inline function set_animationId(value:Float):Float return RiveStateMachineState_Ffi.set_animationId(this, value);
}
