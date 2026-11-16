package flight._js._fn;

@:jsRequire("@flighthq/flow")
extern class Flow {
	@:native("createFlowStack")
	public static function createFlowStack():Dynamic;
	@:native("clearFlowStack")
	public static function clearFlowStack(stack:Dynamic):Void;
	@:native("getActiveFlowState")
	public static function getActiveFlowState(stack:Dynamic):Null<Dynamic>;
	@:native("getFlowStackDepth")
	public static function getFlowStackDepth(stack:Dynamic):Int;
	@:native("popFlowState")
	public static function popFlowState(stack:Dynamic):Null<Dynamic>;
	@:native("pushFlowState")
	public static function pushFlowState(stack:Dynamic, state:Dynamic, guards:Dynamic):Void;
	@:native("replaceFlowState")
	public static function replaceFlowState(stack:Dynamic, state:Dynamic, guards:Dynamic):Void;
	@:native("updateFlowStack")
	public static function updateFlowStack(stack:Dynamic, deltaTime:Float):Void;
	@:native("disableFlowGuards")
	public static function disableFlowGuards(state:Dynamic):Void;
	@:native("enableFlowGuards")
	public static function enableFlowGuards(state:Dynamic, logState:Dynamic, clock:Dynamic):Void;
	@:native("getFlowGuardKindString")
	public static function getFlowGuardKindString(value:Dynamic):String;
	@:native("parseFlowGuardKind")
	public static function parseFlowGuardKind(value:String):Null<Dynamic>;
}
