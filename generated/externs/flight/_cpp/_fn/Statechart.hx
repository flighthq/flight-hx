package flight._cpp._fn;

extern class Statechart {
	@:native("flight_are_statechart_guards_enabled")
	public static function areStatechartGuardsEnabled(instance:cpp.Star<cpp.Void>):Bool;
	@:native("flight_disable_statechart_guards")
	public static function disableStatechartGuards(instance:cpp.Star<cpp.Void>):Void;
	@:native("flight_create_statechart_instance")
	public static function createStatechartInstance(chart:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_advance_statechart_instance")
	public static function advanceStatechartInstance(instance:cpp.Star<cpp.Void>, deltaTime:Float):Int;
	@:native("flight_explain_statechart_transition")
	public static function explainStatechartTransition(instance:cpp.Star<cpp.Void>, regionIndex:Int):flight._cpp.StatechartTransitionExplanation;
	@:native("flight_fire_statechart_trigger")
	public static function fireStatechartTrigger(instance:cpp.Star<cpp.Void>, inputIndex:Int):Void;
	@:native("flight_get_statechart_input_index")
	public static function getStatechartInputIndex(chart:flight._cpp.StatechartRaw, name:cpp.ConstCharStar):Int;
	@:native("flight_get_statechart_region_blend")
	public static function getStatechartRegionBlend(instance:cpp.Star<cpp.Void>, regionIndex:Int):Single;
	@:native("flight_get_statechart_region_state")
	public static function getStatechartRegionState(instance:cpp.Star<cpp.Void>, regionIndex:Int):Int;
	@:native("flight_set_statechart_boolean_input")
	public static function setStatechartBooleanInput(instance:cpp.Star<cpp.Void>, inputIndex:Int, value:Bool):Void;
	@:native("flight_set_statechart_number_input")
	public static function setStatechartNumberInput(instance:cpp.Star<cpp.Void>, inputIndex:Int, value:Float):Void;
	@:native("flight_set_statechart_region_duration")
	public static function setStatechartRegionDuration(instance:cpp.Star<cpp.Void>, regionIndex:Int, duration:Float):Void;
	@:native("flight_enable_statechart_signals")
	public static function enableStatechartSignals(instance:cpp.Star<cpp.Void>):flight._cpp.StatechartSignals;
	@:native("flight_get_statechart_signals")
	public static function getStatechartSignals(instance:cpp.Star<cpp.Void>):flight._cpp.StatechartSignals;
	@:native("flight_free_statechart_instance_raw_ref")
	public static function freeStatechartInstanceRawRef(ptr:flight._cpp.StatechartInstanceRaw):Void;
	@:native("flight_free_statechart_transition_explanation")
	public static function freeStatechartTransitionExplanation(ptr:flight._cpp.StatechartTransitionExplanation):Void;
	@:native("flight_free_statechart_signals")
	public static function freeStatechartSignals(ptr:flight._cpp.StatechartSignals):Void;
}
