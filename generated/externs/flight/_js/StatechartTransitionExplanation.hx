package flight._js;

@:jsRequire("flight")
private extern class StatechartTransitionExplanation_Ffi {
	@:native("flight_get_statechart_transition_explanation_blend") static function get_blend(ptr:Dynamic):Float;
	@:native("flight_set_statechart_transition_explanation_blend") static function set_blend(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_statechart_transition_explanation_condition_index") static function get_conditionIndex(ptr:Dynamic):Int;
	@:native("flight_set_statechart_transition_explanation_condition_index") static function set_conditionIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_statechart_transition_explanation_region_index") static function get_regionIndex(ptr:Dynamic):Int;
	@:native("flight_set_statechart_transition_explanation_region_index") static function set_regionIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_statechart_transition_explanation_source_state_index") static function get_sourceStateIndex(ptr:Dynamic):Int;
	@:native("flight_set_statechart_transition_explanation_source_state_index") static function set_sourceStateIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_statechart_transition_explanation_target_state_index") static function get_targetStateIndex(ptr:Dynamic):Int;
	@:native("flight_set_statechart_transition_explanation_target_state_index") static function set_targetStateIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_statechart_transition_explanation_transition_index") static function get_transitionIndex(ptr:Dynamic):Int;
	@:native("flight_set_statechart_transition_explanation_transition_index") static function set_transitionIndex(ptr:Dynamic, value:Int):Int;
}

abstract StatechartTransitionExplanation(Dynamic) {
	public var blend(get, set):Float;

	inline function get_blend():Float return StatechartTransitionExplanation_Ffi.get_blend(this);

	inline function set_blend(value:Float):Float return StatechartTransitionExplanation_Ffi.set_blend(this, value);
	public var conditionIndex(get, set):Int;

	inline function get_conditionIndex():Int return StatechartTransitionExplanation_Ffi.get_conditionIndex(this);

	inline function set_conditionIndex(value:Int):Int return StatechartTransitionExplanation_Ffi.set_conditionIndex(this, value);
	public var regionIndex(get, set):Int;

	inline function get_regionIndex():Int return StatechartTransitionExplanation_Ffi.get_regionIndex(this);

	inline function set_regionIndex(value:Int):Int return StatechartTransitionExplanation_Ffi.set_regionIndex(this, value);
	public var sourceStateIndex(get, set):Int;

	inline function get_sourceStateIndex():Int return StatechartTransitionExplanation_Ffi.get_sourceStateIndex(this);

	inline function set_sourceStateIndex(value:Int):Int return StatechartTransitionExplanation_Ffi.set_sourceStateIndex(this, value);
	public var targetStateIndex(get, set):Int;

	inline function get_targetStateIndex():Int return StatechartTransitionExplanation_Ffi.get_targetStateIndex(this);

	inline function set_targetStateIndex(value:Int):Int return StatechartTransitionExplanation_Ffi.set_targetStateIndex(this, value);
	public var transitionIndex(get, set):Int;

	inline function get_transitionIndex():Int return StatechartTransitionExplanation_Ffi.get_transitionIndex(this);

	inline function set_transitionIndex(value:Int):Int return StatechartTransitionExplanation_Ffi.set_transitionIndex(this, value);
}
