package flight._hl._fn;

extern class Selection {
	@:hlNative("flight", "flight_create_lasso_selection")
	public static function createLassoSelection():flight._hl.LassoSelection;
	@:hlNative("flight", "flight_add_lasso_selection_point")
	public static function addLassoSelectionPoint(selection:flight._hl.LassoSelection, x:Float, y:Float):Void;
	@:hlNative("flight", "flight_begin_lasso_selection")
	public static function beginLassoSelection(selection:flight._hl.LassoSelection, startX:Float, startY:Float):Void;
	@:hlNative("flight", "flight_end_lasso_selection")
	public static function endLassoSelection(selection:flight._hl.LassoSelection):flight._hl.Path;
	@:hlNative("flight", "flight_get_lasso_selection_path")
	public static function getLassoSelectionPath(selection:flight._hl.LassoSelection):flight._hl.Path;
	@:hlNative("flight", "flight_find_nodes_in_lasso_selection")
	public static function findNodesInLassoSelection(out:flight._hl.FlightNodeArray, selection:flight._hl.LassoSelection, candidates:flight._hl.FlightNodeArray):Void;
	@:hlNative("flight", "flight_create_marquee_selection")
	public static function createMarqueeSelection():flight._hl.MarqueeSelection;
	@:hlNative("flight", "flight_begin_marquee_selection")
	public static function beginMarqueeSelection(selection:flight._hl.MarqueeSelection, startX:Float, startY:Float):Void;
	@:hlNative("flight", "flight_end_marquee_selection")
	public static function endMarqueeSelection(selection:flight._hl.MarqueeSelection):flight._hl.Rectangle;
	@:hlNative("flight", "flight_get_marquee_rectangle")
	public static function getMarqueeRectangle(selection:flight._hl.MarqueeSelection):flight._hl.Rectangle;
	@:hlNative("flight", "flight_update_marquee_selection")
	public static function updateMarqueeSelection(selection:flight._hl.MarqueeSelection, currentX:Float, currentY:Float):Void;
	@:hlNative("flight", "flight_create_selection_state")
	public static function createSelectionState():flight._hl.SelectionState;
	@:hlNative("flight", "flight_add_node_to_selection")
	public static function addNodeToSelection(state:flight._hl.SelectionState, node:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_clear_selection")
	public static function clearSelection(state:flight._hl.SelectionState):Void;
	@:hlNative("flight", "flight_get_active_node")
	public static function getActiveNode(state:flight._hl.SelectionState):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_get_selected_nodes")
	public static function getSelectedNodes(out:flight._hl.FlightNodeArray, state:flight._hl.SelectionState):Void;
	@:hlNative("flight", "flight_get_selection_count")
	public static function getSelectionCount(state:flight._hl.SelectionState):Int;
	@:hlNative("flight", "flight_get_selection_signals")
	public static function getSelectionSignals(state:flight._hl.SelectionState):flight._hl.SelectionSignals;
	@:hlNative("flight", "flight_has_selection")
	public static function hasSelection(state:flight._hl.SelectionState):Bool;
	@:hlNative("flight", "flight_is_node_selected")
	public static function isNodeSelected(state:flight._hl.SelectionState, node:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_remove_node_from_selection")
	public static function removeNodeFromSelection(state:flight._hl.SelectionState, node:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_select_all_nodes")
	public static function selectAllNodes(state:flight._hl.SelectionState, candidates:flight._hl.FlightNodeArray):Void;
	@:hlNative("flight", "flight_select_node")
	public static function selectNode(state:flight._hl.SelectionState, node:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_toggle_node_selection")
	public static function toggleNodeSelection(state:flight._hl.SelectionState, node:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_apply_pointer_selection_policy")
	public static function applyPointerSelectionPolicy(state:flight._hl.SelectionState, hit:Null<flight._hl.FlightNode>, modifiers:flight._hl.SelectionModifierState):Void;
	@:hlNative("flight", "flight_apply_pointer_up_selection_policy")
	public static function applyPointerUpSelectionPolicy(state:flight._hl.SelectionState, hit:Null<flight._hl.FlightNode>, modifiers:flight._hl.SelectionModifierState, didDrag:Bool):Void;
	@:hlNative("flight", "flight_free_lasso_selection")
	public static function freeLassoSelection(ptr:flight._hl.LassoSelection):Void;
	@:hlNative("flight", "flight_free_marquee_selection")
	public static function freeMarqueeSelection(ptr:flight._hl.MarqueeSelection):Void;
	@:hlNative("flight", "flight_free_selection_state")
	public static function freeSelectionState(ptr:flight._hl.SelectionState):Void;
	@:hlNative("flight", "flight_free_selection_signals")
	public static function freeSelectionSignals(ptr:flight._hl.SelectionSignals):Void;
}
