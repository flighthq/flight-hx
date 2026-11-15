package flight._js._fn;

@:jsRequire("flight")
extern class Layout {
	@:native("flight_register_anchor_layout_resolver")
	public static function registerAnchorLayoutResolver(state:flight._js.LayoutState):Void;
	@:native("flight_enable_layout_guards")
	public static function enableLayoutGuards(state:flight._js.LayoutState, warningSink:flight._js.LayoutResolutionGuard):Void;
	@:native("flight_register_flex_layout_resolver")
	public static function registerFlexLayoutResolver(state:flight._js.LayoutState):Void;
	@:native("flight_register_grid_layout_resolver")
	public static function registerGridLayoutResolver(state:flight._js.LayoutState):Void;
	@:native("flight_create_layout_state")
	public static function createLayoutState():flight._js.LayoutState;
	@:native("flight_explain_layout_resolution")
	public static function explainLayoutResolution(state:flight._js.LayoutState, tree:flight._js.LayoutTree, nodeIndex:Int):Dynamic;
	@:native("flight_resolve_layout_tree")
	public static function resolveLayoutTree(out:Dynamic, outLen:Int, state:flight._js.LayoutState, tree:flight._js.LayoutTree, intrinsicSizes:Dynamic, intrinsicSizesLen:Int, availableWidth:Float, availableHeight:Float):Bool;
	@:native("flight_free_layout_state")
	public static function freeLayoutState(ptr:flight._js.LayoutState):Void;
	@:native("flight_free_layout_resolution_explanation")
	public static function freeLayoutResolutionExplanation(ptr:flight._js.LayoutResolutionExplanation):Void;
}
