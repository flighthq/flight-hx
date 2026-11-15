package flight._cpp._fn;

extern class Flow {
	@:native("flight_create_flow_stack")
	public static function createFlowStack():cpp.Star<cpp.Void>;
	@:native("flight_clear_flow_stack")
	public static function clearFlowStack(stack:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_active_flow_state")
	public static function getActiveFlowState(stack:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_flow_stack_depth")
	public static function getFlowStackDepth(stack:cpp.Star<cpp.Void>):Int;
	@:native("flight_pop_flow_state")
	public static function popFlowState(stack:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_push_flow_state")
	public static function pushFlowState(stack:cpp.Star<cpp.Void>, state:cpp.Star<cpp.Void>, guards:cpp.Star<cpp.Void>):Void;
	@:native("flight_replace_flow_state")
	public static function replaceFlowState(stack:cpp.Star<cpp.Void>, state:cpp.Star<cpp.Void>, guards:cpp.Star<cpp.Void>):Void;
	@:native("flight_update_flow_stack")
	public static function updateFlowStack(stack:cpp.Star<cpp.Void>, deltaTime:Single):Void;
	@:native("flight_disable_flow_guards")
	public static function disableFlowGuards(state:cpp.Star<cpp.Void>):Void;
	@:native("flight_enable_flow_guards")
	public static function enableFlowGuards(state:cpp.Star<cpp.Void>, logState:cpp.Star<cpp.Void>, clockFn:cpp.Star<cpp.Void>, clockCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_flow_guard_kind_string")
	public static function getFlowGuardKindString(value:Int):cpp.ConstCharStar;
	@:native("flight_parse_flow_guard_kind")
	public static function parseFlowGuardKind(value:cpp.ConstCharStar):Int;
}
