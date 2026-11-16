package flight._js._fn;

@:jsRequire("@flighthq/statechart")
extern class Statechart {
	@:native("areStatechartGuardsEnabled")
	public static function areStatechartGuardsEnabled(instance:Dynamic):Bool;
	@:native("disableStatechartGuards")
	public static function disableStatechartGuards(instance:Dynamic):Void;
	@:native("createStatechartInstance")
	public static function createStatechartInstance(chart:Dynamic):Dynamic;
	@:native("advanceStatechartInstance")
	public static function advanceStatechartInstance(instance:Dynamic, deltaTime:Float):Int;
	@:native("explainStatechartTransition")
	public static function explainStatechartTransition(instance:Dynamic, regionIndex:Int):flight._js.StatechartTransitionExplanation;
	@:native("fireStatechartTrigger")
	public static function fireStatechartTrigger(instance:Dynamic, inputIndex:Int):Void;
	@:native("getStatechartInputIndex")
	public static function getStatechartInputIndex(chart:flight._js.StatechartRaw, name:String):Int;
	@:native("getStatechartRegionBlend")
	public static function getStatechartRegionBlend(instance:Dynamic, regionIndex:Int):Float;
	@:native("getStatechartRegionState")
	public static function getStatechartRegionState(instance:Dynamic, regionIndex:Int):Int;
	@:native("setStatechartBooleanInput")
	public static function setStatechartBooleanInput(instance:Dynamic, inputIndex:Int, value:Bool):Void;
	@:native("setStatechartNumberInput")
	public static function setStatechartNumberInput(instance:Dynamic, inputIndex:Int, value:Float):Void;
	@:native("setStatechartRegionDuration")
	public static function setStatechartRegionDuration(instance:Dynamic, regionIndex:Int, duration:Float):Void;
	@:native("enableStatechartSignals")
	public static function enableStatechartSignals(instance:Dynamic):flight._js.StatechartSignals;
	@:native("getStatechartSignals")
	public static function getStatechartSignals(instance:Dynamic):Null<flight._js.StatechartSignals>;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStatechartTransitionExplanation(ptr:flight._js.StatechartTransitionExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeStatechartSignals(ptr:flight._js.StatechartSignals):Void {}
}
