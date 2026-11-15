package flight._js;

@:jsRequire("flight")
private extern class AnimationStateMachine_Ffi {
	@:native("flight_get_animation_state_machine_current_state_index") static function get_currentStateIndex(ptr:Dynamic):Int;
	@:native("flight_set_animation_state_machine_current_state_index") static function set_currentStateIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_animation_state_machine_transition_duration") static function get_transitionDuration(ptr:Dynamic):Float;
	@:native("flight_set_animation_state_machine_transition_duration") static function set_transitionDuration(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_animation_state_machine_transition_elapsed") static function get_transitionElapsed(ptr:Dynamic):Float;
	@:native("flight_set_animation_state_machine_transition_elapsed") static function set_transitionElapsed(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_animation_state_machine_transition_weight") static function get_transitionWeight(ptr:Dynamic):Float;
	@:native("flight_set_animation_state_machine_transition_weight") static function set_transitionWeight(ptr:Dynamic, value:Float):Float;
}

abstract AnimationStateMachine(Dynamic) {
	public var currentStateIndex(get, set):Int;

	inline function get_currentStateIndex():Int return AnimationStateMachine_Ffi.get_currentStateIndex(this);

	inline function set_currentStateIndex(value:Int):Int return AnimationStateMachine_Ffi.set_currentStateIndex(this, value);
	public var transitionDuration(get, set):Float;

	inline function get_transitionDuration():Float return AnimationStateMachine_Ffi.get_transitionDuration(this);

	inline function set_transitionDuration(value:Float):Float return AnimationStateMachine_Ffi.set_transitionDuration(this, value);
	public var transitionElapsed(get, set):Float;

	inline function get_transitionElapsed():Float return AnimationStateMachine_Ffi.get_transitionElapsed(this);

	inline function set_transitionElapsed(value:Float):Float return AnimationStateMachine_Ffi.set_transitionElapsed(this, value);
	public var transitionWeight(get, set):Float;

	inline function get_transitionWeight():Float return AnimationStateMachine_Ffi.get_transitionWeight(this);

	inline function set_transitionWeight(value:Float):Float return AnimationStateMachine_Ffi.set_transitionWeight(this, value);
}
