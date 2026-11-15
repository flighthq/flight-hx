package flight._hl._fn;

extern class Flow {
	@:hlNative("flight", "flight_create_flow_stack")
	public static function createFlowStack():Dynamic;
	@:hlNative("flight", "flight_clear_flow_stack")
	public static function clearFlowStack(stack:Dynamic):Void;
	@:hlNative("flight", "flight_get_active_flow_state")
	public static function getActiveFlowState(stack:Dynamic):Dynamic;
	@:hlNative("flight", "flight_get_flow_stack_depth")
	public static function getFlowStackDepth(stack:Dynamic):Int;
	@:hlNative("flight", "flight_pop_flow_state")
	public static function popFlowState(stack:Dynamic):Dynamic;
	@:hlNative("flight", "flight_push_flow_state")
	public static function pushFlowState(stack:Dynamic, state:Dynamic, guards:Dynamic):Void;
	@:hlNative("flight", "flight_replace_flow_state")
	public static function replaceFlowState(stack:Dynamic, state:Dynamic, guards:Dynamic):Void;
	@:hlNative("flight", "flight_update_flow_stack")
	public static function updateFlowStack(stack:Dynamic, deltaTime:Single):Void;
	@:hlNative("flight", "flight_disable_flow_guards")
	public static function disableFlowGuards(state:Dynamic):Void;
	@:hlNative("flight", "flight_enable_flow_guards")
	public static function enableFlowGuards(state:Dynamic, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void;
	@:hlNative("flight", "flight_get_flow_guard_kind_string")
	public static function getFlowGuardKindString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_parse_flow_guard_kind")
	public static function parseFlowGuardKind(value:hl.Bytes):Int;
}
