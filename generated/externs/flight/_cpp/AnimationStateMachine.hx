package flight._cpp;

private extern class AnimationStateMachine_Ffi {
	@:native("flight_get_animation_state_machine_current_state_index") static function get_currentStateIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_animation_state_machine_current_state_index") static function set_currentStateIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_animation_state_machine_transition_duration") static function get_transitionDuration(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_animation_state_machine_transition_duration") static function set_transitionDuration(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_animation_state_machine_transition_elapsed") static function get_transitionElapsed(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_animation_state_machine_transition_elapsed") static function set_transitionElapsed(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_animation_state_machine_transition_weight") static function get_transitionWeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_animation_state_machine_transition_weight") static function set_transitionWeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract AnimationStateMachine(cpp.Star<cpp.Void>) {
	public var currentStateIndex(get, set):Int;

	inline function get_currentStateIndex():Int return AnimationStateMachine_Ffi.get_currentStateIndex(this);

	inline function set_currentStateIndex(value:Int):Int { AnimationStateMachine_Ffi.set_currentStateIndex(this, value); return value; }
	public var transitionDuration(get, set):Float;

	inline function get_transitionDuration():Float return AnimationStateMachine_Ffi.get_transitionDuration(this);

	inline function set_transitionDuration(value:Float):Float { AnimationStateMachine_Ffi.set_transitionDuration(this, value); return value; }
	public var transitionElapsed(get, set):Float;

	inline function get_transitionElapsed():Float return AnimationStateMachine_Ffi.get_transitionElapsed(this);

	inline function set_transitionElapsed(value:Float):Float { AnimationStateMachine_Ffi.set_transitionElapsed(this, value); return value; }
	public var transitionWeight(get, set):Single;

	inline function get_transitionWeight():Single return AnimationStateMachine_Ffi.get_transitionWeight(this);

	inline function set_transitionWeight(value:Single):Single { AnimationStateMachine_Ffi.set_transitionWeight(this, value); return value; }
}
