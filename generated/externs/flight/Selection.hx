package flight;

#if (js && flight_esm)
extern inline function createLassoSelection():LassoSelection {
	return flight._js._fn.Selection.createLassoSelection();
}
#else
extern inline function createLassoSelection():LassoSelection {
#if hl
	return flight._hl._fn.Selection.createLassoSelection();
#elseif cpp
	return flight._cpp._fn.Selection.createLassoSelection();
#elseif (js && flight_esm)
	return flight._js._fn.Selection.createLassoSelection();
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addLassoSelectionPoint(selection:LassoSelection, x:Float, y:Float):Void {
	flight._js._fn.Selection.addLassoSelectionPoint(selection, x, y);
}
#else
extern inline function addLassoSelectionPoint(selection:LassoSelection, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Selection.addLassoSelectionPoint(selection, x, y);
#elseif cpp
	flight._cpp._fn.Selection.addLassoSelectionPoint(selection, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Selection.addLassoSelectionPoint(selection, x, y);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function beginLassoSelection(selection:LassoSelection, startX:Float, startY:Float):Void {
	flight._js._fn.Selection.beginLassoSelection(selection, startX, startY);
}
#else
extern inline function beginLassoSelection(selection:LassoSelection, startX:Float, startY:Float):Void {
#if hl
	flight._hl._fn.Selection.beginLassoSelection(selection, startX, startY);
#elseif cpp
	flight._cpp._fn.Selection.beginLassoSelection(selection, startX, startY);
#elseif (js && flight_esm)
	flight._js._fn.Selection.beginLassoSelection(selection, startX, startY);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function endLassoSelection(selection:LassoSelection):Path {
	return flight._js._fn.Selection.endLassoSelection(selection);
}
#else
extern inline function endLassoSelection(selection:LassoSelection):Path {
#if hl
	return flight._hl._fn.Selection.endLassoSelection(selection);
#elseif cpp
	return flight._cpp._fn.Selection.endLassoSelection(selection);
#elseif (js && flight_esm)
	return flight._js._fn.Selection.endLassoSelection(selection);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getLassoSelectionPath(selection:LassoSelection):Path {
	return flight._js._fn.Selection.getLassoSelectionPath(selection);
}
#else
extern inline function getLassoSelectionPath(selection:LassoSelection):Path {
#if hl
	return flight._hl._fn.Selection.getLassoSelectionPath(selection);
#elseif cpp
	return flight._cpp._fn.Selection.getLassoSelectionPath(selection);
#elseif (js && flight_esm)
	return flight._js._fn.Selection.getLassoSelectionPath(selection);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function findNodesInLassoSelection(out:Dynamic, selection:LassoSelection, candidates:Dynamic):Void {
	flight._js._fn.Selection.findNodesInLassoSelection(out, selection, candidates);
}
#else
extern inline function findNodesInLassoSelection(out:flight.FlightNodeArray, selection:LassoSelection, candidates:flight.FlightNodeArray):Void {
#if hl
	flight._hl._fn.Selection.findNodesInLassoSelection(out, selection, candidates);
#elseif cpp
	flight._cpp._fn.Selection.findNodesInLassoSelection(out, selection, candidates);
#elseif (js && flight_esm)
	flight._js._fn.Selection.findNodesInLassoSelection(out, selection, candidates);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createMarqueeSelection():MarqueeSelection {
	return flight._js._fn.Selection.createMarqueeSelection();
}
#else
extern inline function createMarqueeSelection():MarqueeSelection {
#if hl
	return flight._hl._fn.Selection.createMarqueeSelection();
#elseif cpp
	return flight._cpp._fn.Selection.createMarqueeSelection();
#elseif (js && flight_esm)
	return flight._js._fn.Selection.createMarqueeSelection();
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function beginMarqueeSelection(selection:MarqueeSelection, startX:Float, startY:Float):Void {
	flight._js._fn.Selection.beginMarqueeSelection(selection, startX, startY);
}
#else
extern inline function beginMarqueeSelection(selection:MarqueeSelection, startX:Float, startY:Float):Void {
#if hl
	flight._hl._fn.Selection.beginMarqueeSelection(selection, startX, startY);
#elseif cpp
	flight._cpp._fn.Selection.beginMarqueeSelection(selection, startX, startY);
#elseif (js && flight_esm)
	flight._js._fn.Selection.beginMarqueeSelection(selection, startX, startY);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function endMarqueeSelection(selection:MarqueeSelection):Rectangle {
	return flight._js._fn.Selection.endMarqueeSelection(selection);
}
#else
extern inline function endMarqueeSelection(selection:MarqueeSelection):Rectangle {
#if hl
	return flight._hl._fn.Selection.endMarqueeSelection(selection);
#elseif cpp
	return flight._cpp._fn.Selection.endMarqueeSelection(selection);
#elseif (js && flight_esm)
	return flight._js._fn.Selection.endMarqueeSelection(selection);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getMarqueeRectangle(selection:MarqueeSelection):Rectangle {
	return flight._js._fn.Selection.getMarqueeRectangle(selection);
}
#else
extern inline function getMarqueeRectangle(selection:MarqueeSelection):Rectangle {
#if hl
	return flight._hl._fn.Selection.getMarqueeRectangle(selection);
#elseif cpp
	return flight._cpp._fn.Selection.getMarqueeRectangle(selection);
#elseif (js && flight_esm)
	return flight._js._fn.Selection.getMarqueeRectangle(selection);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateMarqueeSelection(selection:MarqueeSelection, currentX:Float, currentY:Float):Void {
	flight._js._fn.Selection.updateMarqueeSelection(selection, currentX, currentY);
}
#else
extern inline function updateMarqueeSelection(selection:MarqueeSelection, currentX:Float, currentY:Float):Void {
#if hl
	flight._hl._fn.Selection.updateMarqueeSelection(selection, currentX, currentY);
#elseif cpp
	flight._cpp._fn.Selection.updateMarqueeSelection(selection, currentX, currentY);
#elseif (js && flight_esm)
	flight._js._fn.Selection.updateMarqueeSelection(selection, currentX, currentY);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSelectionState():SelectionState {
	return flight._js._fn.Selection.createSelectionState();
}
#else
extern inline function createSelectionState():SelectionState {
#if hl
	return flight._hl._fn.Selection.createSelectionState();
#elseif cpp
	return flight._cpp._fn.Selection.createSelectionState();
#elseif (js && flight_esm)
	return flight._js._fn.Selection.createSelectionState();
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addNodeToSelection(state:SelectionState, node:Dynamic):Void {
	flight._js._fn.Selection.addNodeToSelection(state, node);
}
#else
extern inline function addNodeToSelection(state:SelectionState, node:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Selection.addNodeToSelection(state, node);
#elseif cpp
	flight._cpp._fn.Selection.addNodeToSelection(state, node);
#elseif (js && flight_esm)
	flight._js._fn.Selection.addNodeToSelection(state, node);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearSelection(state:SelectionState):Void {
	flight._js._fn.Selection.clearSelection(state);
}
#else
extern inline function clearSelection(state:SelectionState):Void {
#if hl
	flight._hl._fn.Selection.clearSelection(state);
#elseif cpp
	flight._cpp._fn.Selection.clearSelection(state);
#elseif (js && flight_esm)
	flight._js._fn.Selection.clearSelection(state);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getActiveNode(state:SelectionState):Null<Dynamic> {
	return flight._js._fn.Selection.getActiveNode(state);
}
#else
extern inline function getActiveNode(state:SelectionState):Null<flight.FlightNode> {
#if hl
	return flight._hl._fn.Selection.getActiveNode(state);
#elseif cpp
	return flight._cpp._fn.Selection.getActiveNode(state);
#elseif (js && flight_esm)
	return flight._js._fn.Selection.getActiveNode(state);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSelectedNodes(out:Dynamic, state:SelectionState):Void {
	flight._js._fn.Selection.getSelectedNodes(out, state);
}
#else
extern inline function getSelectedNodes(out:flight.FlightNodeArray, state:SelectionState):Void {
#if hl
	flight._hl._fn.Selection.getSelectedNodes(out, state);
#elseif cpp
	flight._cpp._fn.Selection.getSelectedNodes(out, state);
#elseif (js && flight_esm)
	flight._js._fn.Selection.getSelectedNodes(out, state);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSelectionCount(state:SelectionState):Int {
	return flight._js._fn.Selection.getSelectionCount(state);
}
#else
extern inline function getSelectionCount(state:SelectionState):Int {
#if hl
	return flight._hl._fn.Selection.getSelectionCount(state);
#elseif cpp
	return flight._cpp._fn.Selection.getSelectionCount(state);
#elseif (js && flight_esm)
	return flight._js._fn.Selection.getSelectionCount(state);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getSelectionSignals(state:SelectionState):SelectionSignals {
	return flight._js._fn.Selection.getSelectionSignals(state);
}
#else
extern inline function getSelectionSignals(state:SelectionState):SelectionSignals {
#if hl
	return flight._hl._fn.Selection.getSelectionSignals(state);
#elseif cpp
	return flight._cpp._fn.Selection.getSelectionSignals(state);
#elseif (js && flight_esm)
	return flight._js._fn.Selection.getSelectionSignals(state);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hasSelection(state:SelectionState):Bool {
	return flight._js._fn.Selection.hasSelection(state);
}
#else
extern inline function hasSelection(state:SelectionState):Bool {
#if hl
	return flight._hl._fn.Selection.hasSelection(state);
#elseif cpp
	return flight._cpp._fn.Selection.hasSelection(state);
#elseif (js && flight_esm)
	return flight._js._fn.Selection.hasSelection(state);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isNodeSelected(state:SelectionState, node:Dynamic):Bool {
	return flight._js._fn.Selection.isNodeSelected(state, node);
}
#else
extern inline function isNodeSelected(state:SelectionState, node:flight.FlightNode):Bool {
#if hl
	return flight._hl._fn.Selection.isNodeSelected(state, node);
#elseif cpp
	return flight._cpp._fn.Selection.isNodeSelected(state, node);
#elseif (js && flight_esm)
	return flight._js._fn.Selection.isNodeSelected(state, node);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function removeNodeFromSelection(state:SelectionState, node:Dynamic):Void {
	flight._js._fn.Selection.removeNodeFromSelection(state, node);
}
#else
extern inline function removeNodeFromSelection(state:SelectionState, node:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Selection.removeNodeFromSelection(state, node);
#elseif cpp
	flight._cpp._fn.Selection.removeNodeFromSelection(state, node);
#elseif (js && flight_esm)
	flight._js._fn.Selection.removeNodeFromSelection(state, node);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function selectAllNodes(state:SelectionState, candidates:Dynamic):Void {
	flight._js._fn.Selection.selectAllNodes(state, candidates);
}
#else
extern inline function selectAllNodes(state:SelectionState, candidates:flight.FlightNodeArray):Void {
#if hl
	flight._hl._fn.Selection.selectAllNodes(state, candidates);
#elseif cpp
	flight._cpp._fn.Selection.selectAllNodes(state, candidates);
#elseif (js && flight_esm)
	flight._js._fn.Selection.selectAllNodes(state, candidates);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function selectNode(state:SelectionState, node:Dynamic):Void {
	flight._js._fn.Selection.selectNode(state, node);
}
#else
extern inline function selectNode(state:SelectionState, node:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Selection.selectNode(state, node);
#elseif cpp
	flight._cpp._fn.Selection.selectNode(state, node);
#elseif (js && flight_esm)
	flight._js._fn.Selection.selectNode(state, node);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function toggleNodeSelection(state:SelectionState, node:Dynamic):Void {
	flight._js._fn.Selection.toggleNodeSelection(state, node);
}
#else
extern inline function toggleNodeSelection(state:SelectionState, node:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Selection.toggleNodeSelection(state, node);
#elseif cpp
	flight._cpp._fn.Selection.toggleNodeSelection(state, node);
#elseif (js && flight_esm)
	flight._js._fn.Selection.toggleNodeSelection(state, node);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyPointerSelectionPolicy(state:SelectionState, hit:Null<Dynamic>, modifiers:SelectionModifierState):Void {
	flight._js._fn.Selection.applyPointerSelectionPolicy(state, hit, modifiers);
}
#else
extern inline function applyPointerSelectionPolicy(state:SelectionState, hit:Null<flight.FlightNode>, modifiers:SelectionModifierState):Void {
#if hl
	flight._hl._fn.Selection.applyPointerSelectionPolicy(state, hit, modifiers);
#elseif cpp
	flight._cpp._fn.Selection.applyPointerSelectionPolicy(state, hit, modifiers);
#elseif (js && flight_esm)
	flight._js._fn.Selection.applyPointerSelectionPolicy(state, hit, modifiers);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyPointerUpSelectionPolicy(state:SelectionState, hit:Null<Dynamic>, modifiers:SelectionModifierState, didDrag:Bool):Void {
	flight._js._fn.Selection.applyPointerUpSelectionPolicy(state, hit, modifiers, didDrag);
}
#else
extern inline function applyPointerUpSelectionPolicy(state:SelectionState, hit:Null<flight.FlightNode>, modifiers:SelectionModifierState, didDrag:Bool):Void {
#if hl
	flight._hl._fn.Selection.applyPointerUpSelectionPolicy(state, hit, modifiers, didDrag);
#elseif cpp
	flight._cpp._fn.Selection.applyPointerUpSelectionPolicy(state, hit, modifiers, didDrag);
#elseif (js && flight_esm)
	flight._js._fn.Selection.applyPointerUpSelectionPolicy(state, hit, modifiers, didDrag);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeLassoSelection(ptr:LassoSelection):Void {
	flight._js._fn.Selection.freeLassoSelection(ptr);
}
#else
extern inline function freeLassoSelection(ptr:LassoSelection):Void {
#if hl
	flight._hl._fn.Selection.freeLassoSelection(ptr);
#elseif cpp
	flight._cpp._fn.Selection.freeLassoSelection(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Selection.freeLassoSelection(ptr);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMarqueeSelection(ptr:MarqueeSelection):Void {
	flight._js._fn.Selection.freeMarqueeSelection(ptr);
}
#else
extern inline function freeMarqueeSelection(ptr:MarqueeSelection):Void {
#if hl
	flight._hl._fn.Selection.freeMarqueeSelection(ptr);
#elseif cpp
	flight._cpp._fn.Selection.freeMarqueeSelection(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Selection.freeMarqueeSelection(ptr);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSelectionState(ptr:SelectionState):Void {
	flight._js._fn.Selection.freeSelectionState(ptr);
}
#else
extern inline function freeSelectionState(ptr:SelectionState):Void {
#if hl
	flight._hl._fn.Selection.freeSelectionState(ptr);
#elseif cpp
	flight._cpp._fn.Selection.freeSelectionState(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Selection.freeSelectionState(ptr);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSelectionSignals(ptr:SelectionSignals):Void {
	flight._js._fn.Selection.freeSelectionSignals(ptr);
}
#else
extern inline function freeSelectionSignals(ptr:SelectionSignals):Void {
#if hl
	flight._hl._fn.Selection.freeSelectionSignals(ptr);
#elseif cpp
	flight._cpp._fn.Selection.freeSelectionSignals(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Selection.freeSelectionSignals(ptr);
#else
	#error "flight.Selection: no backend for this target."
#end
}
#end
