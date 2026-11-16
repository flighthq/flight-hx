package flight._js._fn;

@:jsRequire("@flighthq/node")
extern class Node {
	@:native("computeNodeBoundsRectangle")
	public static function computeNodeBoundsRectangle(out:flight._js.Rectangle, source:Dynamic, targetCoordinateSpace:Null<Dynamic>):Void;
	@:native("computeNodeRootLocalBoundsRectangle")
	public static function computeNodeRootLocalBoundsRectangle(out:flight._js.Rectangle, root:Dynamic):Void;
	@:native("ensureNodeLocalBoundsRectangle")
	public static function ensureNodeLocalBoundsRectangle(target:Dynamic):Void;
	@:native("ensureNodeParentBoundsRectangle")
	public static function ensureNodeParentBoundsRectangle(target:Dynamic):Void;
	@:native("ensureNodeWorldBoundsRectangle")
	public static function ensureNodeWorldBoundsRectangle(target:Dynamic):Void;
	@:native("getNodeHeight")
	public static function getNodeHeight(source:Dynamic):Float;
	@:native("getNodeLocalBoundsRectangle")
	public static function getNodeLocalBoundsRectangle(target:Dynamic):flight._js.Rectangle;
	@:native("getNodeParentBoundsRectangle")
	public static function getNodeParentBoundsRectangle(target:Dynamic):flight._js.Rectangle;
	@:native("getNodeWidth")
	public static function getNodeWidth(source:Dynamic):Float;
	@:native("getNodeWorldBoundsRectangle")
	public static function getNodeWorldBoundsRectangle(target:Dynamic):flight._js.Rectangle;
	@:native("setNodeHeight")
	public static function setNodeHeight(target:Dynamic, value:Float):Void;
	@:native("setNodeWidth")
	public static function setNodeWidth(target:Dynamic, value:Float):Void;
	@:native("areNodeGuardsEnabled")
	public static function areNodeGuardsEnabled(guards:flight._js.NodeGuardState):Bool;
	@:native("disableNodeGuards")
	public static function disableNodeGuards(guards:flight._js.NodeGuardState):Void;
	@:native("enableNodeGuards")
	public static function enableNodeGuards(guards:flight._js.NodeGuardState, logState:Dynamic, clock:Dynamic):Void;
	@:native("initAppearanceRuntimeTrait")
	public static function initAppearanceRuntimeTrait(target:flight._js.HasAppearanceRuntime):Void;
	@:native("initAppearanceTrait")
	public static function initAppearanceTrait(target:flight._js.HasAppearance, obj:Null<flight._js.HasAppearanceOptions>):Void;
	@:native("initBlendModeTrait")
	public static function initBlendModeTrait(target:flight._js.HasBlendMode, obj:Null<flight._js.HasBlendModeOptions>):Void;
	@:native("defaultComputeLocalBoundsRectangle")
	public static function defaultComputeLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("initBoundsRectangleTrait")
	public static function initBoundsRectangleTrait(target:flight._js.HasBoundsRectangle, obj:Null<flight._js.HasBoundsRectangleOptions>):Void;
	@:native("initClipTrait")
	public static function initClipTrait(target:flight._js.HasClip, obj:Null<flight._js.HasClipOptions>):Void;
	@:native("initMaterialTrait")
	public static function initMaterialTrait(target:flight._js.HasMaterial, obj:Null<flight._js.HasMaterialOptions>):Void;
	@:native("initTransform2DTrait")
	public static function initTransform2dTrait(target:flight._js.HasTransform2D, obj:Null<flight._js.HasTransform2DOptions>):Void;
	@:native("initTransform3DRuntimeTrait")
	public static function initTransform3dRuntimeTrait(target:flight._js.HasTransform3DRuntime):Void;
	@:native("initTransform3DTrait")
	public static function initTransform3dTrait(target:flight._js.HasTransform3D, obj:Null<flight._js.HasTransform3DOptions>):Void;
	@:native("addNodeChild")
	public static function addNodeChild(target:Dynamic, child:Dynamic):Dynamic;
	@:native("addNodeChildAt")
	public static function addNodeChildAt(target:Dynamic, child:Dynamic, index:Int):Dynamic;
	@:native("addNodeChildren")
	public static function addNodeChildren(target:Dynamic, children:Dynamic):Void;
	@:native("containsNodeChild")
	public static function containsNodeChild(source:Dynamic, child:Dynamic):Bool;
	@:native("forEachNodeChild")
	public static function forEachNodeChild(source:Dynamic, callback_:Dynamic):Void;
	@:native("getNodeAncestors")
	public static function getNodeAncestors(out:Dynamic, source:Dynamic):Void;
	@:native("getNodeChildAt")
	public static function getNodeChildAt(source:Dynamic, index:Int):Null<Dynamic>;
	@:native("getNodeChildByName")
	public static function getNodeChildByName(source:Dynamic, name:String):Null<Dynamic>;
	@:native("getNodeChildCount")
	public static function getNodeChildCount(source:Dynamic):Int;
	@:native("getNodeChildIndex")
	public static function getNodeChildIndex(source:Dynamic, child:Dynamic):Int;
	@:native("getNodeCommonAncestor")
	public static function getNodeCommonAncestor(a:Dynamic, b:Dynamic):Null<Dynamic>;
	@:native("getNodeParent")
	public static function getNodeParent(source:Dynamic):Null<Dynamic>;
	@:native("getNodeRoot")
	public static function getNodeRoot(source:Dynamic):Dynamic;
	@:native("isNodeAncestorOf")
	public static function isNodeAncestorOf(ancestor:Dynamic, descendant:Dynamic):Bool;
	@:native("removeNodeChild")
	public static function removeNodeChild(target:Dynamic, child:Dynamic):Dynamic;
	@:native("removeNodeChildAt")
	public static function removeNodeChildAt(target:Dynamic, index:Int):Null<Dynamic>;
	@:native("removeNodeChildren")
	public static function removeNodeChildren(target:Dynamic, beginIndex:Null<Int>, endIndex:Null<Int>):Void;
	@:native("reparentNode")
	public static function reparentNode(child:Dynamic, newParent:Dynamic, guards:Null<flight._js.NodeGuardState>):Bool;
	@:native("replaceNodeChild")
	public static function replaceNodeChild(target:Dynamic, oldChild:Dynamic, newChild:Dynamic):Void;
	@:native("setNodeChildIndex")
	public static function setNodeChildIndex(target:Dynamic, child:Dynamic, index:Int):Void;
	@:native("swapNodeChildren")
	public static function swapNodeChildren(target:Dynamic, child1:Dynamic, child2:Dynamic):Void;
	@:native("swapNodeChildrenAt")
	public static function swapNodeChildrenAt(target:Dynamic, index1:Int, index2:Int):Void;
	@:native("createNodeRuntime")
	public static function createNodeRuntime(methods:Null<flight._js.NodeRuntimeMethods>):flight._js.NodeRuntime;
	@:native("createNodeSignals")
	public static function createNodeSignals():Dynamic;
	@:native("defaultNodeRuntimeCanAddChild")
	public static function defaultNodeRuntimeCanAddChild(target:Dynamic, child:Dynamic):Bool;
	@:native("disposeNode")
	public static function disposeNode(target:Dynamic):Void;
	@:native("enableNodeSignals")
	public static function enableNodeSignals(source:Dynamic):Dynamic;
	@:native("getNodeRuntime")
	public static function getNodeRuntime(source:Dynamic):flight._js.NodeRuntime;
	@:native("getNodeSignals")
	public static function getNodeSignals(source:Dynamic):Null<Dynamic>;
	@:native("setNodeEnabled")
	public static function setNodeEnabled(target:Dynamic, value:Bool):Void;
	@:native("setNodeColorAdjustmentsTint")
	public static function setNodeColorAdjustmentsTint(source:Dynamic, tint:Int):Void;
	@:native("createNodeOrderList")
	public static function createNodeOrderList():flight._js.NodeOrderList;
	@:native("addNodeOrderListEntry")
	public static function addNodeOrderListEntry(list:flight._js.NodeOrderList, node:Dynamic, sortKey:Float):Void;
	@:native("applyNodeOrderList")
	public static function applyNodeOrderList(target:Dynamic, list:flight._js.NodeOrderList):Void;
	@:native("clearNodeOrderList")
	public static function clearNodeOrderList(list:flight._js.NodeOrderList):Void;
	@:native("disposeNodeOrderList")
	public static function disposeNodeOrderList(list:flight._js.NodeOrderList):Void;
	@:native("forEachNodeOrderListEntry")
	public static function forEachNodeOrderListEntry(list:flight._js.NodeOrderList, callback_:Dynamic):Void;
	@:native("getNodeOrderListEntrySortKey")
	public static function getNodeOrderListEntrySortKey(list:flight._js.NodeOrderList, node:Dynamic):Null<Float>;
	@:native("hasNodeOrderListEntry")
	public static function hasNodeOrderListEntry(list:flight._js.NodeOrderList, node:Dynamic):Bool;
	@:native("removeNodeOrderListEntry")
	public static function removeNodeOrderListEntry(list:flight._js.NodeOrderList, node:Dynamic):Bool;
	@:native("setNodeOrderListEntry")
	public static function setNodeOrderListEntry(list:flight._js.NodeOrderList, node:Dynamic, sortKey:Float):Void;
	@:native("setNodeOrderListEntryAbove")
	public static function setNodeOrderListEntryAbove(list:flight._js.NodeOrderList, node:Dynamic, target:Dynamic):Void;
	@:native("setNodeOrderListEntryBelow")
	public static function setNodeOrderListEntryBelow(list:flight._js.NodeOrderList, node:Dynamic, target:Dynamic):Void;
	@:native("setNodeOrderListFromNodeChildren")
	public static function setNodeOrderListFromNodeChildren(list:flight._js.NodeOrderList, source:Dynamic):Void;
	@:native("swapNodeOrderListEntries")
	public static function swapNodeOrderListEntries(list:flight._js.NodeOrderList, nodeA:Dynamic, nodeB:Dynamic):Void;
	@:native("getNodeLocalMatrix")
	public static function getNodeLocalMatrix(target:Dynamic):flight._js.Matrix;
	@:native("getNodeTransform2D")
	public static function getNodeTransform2d(out:flight._js.Transform2D, source:Dynamic):Void;
	@:native("getNodeWorldMatrix")
	public static function getNodeWorldMatrix(target:Dynamic):flight._js.Matrix;
	@:native("setNodeLocalMatrix")
	public static function setNodeLocalMatrix(target:Dynamic, source:flight._js.Matrix):Void;
	@:native("setNodeTransform2D")
	public static function setNodeTransform2d(target:Dynamic, source:flight._js.Transform2D):Void;
	@:native("computeNodeWorldTransformRevision")
	public static function computeNodeWorldTransformRevision(target:Dynamic, parentWorldTransformId:Null<Int>, root:Null<flight._js.NodeRuntime>):Void;
	@:native("getNodeAppearanceRevision")
	public static function getNodeAppearanceRevision(source:Dynamic):Int;
	@:native("getNodeChildrenRevision")
	public static function getNodeChildrenRevision(source:Dynamic):Int;
	@:native("getNodeLocalBoundsRevision")
	public static function getNodeLocalBoundsRevision(source:Dynamic):Int;
	@:native("getNodeLocalContentRevision")
	public static function getNodeLocalContentRevision(source:Dynamic):Int;
	@:native("getNodeLocalTransformRevision")
	public static function getNodeLocalTransformRevision(source:Dynamic):Int;
	@:native("getNodeParentReferenceRevision")
	public static function getNodeParentReferenceRevision(source:Dynamic):Int;
	@:native("getNodeWorldTransformRevision")
	public static function getNodeWorldTransformRevision(source:Dynamic):Int;
	@:native("invalidateContent")
	public static function invalidateContent(target:Dynamic):Void;
	@:native("invalidateNode")
	public static function invalidateNode(target:Dynamic):Void;
	@:native("invalidateNodeAppearance")
	public static function invalidateNodeAppearance(target:Dynamic):Void;
	@:native("invalidateNodeLocalBounds")
	public static function invalidateNodeLocalBounds(target:Dynamic):Void;
	@:native("invalidateNodeLocalContent")
	public static function invalidateNodeLocalContent(target:Dynamic):Void;
	@:native("invalidateNodeLocalTransform")
	public static function invalidateNodeLocalTransform(target:Dynamic):Void;
	@:native("invalidateNodeParentReference")
	public static function invalidateNodeParentReference(target:Dynamic):Void;
	@:native("invalidateNodeRender")
	public static function invalidateNodeRender(target:Dynamic):Void;
	@:native("invalidateNodeWorldBounds")
	public static function invalidateNodeWorldBounds(target:Dynamic):Void;
	@:native("computeScene2DFitAlignX")
	public static function computeScene2dFitAlignX(scaledContentWidth:Float, viewWidth:Float, align:flight._js.ViewportAlign):Float;
	@:native("computeScene2DFitAlignY")
	public static function computeScene2dFitAlignY(scaledContentHeight:Float, viewHeight:Float, align:flight._js.ViewportAlign):Float;
	@:native("computeScene2DFitFillScale")
	public static function computeScene2dFitFillScale(contentWidth:Float, contentHeight:Float, viewWidth:Float, viewHeight:Float):Float;
	@:native("computeScene2DFitScale")
	public static function computeScene2dFitScale(contentWidth:Float, contentHeight:Float, viewWidth:Float, viewHeight:Float):Float;
	@:native("computeScene2DFitTransform")
	public static function computeScene2dFitTransform(out:flight._js.Matrix, scene2d:flight._js.Scene2DFitContext, viewWidth:Float, viewHeight:Float):Void;
	@:native("findNode")
	public static function findNode(source:Dynamic, predicate:Dynamic):Null<Dynamic>;
	@:native("findNodeByName")
	public static function findNodeByName(source:Dynamic, name:String):Null<Dynamic>;
	@:native("forEachNodeAncestor")
	public static function forEachNodeAncestor(source:Dynamic, callback_:Dynamic):Void;
	@:native("forEachNodeDescendant")
	public static function forEachNodeDescendant(source:Dynamic, callback_:Dynamic):Void;
	@:native("getNodeChildren")
	public static function getNodeChildren(out:Dynamic, source:Dynamic):Void;
	@:native("getNodeDepth")
	public static function getNodeDepth(source:Dynamic):Int;
	@:native("getNodeNextSibling")
	public static function getNodeNextSibling(source:Dynamic):Null<Dynamic>;
	@:native("getNodePreviousSibling")
	public static function getNodePreviousSibling(source:Dynamic):Null<Dynamic>;
	@:native("walkNodeDescendants")
	public static function walkNodeDescendants(source:Dynamic, visit:Dynamic):Bool;
	@:native("createViewport")
	public static function createViewport():flight._js.Viewport;
	@:native("getViewportAspect")
	public static function getViewportAspect(viewport:flight._js.Viewport):Float;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeNodeRuntime(ptr:flight._js.NodeRuntime):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeNodeOrderList(ptr:flight._js.NodeOrderList):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeViewport(ptr:flight._js.Viewport):Void {}
}
