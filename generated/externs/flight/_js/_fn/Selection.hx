package flight._js._fn;

@:jsRequire("@flighthq/selection")
extern class Selection {
	@:native("createLassoSelection")
	public static function createLassoSelection():flight._js.LassoSelection;
	@:native("addLassoSelectionPoint")
	public static function addLassoSelectionPoint(selection:flight._js.LassoSelection, x:Float, y:Float):Void;
	@:native("beginLassoSelection")
	public static function beginLassoSelection(selection:flight._js.LassoSelection, startX:Float, startY:Float):Void;
	@:native("endLassoSelection")
	public static function endLassoSelection(selection:flight._js.LassoSelection):flight._js.Path;
	@:native("getLassoSelectionPath")
	public static function getLassoSelectionPath(selection:flight._js.LassoSelection):flight._js.Path;
	@:native("findNodesInLassoSelection")
	public static function findNodesInLassoSelection(out:Dynamic, selection:flight._js.LassoSelection, candidates:Dynamic):Void;
	@:native("createMarqueeSelection")
	public static function createMarqueeSelection():flight._js.MarqueeSelection;
	@:native("beginMarqueeSelection")
	public static function beginMarqueeSelection(selection:flight._js.MarqueeSelection, startX:Float, startY:Float):Void;
	@:native("endMarqueeSelection")
	public static function endMarqueeSelection(selection:flight._js.MarqueeSelection):flight._js.Rectangle;
	@:native("getMarqueeRectangle")
	public static function getMarqueeRectangle(selection:flight._js.MarqueeSelection):flight._js.Rectangle;
	@:native("updateMarqueeSelection")
	public static function updateMarqueeSelection(selection:flight._js.MarqueeSelection, currentX:Float, currentY:Float):Void;
	@:native("createSelectionState")
	public static function createSelectionState():flight._js.SelectionState;
	@:native("addNodeToSelection")
	public static function addNodeToSelection(state:flight._js.SelectionState, node:Dynamic):Void;
	@:native("clearSelection")
	public static function clearSelection(state:flight._js.SelectionState):Void;
	@:native("getActiveNode")
	public static function getActiveNode(state:flight._js.SelectionState):Null<Dynamic>;
	@:native("getSelectedNodes")
	public static function getSelectedNodes(out:Dynamic, state:flight._js.SelectionState):Void;
	@:native("getSelectionCount")
	public static function getSelectionCount(state:flight._js.SelectionState):Int;
	@:native("getSelectionSignals")
	public static function getSelectionSignals(state:flight._js.SelectionState):flight._js.SelectionSignals;
	@:native("hasSelection")
	public static function hasSelection(state:flight._js.SelectionState):Bool;
	@:native("isNodeSelected")
	public static function isNodeSelected(state:flight._js.SelectionState, node:Dynamic):Bool;
	@:native("removeNodeFromSelection")
	public static function removeNodeFromSelection(state:flight._js.SelectionState, node:Dynamic):Void;
	@:native("selectAllNodes")
	public static function selectAllNodes(state:flight._js.SelectionState, candidates:Dynamic):Void;
	@:native("selectNode")
	public static function selectNode(state:flight._js.SelectionState, node:Dynamic):Void;
	@:native("toggleNodeSelection")
	public static function toggleNodeSelection(state:flight._js.SelectionState, node:Dynamic):Void;
	@:native("applyPointerSelectionPolicy")
	public static function applyPointerSelectionPolicy(state:flight._js.SelectionState, hit:Null<Dynamic>, modifiers:flight._js.SelectionModifierState):Void;
	@:native("applyPointerUpSelectionPolicy")
	public static function applyPointerUpSelectionPolicy(state:flight._js.SelectionState, hit:Null<Dynamic>, modifiers:flight._js.SelectionModifierState, didDrag:Bool):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeLassoSelection(ptr:flight._js.LassoSelection):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMarqueeSelection(ptr:flight._js.MarqueeSelection):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSelectionState(ptr:flight._js.SelectionState):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeSelectionSignals(ptr:flight._js.SelectionSignals):Void {}
}
