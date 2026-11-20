package flight;

#if (js && flight_esm)
extern inline function computeNodeBoundsRectangle(out:Rectangle, source:Dynamic, targetCoordinateSpace:Null<Dynamic>):Void {
	flight._js._fn.Node.computeNodeBoundsRectangle(out, source, targetCoordinateSpace);
}
#else
extern inline function computeNodeBoundsRectangle(out:Rectangle, source:flight.FlightNode, targetCoordinateSpace:Null<flight.FlightNode>):Void {
#if hl
	flight._hl._fn.Node.computeNodeBoundsRectangle(out, source, targetCoordinateSpace);
#elseif cpp
	flight._cpp._fn.Node.computeNodeBoundsRectangle(out, source, targetCoordinateSpace);
#elseif (js && flight_esm)
	flight._js._fn.Node.computeNodeBoundsRectangle(out, source, targetCoordinateSpace);
#else
	#error "flight.Node: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computeNodeRootLocalBoundsRectangle(out:Rectangle, root:Dynamic):Void {
	flight._js._fn.Node.computeNodeRootLocalBoundsRectangle(out, root);
}
#else
extern inline function computeNodeRootLocalBoundsRectangle(out:Rectangle, root:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function ensureNodeLocalBoundsRectangle(target:Dynamic):Void {
	flight._js._fn.Node.ensureNodeLocalBoundsRectangle(target);
}
#else
extern inline function ensureNodeLocalBoundsRectangle(target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function ensureNodeParentBoundsRectangle(target:Dynamic):Void {
	flight._js._fn.Node.ensureNodeParentBoundsRectangle(target);
}
#else
extern inline function ensureNodeParentBoundsRectangle(target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function ensureNodeWorldBoundsRectangle(target:Dynamic):Void {
	flight._js._fn.Node.ensureNodeWorldBoundsRectangle(target);
}
#else
extern inline function ensureNodeWorldBoundsRectangle(target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function getNodeHeight(source:Dynamic):Float {
	return flight._js._fn.Node.getNodeHeight(source);
}
#else
extern inline function getNodeHeight(source:flight.FlightNode):Float {
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
#end
#if (js && flight_esm)
extern inline function getNodeLocalBoundsRectangle(target:Dynamic):Rectangle {
	return flight._js._fn.Node.getNodeLocalBoundsRectangle(target);
}
#else
extern inline function getNodeLocalBoundsRectangle(target:flight.FlightNode):Rectangle {
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
#end
#if (js && flight_esm)
extern inline function getNodeParentBoundsRectangle(target:Dynamic):Rectangle {
	return flight._js._fn.Node.getNodeParentBoundsRectangle(target);
}
#else
extern inline function getNodeParentBoundsRectangle(target:flight.FlightNode):Rectangle {
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
#end
#if (js && flight_esm)
extern inline function getNodeWidth(source:Dynamic):Float {
	return flight._js._fn.Node.getNodeWidth(source);
}
#else
extern inline function getNodeWidth(source:flight.FlightNode):Float {
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
#end
#if (js && flight_esm)
extern inline function getNodeWorldBoundsRectangle(target:Dynamic):Rectangle {
	return flight._js._fn.Node.getNodeWorldBoundsRectangle(target);
}
#else
extern inline function getNodeWorldBoundsRectangle(target:flight.FlightNode):Rectangle {
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
#end
#if (js && flight_esm)
extern inline function setNodeHeight(target:Dynamic, value:Float):Void {
	flight._js._fn.Node.setNodeHeight(target, value);
}
#else
extern inline function setNodeHeight(target:flight.FlightNode, value:Float):Void {
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
#end
#if (js && flight_esm)
extern inline function setNodeWidth(target:Dynamic, value:Float):Void {
	flight._js._fn.Node.setNodeWidth(target, value);
}
#else
extern inline function setNodeWidth(target:flight.FlightNode, value:Float):Void {
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
#end
#if (js && flight_esm)
extern inline function areNodeGuardsEnabled(guards:NodeGuardState):Bool {
	return flight._js._fn.Node.areNodeGuardsEnabled(guards);
}
#else
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
#end
#if (js && flight_esm)
extern inline function disableNodeGuards(guards:NodeGuardState):Void {
	flight._js._fn.Node.disableNodeGuards(guards);
}
#else
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
#end
#if (js && flight_esm)
extern inline function enableNodeGuards(guards:NodeGuardState, logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.Node.enableNodeGuards(guards, logState, clock);
}
#end
#if (js && flight_esm)
extern inline function initAppearanceRuntimeTrait(target:HasAppearanceRuntime):Void {
	flight._js._fn.Node.initAppearanceRuntimeTrait(target);
}
#else
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
#end
#if (js && flight_esm)
extern inline function initAppearanceTrait(target:HasAppearance, obj:Null<HasAppearanceOptions>):Void {
	flight._js._fn.Node.initAppearanceTrait(target, obj);
}
#else
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
#end
#if (js && flight_esm)
extern inline function initBlendModeTrait(target:HasBlendMode, obj:Null<HasBlendModeOptions>):Void {
	flight._js._fn.Node.initBlendModeTrait(target, obj);
}
#else
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
#end
#if (js && flight_esm)
extern inline function defaultComputeLocalBoundsRectangle(out:Rectangle, source:Dynamic):Void {
	flight._js._fn.Node.defaultComputeLocalBoundsRectangle(out, source);
}
#else
extern inline function defaultComputeLocalBoundsRectangle(out:Rectangle, source:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function initBoundsRectangleTrait(target:HasBoundsRectangle, obj:Null<HasBoundsRectangleOptions>):Void {
	flight._js._fn.Node.initBoundsRectangleTrait(target, obj);
}
#else
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
#end
#if (js && flight_esm)
extern inline function initClipTrait(target:HasClip, obj:Null<HasClipOptions>):Void {
	flight._js._fn.Node.initClipTrait(target, obj);
}
#else
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
#end
#if (js && flight_esm)
extern inline function initMaterialTrait(target:HasMaterial, obj:Null<HasMaterialOptions>):Void {
	flight._js._fn.Node.initMaterialTrait(target, obj);
}
#else
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
#end
#if (js && flight_esm)
extern inline function initTransform2dTrait(target:HasTransform2D, obj:Null<HasTransform2DOptions>):Void {
	flight._js._fn.Node.initTransform2dTrait(target, obj);
}
#else
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
#end
#if (js && flight_esm)
extern inline function initTransform3dRuntimeTrait(target:HasTransform3DRuntime):Void {
	flight._js._fn.Node.initTransform3dRuntimeTrait(target);
}
#else
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
#end
#if (js && flight_esm)
extern inline function initTransform3dTrait(target:HasTransform3D, obj:Null<HasTransform3DOptions>):Void {
	flight._js._fn.Node.initTransform3dTrait(target, obj);
}
#else
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
#end
#if (js && flight_esm)
extern inline function addNodeChild(target:Dynamic, child:Dynamic):Dynamic {
	return flight._js._fn.Node.addNodeChild(target, child);
}
#else
extern inline function addNodeChild(target:flight.FlightNode, child:flight.FlightNode):flight.FlightNode {
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
#end
#if (js && flight_esm)
extern inline function addNodeChildAt(target:Dynamic, child:Dynamic, index:Int):Dynamic {
	return flight._js._fn.Node.addNodeChildAt(target, child, index);
}
#else
extern inline function addNodeChildAt(target:flight.FlightNode, child:flight.FlightNode, index:Int):flight.FlightNode {
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
#end
#if (js && flight_esm)
extern inline function addNodeChildren(target:Dynamic, children:Dynamic):Void {
	flight._js._fn.Node.addNodeChildren(target, children);
}
#else
extern inline function addNodeChildren(target:flight.FlightNode, children:flight.FlightNodeArray):Void {
#if hl
	flight._hl._fn.Node.addNodeChildren(target, children);
#elseif cpp
	flight._cpp._fn.Node.addNodeChildren(target, children);
#elseif (js && flight_esm)
	flight._js._fn.Node.addNodeChildren(target, children);
#else
	#error "flight.Node: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function containsNodeChild(source:Dynamic, child:Dynamic):Bool {
	return flight._js._fn.Node.containsNodeChild(source, child);
}
#else
extern inline function containsNodeChild(source:flight.FlightNode, child:flight.FlightNode):Bool {
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
#end
#if (js && flight_esm)
extern inline function forEachNodeChild(source:Dynamic, callback_:Dynamic):Void {
	flight._js._fn.Node.forEachNodeChild(source, callback_);
}
#else
extern inline function forEachNodeChild(source:flight.FlightNode, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void {
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
#end
#if (js && flight_esm)
extern inline function getNodeAncestors(out:Dynamic, source:Dynamic):Void {
	flight._js._fn.Node.getNodeAncestors(out, source);
}
#else
extern inline function getNodeAncestors(out:flight.FlightNodeArray, source:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function getNodeChildAt(source:Dynamic, index:Int):Null<Dynamic> {
	return flight._js._fn.Node.getNodeChildAt(source, index);
}
#else
extern inline function getNodeChildAt(source:flight.FlightNode, index:Int):Null<flight.FlightNode> {
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
#end
#if (js && flight_esm)
extern inline function getNodeChildByName(source:Dynamic, name:String):Null<Dynamic> {
	return flight._js._fn.Node.getNodeChildByName(source, name);
}
#else
extern inline function getNodeChildByName(source:flight.FlightNode, name:String):Null<flight.FlightNode> {
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
#end
#if (js && flight_esm)
extern inline function getNodeChildCount(source:Dynamic):Int {
	return flight._js._fn.Node.getNodeChildCount(source);
}
#else
extern inline function getNodeChildCount(source:flight.FlightNode):Int {
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
#end
#if (js && flight_esm)
extern inline function getNodeChildIndex(source:Dynamic, child:Dynamic):Int {
	return flight._js._fn.Node.getNodeChildIndex(source, child);
}
#else
extern inline function getNodeChildIndex(source:flight.FlightNode, child:flight.FlightNode):Int {
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
#end
#if (js && flight_esm)
extern inline function getNodeCommonAncestor(a:Dynamic, b:Dynamic):Null<Dynamic> {
	return flight._js._fn.Node.getNodeCommonAncestor(a, b);
}
#else
extern inline function getNodeCommonAncestor(a:flight.FlightNode, b:flight.FlightNode):Null<flight.FlightNode> {
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
#end
#if (js && flight_esm)
extern inline function getNodeParent(source:Dynamic):Null<Dynamic> {
	return flight._js._fn.Node.getNodeParent(source);
}
#else
extern inline function getNodeParent(source:flight.FlightNode):Null<flight.FlightNode> {
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
#end
#if (js && flight_esm)
extern inline function getNodeRoot(source:Dynamic):Dynamic {
	return flight._js._fn.Node.getNodeRoot(source);
}
#else
extern inline function getNodeRoot(source:flight.FlightNode):flight.FlightNode {
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
#end
#if (js && flight_esm)
extern inline function isNodeAncestorOf(ancestor:Dynamic, descendant:Dynamic):Bool {
	return flight._js._fn.Node.isNodeAncestorOf(ancestor, descendant);
}
#else
extern inline function isNodeAncestorOf(ancestor:flight.FlightNode, descendant:flight.FlightNode):Bool {
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
#end
#if (js && flight_esm)
extern inline function removeNodeChild(target:Dynamic, child:Dynamic):Dynamic {
	return flight._js._fn.Node.removeNodeChild(target, child);
}
#else
extern inline function removeNodeChild(target:flight.FlightNode, child:flight.FlightNode):flight.FlightNode {
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
#end
#if (js && flight_esm)
extern inline function removeNodeChildAt(target:Dynamic, index:Int):Null<Dynamic> {
	return flight._js._fn.Node.removeNodeChildAt(target, index);
}
#else
extern inline function removeNodeChildAt(target:flight.FlightNode, index:Int):Null<flight.FlightNode> {
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
#end
#if (js && flight_esm)
extern inline function removeNodeChildren(target:Dynamic, beginIndex:Null<Int>, endIndex:Null<Int>):Void {
	flight._js._fn.Node.removeNodeChildren(target, beginIndex, endIndex);
}
#else
extern inline function removeNodeChildren(target:flight.FlightNode, beginIndex:Int, endIndex:Int):Void {
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
#end
#if (js && flight_esm)
extern inline function reparentNode(child:Dynamic, newParent:Dynamic, guards:Null<NodeGuardState>):Bool {
	return flight._js._fn.Node.reparentNode(child, newParent, guards);
}
#else
extern inline function reparentNode(child:flight.FlightNode, newParent:flight.FlightNode, guards:NodeGuardState):Bool {
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
#end
#if (js && flight_esm)
extern inline function replaceNodeChild(target:Dynamic, oldChild:Dynamic, newChild:Dynamic):Void {
	flight._js._fn.Node.replaceNodeChild(target, oldChild, newChild);
}
#else
extern inline function replaceNodeChild(target:flight.FlightNode, oldChild:flight.FlightNode, newChild:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function setNodeChildIndex(target:Dynamic, child:Dynamic, index:Int):Void {
	flight._js._fn.Node.setNodeChildIndex(target, child, index);
}
#else
extern inline function setNodeChildIndex(target:flight.FlightNode, child:flight.FlightNode, index:Int):Void {
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
#end
#if (js && flight_esm)
extern inline function swapNodeChildren(target:Dynamic, child1:Dynamic, child2:Dynamic):Void {
	flight._js._fn.Node.swapNodeChildren(target, child1, child2);
}
#else
extern inline function swapNodeChildren(target:flight.FlightNode, child1:flight.FlightNode, child2:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function swapNodeChildrenAt(target:Dynamic, index1:Int, index2:Int):Void {
	flight._js._fn.Node.swapNodeChildrenAt(target, index1, index2);
}
#else
extern inline function swapNodeChildrenAt(target:flight.FlightNode, index1:Int, index2:Int):Void {
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
#end
#if (js && flight_esm)
extern inline function createNodeSignals():Dynamic {
	return flight._js._fn.Node.createNodeSignals();
}
#else
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
#end
#if (js && flight_esm)
extern inline function defaultNodeRuntimeCanAddChild(target:Dynamic, child:Dynamic):Bool {
	return flight._js._fn.Node.defaultNodeRuntimeCanAddChild(target, child);
}
#else
extern inline function defaultNodeRuntimeCanAddChild(target:flight.FlightNode, child:flight.FlightNode):Bool {
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
#end
#if (js && flight_esm)
extern inline function disposeNode(target:Dynamic):Void {
	flight._js._fn.Node.disposeNode(target);
}
#else
extern inline function disposeNode(target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function enableNodeSignals(source:Dynamic):Dynamic {
	return flight._js._fn.Node.enableNodeSignals(source);
}
#else
extern inline function enableNodeSignals(source:flight.FlightNode):Dynamic {
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
#end
#if (js && flight_esm)
extern inline function getNodeSignals(source:Dynamic):Null<Dynamic> {
	return flight._js._fn.Node.getNodeSignals(source);
}
#else
extern inline function getNodeSignals(source:flight.FlightNode):Dynamic {
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
#end
#if (js && flight_esm)
extern inline function setNodeEnabled(target:Dynamic, value:Bool):Void {
	flight._js._fn.Node.setNodeEnabled(target, value);
}
#else
extern inline function setNodeEnabled(target:flight.FlightNode, value:Bool):Bool {
#if hl
	return flight._hl._fn.Node.setNodeEnabled(target, value);
#elseif cpp
	return flight._cpp._fn.Node.setNodeEnabled(target, value);
#elseif (js && flight_esm)
	return flight._js._fn.Node.setNodeEnabled(target, value);
#else
	#error "flight.Node: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addNodeColorAdjustment(source:Dynamic, adjustment:AdjustmentRef):Void {
	flight._js._fn.Node.addNodeColorAdjustment(source, adjustment);
}
#else
extern inline function addNodeColorAdjustment(source:flight.FlightNode, adjustment:AdjustmentRef):Void {
#if hl
	flight._hl._fn.Node.addNodeColorAdjustment(source, adjustment);
#elseif cpp
	flight._cpp._fn.Node.addNodeColorAdjustment(source, adjustment);
#elseif (js && flight_esm)
	flight._js._fn.Node.addNodeColorAdjustment(source, adjustment);
#else
	#error "flight.Node: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setNodeColorAdjustmentsTint(source:Dynamic, tint:Int):Void {
	flight._js._fn.Node.setNodeColorAdjustmentsTint(source, tint);
}
#else
extern inline function setNodeColorAdjustmentsTint(source:flight.FlightNode, tint:Int):Void {
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
#end
#if (js && flight_esm)
extern inline function createNodeOrderList():NodeOrderList {
	return flight._js._fn.Node.createNodeOrderList();
}
#else
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
#end
#if (js && flight_esm)
extern inline function addNodeOrderListEntry(list:NodeOrderList, node:Dynamic, sortKey:Float):Void {
	flight._js._fn.Node.addNodeOrderListEntry(list, node, sortKey);
}
#else
extern inline function addNodeOrderListEntry(list:NodeOrderList, node:flight.FlightNode, sortKey:Float):Void {
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
#end
#if (js && flight_esm)
extern inline function applyNodeOrderList(target:Dynamic, list:NodeOrderList):Void {
	flight._js._fn.Node.applyNodeOrderList(target, list);
}
#else
extern inline function applyNodeOrderList(target:flight.FlightNode, list:NodeOrderList):Void {
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
#end
#if (js && flight_esm)
extern inline function clearNodeOrderList(list:NodeOrderList):Void {
	flight._js._fn.Node.clearNodeOrderList(list);
}
#else
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
#end
#if (js && flight_esm)
extern inline function disposeNodeOrderList(list:NodeOrderList):Void {
	flight._js._fn.Node.disposeNodeOrderList(list);
}
#else
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
#end
#if (js && flight_esm)
extern inline function forEachNodeOrderListEntry(list:NodeOrderList, callback_:Dynamic):Void {
	flight._js._fn.Node.forEachNodeOrderListEntry(list, callback_);
}
#else
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
#end
#if (js && flight_esm)
extern inline function getNodeOrderListEntrySortKey(list:NodeOrderList, node:Dynamic):Null<Float> {
	return flight._js._fn.Node.getNodeOrderListEntrySortKey(list, node);
}
#else
extern inline function getNodeOrderListEntrySortKey(list:NodeOrderList, node:flight.FlightNode):Float {
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
#end
#if (js && flight_esm)
extern inline function hasNodeOrderListEntry(list:NodeOrderList, node:Dynamic):Bool {
	return flight._js._fn.Node.hasNodeOrderListEntry(list, node);
}
#else
extern inline function hasNodeOrderListEntry(list:NodeOrderList, node:flight.FlightNode):Bool {
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
#end
#if (js && flight_esm)
extern inline function removeNodeOrderListEntry(list:NodeOrderList, node:Dynamic):Bool {
	return flight._js._fn.Node.removeNodeOrderListEntry(list, node);
}
#else
extern inline function removeNodeOrderListEntry(list:NodeOrderList, node:flight.FlightNode):Bool {
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
#end
#if (js && flight_esm)
extern inline function setNodeOrderListEntry(list:NodeOrderList, node:Dynamic, sortKey:Float):Void {
	flight._js._fn.Node.setNodeOrderListEntry(list, node, sortKey);
}
#else
extern inline function setNodeOrderListEntry(list:NodeOrderList, node:flight.FlightNode, sortKey:Float):Void {
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
#end
#if (js && flight_esm)
extern inline function setNodeOrderListEntryAbove(list:NodeOrderList, node:Dynamic, target:Dynamic):Void {
	flight._js._fn.Node.setNodeOrderListEntryAbove(list, node, target);
}
#else
extern inline function setNodeOrderListEntryAbove(list:NodeOrderList, node:flight.FlightNode, target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function setNodeOrderListEntryBelow(list:NodeOrderList, node:Dynamic, target:Dynamic):Void {
	flight._js._fn.Node.setNodeOrderListEntryBelow(list, node, target);
}
#else
extern inline function setNodeOrderListEntryBelow(list:NodeOrderList, node:flight.FlightNode, target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function setNodeOrderListFromNodeChildren(list:NodeOrderList, source:Dynamic):Void {
	flight._js._fn.Node.setNodeOrderListFromNodeChildren(list, source);
}
#else
extern inline function setNodeOrderListFromNodeChildren(list:NodeOrderList, source:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function swapNodeOrderListEntries(list:NodeOrderList, nodeA:Dynamic, nodeB:Dynamic):Void {
	flight._js._fn.Node.swapNodeOrderListEntries(list, nodeA, nodeB);
}
#else
extern inline function swapNodeOrderListEntries(list:NodeOrderList, nodeA:flight.FlightNode, nodeB:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function getNodeLocalMatrix(target:Dynamic):Matrix {
	return flight._js._fn.Node.getNodeLocalMatrix(target);
}
#else
extern inline function getNodeLocalMatrix(target:flight.FlightNode):Matrix {
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
#end
#if (js && flight_esm)
extern inline function getNodeTransform2d(out:Transform2D, source:Dynamic):Void {
	flight._js._fn.Node.getNodeTransform2d(out, source);
}
#else
extern inline function getNodeTransform2d(out:Transform2D, source:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function getNodeWorldMatrix(target:Dynamic):Matrix {
	return flight._js._fn.Node.getNodeWorldMatrix(target);
}
#else
extern inline function getNodeWorldMatrix(target:flight.FlightNode):Matrix {
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
#end
#if (js && flight_esm)
extern inline function setNodeLocalMatrix(target:Dynamic, source:Matrix):Void {
	flight._js._fn.Node.setNodeLocalMatrix(target, source);
}
#else
extern inline function setNodeLocalMatrix(target:flight.FlightNode, source:Matrix):Void {
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
#end
#if (js && flight_esm)
extern inline function setNodeTransform2d(target:Dynamic, source:Transform2D):Void {
	flight._js._fn.Node.setNodeTransform2d(target, source);
}
#else
extern inline function setNodeTransform2d(target:flight.FlightNode, source:Transform2D):Void {
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
#end
#if (js && flight_esm)
extern inline function computeNodeWorldTransformRevision(target:Dynamic, parentWorldTransformId:Null<Int>, root:Null<NodeRuntime>):Void {
	flight._js._fn.Node.computeNodeWorldTransformRevision(target, parentWorldTransformId, root);
}
#else
extern inline function computeNodeWorldTransformRevision(target:flight.FlightNode, parentWorldTransformId:haxe.Int64, root:NodeRuntime):Void {
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
#end
#if (js && flight_esm)
extern inline function getNodeAppearanceRevision(source:Dynamic):Int {
	return flight._js._fn.Node.getNodeAppearanceRevision(source);
}
#else
extern inline function getNodeAppearanceRevision(source:flight.FlightNode):Int {
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
#end
#if (js && flight_esm)
extern inline function getNodeChildrenRevision(source:Dynamic):Int {
	return flight._js._fn.Node.getNodeChildrenRevision(source);
}
#else
extern inline function getNodeChildrenRevision(source:flight.FlightNode):Int {
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
#end
#if (js && flight_esm)
extern inline function getNodeLocalBoundsRevision(source:Dynamic):Int {
	return flight._js._fn.Node.getNodeLocalBoundsRevision(source);
}
#else
extern inline function getNodeLocalBoundsRevision(source:flight.FlightNode):Int {
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
#end
#if (js && flight_esm)
extern inline function getNodeLocalContentRevision(source:Dynamic):Int {
	return flight._js._fn.Node.getNodeLocalContentRevision(source);
}
#else
extern inline function getNodeLocalContentRevision(source:flight.FlightNode):Int {
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
#end
#if (js && flight_esm)
extern inline function getNodeLocalTransformRevision(source:Dynamic):Int {
	return flight._js._fn.Node.getNodeLocalTransformRevision(source);
}
#else
extern inline function getNodeLocalTransformRevision(source:flight.FlightNode):Int {
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
#end
#if (js && flight_esm)
extern inline function getNodeParentReferenceRevision(source:Dynamic):Int {
	return flight._js._fn.Node.getNodeParentReferenceRevision(source);
}
#else
extern inline function getNodeParentReferenceRevision(source:flight.FlightNode):Int {
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
#end
#if (js && flight_esm)
extern inline function getNodeWorldTransformRevision(source:Dynamic):Int {
	return flight._js._fn.Node.getNodeWorldTransformRevision(source);
}
#else
extern inline function getNodeWorldTransformRevision(source:flight.FlightNode):Int {
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
#end
#if (js && flight_esm)
extern inline function invalidateContent(target:Dynamic):Void {
	flight._js._fn.Node.invalidateContent(target);
}
#else
extern inline function invalidateContent(target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function invalidateNode(target:Dynamic):Void {
	flight._js._fn.Node.invalidateNode(target);
}
#else
extern inline function invalidateNode(target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function invalidateNodeAppearance(target:Dynamic):Void {
	flight._js._fn.Node.invalidateNodeAppearance(target);
}
#else
extern inline function invalidateNodeAppearance(target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function invalidateNodeLocalBounds(target:Dynamic):Void {
	flight._js._fn.Node.invalidateNodeLocalBounds(target);
}
#else
extern inline function invalidateNodeLocalBounds(target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function invalidateNodeLocalContent(target:Dynamic):Void {
	flight._js._fn.Node.invalidateNodeLocalContent(target);
}
#else
extern inline function invalidateNodeLocalContent(target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function invalidateNodeLocalTransform(target:Dynamic):Void {
	flight._js._fn.Node.invalidateNodeLocalTransform(target);
}
#else
extern inline function invalidateNodeLocalTransform(target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function invalidateNodeParentReference(target:Dynamic):Void {
	flight._js._fn.Node.invalidateNodeParentReference(target);
}
#else
extern inline function invalidateNodeParentReference(target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function invalidateNodeRender(target:Dynamic):Void {
	flight._js._fn.Node.invalidateNodeRender(target);
}
#else
extern inline function invalidateNodeRender(target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function invalidateNodeWorldBounds(target:Dynamic):Void {
	flight._js._fn.Node.invalidateNodeWorldBounds(target);
}
#else
extern inline function invalidateNodeWorldBounds(target:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function computeScene2dFitAlignX(scaledContentWidth:Float, viewWidth:Float, align:ViewportAlign):Float {
	return flight._js._fn.Node.computeScene2dFitAlignX(scaledContentWidth, viewWidth, align);
}
#else
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
#end
#if (js && flight_esm)
extern inline function computeScene2dFitAlignY(scaledContentHeight:Float, viewHeight:Float, align:ViewportAlign):Float {
	return flight._js._fn.Node.computeScene2dFitAlignY(scaledContentHeight, viewHeight, align);
}
#else
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
#end
#if (js && flight_esm)
extern inline function computeScene2dFitFillScale(contentWidth:Float, contentHeight:Float, viewWidth:Float, viewHeight:Float):Float {
	return flight._js._fn.Node.computeScene2dFitFillScale(contentWidth, contentHeight, viewWidth, viewHeight);
}
#else
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
#end
#if (js && flight_esm)
extern inline function computeScene2dFitScale(contentWidth:Float, contentHeight:Float, viewWidth:Float, viewHeight:Float):Float {
	return flight._js._fn.Node.computeScene2dFitScale(contentWidth, contentHeight, viewWidth, viewHeight);
}
#else
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
#end
#if (js && flight_esm)
extern inline function computeScene2dFitTransform(out:Matrix, scene2d:Scene2DFitContext, viewWidth:Float, viewHeight:Float):Void {
	flight._js._fn.Node.computeScene2dFitTransform(out, scene2d, viewWidth, viewHeight);
}
#else
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
#end
#if (js && flight_esm)
extern inline function findNode(source:Dynamic, predicate:Dynamic):Null<Dynamic> {
	return flight._js._fn.Node.findNode(source, predicate);
}
#else
extern inline function findNode(source:flight.FlightNode, predicateFn:Dynamic, predicateCtx:Dynamic):Null<flight.FlightNode> {
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
#end
#if (js && flight_esm)
extern inline function findNodeByName(source:Dynamic, name:String):Null<Dynamic> {
	return flight._js._fn.Node.findNodeByName(source, name);
}
#else
extern inline function findNodeByName(source:flight.FlightNode, name:String):Null<flight.FlightNode> {
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
#end
#if (js && flight_esm)
extern inline function forEachNodeAncestor(source:Dynamic, callback_:Dynamic):Void {
	flight._js._fn.Node.forEachNodeAncestor(source, callback_);
}
#else
extern inline function forEachNodeAncestor(source:flight.FlightNode, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void {
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
#end
#if (js && flight_esm)
extern inline function forEachNodeDescendant(source:Dynamic, callback_:Dynamic):Void {
	flight._js._fn.Node.forEachNodeDescendant(source, callback_);
}
#else
extern inline function forEachNodeDescendant(source:flight.FlightNode, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void {
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
#end
#if (js && flight_esm)
extern inline function getNodeChildren(out:Dynamic, source:Dynamic):Void {
	flight._js._fn.Node.getNodeChildren(out, source);
}
#else
extern inline function getNodeChildren(out:flight.FlightNodeArray, source:flight.FlightNode):Void {
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
#end
#if (js && flight_esm)
extern inline function getNodeDepth(source:Dynamic):Int {
	return flight._js._fn.Node.getNodeDepth(source);
}
#else
extern inline function getNodeDepth(source:flight.FlightNode):Int {
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
#end
#if (js && flight_esm)
extern inline function getNodeNextSibling(source:Dynamic):Null<Dynamic> {
	return flight._js._fn.Node.getNodeNextSibling(source);
}
#else
extern inline function getNodeNextSibling(source:flight.FlightNode):Null<flight.FlightNode> {
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
#end
#if (js && flight_esm)
extern inline function getNodePreviousSibling(source:Dynamic):Null<Dynamic> {
	return flight._js._fn.Node.getNodePreviousSibling(source);
}
#else
extern inline function getNodePreviousSibling(source:flight.FlightNode):Null<flight.FlightNode> {
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
#end
#if (js && flight_esm)
extern inline function walkNodeDescendants(source:Dynamic, visit:Dynamic):Bool {
	return flight._js._fn.Node.walkNodeDescendants(source, visit);
}
#else
extern inline function walkNodeDescendants(source:flight.FlightNode, visitFn:Dynamic, visitCtx:Dynamic):Bool {
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
#end
#if (js && flight_esm)
extern inline function createViewport():Viewport {
	return flight._js._fn.Node.createViewport();
}
#else
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
#end
#if (js && flight_esm)
extern inline function getViewportAspect(viewport:Viewport):Float {
	return flight._js._fn.Node.getViewportAspect(viewport);
}
#else
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
#end
#if (js && flight_esm)
extern inline function freeNodeSignalsRef(ptr:NodeSignals):Void {
	flight._js._fn.Node.freeNodeSignalsRef(ptr);
}
#else
extern inline function freeNodeSignalsRef(ptr:NodeSignals):Void {
#if hl
	flight._hl._fn.Node.freeNodeSignalsRef(ptr);
#elseif cpp
	flight._cpp._fn.Node.freeNodeSignalsRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Node.freeNodeSignalsRef(ptr);
#else
	#error "flight.Node: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeNodeOrderList(ptr:NodeOrderList):Void {
	flight._js._fn.Node.freeNodeOrderList(ptr);
}
#else
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
#end
#if (js && flight_esm)
extern inline function freeViewport(ptr:Viewport):Void {
	flight._js._fn.Node.freeViewport(ptr);
}
#else
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
#end
