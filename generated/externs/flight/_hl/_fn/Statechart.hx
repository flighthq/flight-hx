package flight._hl._fn;

extern class Statechart {
	@:hlNative("flight", "flight_are_statechart_guards_enabled")
	public static function areStatechartGuardsEnabled(instance:hl.Bytes):Bool;
	@:hlNative("flight", "flight_disable_statechart_guards")
	public static function disableStatechartGuards(instance:hl.Bytes):Void;
	@:hlNative("flight", "flight_create_statechart_instance")
	public static function createStatechartInstance(chart:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_advance_statechart_instance")
	public static function advanceStatechartInstance(instance:hl.Bytes, deltaTime:Float):Int;
	@:hlNative("flight", "flight_explain_statechart_transition")
	public static function explainStatechartTransition(instance:hl.Bytes, regionIndex:Int):flight._hl.StatechartTransitionExplanation;
	@:hlNative("flight", "flight_fire_statechart_trigger")
	public static function fireStatechartTrigger(instance:hl.Bytes, inputIndex:Int):Void;
	@:hlNative("flight", "flight_get_statechart_input_index")
	public static function getStatechartInputIndex(chart:flight._hl.StatechartRaw, name:hl.Bytes):Int;
	@:hlNative("flight", "flight_get_statechart_region_blend")
	public static function getStatechartRegionBlend(instance:hl.Bytes, regionIndex:Int):Single;
	@:hlNative("flight", "flight_get_statechart_region_state")
	public static function getStatechartRegionState(instance:hl.Bytes, regionIndex:Int):Int;
	@:hlNative("flight", "flight_set_statechart_boolean_input")
	public static function setStatechartBooleanInput(instance:hl.Bytes, inputIndex:Int, value:Bool):Void;
	@:hlNative("flight", "flight_set_statechart_number_input")
	public static function setStatechartNumberInput(instance:hl.Bytes, inputIndex:Int, value:Float):Void;
	@:hlNative("flight", "flight_set_statechart_region_duration")
	public static function setStatechartRegionDuration(instance:hl.Bytes, regionIndex:Int, duration:Float):Void;
	@:hlNative("flight", "flight_enable_statechart_signals")
	public static function enableStatechartSignals(instance:hl.Bytes):flight._hl.StatechartSignals;
	@:hlNative("flight", "flight_get_statechart_signals")
	public static function getStatechartSignals(instance:hl.Bytes):flight._hl.StatechartSignals;
	@:hlNative("flight", "flight_free_statechart_transition_explanation")
	public static function freeStatechartTransitionExplanation(ptr:flight._hl.StatechartTransitionExplanation):Void;
	@:hlNative("flight", "flight_free_statechart_signals")
	public static function freeStatechartSignals(ptr:flight._hl.StatechartSignals):Void;
}
