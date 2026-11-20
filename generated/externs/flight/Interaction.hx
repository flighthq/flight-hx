package flight;

#if (js && flight_esm)
extern inline function containsNode2d(outer:Dynamic, inner:Dynamic):Bool {
	return flight._js._fn.Interaction.containsNode2d(outer, inner);
}
#else
extern inline function containsNode2d(outer:flight.FlightNode, inner:flight.FlightNode):Bool {
#if hl
	return flight._hl._fn.Interaction.containsNode2d(outer, inner);
#elseif cpp
	return flight._cpp._fn.Interaction.containsNode2d(outer, inner);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.containsNode2d(outer, inner);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNode2dOverlapRectangle(out:Rectangle, source:Dynamic, other:Dynamic):Void {
	flight._js._fn.Interaction.getNode2dOverlapRectangle(out, source, other);
}
#else
extern inline function getNode2dOverlapRectangle(out:Rectangle, source:flight.FlightNode, other:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Interaction.getNode2dOverlapRectangle(out, source, other);
#elseif cpp
	flight._cpp._fn.Interaction.getNode2dOverlapRectangle(out, source, other);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.getNode2dOverlapRectangle(out, source, other);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hitTestNode2dsShape(source:Dynamic, other:Dynamic):Bool {
	return flight._js._fn.Interaction.hitTestNode2dsShape(source, other);
}
#else
extern inline function hitTestNode2dsShape(source:flight.FlightNode, other:flight.FlightNode):Bool {
#if hl
	return flight._hl._fn.Interaction.hitTestNode2dsShape(source, other);
#elseif cpp
	return flight._cpp._fn.Interaction.hitTestNode2dsShape(source, other);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.hitTestNode2dsShape(source, other);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disableInteractionGuards():Void {
	flight._js._fn.Interaction.disableInteractionGuards();
}
#else
extern inline function disableInteractionGuards():Void {
#if hl
	flight._hl._fn.Interaction.disableInteractionGuards();
#elseif cpp
	flight._cpp._fn.Interaction.disableInteractionGuards();
#elseif (js && flight_esm)
	flight._js._fn.Interaction.disableInteractionGuards();
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableInteractionGuards():Void {
	flight._js._fn.Interaction.enableInteractionGuards();
}
#else
extern inline function enableInteractionGuards():Void {
#if hl
	flight._hl._fn.Interaction.enableInteractionGuards();
#elseif cpp
	flight._cpp._fn.Interaction.enableInteractionGuards();
#elseif (js && flight_esm)
	flight._js._fn.Interaction.enableInteractionGuards();
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainInteractionHitEligibility(node:Dynamic):InteractionHitEligibility {
	return flight._js._fn.Interaction.explainInteractionHitEligibility(node);
}
#else
extern inline function explainInteractionHitEligibility(node:flight.FlightNode):InteractionHitEligibility {
#if hl
	return flight._hl._fn.Interaction.explainInteractionHitEligibility(node);
#elseif cpp
	return flight._cpp._fn.Interaction.explainInteractionHitEligibility(node);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.explainInteractionHitEligibility(node);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createFocusManager(root:Dynamic, options:FocusManagerOptions):FocusManager {
	return flight._js._fn.Interaction.createFocusManager(root, options);
}
#else
extern inline function createFocusManager(root:flight.FlightNode, options:FocusManagerOptions):FocusManager {
#if hl
	return flight._hl._fn.Interaction.createFocusManager(root, options);
#elseif cpp
	return flight._cpp._fn.Interaction.createFocusManager(root, options);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.createFocusManager(root, options);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearFocus(manager:FocusManager):Void {
	flight._js._fn.Interaction.clearFocus(manager);
}
#else
extern inline function clearFocus(manager:FocusManager):Void {
#if hl
	flight._hl._fn.Interaction.clearFocus(manager);
#elseif cpp
	flight._cpp._fn.Interaction.clearFocus(manager);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.clearFocus(manager);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function focusNextNode(manager:FocusManager):Null<Dynamic> {
	return flight._js._fn.Interaction.focusNextNode(manager);
}
#else
extern inline function focusNextNode(manager:FocusManager):Null<flight.FlightNode> {
#if hl
	return flight._hl._fn.Interaction.focusNextNode(manager);
#elseif cpp
	return flight._cpp._fn.Interaction.focusNextNode(manager);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.focusNextNode(manager);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function focusNodeInDirection(manager:FocusManager, direction:Dynamic):Null<Dynamic> {
	return flight._js._fn.Interaction.focusNodeInDirection(manager, direction);
}
#else
extern inline function focusNodeInDirection(manager:FocusManager, direction:flight.FocusDirection):Null<flight.FlightNode> {
#if hl
	return flight._hl._fn.Interaction.focusNodeInDirection(manager, direction);
#elseif cpp
	return flight._cpp._fn.Interaction.focusNodeInDirection(manager, direction);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.focusNodeInDirection(manager, direction);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function focusPreviousNode(manager:FocusManager):Null<Dynamic> {
	return flight._js._fn.Interaction.focusPreviousNode(manager);
}
#else
extern inline function focusPreviousNode(manager:FocusManager):Null<flight.FlightNode> {
#if hl
	return flight._hl._fn.Interaction.focusPreviousNode(manager);
#elseif cpp
	return flight._cpp._fn.Interaction.focusPreviousNode(manager);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.focusPreviousNode(manager);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getFocusOrder(manager:FocusManager):Dynamic {
	return flight._js._fn.Interaction.getFocusOrder(manager);
}
#else
extern inline function getFocusOrder(manager:FocusManager):flight.FlightNodeArray {
#if hl
	return flight._hl._fn.Interaction.getFocusOrder(manager);
#elseif cpp
	return flight._cpp._fn.Interaction.getFocusOrder(manager);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.getFocusOrder(manager);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getFocusedNode(manager:FocusManager):Null<Dynamic> {
	return flight._js._fn.Interaction.getFocusedNode(manager);
}
#else
extern inline function getFocusedNode(manager:FocusManager):Null<flight.FlightNode> {
#if hl
	return flight._hl._fn.Interaction.getFocusedNode(manager);
#elseif cpp
	return flight._cpp._fn.Interaction.getFocusedNode(manager);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.getFocusedNode(manager);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isNodeFocused(manager:FocusManager, node:Dynamic):Bool {
	return flight._js._fn.Interaction.isNodeFocused(manager, node);
}
#else
extern inline function isNodeFocused(manager:FocusManager, node:flight.FlightNode):Bool {
#if hl
	return flight._hl._fn.Interaction.isNodeFocused(manager, node);
#elseif cpp
	return flight._cpp._fn.Interaction.isNodeFocused(manager, node);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.isNodeFocused(manager, node);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setFocusedNode(manager:FocusManager, node:Null<Dynamic>):Bool {
	return flight._js._fn.Interaction.setFocusedNode(manager, node);
}
#else
extern inline function setFocusedNode(manager:FocusManager, node:Null<flight.FlightNode>):Bool {
#if hl
	return flight._hl._fn.Interaction.setFocusedNode(manager, node);
#elseif cpp
	return flight._cpp._fn.Interaction.setFocusedNode(manager, node);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.setFocusedNode(manager, node);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createInteractionManager(root:Dynamic, options:Null<InteractionManagerOptions>):Dynamic {
	return flight._js._fn.Interaction.createInteractionManager(root, options);
}
#else
extern inline function createInteractionManager(root:flight.FlightNode, options:InteractionManagerOptions):Dynamic {
#if hl
	return flight._hl._fn.Interaction.createInteractionManager(root, options);
#elseif cpp
	return flight._cpp._fn.Interaction.createInteractionManager(root, options);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.createInteractionManager(root, options);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function captureInteractionPointer(manager:InteractionManager, pointerId:Int, target:Dynamic):Void {
	flight._js._fn.Interaction.captureInteractionPointer(manager, pointerId, target);
}
#else
extern inline function captureInteractionPointer(manager:InteractionManager, pointerId:Int, target:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Interaction.captureInteractionPointer(manager, pointerId, target);
#elseif cpp
	flight._cpp._fn.Interaction.captureInteractionPointer(manager, pointerId, target);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.captureInteractionPointer(manager, pointerId, target);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function connectInteractionDispatchLayer(manager:InteractionManager, layer:InteractionDispatchLayer, options:InteractionDispatchLayerOptions):Void {
	flight._js._fn.Interaction.connectInteractionDispatchLayer(manager, layer, options);
}
#else
extern inline function connectInteractionDispatchLayer(manager:InteractionManager, layer:InteractionDispatchLayer, options:InteractionDispatchLayerOptions):Void {
#if hl
	flight._hl._fn.Interaction.connectInteractionDispatchLayer(manager, layer, options);
#elseif cpp
	flight._cpp._fn.Interaction.connectInteractionDispatchLayer(manager, layer, options);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.connectInteractionDispatchLayer(manager, layer, options);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function connectInteractionSignal(manager:Dynamic, target:Dynamic, name:Dynamic, slot:AnyInteractionSignalSlot, options:Null<SignalConnectOptions>):Null<SlotId> {
	return flight._js._fn.Interaction.connectInteractionSignal(manager, target, name, slot, options);
}
#end
#if (js && flight_esm)
extern inline function disconnectInteractionSignal(manager:Dynamic, target:Dynamic, name:Dynamic, id:SlotId):Void {
	flight._js._fn.Interaction.disconnectInteractionSignal(manager, target, name, id);
}
#else
extern inline function disconnectInteractionSignal(manager:Dynamic, target:flight.FlightNode, name:flight.InteractionSignalName, id:SlotId):Void {
#if hl
	flight._hl._fn.Interaction.disconnectInteractionSignal(manager, target, name, id);
#elseif cpp
	flight._cpp._fn.Interaction.disconnectInteractionSignal(manager, target, name, id);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.disconnectInteractionSignal(manager, target, name, id);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchInteractionContextMenu(manager:Dynamic, x:Float, y:Float, button:Int, options:Null<InteractionPointerOptions>):Void {
	flight._js._fn.Interaction.dispatchInteractionContextMenu(manager, x, y, button, options);
}
#else
extern inline function dispatchInteractionContextMenu(manager:Dynamic, x:Float, y:Float, button:Int, options:InteractionPointerOptions):Void {
#if hl
	flight._hl._fn.Interaction.dispatchInteractionContextMenu(manager, x, y, button, options);
#elseif cpp
	flight._cpp._fn.Interaction.dispatchInteractionContextMenu(manager, x, y, button, options);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.dispatchInteractionContextMenu(manager, x, y, button, options);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchInteractionKeyDown(manager:Dynamic, key:String, keyCode:Int, modifiers:Null<KeyboardEventData>):Void {
	flight._js._fn.Interaction.dispatchInteractionKeyDown(manager, key, keyCode, modifiers);
}
#else
extern inline function dispatchInteractionKeyDown(manager:Dynamic, key:String, keyCode:Int, modifiers:KeyboardEventData):Void {
#if hl
	flight._hl._fn.Interaction.dispatchInteractionKeyDown(manager, cast key, keyCode, modifiers);
#elseif cpp
	flight._cpp._fn.Interaction.dispatchInteractionKeyDown(manager, cast key, keyCode, modifiers);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.dispatchInteractionKeyDown(manager, key, keyCode, modifiers);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchInteractionKeyUp(manager:Dynamic, key:String, keyCode:Int, modifiers:Null<KeyboardEventData>):Void {
	flight._js._fn.Interaction.dispatchInteractionKeyUp(manager, key, keyCode, modifiers);
}
#else
extern inline function dispatchInteractionKeyUp(manager:Dynamic, key:String, keyCode:Int, modifiers:KeyboardEventData):Void {
#if hl
	flight._hl._fn.Interaction.dispatchInteractionKeyUp(manager, cast key, keyCode, modifiers);
#elseif cpp
	flight._cpp._fn.Interaction.dispatchInteractionKeyUp(manager, cast key, keyCode, modifiers);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.dispatchInteractionKeyUp(manager, key, keyCode, modifiers);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchInteractionPointerCancel(manager:Dynamic, x:Float, y:Float, options:Null<InteractionPointerOptions>):Void {
	flight._js._fn.Interaction.dispatchInteractionPointerCancel(manager, x, y, options);
}
#else
extern inline function dispatchInteractionPointerCancel(manager:Dynamic, x:Float, y:Float, options:InteractionPointerOptions):Void {
#if hl
	flight._hl._fn.Interaction.dispatchInteractionPointerCancel(manager, x, y, options);
#elseif cpp
	flight._cpp._fn.Interaction.dispatchInteractionPointerCancel(manager, x, y, options);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.dispatchInteractionPointerCancel(manager, x, y, options);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchInteractionPointerDown(manager:Dynamic, x:Float, y:Float, button:Int, options:Null<InteractionPointerOptions>):Void {
	flight._js._fn.Interaction.dispatchInteractionPointerDown(manager, x, y, button, options);
}
#else
extern inline function dispatchInteractionPointerDown(manager:Dynamic, x:Float, y:Float, button:Int, options:InteractionPointerOptions):Void {
#if hl
	flight._hl._fn.Interaction.dispatchInteractionPointerDown(manager, x, y, button, options);
#elseif cpp
	flight._cpp._fn.Interaction.dispatchInteractionPointerDown(manager, x, y, button, options);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.dispatchInteractionPointerDown(manager, x, y, button, options);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchInteractionPointerMove(manager:Dynamic, x:Float, y:Float, button:Int, options:Null<InteractionPointerOptions>):Void {
	flight._js._fn.Interaction.dispatchInteractionPointerMove(manager, x, y, button, options);
}
#else
extern inline function dispatchInteractionPointerMove(manager:Dynamic, x:Float, y:Float, button:Int, options:InteractionPointerOptions):Void {
#if hl
	flight._hl._fn.Interaction.dispatchInteractionPointerMove(manager, x, y, button, options);
#elseif cpp
	flight._cpp._fn.Interaction.dispatchInteractionPointerMove(manager, x, y, button, options);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.dispatchInteractionPointerMove(manager, x, y, button, options);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchInteractionPointerUp(manager:Dynamic, x:Float, y:Float, button:Int, time:Null<Float>, options:Null<InteractionPointerOptions>):Void {
	flight._js._fn.Interaction.dispatchInteractionPointerUp(manager, x, y, button, time, options);
}
#else
extern inline function dispatchInteractionPointerUp(manager:Dynamic, x:Float, y:Float, button:Int, time:Float, options:InteractionPointerOptions):Void {
#if hl
	flight._hl._fn.Interaction.dispatchInteractionPointerUp(manager, x, y, button, time, options);
#elseif cpp
	flight._cpp._fn.Interaction.dispatchInteractionPointerUp(manager, x, y, button, time, options);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.dispatchInteractionPointerUp(manager, x, y, button, time, options);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function dispatchInteractionWheel(manager:Dynamic, x:Float, y:Float, deltaX:Float, deltaY:Float, options:Null<InteractionPointerOptions>):Void {
	flight._js._fn.Interaction.dispatchInteractionWheel(manager, x, y, deltaX, deltaY, options);
}
#else
extern inline function dispatchInteractionWheel(manager:Dynamic, x:Float, y:Float, deltaX:Float, deltaY:Float, options:InteractionPointerOptions):Void {
#if hl
	flight._hl._fn.Interaction.dispatchInteractionWheel(manager, x, y, deltaX, deltaY, options);
#elseif cpp
	flight._cpp._fn.Interaction.dispatchInteractionWheel(manager, x, y, deltaX, deltaY, options);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.dispatchInteractionWheel(manager, x, y, deltaX, deltaY, options);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableInteractionSignals(source:Dynamic):Dynamic {
	return flight._js._fn.Interaction.enableInteractionSignals(source);
}
#else
extern inline function enableInteractionSignals(source:flight.FlightNode):Dynamic {
#if hl
	return flight._hl._fn.Interaction.enableInteractionSignals(source);
#elseif cpp
	return flight._cpp._fn.Interaction.enableInteractionSignals(source);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.enableInteractionSignals(source);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getInteractionSignals(source:Dynamic):Null<Dynamic> {
	return flight._js._fn.Interaction.getInteractionSignals(source);
}
#else
extern inline function getInteractionSignals(source:flight.FlightNode):Dynamic {
#if hl
	return flight._hl._fn.Interaction.getInteractionSignals(source);
#elseif cpp
	return flight._cpp._fn.Interaction.getInteractionSignals(source);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.getInteractionSignals(source);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function invalidateInteractionCursor(manager:Dynamic):Void {
	flight._js._fn.Interaction.invalidateInteractionCursor(manager);
}
#else
extern inline function invalidateInteractionCursor(manager:Dynamic):Void {
#if hl
	flight._hl._fn.Interaction.invalidateInteractionCursor(manager);
#elseif cpp
	flight._cpp._fn.Interaction.invalidateInteractionCursor(manager);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.invalidateInteractionCursor(manager);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function releaseInteractionPointer(manager:InteractionManager, pointerId:Int):Void {
	flight._js._fn.Interaction.releaseInteractionPointer(manager, pointerId);
}
#else
extern inline function releaseInteractionPointer(manager:InteractionManager, pointerId:Int):Void {
#if hl
	flight._hl._fn.Interaction.releaseInteractionPointer(manager, pointerId);
#elseif cpp
	flight._cpp._fn.Interaction.releaseInteractionPointer(manager, pointerId);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.releaseInteractionPointer(manager, pointerId);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function findSpatialInteractionTarget(manager:Dynamic, ctx:HitTestContext, x:Float, y:Float, precise:Bool, candidates:Dynamic):Null<Dynamic> {
	return flight._js._fn.Interaction.findSpatialInteractionTarget(manager, ctx, x, y, precise, candidates);
}
#else
extern inline function findSpatialInteractionTarget(manager:Dynamic, ctx:HitTestContext, x:Float, y:Float, precise:Bool, candidates:flight.FlightNodeArray):Null<flight.FlightNode> {
#if hl
	return flight._hl._fn.Interaction.findSpatialInteractionTarget(manager, ctx, x, y, precise, candidates);
#elseif cpp
	return flight._cpp._fn.Interaction.findSpatialInteractionTarget(manager, ctx, x, y, precise, candidates);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.findSpatialInteractionTarget(manager, ctx, x, y, precise, candidates);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function refreshInteractionSpatialIndex(manager:InteractionManager, candidates:Dynamic):Void {
	flight._js._fn.Interaction.refreshInteractionSpatialIndex(manager, candidates);
}
#else
extern inline function refreshInteractionSpatialIndex(manager:InteractionManager, candidates:flight.FlightNodeArray):Void {
#if hl
	flight._hl._fn.Interaction.refreshInteractionSpatialIndex(manager, candidates);
#elseif cpp
	flight._cpp._fn.Interaction.refreshInteractionSpatialIndex(manager, candidates);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.refreshInteractionSpatialIndex(manager, candidates);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createNodeInteractionState():NodeInteractionState {
	return flight._js._fn.Interaction.createNodeInteractionState();
}
#else
extern inline function createNodeInteractionState():NodeInteractionState {
#if hl
	return flight._hl._fn.Interaction.createNodeInteractionState();
#elseif cpp
	return flight._cpp._fn.Interaction.createNodeInteractionState();
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.createNodeInteractionState();
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function areNodeChildrenHitTestEnabled(source:Dynamic):Bool {
	return flight._js._fn.Interaction.areNodeChildrenHitTestEnabled(source);
}
#else
extern inline function areNodeChildrenHitTestEnabled(source:flight.FlightNode):Bool {
#if hl
	return flight._hl._fn.Interaction.areNodeChildrenHitTestEnabled(source);
#elseif cpp
	return flight._cpp._fn.Interaction.areNodeChildrenHitTestEnabled(source);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.areNodeChildrenHitTestEnabled(source);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enableNodeInteractionState(source:Dynamic):NodeInteractionStateRef {
	return flight._js._fn.Interaction.enableNodeInteractionState(source);
}
#else
extern inline function enableNodeInteractionState(source:flight.FlightNode):NodeInteractionStateRef {
#if hl
	return flight._hl._fn.Interaction.enableNodeInteractionState(source);
#elseif cpp
	return flight._cpp._fn.Interaction.enableNodeInteractionState(source);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.enableNodeInteractionState(source);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNodeCursor(source:Dynamic):Null<Cursor> {
	return flight._js._fn.Interaction.getNodeCursor(source);
}
#else
extern inline function getNodeCursor(source:flight.FlightNode):Cursor {
#if hl
	return flight._hl._fn.Interaction.getNodeCursor(source);
#elseif cpp
	return flight._cpp._fn.Interaction.getNodeCursor(source);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.getNodeCursor(source);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNodeHitArea(source:Dynamic):Null<NodeInteractionStateRef> {
	return flight._js._fn.Interaction.getNodeHitArea(source);
}
#else
extern inline function getNodeHitArea(source:flight.FlightNode):NodeInteractionStateRef {
#if hl
	return flight._hl._fn.Interaction.getNodeHitArea(source);
#elseif cpp
	return flight._cpp._fn.Interaction.getNodeHitArea(source);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.getNodeHitArea(source);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNodeInteractionState(source:Dynamic):Null<NodeInteractionStateRef> {
	return flight._js._fn.Interaction.getNodeInteractionState(source);
}
#else
extern inline function getNodeInteractionState(source:flight.FlightNode):NodeInteractionStateRef {
#if hl
	return flight._hl._fn.Interaction.getNodeInteractionState(source);
#elseif cpp
	return flight._cpp._fn.Interaction.getNodeInteractionState(source);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.getNodeInteractionState(source);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getNodeTabIndex(source:Dynamic):Int {
	return flight._js._fn.Interaction.getNodeTabIndex(source);
}
#else
extern inline function getNodeTabIndex(source:flight.FlightNode):Int {
#if hl
	return flight._hl._fn.Interaction.getNodeTabIndex(source);
#elseif cpp
	return flight._cpp._fn.Interaction.getNodeTabIndex(source);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.getNodeTabIndex(source);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isNodeFocusable(source:Dynamic):Bool {
	return flight._js._fn.Interaction.isNodeFocusable(source);
}
#else
extern inline function isNodeFocusable(source:flight.FlightNode):Bool {
#if hl
	return flight._hl._fn.Interaction.isNodeFocusable(source);
#elseif cpp
	return flight._cpp._fn.Interaction.isNodeFocusable(source);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.isNodeFocusable(source);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isNodeHitTestEnabled(source:Dynamic):Bool {
	return flight._js._fn.Interaction.isNodeHitTestEnabled(source);
}
#else
extern inline function isNodeHitTestEnabled(source:flight.FlightNode):Bool {
#if hl
	return flight._hl._fn.Interaction.isNodeHitTestEnabled(source);
#elseif cpp
	return flight._cpp._fn.Interaction.isNodeHitTestEnabled(source);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.isNodeHitTestEnabled(source);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isNodePointerDoubleClickEnabled(source:Dynamic):Bool {
	return flight._js._fn.Interaction.isNodePointerDoubleClickEnabled(source);
}
#else
extern inline function isNodePointerDoubleClickEnabled(source:flight.FlightNode):Bool {
#if hl
	return flight._hl._fn.Interaction.isNodePointerDoubleClickEnabled(source);
#elseif cpp
	return flight._cpp._fn.Interaction.isNodePointerDoubleClickEnabled(source);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.isNodePointerDoubleClickEnabled(source);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setNodeChildrenHitTestEnabled(source:Dynamic, enabled:Bool):Void {
	flight._js._fn.Interaction.setNodeChildrenHitTestEnabled(source, enabled);
}
#else
extern inline function setNodeChildrenHitTestEnabled(source:flight.FlightNode, enabled:Bool):Void {
#if hl
	flight._hl._fn.Interaction.setNodeChildrenHitTestEnabled(source, enabled);
#elseif cpp
	flight._cpp._fn.Interaction.setNodeChildrenHitTestEnabled(source, enabled);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.setNodeChildrenHitTestEnabled(source, enabled);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setNodeFocusable(source:Dynamic, focusable:Bool):Void {
	flight._js._fn.Interaction.setNodeFocusable(source, focusable);
}
#else
extern inline function setNodeFocusable(source:flight.FlightNode, focusable:Bool):Void {
#if hl
	flight._hl._fn.Interaction.setNodeFocusable(source, focusable);
#elseif cpp
	flight._cpp._fn.Interaction.setNodeFocusable(source, focusable);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.setNodeFocusable(source, focusable);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setNodeHitTestEnabled(source:Dynamic, enabled:Bool):Void {
	flight._js._fn.Interaction.setNodeHitTestEnabled(source, enabled);
}
#else
extern inline function setNodeHitTestEnabled(source:flight.FlightNode, enabled:Bool):Void {
#if hl
	flight._hl._fn.Interaction.setNodeHitTestEnabled(source, enabled);
#elseif cpp
	flight._cpp._fn.Interaction.setNodeHitTestEnabled(source, enabled);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.setNodeHitTestEnabled(source, enabled);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setNodePointerDoubleClickEnabled(source:Dynamic, enabled:Bool):Void {
	flight._js._fn.Interaction.setNodePointerDoubleClickEnabled(source, enabled);
}
#else
extern inline function setNodePointerDoubleClickEnabled(source:flight.FlightNode, enabled:Bool):Void {
#if hl
	flight._hl._fn.Interaction.setNodePointerDoubleClickEnabled(source, enabled);
#elseif cpp
	flight._cpp._fn.Interaction.setNodePointerDoubleClickEnabled(source, enabled);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.setNodePointerDoubleClickEnabled(source, enabled);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setNodeTabIndex(source:Dynamic, tabIndex:Int):Void {
	flight._js._fn.Interaction.setNodeTabIndex(source, tabIndex);
}
#else
extern inline function setNodeTabIndex(source:flight.FlightNode, tabIndex:Int):Void {
#if hl
	flight._hl._fn.Interaction.setNodeTabIndex(source, tabIndex);
#elseif cpp
	flight._cpp._fn.Interaction.setNodeTabIndex(source, tabIndex);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.setNodeTabIndex(source, tabIndex);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createNodeInteractiveStateBinding(node:Dynamic, interactiveStates:FlightDocumentInteractiveStates, schemas:FlightDocumentSchemaRegistry, transition:Null<FlightDocumentInteractiveStateTransitionDescriptor>):Null<NodeInteractiveStateBinding> {
	return flight._js._fn.Interaction.createNodeInteractiveStateBinding(node, interactiveStates, schemas, transition);
}
#else
extern inline function createNodeInteractiveStateBinding(node:flight.FlightNode, interactiveStates:FlightDocumentInteractiveStates, schemas:FlightDocumentSchemaRegistry, transition:FlightDocumentInteractiveStateTransitionDescriptor):NodeInteractiveStateBinding {
#if hl
	return flight._hl._fn.Interaction.createNodeInteractiveStateBinding(node, interactiveStates, schemas, transition);
#elseif cpp
	return flight._cpp._fn.Interaction.createNodeInteractiveStateBinding(node, interactiveStates, schemas, transition);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.createNodeInteractiveStateBinding(node, interactiveStates, schemas, transition);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyNodeInteractiveStates(binding:NodeInteractiveStateBinding, flags:NodeInteractiveStateFlags):Bool {
	return flight._js._fn.Interaction.applyNodeInteractiveStates(binding, flags);
}
#else
extern inline function applyNodeInteractiveStates(binding:NodeInteractiveStateBinding, flags:NodeInteractiveStateFlags):Bool {
#if hl
	return flight._hl._fn.Interaction.applyNodeInteractiveStates(binding, flags);
#elseif cpp
	return flight._cpp._fn.Interaction.applyNodeInteractiveStates(binding, flags);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.applyNodeInteractiveStates(binding, flags);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeNodeInteractiveStateBinding(binding:NodeInteractiveStateBinding):Void {
	flight._js._fn.Interaction.disposeNodeInteractiveStateBinding(binding);
}
#else
extern inline function disposeNodeInteractiveStateBinding(binding:NodeInteractiveStateBinding):Void {
#if hl
	flight._hl._fn.Interaction.disposeNodeInteractiveStateBinding(binding);
#elseif cpp
	flight._cpp._fn.Interaction.disposeNodeInteractiveStateBinding(binding);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.disposeNodeInteractiveStateBinding(binding);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainNodeInteractiveStateBinding(node:Dynamic, interactiveStates:FlightDocumentInteractiveStates, schemas:FlightDocumentSchemaRegistry, transition:Null<FlightDocumentInteractiveStateTransitionDescriptor>):Null<NodeInteractiveStateExplanation> {
	return flight._js._fn.Interaction.explainNodeInteractiveStateBinding(node, interactiveStates, schemas, transition);
}
#else
extern inline function explainNodeInteractiveStateBinding(node:flight.FlightNode, interactiveStates:FlightDocumentInteractiveStates, schemas:FlightDocumentSchemaRegistry, transition:FlightDocumentInteractiveStateTransitionDescriptor):NodeInteractiveStateExplanation {
#if hl
	return flight._hl._fn.Interaction.explainNodeInteractiveStateBinding(node, interactiveStates, schemas, transition);
#elseif cpp
	return flight._cpp._fn.Interaction.explainNodeInteractiveStateBinding(node, interactiveStates, schemas, transition);
#elseif (js && flight_esm)
	return flight._js._fn.Interaction.explainNodeInteractiveStateBinding(node, interactiveStates, schemas, transition);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hitTestAreaQuery(root:Dynamic, rect:Rectangle, out:Dynamic):Void {
	flight._js._fn.Interaction.hitTestAreaQuery(root, rect, out);
}
#else
extern inline function hitTestAreaQuery(root:flight.FlightNode, rect:Rectangle, out:flight.FlightNodeArray):Void {
#if hl
	flight._hl._fn.Interaction.hitTestAreaQuery(root, rect, out);
#elseif cpp
	flight._cpp._fn.Interaction.hitTestAreaQuery(root, rect, out);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.hitTestAreaQuery(root, rect, out);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hitTestAreaQueryCircle(root:Dynamic, cx:Float, cy:Float, radius:Float, out:Dynamic):Void {
	flight._js._fn.Interaction.hitTestAreaQueryCircle(root, cx, cy, radius, out);
}
#else
extern inline function hitTestAreaQueryCircle(root:flight.FlightNode, cx:Float, cy:Float, radius:Float, out:flight.FlightNodeArray):Void {
#if hl
	flight._hl._fn.Interaction.hitTestAreaQueryCircle(root, cx, cy, radius, out);
#elseif cpp
	flight._cpp._fn.Interaction.hitTestAreaQueryCircle(root, cx, cy, radius, out);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.hitTestAreaQueryCircle(root, cx, cy, radius, out);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeInteractionHitEligibility(ptr:InteractionHitEligibility):Void {
	flight._js._fn.Interaction.freeInteractionHitEligibility(ptr);
}
#else
extern inline function freeInteractionHitEligibility(ptr:InteractionHitEligibility):Void {
#if hl
	flight._hl._fn.Interaction.freeInteractionHitEligibility(ptr);
#elseif cpp
	flight._cpp._fn.Interaction.freeInteractionHitEligibility(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.freeInteractionHitEligibility(ptr);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeFocusManager(ptr:FocusManager):Void {
	flight._js._fn.Interaction.freeFocusManager(ptr);
}
#else
extern inline function freeFocusManager(ptr:FocusManager):Void {
#if hl
	flight._hl._fn.Interaction.freeFocusManager(ptr);
#elseif cpp
	flight._cpp._fn.Interaction.freeFocusManager(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.freeFocusManager(ptr);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeInteractionManagerRef(ptr:InteractionManager):Void {
	flight._js._fn.Interaction.freeInteractionManagerRef(ptr);
}
#else
extern inline function freeInteractionManagerRef(ptr:InteractionManager):Void {
#if hl
	flight._hl._fn.Interaction.freeInteractionManagerRef(ptr);
#elseif cpp
	flight._cpp._fn.Interaction.freeInteractionManagerRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.freeInteractionManagerRef(ptr);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeInteractionSignalsRef(ptr:InteractionSignals):Void {
	flight._js._fn.Interaction.freeInteractionSignalsRef(ptr);
}
#else
extern inline function freeInteractionSignalsRef(ptr:InteractionSignals):Void {
#if hl
	flight._hl._fn.Interaction.freeInteractionSignalsRef(ptr);
#elseif cpp
	flight._cpp._fn.Interaction.freeInteractionSignalsRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.freeInteractionSignalsRef(ptr);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeNodeInteractionState(ptr:NodeInteractionState):Void {
	flight._js._fn.Interaction.freeNodeInteractionState(ptr);
}
#else
extern inline function freeNodeInteractionState(ptr:NodeInteractionState):Void {
#if hl
	flight._hl._fn.Interaction.freeNodeInteractionState(ptr);
#elseif cpp
	flight._cpp._fn.Interaction.freeNodeInteractionState(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.freeNodeInteractionState(ptr);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeNodeInteractionStateRef(ptr:NodeInteractionState):Void {
	flight._js._fn.Interaction.freeNodeInteractionStateRef(ptr);
}
#else
extern inline function freeNodeInteractionStateRef(ptr:NodeInteractionState):Void {
#if hl
	flight._hl._fn.Interaction.freeNodeInteractionStateRef(ptr);
#elseif cpp
	flight._cpp._fn.Interaction.freeNodeInteractionStateRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.freeNodeInteractionStateRef(ptr);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCursor(ptr:Cursor):Void {
	flight._js._fn.Interaction.freeCursor(ptr);
}
#else
extern inline function freeCursor(ptr:Cursor):Void {
#if hl
	flight._hl._fn.Interaction.freeCursor(ptr);
#elseif cpp
	flight._cpp._fn.Interaction.freeCursor(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.freeCursor(ptr);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeNodeInteractiveStateBinding(ptr:NodeInteractiveStateBinding):Void {
	flight._js._fn.Interaction.freeNodeInteractiveStateBinding(ptr);
}
#else
extern inline function freeNodeInteractiveStateBinding(ptr:NodeInteractiveStateBinding):Void {
#if hl
	flight._hl._fn.Interaction.freeNodeInteractiveStateBinding(ptr);
#elseif cpp
	flight._cpp._fn.Interaction.freeNodeInteractiveStateBinding(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.freeNodeInteractiveStateBinding(ptr);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeNodeInteractiveStateExplanation(ptr:NodeInteractiveStateExplanation):Void {
	flight._js._fn.Interaction.freeNodeInteractiveStateExplanation(ptr);
}
#else
extern inline function freeNodeInteractiveStateExplanation(ptr:NodeInteractiveStateExplanation):Void {
#if hl
	flight._hl._fn.Interaction.freeNodeInteractiveStateExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Interaction.freeNodeInteractiveStateExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Interaction.freeNodeInteractiveStateExplanation(ptr);
#else
	#error "flight.Interaction: no backend for this target."
#end
}
#end
