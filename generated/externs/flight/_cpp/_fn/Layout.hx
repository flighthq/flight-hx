package flight._cpp._fn;

extern class Layout {
	@:native("flight_register_anchor_layout_resolver")
	public static function registerAnchorLayoutResolver(state:flight._cpp.LayoutState):Void;
	@:native("flight_enable_layout_guards")
	public static function enableLayoutGuards(state:flight._cpp.LayoutState, warningSink:flight._cpp.LayoutResolutionGuard):Void;
	@:native("flight_register_flex_layout_resolver")
	public static function registerFlexLayoutResolver(state:flight._cpp.LayoutState):Void;
	@:native("flight_register_grid_layout_resolver")
	public static function registerGridLayoutResolver(state:flight._cpp.LayoutState):Void;
	@:native("flight_create_layout_state")
	public static function createLayoutState():flight._cpp.LayoutState;
	@:native("flight_explain_layout_resolution")
	public static function explainLayoutResolution(state:flight._cpp.LayoutState, tree:flight._cpp.LayoutTree, nodeIndex:Int):flight._cpp.LayoutResolutionExplanation;
	@:native("flight_resolve_layout_tree")
	public static function resolveLayoutTree(out:cpp.Star<cpp.Void>, outLen:Int, state:flight._cpp.LayoutState, tree:flight._cpp.LayoutTree, intrinsicSizes:cpp.Star<cpp.Void>, intrinsicSizesLen:Int, availableWidth:Single, availableHeight:Single):Bool;
	@:native("flight_free_layout_state")
	public static function freeLayoutState(ptr:flight._cpp.LayoutState):Void;
	@:native("flight_free_layout_resolution_explanation")
	public static function freeLayoutResolutionExplanation(ptr:flight._cpp.LayoutResolutionExplanation):Void;
}
