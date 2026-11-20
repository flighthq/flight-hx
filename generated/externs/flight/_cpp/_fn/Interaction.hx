package flight._cpp._fn;

extern class Interaction {
	@:native("flight_contains_node2d")
	public static function containsNode2d(outer:flight._cpp.FlightNode, inner:flight._cpp.FlightNode):Bool;
	@:native("flight_get_node2d_overlap_rectangle")
	public static function getNode2dOverlapRectangle(out:flight._cpp.Rectangle, source:flight._cpp.FlightNode, other:flight._cpp.FlightNode):Void;
	@:native("flight_hit_test_node2ds_shape")
	public static function hitTestNode2dsShape(source:flight._cpp.FlightNode, other:flight._cpp.FlightNode):Bool;
	@:native("flight_disable_interaction_guards")
	public static function disableInteractionGuards():Void;
	@:native("flight_enable_interaction_guards")
	public static function enableInteractionGuards():Void;
	@:native("flight_explain_interaction_hit_eligibility")
	public static function explainInteractionHitEligibility(node:flight._cpp.FlightNode):flight._cpp.InteractionHitEligibility;
	@:native("flight_create_focus_manager")
	public static function createFocusManager(root:flight._cpp.FlightNode, options:flight._cpp.FocusManagerOptions):flight._cpp.FocusManager;
	@:native("flight_clear_focus")
	public static function clearFocus(manager:flight._cpp.FocusManager):Void;
	@:native("flight_focus_next_node")
	public static function focusNextNode(manager:flight._cpp.FocusManager):Null<flight._cpp.FlightNode>;
	@:native("flight_focus_node_in_direction")
	public static function focusNodeInDirection(manager:flight._cpp.FocusManager, direction:Int):Null<flight._cpp.FlightNode>;
	@:native("flight_focus_previous_node")
	public static function focusPreviousNode(manager:flight._cpp.FocusManager):Null<flight._cpp.FlightNode>;
	@:native("flight_get_focus_order")
	public static function getFocusOrder(manager:flight._cpp.FocusManager):flight._cpp.FlightNodeArray;
	@:native("flight_get_focused_node")
	public static function getFocusedNode(manager:flight._cpp.FocusManager):Null<flight._cpp.FlightNode>;
	@:native("flight_is_node_focused")
	public static function isNodeFocused(manager:flight._cpp.FocusManager, node:flight._cpp.FlightNode):Bool;
	@:native("flight_set_focused_node")
	public static function setFocusedNode(manager:flight._cpp.FocusManager, node:Null<flight._cpp.FlightNode>):Bool;
	@:native("flight_create_interaction_manager")
	public static function createInteractionManager(root:flight._cpp.FlightNode, options:flight._cpp.InteractionManagerOptions):cpp.Star<cpp.Void>;
	@:native("flight_capture_interaction_pointer")
	public static function captureInteractionPointer(manager:flight._cpp.InteractionManager, pointerId:Int, target:flight._cpp.FlightNode):Void;
	@:native("flight_connect_interaction_dispatch_layer")
	public static function connectInteractionDispatchLayer(manager:flight._cpp.InteractionManager, layer:flight._cpp.InteractionDispatchLayer, options:flight._cpp.InteractionDispatchLayerOptions):Void;
	@:native("flight_disconnect_interaction_signal")
	public static function disconnectInteractionSignal(manager:cpp.Star<cpp.Void>, target:flight._cpp.FlightNode, name:Int, id:flight._cpp.SlotId):Void;
	@:native("flight_dispatch_interaction_context_menu")
	public static function dispatchInteractionContextMenu(manager:cpp.Star<cpp.Void>, x:Float, y:Float, button:Int, options:flight._cpp.InteractionPointerOptions):Void;
	@:native("flight_dispatch_interaction_key_down")
	public static function dispatchInteractionKeyDown(manager:cpp.Star<cpp.Void>, key:cpp.ConstCharStar, keyCode:Int, modifiers:flight._cpp.KeyboardEventData):Void;
	@:native("flight_dispatch_interaction_key_up")
	public static function dispatchInteractionKeyUp(manager:cpp.Star<cpp.Void>, key:cpp.ConstCharStar, keyCode:Int, modifiers:flight._cpp.KeyboardEventData):Void;
	@:native("flight_dispatch_interaction_pointer_cancel")
	public static function dispatchInteractionPointerCancel(manager:cpp.Star<cpp.Void>, x:Float, y:Float, options:flight._cpp.InteractionPointerOptions):Void;
	@:native("flight_dispatch_interaction_pointer_down")
	public static function dispatchInteractionPointerDown(manager:cpp.Star<cpp.Void>, x:Float, y:Float, button:Int, options:flight._cpp.InteractionPointerOptions):Void;
	@:native("flight_dispatch_interaction_pointer_move")
	public static function dispatchInteractionPointerMove(manager:cpp.Star<cpp.Void>, x:Float, y:Float, button:Int, options:flight._cpp.InteractionPointerOptions):Void;
	@:native("flight_dispatch_interaction_pointer_up")
	public static function dispatchInteractionPointerUp(manager:cpp.Star<cpp.Void>, x:Float, y:Float, button:Int, time:Float, options:flight._cpp.InteractionPointerOptions):Void;
	@:native("flight_dispatch_interaction_wheel")
	public static function dispatchInteractionWheel(manager:cpp.Star<cpp.Void>, x:Float, y:Float, deltaX:Float, deltaY:Float, options:flight._cpp.InteractionPointerOptions):Void;
	@:native("flight_enable_interaction_signals")
	public static function enableInteractionSignals(source:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_get_interaction_signals")
	public static function getInteractionSignals(source:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_invalidate_interaction_cursor")
	public static function invalidateInteractionCursor(manager:cpp.Star<cpp.Void>):Void;
	@:native("flight_release_interaction_pointer")
	public static function releaseInteractionPointer(manager:flight._cpp.InteractionManager, pointerId:Int):Void;
	@:native("flight_find_spatial_interaction_target")
	public static function findSpatialInteractionTarget(manager:cpp.Star<cpp.Void>, ctx:flight._cpp.HitTestContext, x:Float, y:Float, precise:Bool, candidates:flight._cpp.FlightNodeArray):Null<flight._cpp.FlightNode>;
	@:native("flight_refresh_interaction_spatial_index")
	public static function refreshInteractionSpatialIndex(manager:flight._cpp.InteractionManager, candidates:flight._cpp.FlightNodeArray):Void;
	@:native("flight_create_node_interaction_state")
	public static function createNodeInteractionState():flight._cpp.NodeInteractionState;
	@:native("flight_are_node_children_hit_test_enabled")
	public static function areNodeChildrenHitTestEnabled(source:flight._cpp.FlightNode):Bool;
	@:native("flight_enable_node_interaction_state")
	public static function enableNodeInteractionState(source:flight._cpp.FlightNode):flight._cpp.NodeInteractionStateRef;
	@:native("flight_get_node_cursor")
	public static function getNodeCursor(source:flight._cpp.FlightNode):flight._cpp.Cursor;
	@:native("flight_get_node_hit_area")
	public static function getNodeHitArea(source:flight._cpp.FlightNode):flight._cpp.NodeInteractionStateRef;
	@:native("flight_get_node_interaction_state")
	public static function getNodeInteractionState(source:flight._cpp.FlightNode):flight._cpp.NodeInteractionStateRef;
	@:native("flight_get_node_tab_index")
	public static function getNodeTabIndex(source:flight._cpp.FlightNode):Int;
	@:native("flight_is_node_focusable")
	public static function isNodeFocusable(source:flight._cpp.FlightNode):Bool;
	@:native("flight_is_node_hit_test_enabled")
	public static function isNodeHitTestEnabled(source:flight._cpp.FlightNode):Bool;
	@:native("flight_is_node_pointer_double_click_enabled")
	public static function isNodePointerDoubleClickEnabled(source:flight._cpp.FlightNode):Bool;
	@:native("flight_set_node_children_hit_test_enabled")
	public static function setNodeChildrenHitTestEnabled(source:flight._cpp.FlightNode, enabled:Bool):Void;
	@:native("flight_set_node_focusable")
	public static function setNodeFocusable(source:flight._cpp.FlightNode, focusable:Bool):Void;
	@:native("flight_set_node_hit_test_enabled")
	public static function setNodeHitTestEnabled(source:flight._cpp.FlightNode, enabled:Bool):Void;
	@:native("flight_set_node_pointer_double_click_enabled")
	public static function setNodePointerDoubleClickEnabled(source:flight._cpp.FlightNode, enabled:Bool):Void;
	@:native("flight_set_node_tab_index")
	public static function setNodeTabIndex(source:flight._cpp.FlightNode, tabIndex:Int):Void;
	@:native("flight_create_node_interactive_state_binding")
	public static function createNodeInteractiveStateBinding(node:flight._cpp.FlightNode, interactiveStates:flight._cpp.FlightDocumentInteractiveStates, schemas:flight._cpp.FlightDocumentSchemaRegistry, transition:flight._cpp.FlightDocumentInteractiveStateTransitionDescriptor):flight._cpp.NodeInteractiveStateBinding;
	@:native("flight_apply_node_interactive_states")
	public static function applyNodeInteractiveStates(binding:flight._cpp.NodeInteractiveStateBinding, flags:flight._cpp.NodeInteractiveStateFlags):Bool;
	@:native("flight_dispose_node_interactive_state_binding")
	public static function disposeNodeInteractiveStateBinding(binding:flight._cpp.NodeInteractiveStateBinding):Void;
	@:native("flight_explain_node_interactive_state_binding")
	public static function explainNodeInteractiveStateBinding(node:flight._cpp.FlightNode, interactiveStates:flight._cpp.FlightDocumentInteractiveStates, schemas:flight._cpp.FlightDocumentSchemaRegistry, transition:flight._cpp.FlightDocumentInteractiveStateTransitionDescriptor):flight._cpp.NodeInteractiveStateExplanation;
	@:native("flight_hit_test_area_query")
	public static function hitTestAreaQuery(root:flight._cpp.FlightNode, rect:flight._cpp.Rectangle, out:flight._cpp.FlightNodeArray):Void;
	@:native("flight_hit_test_area_query_circle")
	public static function hitTestAreaQueryCircle(root:flight._cpp.FlightNode, cx:Float, cy:Float, radius:Float, out:flight._cpp.FlightNodeArray):Void;
	@:native("flight_free_interaction_hit_eligibility")
	public static function freeInteractionHitEligibility(ptr:flight._cpp.InteractionHitEligibility):Void;
	@:native("flight_free_focus_manager")
	public static function freeFocusManager(ptr:flight._cpp.FocusManager):Void;
	@:native("flight_free_interaction_manager_ref")
	public static function freeInteractionManagerRef(ptr:flight._cpp.InteractionManager):Void;
	@:native("flight_free_interaction_signals_ref")
	public static function freeInteractionSignalsRef(ptr:flight._cpp.InteractionSignals):Void;
	@:native("flight_free_node_interaction_state")
	public static function freeNodeInteractionState(ptr:flight._cpp.NodeInteractionState):Void;
	@:native("flight_free_node_interaction_state_ref")
	public static function freeNodeInteractionStateRef(ptr:flight._cpp.NodeInteractionState):Void;
	@:native("flight_free_cursor")
	public static function freeCursor(ptr:flight._cpp.Cursor):Void;
	@:native("flight_free_node_interactive_state_binding")
	public static function freeNodeInteractiveStateBinding(ptr:flight._cpp.NodeInteractiveStateBinding):Void;
	@:native("flight_free_node_interactive_state_explanation")
	public static function freeNodeInteractiveStateExplanation(ptr:flight._cpp.NodeInteractiveStateExplanation):Void;
}
