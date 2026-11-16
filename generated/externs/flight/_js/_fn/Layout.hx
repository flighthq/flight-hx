package flight._js._fn;

@:jsRequire("@flighthq/layout")
extern class Layout {
	@:native("registerAnchorLayoutResolver")
	public static function registerAnchorLayoutResolver(state:flight._js.LayoutState):Void;
	@:native("enableLayoutGuards")
	public static function enableLayoutGuards(state:flight._js.LayoutState, warningSink:flight._js.LayoutResolutionGuard):Void;
	@:native("registerFlexLayoutResolver")
	public static function registerFlexLayoutResolver(state:flight._js.LayoutState):Void;
	@:native("registerGridLayoutResolver")
	public static function registerGridLayoutResolver(state:flight._js.LayoutState):Void;
	@:native("createLayoutState")
	public static function createLayoutState():flight._js.LayoutState;
	@:native("explainLayoutResolution")
	public static function explainLayoutResolution(state:flight._js.LayoutState, tree:flight._js.LayoutTree, nodeIndex:Int):Null<flight._js.LayoutResolutionExplanation>;
	@:native("resolveLayoutTree")
	public static function resolveLayoutTree(out:Dynamic, state:flight._js.LayoutState, tree:flight._js.LayoutTree, intrinsicSizes:Dynamic, availableWidth:Float, availableHeight:Float):Bool;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLayoutState(ptr:flight._js.LayoutState):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLayoutResolutionExplanation(ptr:flight._js.LayoutResolutionExplanation):Void {}
}
