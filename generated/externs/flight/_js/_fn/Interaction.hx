package flight._js._fn;

@:jsRequire("@flighthq/interaction")
extern class Interaction {
	@:native("containsNode2D")
	public static function containsNode2d(outer:Dynamic, inner:Dynamic):Bool;
	@:native("getNode2DOverlapRectangle")
	public static function getNode2dOverlapRectangle(out:flight._js.Rectangle, source:Dynamic, other:Dynamic):Void;
	@:native("hitTestNode2DsShape")
	public static function hitTestNode2dsShape(source:Dynamic, other:Dynamic):Bool;
	@:native("disableInteractionGuards")
	public static function disableInteractionGuards():Void;
	@:native("enableInteractionGuards")
	public static function enableInteractionGuards():Void;
	@:native("explainInteractionHitEligibility")
	public static function explainInteractionHitEligibility(node:Dynamic):flight._js.InteractionHitEligibility;
	@:native("createFocusManager")
	public static function createFocusManager(root:Dynamic, options:flight._js.FocusManagerOptions):flight._js.FocusManager;
	@:native("clearFocus")
	public static function clearFocus(manager:flight._js.FocusManager):Void;
	@:native("focusNextNode")
	public static function focusNextNode(manager:flight._js.FocusManager):Null<Dynamic>;
	@:native("focusNodeInDirection")
	public static function focusNodeInDirection(manager:flight._js.FocusManager, direction:Dynamic):Null<Dynamic>;
	@:native("focusPreviousNode")
	public static function focusPreviousNode(manager:flight._js.FocusManager):Null<Dynamic>;
	@:native("getFocusOrder")
	public static function getFocusOrder(manager:flight._js.FocusManager):Dynamic;
	@:native("getFocusedNode")
	public static function getFocusedNode(manager:flight._js.FocusManager):Null<Dynamic>;
	@:native("isNodeFocused")
	public static function isNodeFocused(manager:flight._js.FocusManager, node:Dynamic):Bool;
	@:native("setFocusedNode")
	public static function setFocusedNode(manager:flight._js.FocusManager, node:Null<Dynamic>):Bool;
	@:native("createInteractionManager")
	public static function createInteractionManager(root:Dynamic, options:Null<flight._js.InteractionManagerOptions>):Dynamic;
	@:native("captureInteractionPointer")
	public static function captureInteractionPointer(manager:flight._js.InteractionManager, pointerId:Int, target:Dynamic):Void;
	@:native("connectInteractionDispatchLayer")
	public static function connectInteractionDispatchLayer(manager:flight._js.InteractionManager, layer:flight._js.InteractionDispatchLayer, options:flight._js.InteractionDispatchLayerOptions):Void;
	@:native("connectInteractionSignal")
	public static function connectInteractionSignal(manager:Dynamic, target:Dynamic, name:Dynamic, slot:flight._js.AnyInteractionSignalSlot, options:Null<flight._js.SignalConnectOptions>):Null<flight._js.SlotId>;
	@:native("disconnectInteractionSignal")
	public static function disconnectInteractionSignal(manager:Dynamic, target:Dynamic, name:Dynamic, id:flight._js.SlotId):Void;
	@:native("dispatchInteractionContextMenu")
	public static function dispatchInteractionContextMenu(manager:Dynamic, x:Float, y:Float, button:Int, options:Null<flight._js.InteractionPointerOptions>):Void;
	@:native("dispatchInteractionKeyDown")
	public static function dispatchInteractionKeyDown(manager:Dynamic, key:String, keyCode:Int, modifiers:Null<flight._js.KeyboardEventData>):Void;
	@:native("dispatchInteractionKeyUp")
	public static function dispatchInteractionKeyUp(manager:Dynamic, key:String, keyCode:Int, modifiers:Null<flight._js.KeyboardEventData>):Void;
	@:native("dispatchInteractionPointerCancel")
	public static function dispatchInteractionPointerCancel(manager:Dynamic, x:Float, y:Float, options:Null<flight._js.InteractionPointerOptions>):Void;
	@:native("dispatchInteractionPointerDown")
	public static function dispatchInteractionPointerDown(manager:Dynamic, x:Float, y:Float, button:Int, options:Null<flight._js.InteractionPointerOptions>):Void;
	@:native("dispatchInteractionPointerMove")
	public static function dispatchInteractionPointerMove(manager:Dynamic, x:Float, y:Float, button:Int, options:Null<flight._js.InteractionPointerOptions>):Void;
	@:native("dispatchInteractionPointerUp")
	public static function dispatchInteractionPointerUp(manager:Dynamic, x:Float, y:Float, button:Int, time:Null<Float>, options:Null<flight._js.InteractionPointerOptions>):Void;
	@:native("dispatchInteractionWheel")
	public static function dispatchInteractionWheel(manager:Dynamic, x:Float, y:Float, deltaX:Float, deltaY:Float, options:Null<flight._js.InteractionPointerOptions>):Void;
	@:native("enableInteractionSignals")
	public static function enableInteractionSignals(source:Dynamic):Dynamic;
	@:native("getInteractionSignals")
	public static function getInteractionSignals(source:Dynamic):Null<Dynamic>;
	@:native("invalidateInteractionCursor")
	public static function invalidateInteractionCursor(manager:Dynamic):Void;
	@:native("releaseInteractionPointer")
	public static function releaseInteractionPointer(manager:flight._js.InteractionManager, pointerId:Int):Void;
	@:native("findSpatialInteractionTarget")
	public static function findSpatialInteractionTarget(manager:Dynamic, ctx:flight._js.HitTestContext, x:Float, y:Float, precise:Bool, candidates:Dynamic):Null<Dynamic>;
	@:native("refreshInteractionSpatialIndex")
	public static function refreshInteractionSpatialIndex(manager:flight._js.InteractionManager, candidates:Dynamic):Void;
	@:native("createNodeInteractionState")
	public static function createNodeInteractionState():flight._js.NodeInteractionState;
	@:native("areNodeChildrenHitTestEnabled")
	public static function areNodeChildrenHitTestEnabled(source:Dynamic):Bool;
	@:native("enableNodeInteractionState")
	public static function enableNodeInteractionState(source:Dynamic):flight._js.NodeInteractionStateRef;
	@:native("getNodeCursor")
	public static function getNodeCursor(source:Dynamic):Null<flight._js.Cursor>;
	@:native("getNodeHitArea")
	public static function getNodeHitArea(source:Dynamic):Null<flight._js.NodeInteractionStateRef>;
	@:native("getNodeInteractionState")
	public static function getNodeInteractionState(source:Dynamic):Null<flight._js.NodeInteractionStateRef>;
	@:native("getNodeTabIndex")
	public static function getNodeTabIndex(source:Dynamic):Int;
	@:native("isNodeFocusable")
	public static function isNodeFocusable(source:Dynamic):Bool;
	@:native("isNodeHitTestEnabled")
	public static function isNodeHitTestEnabled(source:Dynamic):Bool;
	@:native("isNodePointerDoubleClickEnabled")
	public static function isNodePointerDoubleClickEnabled(source:Dynamic):Bool;
	@:native("setNodeChildrenHitTestEnabled")
	public static function setNodeChildrenHitTestEnabled(source:Dynamic, enabled:Bool):Void;
	@:native("setNodeFocusable")
	public static function setNodeFocusable(source:Dynamic, focusable:Bool):Void;
	@:native("setNodeHitTestEnabled")
	public static function setNodeHitTestEnabled(source:Dynamic, enabled:Bool):Void;
	@:native("setNodePointerDoubleClickEnabled")
	public static function setNodePointerDoubleClickEnabled(source:Dynamic, enabled:Bool):Void;
	@:native("setNodeTabIndex")
	public static function setNodeTabIndex(source:Dynamic, tabIndex:Int):Void;
	@:native("createNodeInteractiveStateBinding")
	public static function createNodeInteractiveStateBinding(node:Dynamic, interactiveStates:flight._js.FlightDocumentInteractiveStates, schemas:flight._js.FlightDocumentSchemaRegistry, transition:Null<flight._js.FlightDocumentInteractiveStateTransitionDescriptor>):Null<flight._js.NodeInteractiveStateBinding>;
	@:native("applyNodeInteractiveStates")
	public static function applyNodeInteractiveStates(binding:flight._js.NodeInteractiveStateBinding, flags:flight._js.NodeInteractiveStateFlags):Bool;
	@:native("disposeNodeInteractiveStateBinding")
	public static function disposeNodeInteractiveStateBinding(binding:flight._js.NodeInteractiveStateBinding):Void;
	@:native("explainNodeInteractiveStateBinding")
	public static function explainNodeInteractiveStateBinding(node:Dynamic, interactiveStates:flight._js.FlightDocumentInteractiveStates, schemas:flight._js.FlightDocumentSchemaRegistry, transition:Null<flight._js.FlightDocumentInteractiveStateTransitionDescriptor>):Null<flight._js.NodeInteractiveStateExplanation>;
	@:native("hitTestAreaQuery")
	public static function hitTestAreaQuery(root:Dynamic, rect:flight._js.Rectangle, out:Dynamic):Void;
	@:native("hitTestAreaQueryCircle")
	public static function hitTestAreaQueryCircle(root:Dynamic, cx:Float, cy:Float, radius:Float, out:Dynamic):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeInteractionHitEligibility(ptr:flight._js.InteractionHitEligibility):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFocusManager(ptr:flight._js.FocusManager):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeInteractionManagerRef(ptr:flight._js.InteractionManager):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeInteractionSignalsRef(ptr:flight._js.InteractionSignals):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeNodeInteractionState(ptr:flight._js.NodeInteractionState):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeNodeInteractionStateRef(ptr:flight._js.NodeInteractionState):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCursor(ptr:flight._js.Cursor):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeNodeInteractiveStateBinding(ptr:flight._js.NodeInteractiveStateBinding):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeNodeInteractiveStateExplanation(ptr:flight._js.NodeInteractiveStateExplanation):Void {}
}
