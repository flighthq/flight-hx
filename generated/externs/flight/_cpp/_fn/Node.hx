package flight._cpp._fn;

extern class Node {
	@:native("flight_compute_node_bounds_rectangle")
	public static function computeNodeBoundsRectangle(out:flight._cpp.Rectangle, source:flight._cpp.FlightNode, targetCoordinateSpace:Null<flight._cpp.FlightNode>):Void;
	@:native("flight_compute_node_root_local_bounds_rectangle")
	public static function computeNodeRootLocalBoundsRectangle(out:flight._cpp.Rectangle, root:flight._cpp.FlightNode):Void;
	@:native("flight_ensure_node_local_bounds_rectangle")
	public static function ensureNodeLocalBoundsRectangle(target:flight._cpp.FlightNode):Void;
	@:native("flight_ensure_node_parent_bounds_rectangle")
	public static function ensureNodeParentBoundsRectangle(target:flight._cpp.FlightNode):Void;
	@:native("flight_ensure_node_world_bounds_rectangle")
	public static function ensureNodeWorldBoundsRectangle(target:flight._cpp.FlightNode):Void;
	@:native("flight_get_node_height")
	public static function getNodeHeight(source:flight._cpp.FlightNode):Float;
	@:native("flight_get_node_local_bounds_rectangle")
	public static function getNodeLocalBoundsRectangle(target:flight._cpp.FlightNode):flight._cpp.Rectangle;
	@:native("flight_get_node_parent_bounds_rectangle")
	public static function getNodeParentBoundsRectangle(target:flight._cpp.FlightNode):flight._cpp.Rectangle;
	@:native("flight_get_node_width")
	public static function getNodeWidth(source:flight._cpp.FlightNode):Float;
	@:native("flight_get_node_world_bounds_rectangle")
	public static function getNodeWorldBoundsRectangle(target:flight._cpp.FlightNode):flight._cpp.Rectangle;
	@:native("flight_set_node_height")
	public static function setNodeHeight(target:flight._cpp.FlightNode, value:Float):Void;
	@:native("flight_set_node_width")
	public static function setNodeWidth(target:flight._cpp.FlightNode, value:Float):Void;
	@:native("flight_are_node_guards_enabled")
	public static function areNodeGuardsEnabled(guards:flight._cpp.NodeGuardState):Bool;
	@:native("flight_disable_node_guards")
	public static function disableNodeGuards(guards:flight._cpp.NodeGuardState):Void;
	@:native("flight_init_appearance_runtime_trait")
	public static function initAppearanceRuntimeTrait(target:flight._cpp.HasAppearanceRuntime):Void;
	@:native("flight_init_appearance_trait")
	public static function initAppearanceTrait(target:flight._cpp.HasAppearance, obj:flight._cpp.HasAppearanceOptions):Void;
	@:native("flight_init_blend_mode_trait")
	public static function initBlendModeTrait(target:flight._cpp.HasBlendMode, obj:flight._cpp.HasBlendModeOptions):Void;
	@:native("flight_default_compute_local_bounds_rectangle")
	public static function defaultComputeLocalBoundsRectangle(out:flight._cpp.Rectangle, source:flight._cpp.FlightNode):Void;
	@:native("flight_init_bounds_rectangle_trait")
	public static function initBoundsRectangleTrait(target:flight._cpp.HasBoundsRectangle, obj:flight._cpp.HasBoundsRectangleOptions):Void;
	@:native("flight_init_clip_trait")
	public static function initClipTrait(target:flight._cpp.HasClip, obj:flight._cpp.HasClipOptions):Void;
	@:native("flight_init_material_trait")
	public static function initMaterialTrait(target:flight._cpp.HasMaterial, obj:flight._cpp.HasMaterialOptions):Void;
	@:native("flight_init_transform2d_trait")
	public static function initTransform2dTrait(target:flight._cpp.HasTransform2D, obj:flight._cpp.HasTransform2DOptions):Void;
	@:native("flight_init_transform3d_runtime_trait")
	public static function initTransform3dRuntimeTrait(target:flight._cpp.HasTransform3DRuntime):Void;
	@:native("flight_init_transform3d_trait")
	public static function initTransform3dTrait(target:flight._cpp.HasTransform3D, obj:flight._cpp.HasTransform3DOptions):Void;
	@:native("flight_add_node_child")
	public static function addNodeChild(target:flight._cpp.FlightNode, child:flight._cpp.FlightNode):flight._cpp.FlightNode;
	@:native("flight_add_node_child_at")
	public static function addNodeChildAt(target:flight._cpp.FlightNode, child:flight._cpp.FlightNode, index:Int):flight._cpp.FlightNode;
	@:native("flight_add_node_children")
	public static function addNodeChildren(target:flight._cpp.FlightNode, children:flight._cpp.FlightNodeArray):Void;
	@:native("flight_contains_node_child")
	public static function containsNodeChild(source:flight._cpp.FlightNode, child:flight._cpp.FlightNode):Bool;
	@:native("flight_for_each_node_child")
	public static function forEachNodeChild(source:flight._cpp.FlightNode, callback_Fn:cpp.Star<cpp.Void>, callback_Ctx:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_node_ancestors")
	public static function getNodeAncestors(out:flight._cpp.FlightNodeArray, source:flight._cpp.FlightNode):Void;
	@:native("flight_get_node_child_at")
	public static function getNodeChildAt(source:flight._cpp.FlightNode, index:Int):Null<flight._cpp.FlightNode>;
	@:native("flight_get_node_child_by_name")
	public static function getNodeChildByName(source:flight._cpp.FlightNode, name:cpp.ConstCharStar):Null<flight._cpp.FlightNode>;
	@:native("flight_get_node_child_count")
	public static function getNodeChildCount(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_node_child_index")
	public static function getNodeChildIndex(source:flight._cpp.FlightNode, child:flight._cpp.FlightNode):Int;
	@:native("flight_get_node_common_ancestor")
	public static function getNodeCommonAncestor(a:flight._cpp.FlightNode, b:flight._cpp.FlightNode):Null<flight._cpp.FlightNode>;
	@:native("flight_get_node_parent")
	public static function getNodeParent(source:flight._cpp.FlightNode):Null<flight._cpp.FlightNode>;
	@:native("flight_get_node_root")
	public static function getNodeRoot(source:flight._cpp.FlightNode):flight._cpp.FlightNode;
	@:native("flight_is_node_ancestor_of")
	public static function isNodeAncestorOf(ancestor:flight._cpp.FlightNode, descendant:flight._cpp.FlightNode):Bool;
	@:native("flight_remove_node_child")
	public static function removeNodeChild(target:flight._cpp.FlightNode, child:flight._cpp.FlightNode):flight._cpp.FlightNode;
	@:native("flight_remove_node_child_at")
	public static function removeNodeChildAt(target:flight._cpp.FlightNode, index:Int):Null<flight._cpp.FlightNode>;
	@:native("flight_remove_node_children")
	public static function removeNodeChildren(target:flight._cpp.FlightNode, beginIndex:Int, endIndex:Int):Void;
	@:native("flight_reparent_node")
	public static function reparentNode(child:flight._cpp.FlightNode, newParent:flight._cpp.FlightNode, guards:flight._cpp.NodeGuardState):Bool;
	@:native("flight_replace_node_child")
	public static function replaceNodeChild(target:flight._cpp.FlightNode, oldChild:flight._cpp.FlightNode, newChild:flight._cpp.FlightNode):Void;
	@:native("flight_set_node_child_index")
	public static function setNodeChildIndex(target:flight._cpp.FlightNode, child:flight._cpp.FlightNode, index:Int):Void;
	@:native("flight_swap_node_children")
	public static function swapNodeChildren(target:flight._cpp.FlightNode, child1:flight._cpp.FlightNode, child2:flight._cpp.FlightNode):Void;
	@:native("flight_swap_node_children_at")
	public static function swapNodeChildrenAt(target:flight._cpp.FlightNode, index1:Int, index2:Int):Void;
	@:native("flight_create_node_signals")
	public static function createNodeSignals():cpp.Star<cpp.Void>;
	@:native("flight_default_node_runtime_can_add_child")
	public static function defaultNodeRuntimeCanAddChild(target:flight._cpp.FlightNode, child:flight._cpp.FlightNode):Bool;
	@:native("flight_dispose_node")
	public static function disposeNode(target:flight._cpp.FlightNode):Void;
	@:native("flight_enable_node_signals")
	public static function enableNodeSignals(source:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_get_node_signals")
	public static function getNodeSignals(source:flight._cpp.FlightNode):cpp.Star<cpp.Void>;
	@:native("flight_set_node_enabled")
	public static function setNodeEnabled(target:flight._cpp.FlightNode, value:Bool):Bool;
	@:native("flight_add_node_color_adjustment")
	public static function addNodeColorAdjustment(source:flight._cpp.FlightNode, adjustment:flight._cpp.AdjustmentRef):Void;
	@:native("flight_set_node_color_adjustments_tint")
	public static function setNodeColorAdjustmentsTint(source:flight._cpp.FlightNode, tint:Int):Void;
	@:native("flight_create_node_order_list")
	public static function createNodeOrderList():flight._cpp.NodeOrderList;
	@:native("flight_add_node_order_list_entry")
	public static function addNodeOrderListEntry(list:flight._cpp.NodeOrderList, node:flight._cpp.FlightNode, sortKey:Float):Void;
	@:native("flight_apply_node_order_list")
	public static function applyNodeOrderList(target:flight._cpp.FlightNode, list:flight._cpp.NodeOrderList):Void;
	@:native("flight_clear_node_order_list")
	public static function clearNodeOrderList(list:flight._cpp.NodeOrderList):Void;
	@:native("flight_dispose_node_order_list")
	public static function disposeNodeOrderList(list:flight._cpp.NodeOrderList):Void;
	@:native("flight_for_each_node_order_list_entry")
	public static function forEachNodeOrderListEntry(list:flight._cpp.NodeOrderList, callback_Fn:cpp.Star<cpp.Void>, callback_Ctx:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_node_order_list_entry_sort_key")
	public static function getNodeOrderListEntrySortKey(list:flight._cpp.NodeOrderList, node:flight._cpp.FlightNode):Float;
	@:native("flight_has_node_order_list_entry")
	public static function hasNodeOrderListEntry(list:flight._cpp.NodeOrderList, node:flight._cpp.FlightNode):Bool;
	@:native("flight_remove_node_order_list_entry")
	public static function removeNodeOrderListEntry(list:flight._cpp.NodeOrderList, node:flight._cpp.FlightNode):Bool;
	@:native("flight_set_node_order_list_entry")
	public static function setNodeOrderListEntry(list:flight._cpp.NodeOrderList, node:flight._cpp.FlightNode, sortKey:Float):Void;
	@:native("flight_set_node_order_list_entry_above")
	public static function setNodeOrderListEntryAbove(list:flight._cpp.NodeOrderList, node:flight._cpp.FlightNode, target:flight._cpp.FlightNode):Void;
	@:native("flight_set_node_order_list_entry_below")
	public static function setNodeOrderListEntryBelow(list:flight._cpp.NodeOrderList, node:flight._cpp.FlightNode, target:flight._cpp.FlightNode):Void;
	@:native("flight_set_node_order_list_from_node_children")
	public static function setNodeOrderListFromNodeChildren(list:flight._cpp.NodeOrderList, source:flight._cpp.FlightNode):Void;
	@:native("flight_swap_node_order_list_entries")
	public static function swapNodeOrderListEntries(list:flight._cpp.NodeOrderList, nodeA:flight._cpp.FlightNode, nodeB:flight._cpp.FlightNode):Void;
	@:native("flight_get_node_local_matrix")
	public static function getNodeLocalMatrix(target:flight._cpp.FlightNode):flight._cpp.Matrix;
	@:native("flight_get_node_transform2d")
	public static function getNodeTransform2d(out:flight._cpp.Transform2D, source:flight._cpp.FlightNode):Void;
	@:native("flight_get_node_world_matrix")
	public static function getNodeWorldMatrix(target:flight._cpp.FlightNode):flight._cpp.Matrix;
	@:native("flight_set_node_local_matrix")
	public static function setNodeLocalMatrix(target:flight._cpp.FlightNode, source:flight._cpp.Matrix):Void;
	@:native("flight_set_node_transform2d")
	public static function setNodeTransform2d(target:flight._cpp.FlightNode, source:flight._cpp.Transform2D):Void;
	@:native("flight_compute_node_world_transform_revision")
	public static function computeNodeWorldTransformRevision(target:flight._cpp.FlightNode, parentWorldTransformId:haxe.Int64, root:flight._cpp.NodeRuntime):Void;
	@:native("flight_get_node_appearance_revision")
	public static function getNodeAppearanceRevision(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_node_children_revision")
	public static function getNodeChildrenRevision(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_node_local_bounds_revision")
	public static function getNodeLocalBoundsRevision(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_node_local_content_revision")
	public static function getNodeLocalContentRevision(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_node_local_transform_revision")
	public static function getNodeLocalTransformRevision(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_node_parent_reference_revision")
	public static function getNodeParentReferenceRevision(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_node_world_transform_revision")
	public static function getNodeWorldTransformRevision(source:flight._cpp.FlightNode):Int;
	@:native("flight_invalidate_content")
	public static function invalidateContent(target:flight._cpp.FlightNode):Void;
	@:native("flight_invalidate_node")
	public static function invalidateNode(target:flight._cpp.FlightNode):Void;
	@:native("flight_invalidate_node_appearance")
	public static function invalidateNodeAppearance(target:flight._cpp.FlightNode):Void;
	@:native("flight_invalidate_node_local_bounds")
	public static function invalidateNodeLocalBounds(target:flight._cpp.FlightNode):Void;
	@:native("flight_invalidate_node_local_content")
	public static function invalidateNodeLocalContent(target:flight._cpp.FlightNode):Void;
	@:native("flight_invalidate_node_local_transform")
	public static function invalidateNodeLocalTransform(target:flight._cpp.FlightNode):Void;
	@:native("flight_invalidate_node_parent_reference")
	public static function invalidateNodeParentReference(target:flight._cpp.FlightNode):Void;
	@:native("flight_invalidate_node_render")
	public static function invalidateNodeRender(target:flight._cpp.FlightNode):Void;
	@:native("flight_invalidate_node_world_bounds")
	public static function invalidateNodeWorldBounds(target:flight._cpp.FlightNode):Void;
	@:native("flight_compute_scene2d_fit_align_x")
	public static function computeScene2dFitAlignX(scaledContentWidth:Float, viewWidth:Float, align:flight._cpp.ViewportAlign):Float;
	@:native("flight_compute_scene2d_fit_align_y")
	public static function computeScene2dFitAlignY(scaledContentHeight:Float, viewHeight:Float, align:flight._cpp.ViewportAlign):Float;
	@:native("flight_compute_scene2d_fit_fill_scale")
	public static function computeScene2dFitFillScale(contentWidth:Float, contentHeight:Float, viewWidth:Float, viewHeight:Float):Float;
	@:native("flight_compute_scene2d_fit_scale")
	public static function computeScene2dFitScale(contentWidth:Float, contentHeight:Float, viewWidth:Float, viewHeight:Float):Float;
	@:native("flight_compute_scene2d_fit_transform")
	public static function computeScene2dFitTransform(out:flight._cpp.Matrix, scene2d:flight._cpp.Scene2DFitContext, viewWidth:Float, viewHeight:Float):Void;
	@:native("flight_find_node")
	public static function findNode(source:flight._cpp.FlightNode, predicateFn:cpp.Star<cpp.Void>, predicateCtx:cpp.Star<cpp.Void>):Null<flight._cpp.FlightNode>;
	@:native("flight_find_node_by_name")
	public static function findNodeByName(source:flight._cpp.FlightNode, name:cpp.ConstCharStar):Null<flight._cpp.FlightNode>;
	@:native("flight_for_each_node_ancestor")
	public static function forEachNodeAncestor(source:flight._cpp.FlightNode, callback_Fn:cpp.Star<cpp.Void>, callback_Ctx:cpp.Star<cpp.Void>):Void;
	@:native("flight_for_each_node_descendant")
	public static function forEachNodeDescendant(source:flight._cpp.FlightNode, callback_Fn:cpp.Star<cpp.Void>, callback_Ctx:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_node_children")
	public static function getNodeChildren(out:flight._cpp.FlightNodeArray, source:flight._cpp.FlightNode):Void;
	@:native("flight_get_node_depth")
	public static function getNodeDepth(source:flight._cpp.FlightNode):Int;
	@:native("flight_get_node_next_sibling")
	public static function getNodeNextSibling(source:flight._cpp.FlightNode):Null<flight._cpp.FlightNode>;
	@:native("flight_get_node_previous_sibling")
	public static function getNodePreviousSibling(source:flight._cpp.FlightNode):Null<flight._cpp.FlightNode>;
	@:native("flight_walk_node_descendants")
	public static function walkNodeDescendants(source:flight._cpp.FlightNode, visitFn:cpp.Star<cpp.Void>, visitCtx:cpp.Star<cpp.Void>):Bool;
	@:native("flight_create_viewport")
	public static function createViewport():flight._cpp.Viewport;
	@:native("flight_get_viewport_aspect")
	public static function getViewportAspect(viewport:flight._cpp.Viewport):Float;
	@:native("flight_free_node_signals_ref")
	public static function freeNodeSignalsRef(ptr:flight._cpp.NodeSignals):Void;
	@:native("flight_free_node_order_list")
	public static function freeNodeOrderList(ptr:flight._cpp.NodeOrderList):Void;
	@:native("flight_free_viewport")
	public static function freeViewport(ptr:flight._cpp.Viewport):Void;
}
