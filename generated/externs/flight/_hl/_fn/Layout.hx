package flight._hl._fn;

extern class Layout {
	@:hlNative("flight", "flight_register_anchor_layout_resolver")
	public static function registerAnchorLayoutResolver(state:flight._hl.LayoutState):Void;
	@:hlNative("flight", "flight_enable_layout_guards")
	public static function enableLayoutGuards(state:flight._hl.LayoutState, warningSink:flight._hl.LayoutResolutionGuard):Void;
	@:hlNative("flight", "flight_register_flex_layout_resolver")
	public static function registerFlexLayoutResolver(state:flight._hl.LayoutState):Void;
	@:hlNative("flight", "flight_register_grid_layout_resolver")
	public static function registerGridLayoutResolver(state:flight._hl.LayoutState):Void;
	@:hlNative("flight", "flight_create_layout_state")
	public static function createLayoutState():flight._hl.LayoutState;
	@:hlNative("flight", "flight_explain_layout_resolution")
	public static function explainLayoutResolution(state:flight._hl.LayoutState, tree:flight._hl.LayoutTree, nodeIndex:Int):Dynamic;
	@:hlNative("flight", "flight_resolve_layout_tree")
	public static function resolveLayoutTree(out:hl.Bytes, outLen:Int, state:flight._hl.LayoutState, tree:flight._hl.LayoutTree, intrinsicSizes:hl.Bytes, intrinsicSizesLen:Int, availableWidth:Single, availableHeight:Single):Bool;
	@:hlNative("flight", "flight_free_layout_state")
	public static function freeLayoutState(ptr:flight._hl.LayoutState):Void;
	@:hlNative("flight", "flight_free_layout_resolution_explanation")
	public static function freeLayoutResolutionExplanation(ptr:flight._hl.LayoutResolutionExplanation):Void;
}
