package flight._js._fn;

@:jsRequire("flight")
extern class Flow {
	@:native("flight_create_flow_stack")
	public static function createFlowStack():Dynamic;
	@:native("flight_clear_flow_stack")
	public static function clearFlowStack(stack:Dynamic):Void;
	@:native("flight_get_active_flow_state")
	public static function getActiveFlowState(stack:Dynamic):Dynamic;
	@:native("flight_get_flow_stack_depth")
	public static function getFlowStackDepth(stack:Dynamic):Int;
	@:native("flight_pop_flow_state")
	public static function popFlowState(stack:Dynamic):Dynamic;
	@:native("flight_push_flow_state")
	public static function pushFlowState(stack:Dynamic, state:Dynamic, guards:Dynamic):Void;
	@:native("flight_replace_flow_state")
	public static function replaceFlowState(stack:Dynamic, state:Dynamic, guards:Dynamic):Void;
	@:native("flight_update_flow_stack")
	public static function updateFlowStack(stack:Dynamic, deltaTime:Float):Void;
	@:native("flight_disable_flow_guards")
	public static function disableFlowGuards(state:Dynamic):Void;
	@:native("flight_enable_flow_guards")
	public static function enableFlowGuards(state:Dynamic, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void;
	@:native("flight_get_flow_guard_kind_string")
	public static function getFlowGuardKindString(value:Int):String;
	@:native("flight_parse_flow_guard_kind")
	public static function parseFlowGuardKind(value:String):Int;
}
