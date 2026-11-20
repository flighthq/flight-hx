package flight._cpp._fn;

extern class Selection {
	@:native("flight_create_lasso_selection")
	public static function createLassoSelection():flight._cpp.LassoSelection;
	@:native("flight_add_lasso_selection_point")
	public static function addLassoSelectionPoint(selection:flight._cpp.LassoSelection, x:Float, y:Float):Void;
	@:native("flight_begin_lasso_selection")
	public static function beginLassoSelection(selection:flight._cpp.LassoSelection, startX:Float, startY:Float):Void;
	@:native("flight_end_lasso_selection")
	public static function endLassoSelection(selection:flight._cpp.LassoSelection):flight._cpp.Path;
	@:native("flight_get_lasso_selection_path")
	public static function getLassoSelectionPath(selection:flight._cpp.LassoSelection):flight._cpp.Path;
	@:native("flight_find_nodes_in_lasso_selection")
	public static function findNodesInLassoSelection(out:flight._cpp.FlightNodeArray, selection:flight._cpp.LassoSelection, candidates:flight._cpp.FlightNodeArray):Void;
	@:native("flight_create_marquee_selection")
	public static function createMarqueeSelection():flight._cpp.MarqueeSelection;
	@:native("flight_begin_marquee_selection")
	public static function beginMarqueeSelection(selection:flight._cpp.MarqueeSelection, startX:Float, startY:Float):Void;
	@:native("flight_end_marquee_selection")
	public static function endMarqueeSelection(selection:flight._cpp.MarqueeSelection):flight._cpp.Rectangle;
	@:native("flight_get_marquee_rectangle")
	public static function getMarqueeRectangle(selection:flight._cpp.MarqueeSelection):flight._cpp.Rectangle;
	@:native("flight_update_marquee_selection")
	public static function updateMarqueeSelection(selection:flight._cpp.MarqueeSelection, currentX:Float, currentY:Float):Void;
	@:native("flight_create_selection_state")
	public static function createSelectionState():flight._cpp.SelectionState;
	@:native("flight_add_node_to_selection")
	public static function addNodeToSelection(state:flight._cpp.SelectionState, node:flight._cpp.FlightNode):Void;
	@:native("flight_clear_selection")
	public static function clearSelection(state:flight._cpp.SelectionState):Void;
	@:native("flight_get_active_node")
	public static function getActiveNode(state:flight._cpp.SelectionState):Null<flight._cpp.FlightNode>;
	@:native("flight_get_selected_nodes")
	public static function getSelectedNodes(out:flight._cpp.FlightNodeArray, state:flight._cpp.SelectionState):Void;
	@:native("flight_get_selection_count")
	public static function getSelectionCount(state:flight._cpp.SelectionState):Int;
	@:native("flight_get_selection_signals")
	public static function getSelectionSignals(state:flight._cpp.SelectionState):flight._cpp.SelectionSignals;
	@:native("flight_has_selection")
	public static function hasSelection(state:flight._cpp.SelectionState):Bool;
	@:native("flight_is_node_selected")
	public static function isNodeSelected(state:flight._cpp.SelectionState, node:flight._cpp.FlightNode):Bool;
	@:native("flight_remove_node_from_selection")
	public static function removeNodeFromSelection(state:flight._cpp.SelectionState, node:flight._cpp.FlightNode):Void;
	@:native("flight_select_all_nodes")
	public static function selectAllNodes(state:flight._cpp.SelectionState, candidates:flight._cpp.FlightNodeArray):Void;
	@:native("flight_select_node")
	public static function selectNode(state:flight._cpp.SelectionState, node:flight._cpp.FlightNode):Void;
	@:native("flight_toggle_node_selection")
	public static function toggleNodeSelection(state:flight._cpp.SelectionState, node:flight._cpp.FlightNode):Void;
	@:native("flight_apply_pointer_selection_policy")
	public static function applyPointerSelectionPolicy(state:flight._cpp.SelectionState, hit:Null<flight._cpp.FlightNode>, modifiers:flight._cpp.SelectionModifierState):Void;
	@:native("flight_apply_pointer_up_selection_policy")
	public static function applyPointerUpSelectionPolicy(state:flight._cpp.SelectionState, hit:Null<flight._cpp.FlightNode>, modifiers:flight._cpp.SelectionModifierState, didDrag:Bool):Void;
	@:native("flight_free_lasso_selection")
	public static function freeLassoSelection(ptr:flight._cpp.LassoSelection):Void;
	@:native("flight_free_marquee_selection")
	public static function freeMarqueeSelection(ptr:flight._cpp.MarqueeSelection):Void;
	@:native("flight_free_selection_state")
	public static function freeSelectionState(ptr:flight._cpp.SelectionState):Void;
	@:native("flight_free_selection_signals")
	public static function freeSelectionSignals(ptr:flight._cpp.SelectionSignals):Void;
}
