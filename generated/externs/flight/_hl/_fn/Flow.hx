package flight._hl._fn;

extern class Flow {
	@:hlNative("flight", "flight_create_flow_stack")
	public static function createFlowStack():hl.Bytes;
	@:hlNative("flight", "flight_clear_flow_stack")
	public static function clearFlowStack(stack:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_active_flow_state")
	public static function getActiveFlowState(stack:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_get_flow_stack_depth")
	public static function getFlowStackDepth(stack:hl.Bytes):Int;
	@:hlNative("flight", "flight_pop_flow_state")
	public static function popFlowState(stack:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_push_flow_state")
	public static function pushFlowState(stack:hl.Bytes, state:hl.Bytes, guards:hl.Bytes):Void;
	@:hlNative("flight", "flight_replace_flow_state")
	public static function replaceFlowState(stack:hl.Bytes, state:hl.Bytes, guards:hl.Bytes):Void;
	@:hlNative("flight", "flight_update_flow_stack")
	public static function updateFlowStack(stack:hl.Bytes, deltaTime:Single):Void;
	@:hlNative("flight", "flight_disable_flow_guards")
	public static function disableFlowGuards(state:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_flow_guard_kind_string")
	public static function getFlowGuardKindString(value:Int):hl.Bytes;
	@:hlNative("flight", "flight_parse_flow_guard_kind")
	public static function parseFlowGuardKind(value:hl.Bytes):Int;
	@:hlNative("flight", "flight_free_flow_stack_ref")
	public static function freeFlowStackRef(ptr:flight._hl.FlowStack):Void;
	@:hlNative("flight", "flight_free_flow_state_ref")
	public static function freeFlowStateRef(ptr:flight._hl.FlowState):Void;
}
