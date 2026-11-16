package flight;

extern inline function computeNodeRootLocalBoundsRectangle(out:Rectangle, root:Dynamic):Void {
#if hl
	flight._hl._fn.Node.computeNodeRootLocalBoundsRectangle(out, root);
#elseif cpp
	flight._cpp._fn.Node.computeNodeRootLocalBoundsRectangle(out, root);
#elseif (js && flight_esm)
	flight._js._fn.Node.computeNodeRootLocalBoundsRectangle(out, root);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function ensureNodeLocalBoundsRectangle(target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.ensureNodeLocalBoundsRectangle(target);
#elseif cpp
	flight._cpp._fn.Node.ensureNodeLocalBoundsRectangle(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.ensureNodeLocalBoundsRectangle(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function ensureNodeParentBoundsRectangle(target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.ensureNodeParentBoundsRectangle(target);
#elseif cpp
	flight._cpp._fn.Node.ensureNodeParentBoundsRectangle(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.ensureNodeParentBoundsRectangle(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function ensureNodeWorldBoundsRectangle(target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.ensureNodeWorldBoundsRectangle(target);
#elseif cpp
	flight._cpp._fn.Node.ensureNodeWorldBoundsRectangle(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.ensureNodeWorldBoundsRectangle(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeHeight(source:Dynamic):Float {
#if hl
	return flight._hl._fn.Node.getNodeHeight(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeHeight(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeHeight(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeLocalBoundsRectangle(target:Dynamic):Rectangle {
#if hl
	return flight._hl._fn.Node.getNodeLocalBoundsRectangle(target);
#elseif cpp
	return flight._cpp._fn.Node.getNodeLocalBoundsRectangle(target);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeLocalBoundsRectangle(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeParentBoundsRectangle(target:Dynamic):Rectangle {
#if hl
	return flight._hl._fn.Node.getNodeParentBoundsRectangle(target);
#elseif cpp
	return flight._cpp._fn.Node.getNodeParentBoundsRectangle(target);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeParentBoundsRectangle(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeWidth(source:Dynamic):Float {
#if hl
	return flight._hl._fn.Node.getNodeWidth(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeWidth(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeWidth(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeWorldBoundsRectangle(target:Dynamic):Rectangle {
#if hl
	return flight._hl._fn.Node.getNodeWorldBoundsRectangle(target);
#elseif cpp
	return flight._cpp._fn.Node.getNodeWorldBoundsRectangle(target);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeWorldBoundsRectangle(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function setNodeHeight(target:Dynamic, value:Float):Void {
#if hl
	flight._hl._fn.Node.setNodeHeight(target, value);
#elseif cpp
	flight._cpp._fn.Node.setNodeHeight(target, value);
#elseif (js && flight_esm)
	flight._js._fn.Node.setNodeHeight(target, value);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function setNodeWidth(target:Dynamic, value:Float):Void {
#if hl
	flight._hl._fn.Node.setNodeWidth(target, value);
#elseif cpp
	flight._cpp._fn.Node.setNodeWidth(target, value);
#elseif (js && flight_esm)
	flight._js._fn.Node.setNodeWidth(target, value);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function areNodeGuardsEnabled(guards:NodeGuardState):Bool {
#if hl
	return flight._hl._fn.Node.areNodeGuardsEnabled(guards);
#elseif cpp
	return flight._cpp._fn.Node.areNodeGuardsEnabled(guards);
#elseif (js && flight_esm)
	return flight._js._fn.Node.areNodeGuardsEnabled(guards);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function disableNodeGuards(guards:NodeGuardState):Void {
#if hl
	flight._hl._fn.Node.disableNodeGuards(guards);
#elseif cpp
	flight._cpp._fn.Node.disableNodeGuards(guards);
#elseif (js && flight_esm)
	flight._js._fn.Node.disableNodeGuards(guards);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function enableNodeGuards(guards:NodeGuardState, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Node.enableNodeGuards(guards, logState, clockFn, clockCtx);
#elseif cpp
	flight._cpp._fn.Node.enableNodeGuards(guards, logState, clockFn, clockCtx);
#elseif (js && flight_esm)
	flight._js._fn.Node.enableNodeGuards(guards, logState, clockFn, clockCtx);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function initAppearanceRuntimeTrait(target:HasAppearanceRuntime):Void {
#if hl
	flight._hl._fn.Node.initAppearanceRuntimeTrait(target);
#elseif cpp
	flight._cpp._fn.Node.initAppearanceRuntimeTrait(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.initAppearanceRuntimeTrait(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function initAppearanceTrait(target:HasAppearance, obj:HasAppearanceOptions):Void {
#if hl
	flight._hl._fn.Node.initAppearanceTrait(target, obj);
#elseif cpp
	flight._cpp._fn.Node.initAppearanceTrait(target, obj);
#elseif (js && flight_esm)
	flight._js._fn.Node.initAppearanceTrait(target, obj);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function initBlendModeTrait(target:HasBlendMode, obj:HasBlendModeOptions):Void {
#if hl
	flight._hl._fn.Node.initBlendModeTrait(target, obj);
#elseif cpp
	flight._cpp._fn.Node.initBlendModeTrait(target, obj);
#elseif (js && flight_esm)
	flight._js._fn.Node.initBlendModeTrait(target, obj);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function defaultComputeLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
#if hl
	flight._hl._fn.Node.defaultComputeLocalBoundsRectangle(out, source);
#elseif cpp
	flight._cpp._fn.Node.defaultComputeLocalBoundsRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Node.defaultComputeLocalBoundsRectangle(out, source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function initBoundsRectangleTrait(target:HasBoundsRectangle, obj:HasBoundsRectangleOptions):Void {
#if hl
	flight._hl._fn.Node.initBoundsRectangleTrait(target, obj);
#elseif cpp
	flight._cpp._fn.Node.initBoundsRectangleTrait(target, obj);
#elseif (js && flight_esm)
	flight._js._fn.Node.initBoundsRectangleTrait(target, obj);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function initClipTrait(target:HasClip, obj:HasClipOptions):Void {
#if hl
	flight._hl._fn.Node.initClipTrait(target, obj);
#elseif cpp
	flight._cpp._fn.Node.initClipTrait(target, obj);
#elseif (js && flight_esm)
	flight._js._fn.Node.initClipTrait(target, obj);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function initMaterialTrait(target:HasMaterial, obj:HasMaterialOptions):Void {
#if hl
	flight._hl._fn.Node.initMaterialTrait(target, obj);
#elseif cpp
	flight._cpp._fn.Node.initMaterialTrait(target, obj);
#elseif (js && flight_esm)
	flight._js._fn.Node.initMaterialTrait(target, obj);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function initTransform2dTrait(target:HasTransform2D, obj:HasTransform2DOptions):Void {
#if hl
	flight._hl._fn.Node.initTransform2dTrait(target, obj);
#elseif cpp
	flight._cpp._fn.Node.initTransform2dTrait(target, obj);
#elseif (js && flight_esm)
	flight._js._fn.Node.initTransform2dTrait(target, obj);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function initTransform3dRuntimeTrait(target:HasTransform3DRuntime):Void {
#if hl
	flight._hl._fn.Node.initTransform3dRuntimeTrait(target);
#elseif cpp
	flight._cpp._fn.Node.initTransform3dRuntimeTrait(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.initTransform3dRuntimeTrait(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function initTransform3dTrait(target:HasTransform3D, obj:HasTransform3DOptions):Void {
#if hl
	flight._hl._fn.Node.initTransform3dTrait(target, obj);
#elseif cpp
	flight._cpp._fn.Node.initTransform3dTrait(target, obj);
#elseif (js && flight_esm)
	flight._js._fn.Node.initTransform3dTrait(target, obj);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function addNodeChild(target:Dynamic, child:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Node.addNodeChild(target, child);
#elseif cpp
	return flight._cpp._fn.Node.addNodeChild(target, child);
#elseif (js && flight_esm)
	return flight._js._fn.Node.addNodeChild(target, child);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function addNodeChildAt(target:Dynamic, child:Dynamic, index:Int):Dynamic {
#if hl
	return flight._hl._fn.Node.addNodeChildAt(target, child, index);
#elseif cpp
	return flight._cpp._fn.Node.addNodeChildAt(target, child, index);
#elseif (js && flight_esm)
	return flight._js._fn.Node.addNodeChildAt(target, child, index);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function addNodeChildren(target:Dynamic, children:Dynamic, childrenLen:Int):Void {
#if hl
	flight._hl._fn.Node.addNodeChildren(target, children, childrenLen);
#elseif cpp
	flight._cpp._fn.Node.addNodeChildren(target, children, childrenLen);
#elseif (js && flight_esm)
	flight._js._fn.Node.addNodeChildren(target, children, childrenLen);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function containsNodeChild(source:Dynamic, child:Dynamic):Bool {
#if hl
	return flight._hl._fn.Node.containsNodeChild(source, child);
#elseif cpp
	return flight._cpp._fn.Node.containsNodeChild(source, child);
#elseif (js && flight_esm)
	return flight._js._fn.Node.containsNodeChild(source, child);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function forEachNodeChild(source:Dynamic, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void {
#if hl
	flight._hl._fn.Node.forEachNodeChild(source, callback_Fn, callback_Ctx);
#elseif cpp
	flight._cpp._fn.Node.forEachNodeChild(source, callback_Fn, callback_Ctx);
#elseif (js && flight_esm)
	flight._js._fn.Node.forEachNodeChild(source, callback_Fn, callback_Ctx);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeAncestors(out:Dynamic, source:Dynamic):Void {
#if hl
	flight._hl._fn.Node.getNodeAncestors(out, source);
#elseif cpp
	flight._cpp._fn.Node.getNodeAncestors(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Node.getNodeAncestors(out, source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeChildAt(source:Dynamic, index:Int):Dynamic {
#if hl
	return flight._hl._fn.Node.getNodeChildAt(source, index);
#elseif cpp
	return flight._cpp._fn.Node.getNodeChildAt(source, index);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeChildAt(source, index);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeChildByName(source:Dynamic, name:String):Dynamic {
#if hl
	return flight._hl._fn.Node.getNodeChildByName(source, cast name);
#elseif cpp
	return flight._cpp._fn.Node.getNodeChildByName(source, cast name);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeChildByName(source, name);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeChildCount(source:Dynamic):Int {
#if hl
	return flight._hl._fn.Node.getNodeChildCount(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeChildCount(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeChildCount(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeChildIndex(source:Dynamic, child:Dynamic):Int {
#if hl
	return flight._hl._fn.Node.getNodeChildIndex(source, child);
#elseif cpp
	return flight._cpp._fn.Node.getNodeChildIndex(source, child);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeChildIndex(source, child);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeCommonAncestor(a:Dynamic, b:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Node.getNodeCommonAncestor(a, b);
#elseif cpp
	return flight._cpp._fn.Node.getNodeCommonAncestor(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeCommonAncestor(a, b);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeParent(source:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Node.getNodeParent(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeParent(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeParent(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeRoot(source:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Node.getNodeRoot(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeRoot(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeRoot(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function isNodeAncestorOf(ancestor:Dynamic, descendant:Dynamic):Bool {
#if hl
	return flight._hl._fn.Node.isNodeAncestorOf(ancestor, descendant);
#elseif cpp
	return flight._cpp._fn.Node.isNodeAncestorOf(ancestor, descendant);
#elseif (js && flight_esm)
	return flight._js._fn.Node.isNodeAncestorOf(ancestor, descendant);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function removeNodeChild(target:Dynamic, child:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Node.removeNodeChild(target, child);
#elseif cpp
	return flight._cpp._fn.Node.removeNodeChild(target, child);
#elseif (js && flight_esm)
	return flight._js._fn.Node.removeNodeChild(target, child);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function removeNodeChildAt(target:Dynamic, index:Int):Dynamic {
#if hl
	return flight._hl._fn.Node.removeNodeChildAt(target, index);
#elseif cpp
	return flight._cpp._fn.Node.removeNodeChildAt(target, index);
#elseif (js && flight_esm)
	return flight._js._fn.Node.removeNodeChildAt(target, index);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function removeNodeChildren(target:Dynamic, beginIndex:Int, endIndex:Int):Void {
#if hl
	flight._hl._fn.Node.removeNodeChildren(target, beginIndex, endIndex);
#elseif cpp
	flight._cpp._fn.Node.removeNodeChildren(target, beginIndex, endIndex);
#elseif (js && flight_esm)
	flight._js._fn.Node.removeNodeChildren(target, beginIndex, endIndex);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function reparentNode(child:Dynamic, newParent:Dynamic, guards:NodeGuardState):Bool {
#if hl
	return flight._hl._fn.Node.reparentNode(child, newParent, guards);
#elseif cpp
	return flight._cpp._fn.Node.reparentNode(child, newParent, guards);
#elseif (js && flight_esm)
	return flight._js._fn.Node.reparentNode(child, newParent, guards);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function replaceNodeChild(target:Dynamic, oldChild:Dynamic, newChild:Dynamic):Void {
#if hl
	flight._hl._fn.Node.replaceNodeChild(target, oldChild, newChild);
#elseif cpp
	flight._cpp._fn.Node.replaceNodeChild(target, oldChild, newChild);
#elseif (js && flight_esm)
	flight._js._fn.Node.replaceNodeChild(target, oldChild, newChild);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function setNodeChildIndex(target:Dynamic, child:Dynamic, index:Int):Void {
#if hl
	flight._hl._fn.Node.setNodeChildIndex(target, child, index);
#elseif cpp
	flight._cpp._fn.Node.setNodeChildIndex(target, child, index);
#elseif (js && flight_esm)
	flight._js._fn.Node.setNodeChildIndex(target, child, index);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function swapNodeChildren(target:Dynamic, child1:Dynamic, child2:Dynamic):Void {
#if hl
	flight._hl._fn.Node.swapNodeChildren(target, child1, child2);
#elseif cpp
	flight._cpp._fn.Node.swapNodeChildren(target, child1, child2);
#elseif (js && flight_esm)
	flight._js._fn.Node.swapNodeChildren(target, child1, child2);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function swapNodeChildrenAt(target:Dynamic, index1:Int, index2:Int):Void {
#if hl
	flight._hl._fn.Node.swapNodeChildrenAt(target, index1, index2);
#elseif cpp
	flight._cpp._fn.Node.swapNodeChildrenAt(target, index1, index2);
#elseif (js && flight_esm)
	flight._js._fn.Node.swapNodeChildrenAt(target, index1, index2);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function createNodeRuntime(methods:NodeRuntimeMethods):NodeRuntime {
#if hl
	return flight._hl._fn.Node.createNodeRuntime(methods);
#elseif cpp
	return flight._cpp._fn.Node.createNodeRuntime(methods);
#elseif (js && flight_esm)
	return flight._js._fn.Node.createNodeRuntime(methods);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function createNodeSignals():Dynamic {
#if hl
	return flight._hl._fn.Node.createNodeSignals();
#elseif cpp
	return flight._cpp._fn.Node.createNodeSignals();
#elseif (js && flight_esm)
	return flight._js._fn.Node.createNodeSignals();
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function defaultNodeRuntimeCanAddChild(target:Dynamic, child:Dynamic):Bool {
#if hl
	return flight._hl._fn.Node.defaultNodeRuntimeCanAddChild(target, child);
#elseif cpp
	return flight._cpp._fn.Node.defaultNodeRuntimeCanAddChild(target, child);
#elseif (js && flight_esm)
	return flight._js._fn.Node.defaultNodeRuntimeCanAddChild(target, child);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function disposeNode(target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.disposeNode(target);
#elseif cpp
	flight._cpp._fn.Node.disposeNode(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.disposeNode(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function enableNodeSignals(source:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Node.enableNodeSignals(source);
#elseif cpp
	return flight._cpp._fn.Node.enableNodeSignals(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.enableNodeSignals(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeRuntime(source:Dynamic):NodeRuntime {
#if hl
	return flight._hl._fn.Node.getNodeRuntime(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeRuntime(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeRuntime(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeSignals(source:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Node.getNodeSignals(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeSignals(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeSignals(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function setNodeEnabled(target:Dynamic, value:Bool):Void {
#if hl
	flight._hl._fn.Node.setNodeEnabled(target, value);
#elseif cpp
	flight._cpp._fn.Node.setNodeEnabled(target, value);
#elseif (js && flight_esm)
	flight._js._fn.Node.setNodeEnabled(target, value);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function setNodeColorAdjustmentsTint(source:Dynamic, tint:Int):Void {
#if hl
	flight._hl._fn.Node.setNodeColorAdjustmentsTint(source, tint);
#elseif cpp
	flight._cpp._fn.Node.setNodeColorAdjustmentsTint(source, tint);
#elseif (js && flight_esm)
	flight._js._fn.Node.setNodeColorAdjustmentsTint(source, tint);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function createNodeOrderList():NodeOrderList {
#if hl
	return flight._hl._fn.Node.createNodeOrderList();
#elseif cpp
	return flight._cpp._fn.Node.createNodeOrderList();
#elseif (js && flight_esm)
	return flight._js._fn.Node.createNodeOrderList();
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function addNodeOrderListEntry(list:NodeOrderList, node:Dynamic, sortKey:Float):Void {
#if hl
	flight._hl._fn.Node.addNodeOrderListEntry(list, node, sortKey);
#elseif cpp
	flight._cpp._fn.Node.addNodeOrderListEntry(list, node, sortKey);
#elseif (js && flight_esm)
	flight._js._fn.Node.addNodeOrderListEntry(list, node, sortKey);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function applyNodeOrderList(target:Dynamic, list:NodeOrderList):Void {
#if hl
	flight._hl._fn.Node.applyNodeOrderList(target, list);
#elseif cpp
	flight._cpp._fn.Node.applyNodeOrderList(target, list);
#elseif (js && flight_esm)
	flight._js._fn.Node.applyNodeOrderList(target, list);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function clearNodeOrderList(list:NodeOrderList):Void {
#if hl
	flight._hl._fn.Node.clearNodeOrderList(list);
#elseif cpp
	flight._cpp._fn.Node.clearNodeOrderList(list);
#elseif (js && flight_esm)
	flight._js._fn.Node.clearNodeOrderList(list);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function disposeNodeOrderList(list:NodeOrderList):Void {
#if hl
	flight._hl._fn.Node.disposeNodeOrderList(list);
#elseif cpp
	flight._cpp._fn.Node.disposeNodeOrderList(list);
#elseif (js && flight_esm)
	flight._js._fn.Node.disposeNodeOrderList(list);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function forEachNodeOrderListEntry(list:NodeOrderList, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void {
#if hl
	flight._hl._fn.Node.forEachNodeOrderListEntry(list, callback_Fn, callback_Ctx);
#elseif cpp
	flight._cpp._fn.Node.forEachNodeOrderListEntry(list, callback_Fn, callback_Ctx);
#elseif (js && flight_esm)
	flight._js._fn.Node.forEachNodeOrderListEntry(list, callback_Fn, callback_Ctx);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeOrderListEntrySortKey(list:NodeOrderList, node:Dynamic):Float {
#if hl
	return flight._hl._fn.Node.getNodeOrderListEntrySortKey(list, node);
#elseif cpp
	return flight._cpp._fn.Node.getNodeOrderListEntrySortKey(list, node);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeOrderListEntrySortKey(list, node);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function hasNodeOrderListEntry(list:NodeOrderList, node:Dynamic):Bool {
#if hl
	return flight._hl._fn.Node.hasNodeOrderListEntry(list, node);
#elseif cpp
	return flight._cpp._fn.Node.hasNodeOrderListEntry(list, node);
#elseif (js && flight_esm)
	return flight._js._fn.Node.hasNodeOrderListEntry(list, node);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function removeNodeOrderListEntry(list:NodeOrderList, node:Dynamic):Bool {
#if hl
	return flight._hl._fn.Node.removeNodeOrderListEntry(list, node);
#elseif cpp
	return flight._cpp._fn.Node.removeNodeOrderListEntry(list, node);
#elseif (js && flight_esm)
	return flight._js._fn.Node.removeNodeOrderListEntry(list, node);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function setNodeOrderListEntry(list:NodeOrderList, node:Dynamic, sortKey:Float):Void {
#if hl
	flight._hl._fn.Node.setNodeOrderListEntry(list, node, sortKey);
#elseif cpp
	flight._cpp._fn.Node.setNodeOrderListEntry(list, node, sortKey);
#elseif (js && flight_esm)
	flight._js._fn.Node.setNodeOrderListEntry(list, node, sortKey);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function setNodeOrderListEntryAbove(list:NodeOrderList, node:Dynamic, target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.setNodeOrderListEntryAbove(list, node, target);
#elseif cpp
	flight._cpp._fn.Node.setNodeOrderListEntryAbove(list, node, target);
#elseif (js && flight_esm)
	flight._js._fn.Node.setNodeOrderListEntryAbove(list, node, target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function setNodeOrderListEntryBelow(list:NodeOrderList, node:Dynamic, target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.setNodeOrderListEntryBelow(list, node, target);
#elseif cpp
	flight._cpp._fn.Node.setNodeOrderListEntryBelow(list, node, target);
#elseif (js && flight_esm)
	flight._js._fn.Node.setNodeOrderListEntryBelow(list, node, target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function setNodeOrderListFromNodeChildren(list:NodeOrderList, source:Dynamic):Void {
#if hl
	flight._hl._fn.Node.setNodeOrderListFromNodeChildren(list, source);
#elseif cpp
	flight._cpp._fn.Node.setNodeOrderListFromNodeChildren(list, source);
#elseif (js && flight_esm)
	flight._js._fn.Node.setNodeOrderListFromNodeChildren(list, source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function swapNodeOrderListEntries(list:NodeOrderList, nodeA:Dynamic, nodeB:Dynamic):Void {
#if hl
	flight._hl._fn.Node.swapNodeOrderListEntries(list, nodeA, nodeB);
#elseif cpp
	flight._cpp._fn.Node.swapNodeOrderListEntries(list, nodeA, nodeB);
#elseif (js && flight_esm)
	flight._js._fn.Node.swapNodeOrderListEntries(list, nodeA, nodeB);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeLocalMatrix(target:Dynamic):Matrix {
#if hl
	return flight._hl._fn.Node.getNodeLocalMatrix(target);
#elseif cpp
	return flight._cpp._fn.Node.getNodeLocalMatrix(target);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeLocalMatrix(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeTransform2d(out:Transform2D, source:Dynamic):Void {
#if hl
	flight._hl._fn.Node.getNodeTransform2d(out, source);
#elseif cpp
	flight._cpp._fn.Node.getNodeTransform2d(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Node.getNodeTransform2d(out, source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeWorldMatrix(target:Dynamic):Matrix {
#if hl
	return flight._hl._fn.Node.getNodeWorldMatrix(target);
#elseif cpp
	return flight._cpp._fn.Node.getNodeWorldMatrix(target);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeWorldMatrix(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function setNodeLocalMatrix(target:Dynamic, source:Matrix):Void {
#if hl
	flight._hl._fn.Node.setNodeLocalMatrix(target, source);
#elseif cpp
	flight._cpp._fn.Node.setNodeLocalMatrix(target, source);
#elseif (js && flight_esm)
	flight._js._fn.Node.setNodeLocalMatrix(target, source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function setNodeTransform2d(target:Dynamic, source:Transform2D):Void {
#if hl
	flight._hl._fn.Node.setNodeTransform2d(target, source);
#elseif cpp
	flight._cpp._fn.Node.setNodeTransform2d(target, source);
#elseif (js && flight_esm)
	flight._js._fn.Node.setNodeTransform2d(target, source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function computeNodeWorldTransformRevision(target:Dynamic, parentWorldTransformId:haxe.Int64, root:NodeRuntime):Void {
#if hl
	flight._hl._fn.Node.computeNodeWorldTransformRevision(target, parentWorldTransformId, root);
#elseif cpp
	flight._cpp._fn.Node.computeNodeWorldTransformRevision(target, parentWorldTransformId, root);
#elseif (js && flight_esm)
	flight._js._fn.Node.computeNodeWorldTransformRevision(target, parentWorldTransformId, root);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeAppearanceRevision(source:Dynamic):Int {
#if hl
	return flight._hl._fn.Node.getNodeAppearanceRevision(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeAppearanceRevision(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeAppearanceRevision(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeChildrenRevision(source:Dynamic):Int {
#if hl
	return flight._hl._fn.Node.getNodeChildrenRevision(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeChildrenRevision(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeChildrenRevision(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeLocalBoundsRevision(source:Dynamic):Int {
#if hl
	return flight._hl._fn.Node.getNodeLocalBoundsRevision(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeLocalBoundsRevision(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeLocalBoundsRevision(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeLocalContentRevision(source:Dynamic):Int {
#if hl
	return flight._hl._fn.Node.getNodeLocalContentRevision(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeLocalContentRevision(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeLocalContentRevision(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeLocalTransformRevision(source:Dynamic):Int {
#if hl
	return flight._hl._fn.Node.getNodeLocalTransformRevision(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeLocalTransformRevision(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeLocalTransformRevision(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeParentReferenceRevision(source:Dynamic):Int {
#if hl
	return flight._hl._fn.Node.getNodeParentReferenceRevision(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeParentReferenceRevision(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeParentReferenceRevision(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeWorldTransformRevision(source:Dynamic):Int {
#if hl
	return flight._hl._fn.Node.getNodeWorldTransformRevision(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeWorldTransformRevision(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeWorldTransformRevision(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function invalidateContent(target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.invalidateContent(target);
#elseif cpp
	flight._cpp._fn.Node.invalidateContent(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.invalidateContent(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function invalidateNode(target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.invalidateNode(target);
#elseif cpp
	flight._cpp._fn.Node.invalidateNode(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.invalidateNode(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function invalidateNodeAppearance(target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.invalidateNodeAppearance(target);
#elseif cpp
	flight._cpp._fn.Node.invalidateNodeAppearance(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.invalidateNodeAppearance(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function invalidateNodeLocalBounds(target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.invalidateNodeLocalBounds(target);
#elseif cpp
	flight._cpp._fn.Node.invalidateNodeLocalBounds(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.invalidateNodeLocalBounds(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function invalidateNodeLocalContent(target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.invalidateNodeLocalContent(target);
#elseif cpp
	flight._cpp._fn.Node.invalidateNodeLocalContent(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.invalidateNodeLocalContent(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function invalidateNodeLocalTransform(target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.invalidateNodeLocalTransform(target);
#elseif cpp
	flight._cpp._fn.Node.invalidateNodeLocalTransform(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.invalidateNodeLocalTransform(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function invalidateNodeParentReference(target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.invalidateNodeParentReference(target);
#elseif cpp
	flight._cpp._fn.Node.invalidateNodeParentReference(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.invalidateNodeParentReference(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function invalidateNodeRender(target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.invalidateNodeRender(target);
#elseif cpp
	flight._cpp._fn.Node.invalidateNodeRender(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.invalidateNodeRender(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function invalidateNodeWorldBounds(target:Dynamic):Void {
#if hl
	flight._hl._fn.Node.invalidateNodeWorldBounds(target);
#elseif cpp
	flight._cpp._fn.Node.invalidateNodeWorldBounds(target);
#elseif (js && flight_esm)
	flight._js._fn.Node.invalidateNodeWorldBounds(target);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function computeScene2dFitAlignX(scaledContentWidth:Float, viewWidth:Float, align:ViewportAlign):Float {
#if hl
	return flight._hl._fn.Node.computeScene2dFitAlignX(scaledContentWidth, viewWidth, align);
#elseif cpp
	return flight._cpp._fn.Node.computeScene2dFitAlignX(scaledContentWidth, viewWidth, align);
#elseif (js && flight_esm)
	return flight._js._fn.Node.computeScene2dFitAlignX(scaledContentWidth, viewWidth, align);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function computeScene2dFitAlignY(scaledContentHeight:Float, viewHeight:Float, align:ViewportAlign):Float {
#if hl
	return flight._hl._fn.Node.computeScene2dFitAlignY(scaledContentHeight, viewHeight, align);
#elseif cpp
	return flight._cpp._fn.Node.computeScene2dFitAlignY(scaledContentHeight, viewHeight, align);
#elseif (js && flight_esm)
	return flight._js._fn.Node.computeScene2dFitAlignY(scaledContentHeight, viewHeight, align);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function computeScene2dFitFillScale(contentWidth:Float, contentHeight:Float, viewWidth:Float, viewHeight:Float):Float {
#if hl
	return flight._hl._fn.Node.computeScene2dFitFillScale(contentWidth, contentHeight, viewWidth, viewHeight);
#elseif cpp
	return flight._cpp._fn.Node.computeScene2dFitFillScale(contentWidth, contentHeight, viewWidth, viewHeight);
#elseif (js && flight_esm)
	return flight._js._fn.Node.computeScene2dFitFillScale(contentWidth, contentHeight, viewWidth, viewHeight);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function computeScene2dFitScale(contentWidth:Float, contentHeight:Float, viewWidth:Float, viewHeight:Float):Float {
#if hl
	return flight._hl._fn.Node.computeScene2dFitScale(contentWidth, contentHeight, viewWidth, viewHeight);
#elseif cpp
	return flight._cpp._fn.Node.computeScene2dFitScale(contentWidth, contentHeight, viewWidth, viewHeight);
#elseif (js && flight_esm)
	return flight._js._fn.Node.computeScene2dFitScale(contentWidth, contentHeight, viewWidth, viewHeight);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function computeScene2dFitTransform(out:Matrix, scene2d:Scene2DFitContext, viewWidth:Float, viewHeight:Float):Void {
#if hl
	flight._hl._fn.Node.computeScene2dFitTransform(out, scene2d, viewWidth, viewHeight);
#elseif cpp
	flight._cpp._fn.Node.computeScene2dFitTransform(out, scene2d, viewWidth, viewHeight);
#elseif (js && flight_esm)
	flight._js._fn.Node.computeScene2dFitTransform(out, scene2d, viewWidth, viewHeight);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function findNode(source:Dynamic, predicateFn:Dynamic, predicateCtx:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Node.findNode(source, predicateFn, predicateCtx);
#elseif cpp
	return flight._cpp._fn.Node.findNode(source, predicateFn, predicateCtx);
#elseif (js && flight_esm)
	return flight._js._fn.Node.findNode(source, predicateFn, predicateCtx);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function findNodeByName(source:Dynamic, name:String):Dynamic {
#if hl
	return flight._hl._fn.Node.findNodeByName(source, cast name);
#elseif cpp
	return flight._cpp._fn.Node.findNodeByName(source, cast name);
#elseif (js && flight_esm)
	return flight._js._fn.Node.findNodeByName(source, name);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function forEachNodeAncestor(source:Dynamic, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void {
#if hl
	flight._hl._fn.Node.forEachNodeAncestor(source, callback_Fn, callback_Ctx);
#elseif cpp
	flight._cpp._fn.Node.forEachNodeAncestor(source, callback_Fn, callback_Ctx);
#elseif (js && flight_esm)
	flight._js._fn.Node.forEachNodeAncestor(source, callback_Fn, callback_Ctx);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function forEachNodeDescendant(source:Dynamic, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void {
#if hl
	flight._hl._fn.Node.forEachNodeDescendant(source, callback_Fn, callback_Ctx);
#elseif cpp
	flight._cpp._fn.Node.forEachNodeDescendant(source, callback_Fn, callback_Ctx);
#elseif (js && flight_esm)
	flight._js._fn.Node.forEachNodeDescendant(source, callback_Fn, callback_Ctx);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeChildren(out:Dynamic, source:Dynamic):Void {
#if hl
	flight._hl._fn.Node.getNodeChildren(out, source);
#elseif cpp
	flight._cpp._fn.Node.getNodeChildren(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Node.getNodeChildren(out, source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeDepth(source:Dynamic):Int {
#if hl
	return flight._hl._fn.Node.getNodeDepth(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeDepth(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeDepth(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodeNextSibling(source:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Node.getNodeNextSibling(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodeNextSibling(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodeNextSibling(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getNodePreviousSibling(source:Dynamic):Dynamic {
#if hl
	return flight._hl._fn.Node.getNodePreviousSibling(source);
#elseif cpp
	return flight._cpp._fn.Node.getNodePreviousSibling(source);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getNodePreviousSibling(source);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function walkNodeDescendants(source:Dynamic, visitFn:Dynamic, visitCtx:Dynamic):Bool {
#if hl
	return flight._hl._fn.Node.walkNodeDescendants(source, visitFn, visitCtx);
#elseif cpp
	return flight._cpp._fn.Node.walkNodeDescendants(source, visitFn, visitCtx);
#elseif (js && flight_esm)
	return flight._js._fn.Node.walkNodeDescendants(source, visitFn, visitCtx);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function createViewport():Viewport {
#if hl
	return flight._hl._fn.Node.createViewport();
#elseif cpp
	return flight._cpp._fn.Node.createViewport();
#elseif (js && flight_esm)
	return flight._js._fn.Node.createViewport();
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function getViewportAspect(viewport:Viewport):Float {
#if hl
	return flight._hl._fn.Node.getViewportAspect(viewport);
#elseif cpp
	return flight._cpp._fn.Node.getViewportAspect(viewport);
#elseif (js && flight_esm)
	return flight._js._fn.Node.getViewportAspect(viewport);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function freeNodeRuntime(ptr:NodeRuntime):Void {
#if hl
	flight._hl._fn.Node.freeNodeRuntime(ptr);
#elseif cpp
	flight._cpp._fn.Node.freeNodeRuntime(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Node.freeNodeRuntime(ptr);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function freeNodeOrderList(ptr:NodeOrderList):Void {
#if hl
	flight._hl._fn.Node.freeNodeOrderList(ptr);
#elseif cpp
	flight._cpp._fn.Node.freeNodeOrderList(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Node.freeNodeOrderList(ptr);
#else
	#error "flight.Node: no backend for this target."
#end
}
extern inline function freeViewport(ptr:Viewport):Void {
#if hl
	flight._hl._fn.Node.freeViewport(ptr);
#elseif cpp
	flight._cpp._fn.Node.freeViewport(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Node.freeViewport(ptr);
#else
	#error "flight.Node: no backend for this target."
#end
}
