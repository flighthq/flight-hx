package flight._js._fn;

@:jsRequire("flight")
extern class Statechart {
	@:native("flight_are_statechart_guards_enabled")
	public static function areStatechartGuardsEnabled(instance:Dynamic):Bool;
	@:native("flight_disable_statechart_guards")
	public static function disableStatechartGuards(instance:Dynamic):Void;
	@:native("flight_create_statechart_instance")
	public static function createStatechartInstance(chart:Dynamic):Dynamic;
	@:native("flight_advance_statechart_instance")
	public static function advanceStatechartInstance(instance:Dynamic, deltaTime:Float):Int;
	@:native("flight_explain_statechart_transition")
	public static function explainStatechartTransition(instance:Dynamic, regionIndex:Int):flight._js.StatechartTransitionExplanation;
	@:native("flight_fire_statechart_trigger")
	public static function fireStatechartTrigger(instance:Dynamic, inputIndex:Int):Void;
	@:native("flight_get_statechart_input_index")
	public static function getStatechartInputIndex(chart:flight._js.StatechartRaw, name:String):Int;
	@:native("flight_get_statechart_region_blend")
	public static function getStatechartRegionBlend(instance:Dynamic, regionIndex:Int):Float;
	@:native("flight_get_statechart_region_state")
	public static function getStatechartRegionState(instance:Dynamic, regionIndex:Int):Int;
	@:native("flight_set_statechart_boolean_input")
	public static function setStatechartBooleanInput(instance:Dynamic, inputIndex:Int, value:Bool):Void;
	@:native("flight_set_statechart_number_input")
	public static function setStatechartNumberInput(instance:Dynamic, inputIndex:Int, value:Float):Void;
	@:native("flight_set_statechart_region_duration")
	public static function setStatechartRegionDuration(instance:Dynamic, regionIndex:Int, duration:Float):Void;
	@:native("flight_enable_statechart_signals")
	public static function enableStatechartSignals(instance:Dynamic):flight._js.StatechartSignals;
	@:native("flight_get_statechart_signals")
	public static function getStatechartSignals(instance:Dynamic):Dynamic;
	@:native("flight_free_statechart_transition_explanation")
	public static function freeStatechartTransitionExplanation(ptr:flight._js.StatechartTransitionExplanation):Void;
	@:native("flight_free_statechart_signals")
	public static function freeStatechartSignals(ptr:flight._js.StatechartSignals):Void;
}
