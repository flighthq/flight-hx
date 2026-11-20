package flight._hl._fn;

extern class Interaction {
	@:hlNative("flight", "flight_contains_node2d")
	public static function containsNode2d(outer:flight._hl.FlightNode, inner:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_get_node2d_overlap_rectangle")
	public static function getNode2dOverlapRectangle(out:flight._hl.Rectangle, source:flight._hl.FlightNode, other:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_hit_test_node2ds_shape")
	public static function hitTestNode2dsShape(source:flight._hl.FlightNode, other:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_disable_interaction_guards")
	public static function disableInteractionGuards():Void;
	@:hlNative("flight", "flight_enable_interaction_guards")
	public static function enableInteractionGuards():Void;
	@:hlNative("flight", "flight_explain_interaction_hit_eligibility")
	public static function explainInteractionHitEligibility(node:flight._hl.FlightNode):flight._hl.InteractionHitEligibility;
	@:hlNative("flight", "flight_create_focus_manager")
	public static function createFocusManager(root:flight._hl.FlightNode, options:flight._hl.FocusManagerOptions):flight._hl.FocusManager;
	@:hlNative("flight", "flight_clear_focus")
	public static function clearFocus(manager:flight._hl.FocusManager):Void;
	@:hlNative("flight", "flight_focus_next_node")
	public static function focusNextNode(manager:flight._hl.FocusManager):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_focus_node_in_direction")
	public static function focusNodeInDirection(manager:flight._hl.FocusManager, direction:Int):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_focus_previous_node")
	public static function focusPreviousNode(manager:flight._hl.FocusManager):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_get_focus_order")
	public static function getFocusOrder(manager:flight._hl.FocusManager):flight._hl.FlightNodeArray;
	@:hlNative("flight", "flight_get_focused_node")
	public static function getFocusedNode(manager:flight._hl.FocusManager):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_is_node_focused")
	public static function isNodeFocused(manager:flight._hl.FocusManager, node:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_set_focused_node")
	public static function setFocusedNode(manager:flight._hl.FocusManager, node:Null<flight._hl.FlightNode>):Bool;
	@:hlNative("flight", "flight_create_interaction_manager")
	public static function createInteractionManager(root:flight._hl.FlightNode, options:flight._hl.InteractionManagerOptions):hl.Bytes;
	@:hlNative("flight", "flight_capture_interaction_pointer")
	public static function captureInteractionPointer(manager:flight._hl.InteractionManager, pointerId:Int, target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_connect_interaction_dispatch_layer")
	public static function connectInteractionDispatchLayer(manager:flight._hl.InteractionManager, layer:flight._hl.InteractionDispatchLayer, options:flight._hl.InteractionDispatchLayerOptions):Void;
	@:hlNative("flight", "flight_disconnect_interaction_signal")
	public static function disconnectInteractionSignal(manager:hl.Bytes, target:flight._hl.FlightNode, name:Int, id:flight._hl.SlotId):Void;
	@:hlNative("flight", "flight_dispatch_interaction_context_menu")
	public static function dispatchInteractionContextMenu(manager:hl.Bytes, x:Float, y:Float, button:Int, options:flight._hl.InteractionPointerOptions):Void;
	@:hlNative("flight", "flight_dispatch_interaction_key_down")
	public static function dispatchInteractionKeyDown(manager:hl.Bytes, key:hl.Bytes, keyCode:Int, modifiers:flight._hl.KeyboardEventData):Void;
	@:hlNative("flight", "flight_dispatch_interaction_key_up")
	public static function dispatchInteractionKeyUp(manager:hl.Bytes, key:hl.Bytes, keyCode:Int, modifiers:flight._hl.KeyboardEventData):Void;
	@:hlNative("flight", "flight_dispatch_interaction_pointer_cancel")
	public static function dispatchInteractionPointerCancel(manager:hl.Bytes, x:Float, y:Float, options:flight._hl.InteractionPointerOptions):Void;
	@:hlNative("flight", "flight_dispatch_interaction_pointer_down")
	public static function dispatchInteractionPointerDown(manager:hl.Bytes, x:Float, y:Float, button:Int, options:flight._hl.InteractionPointerOptions):Void;
	@:hlNative("flight", "flight_dispatch_interaction_pointer_move")
	public static function dispatchInteractionPointerMove(manager:hl.Bytes, x:Float, y:Float, button:Int, options:flight._hl.InteractionPointerOptions):Void;
	@:hlNative("flight", "flight_dispatch_interaction_pointer_up")
	public static function dispatchInteractionPointerUp(manager:hl.Bytes, x:Float, y:Float, button:Int, time:Float, options:flight._hl.InteractionPointerOptions):Void;
	@:hlNative("flight", "flight_dispatch_interaction_wheel")
	public static function dispatchInteractionWheel(manager:hl.Bytes, x:Float, y:Float, deltaX:Float, deltaY:Float, options:flight._hl.InteractionPointerOptions):Void;
	@:hlNative("flight", "flight_enable_interaction_signals")
	public static function enableInteractionSignals(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_get_interaction_signals")
	public static function getInteractionSignals(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_invalidate_interaction_cursor")
	public static function invalidateInteractionCursor(manager:hl.Bytes):Void;
	@:hlNative("flight", "flight_release_interaction_pointer")
	public static function releaseInteractionPointer(manager:flight._hl.InteractionManager, pointerId:Int):Void;
	@:hlNative("flight", "flight_find_spatial_interaction_target")
	public static function findSpatialInteractionTarget(manager:hl.Bytes, ctx:flight._hl.HitTestContext, x:Float, y:Float, precise:Bool, candidates:flight._hl.FlightNodeArray):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_refresh_interaction_spatial_index")
	public static function refreshInteractionSpatialIndex(manager:flight._hl.InteractionManager, candidates:flight._hl.FlightNodeArray):Void;
	@:hlNative("flight", "flight_create_node_interaction_state")
	public static function createNodeInteractionState():flight._hl.NodeInteractionState;
	@:hlNative("flight", "flight_are_node_children_hit_test_enabled")
	public static function areNodeChildrenHitTestEnabled(source:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_enable_node_interaction_state")
	public static function enableNodeInteractionState(source:flight._hl.FlightNode):flight._hl.NodeInteractionStateRef;
	@:hlNative("flight", "flight_get_node_cursor")
	public static function getNodeCursor(source:flight._hl.FlightNode):flight._hl.Cursor;
	@:hlNative("flight", "flight_get_node_hit_area")
	public static function getNodeHitArea(source:flight._hl.FlightNode):flight._hl.NodeInteractionStateRef;
	@:hlNative("flight", "flight_get_node_interaction_state")
	public static function getNodeInteractionState(source:flight._hl.FlightNode):flight._hl.NodeInteractionStateRef;
	@:hlNative("flight", "flight_get_node_tab_index")
	public static function getNodeTabIndex(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_is_node_focusable")
	public static function isNodeFocusable(source:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_is_node_hit_test_enabled")
	public static function isNodeHitTestEnabled(source:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_is_node_pointer_double_click_enabled")
	public static function isNodePointerDoubleClickEnabled(source:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_set_node_children_hit_test_enabled")
	public static function setNodeChildrenHitTestEnabled(source:flight._hl.FlightNode, enabled:Bool):Void;
	@:hlNative("flight", "flight_set_node_focusable")
	public static function setNodeFocusable(source:flight._hl.FlightNode, focusable:Bool):Void;
	@:hlNative("flight", "flight_set_node_hit_test_enabled")
	public static function setNodeHitTestEnabled(source:flight._hl.FlightNode, enabled:Bool):Void;
	@:hlNative("flight", "flight_set_node_pointer_double_click_enabled")
	public static function setNodePointerDoubleClickEnabled(source:flight._hl.FlightNode, enabled:Bool):Void;
	@:hlNative("flight", "flight_set_node_tab_index")
	public static function setNodeTabIndex(source:flight._hl.FlightNode, tabIndex:Int):Void;
	@:hlNative("flight", "flight_create_node_interactive_state_binding")
	public static function createNodeInteractiveStateBinding(node:flight._hl.FlightNode, interactiveStates:flight._hl.FlightDocumentInteractiveStates, schemas:flight._hl.FlightDocumentSchemaRegistry, transition:flight._hl.FlightDocumentInteractiveStateTransitionDescriptor):flight._hl.NodeInteractiveStateBinding;
	@:hlNative("flight", "flight_apply_node_interactive_states")
	public static function applyNodeInteractiveStates(binding:flight._hl.NodeInteractiveStateBinding, flags:flight._hl.NodeInteractiveStateFlags):Bool;
	@:hlNative("flight", "flight_dispose_node_interactive_state_binding")
	public static function disposeNodeInteractiveStateBinding(binding:flight._hl.NodeInteractiveStateBinding):Void;
	@:hlNative("flight", "flight_explain_node_interactive_state_binding")
	public static function explainNodeInteractiveStateBinding(node:flight._hl.FlightNode, interactiveStates:flight._hl.FlightDocumentInteractiveStates, schemas:flight._hl.FlightDocumentSchemaRegistry, transition:flight._hl.FlightDocumentInteractiveStateTransitionDescriptor):flight._hl.NodeInteractiveStateExplanation;
	@:hlNative("flight", "flight_hit_test_area_query")
	public static function hitTestAreaQuery(root:flight._hl.FlightNode, rect:flight._hl.Rectangle, out:flight._hl.FlightNodeArray):Void;
	@:hlNative("flight", "flight_hit_test_area_query_circle")
	public static function hitTestAreaQueryCircle(root:flight._hl.FlightNode, cx:Float, cy:Float, radius:Float, out:flight._hl.FlightNodeArray):Void;
	@:hlNative("flight", "flight_free_interaction_hit_eligibility")
	public static function freeInteractionHitEligibility(ptr:flight._hl.InteractionHitEligibility):Void;
	@:hlNative("flight", "flight_free_focus_manager")
	public static function freeFocusManager(ptr:flight._hl.FocusManager):Void;
	@:hlNative("flight", "flight_free_interaction_manager_ref")
	public static function freeInteractionManagerRef(ptr:flight._hl.InteractionManager):Void;
	@:hlNative("flight", "flight_free_interaction_signals_ref")
	public static function freeInteractionSignalsRef(ptr:flight._hl.InteractionSignals):Void;
	@:hlNative("flight", "flight_free_node_interaction_state")
	public static function freeNodeInteractionState(ptr:flight._hl.NodeInteractionState):Void;
	@:hlNative("flight", "flight_free_node_interaction_state_ref")
	public static function freeNodeInteractionStateRef(ptr:flight._hl.NodeInteractionState):Void;
	@:hlNative("flight", "flight_free_cursor")
	public static function freeCursor(ptr:flight._hl.Cursor):Void;
	@:hlNative("flight", "flight_free_node_interactive_state_binding")
	public static function freeNodeInteractiveStateBinding(ptr:flight._hl.NodeInteractiveStateBinding):Void;
	@:hlNative("flight", "flight_free_node_interactive_state_explanation")
	public static function freeNodeInteractiveStateExplanation(ptr:flight._hl.NodeInteractiveStateExplanation):Void;
}
