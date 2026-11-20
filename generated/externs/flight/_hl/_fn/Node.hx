package flight._hl._fn;

extern class Node {
	@:hlNative("flight", "flight_compute_node_bounds_rectangle")
	public static function computeNodeBoundsRectangle(out:flight._hl.Rectangle, source:flight._hl.FlightNode, targetCoordinateSpace:Null<flight._hl.FlightNode>):Void;
	@:hlNative("flight", "flight_compute_node_root_local_bounds_rectangle")
	public static function computeNodeRootLocalBoundsRectangle(out:flight._hl.Rectangle, root:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_ensure_node_local_bounds_rectangle")
	public static function ensureNodeLocalBoundsRectangle(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_ensure_node_parent_bounds_rectangle")
	public static function ensureNodeParentBoundsRectangle(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_ensure_node_world_bounds_rectangle")
	public static function ensureNodeWorldBoundsRectangle(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_get_node_height")
	public static function getNodeHeight(source:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_get_node_local_bounds_rectangle")
	public static function getNodeLocalBoundsRectangle(target:flight._hl.FlightNode):flight._hl.Rectangle;
	@:hlNative("flight", "flight_get_node_parent_bounds_rectangle")
	public static function getNodeParentBoundsRectangle(target:flight._hl.FlightNode):flight._hl.Rectangle;
	@:hlNative("flight", "flight_get_node_width")
	public static function getNodeWidth(source:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_get_node_world_bounds_rectangle")
	public static function getNodeWorldBoundsRectangle(target:flight._hl.FlightNode):flight._hl.Rectangle;
	@:hlNative("flight", "flight_set_node_height")
	public static function setNodeHeight(target:flight._hl.FlightNode, value:Float):Void;
	@:hlNative("flight", "flight_set_node_width")
	public static function setNodeWidth(target:flight._hl.FlightNode, value:Float):Void;
	@:hlNative("flight", "flight_are_node_guards_enabled")
	public static function areNodeGuardsEnabled(guards:flight._hl.NodeGuardState):Bool;
	@:hlNative("flight", "flight_disable_node_guards")
	public static function disableNodeGuards(guards:flight._hl.NodeGuardState):Void;
	@:hlNative("flight", "flight_init_appearance_runtime_trait")
	public static function initAppearanceRuntimeTrait(target:flight._hl.HasAppearanceRuntime):Void;
	@:hlNative("flight", "flight_init_appearance_trait")
	public static function initAppearanceTrait(target:flight._hl.HasAppearance, obj:flight._hl.HasAppearanceOptions):Void;
	@:hlNative("flight", "flight_init_blend_mode_trait")
	public static function initBlendModeTrait(target:flight._hl.HasBlendMode, obj:flight._hl.HasBlendModeOptions):Void;
	@:hlNative("flight", "flight_default_compute_local_bounds_rectangle")
	public static function defaultComputeLocalBoundsRectangle(out:flight._hl.Rectangle, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_init_bounds_rectangle_trait")
	public static function initBoundsRectangleTrait(target:flight._hl.HasBoundsRectangle, obj:flight._hl.HasBoundsRectangleOptions):Void;
	@:hlNative("flight", "flight_init_clip_trait")
	public static function initClipTrait(target:flight._hl.HasClip, obj:flight._hl.HasClipOptions):Void;
	@:hlNative("flight", "flight_init_material_trait")
	public static function initMaterialTrait(target:flight._hl.HasMaterial, obj:flight._hl.HasMaterialOptions):Void;
	@:hlNative("flight", "flight_init_transform2d_trait")
	public static function initTransform2dTrait(target:flight._hl.HasTransform2D, obj:flight._hl.HasTransform2DOptions):Void;
	@:hlNative("flight", "flight_init_transform3d_runtime_trait")
	public static function initTransform3dRuntimeTrait(target:flight._hl.HasTransform3DRuntime):Void;
	@:hlNative("flight", "flight_init_transform3d_trait")
	public static function initTransform3dTrait(target:flight._hl.HasTransform3D, obj:flight._hl.HasTransform3DOptions):Void;
	@:hlNative("flight", "flight_add_node_child")
	public static function addNodeChild(target:flight._hl.FlightNode, child:flight._hl.FlightNode):flight._hl.FlightNode;
	@:hlNative("flight", "flight_add_node_child_at")
	public static function addNodeChildAt(target:flight._hl.FlightNode, child:flight._hl.FlightNode, index:Int):flight._hl.FlightNode;
	@:hlNative("flight", "flight_add_node_children")
	public static function addNodeChildren(target:flight._hl.FlightNode, children:flight._hl.FlightNodeArray):Void;
	@:hlNative("flight", "flight_contains_node_child")
	public static function containsNodeChild(source:flight._hl.FlightNode, child:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_for_each_node_child")
	public static function forEachNodeChild(source:flight._hl.FlightNode, callback_Fn:hl.Bytes, callback_Ctx:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_node_ancestors")
	public static function getNodeAncestors(out:flight._hl.FlightNodeArray, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_get_node_child_at")
	public static function getNodeChildAt(source:flight._hl.FlightNode, index:Int):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_get_node_child_by_name")
	public static function getNodeChildByName(source:flight._hl.FlightNode, name:hl.Bytes):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_get_node_child_count")
	public static function getNodeChildCount(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_node_child_index")
	public static function getNodeChildIndex(source:flight._hl.FlightNode, child:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_node_common_ancestor")
	public static function getNodeCommonAncestor(a:flight._hl.FlightNode, b:flight._hl.FlightNode):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_get_node_parent")
	public static function getNodeParent(source:flight._hl.FlightNode):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_get_node_root")
	public static function getNodeRoot(source:flight._hl.FlightNode):flight._hl.FlightNode;
	@:hlNative("flight", "flight_is_node_ancestor_of")
	public static function isNodeAncestorOf(ancestor:flight._hl.FlightNode, descendant:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_remove_node_child")
	public static function removeNodeChild(target:flight._hl.FlightNode, child:flight._hl.FlightNode):flight._hl.FlightNode;
	@:hlNative("flight", "flight_remove_node_child_at")
	public static function removeNodeChildAt(target:flight._hl.FlightNode, index:Int):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_remove_node_children")
	public static function removeNodeChildren(target:flight._hl.FlightNode, beginIndex:Int, endIndex:Int):Void;
	@:hlNative("flight", "flight_reparent_node")
	public static function reparentNode(child:flight._hl.FlightNode, newParent:flight._hl.FlightNode, guards:flight._hl.NodeGuardState):Bool;
	@:hlNative("flight", "flight_replace_node_child")
	public static function replaceNodeChild(target:flight._hl.FlightNode, oldChild:flight._hl.FlightNode, newChild:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_set_node_child_index")
	public static function setNodeChildIndex(target:flight._hl.FlightNode, child:flight._hl.FlightNode, index:Int):Void;
	@:hlNative("flight", "flight_swap_node_children")
	public static function swapNodeChildren(target:flight._hl.FlightNode, child1:flight._hl.FlightNode, child2:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_swap_node_children_at")
	public static function swapNodeChildrenAt(target:flight._hl.FlightNode, index1:Int, index2:Int):Void;
	@:hlNative("flight", "flight_create_node_signals")
	public static function createNodeSignals():hl.Bytes;
	@:hlNative("flight", "flight_default_node_runtime_can_add_child")
	public static function defaultNodeRuntimeCanAddChild(target:flight._hl.FlightNode, child:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_dispose_node")
	public static function disposeNode(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_enable_node_signals")
	public static function enableNodeSignals(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_get_node_signals")
	public static function getNodeSignals(source:flight._hl.FlightNode):hl.Bytes;
	@:hlNative("flight", "flight_set_node_enabled")
	public static function setNodeEnabled(target:flight._hl.FlightNode, value:Bool):Bool;
	@:hlNative("flight", "flight_add_node_color_adjustment")
	public static function addNodeColorAdjustment(source:flight._hl.FlightNode, adjustment:flight._hl.AdjustmentRef):Void;
	@:hlNative("flight", "flight_set_node_color_adjustments_tint")
	public static function setNodeColorAdjustmentsTint(source:flight._hl.FlightNode, tint:Int):Void;
	@:hlNative("flight", "flight_create_node_order_list")
	public static function createNodeOrderList():flight._hl.NodeOrderList;
	@:hlNative("flight", "flight_add_node_order_list_entry")
	public static function addNodeOrderListEntry(list:flight._hl.NodeOrderList, node:flight._hl.FlightNode, sortKey:Float):Void;
	@:hlNative("flight", "flight_apply_node_order_list")
	public static function applyNodeOrderList(target:flight._hl.FlightNode, list:flight._hl.NodeOrderList):Void;
	@:hlNative("flight", "flight_clear_node_order_list")
	public static function clearNodeOrderList(list:flight._hl.NodeOrderList):Void;
	@:hlNative("flight", "flight_dispose_node_order_list")
	public static function disposeNodeOrderList(list:flight._hl.NodeOrderList):Void;
	@:hlNative("flight", "flight_for_each_node_order_list_entry")
	public static function forEachNodeOrderListEntry(list:flight._hl.NodeOrderList, callback_Fn:hl.Bytes, callback_Ctx:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_node_order_list_entry_sort_key")
	public static function getNodeOrderListEntrySortKey(list:flight._hl.NodeOrderList, node:flight._hl.FlightNode):Float;
	@:hlNative("flight", "flight_has_node_order_list_entry")
	public static function hasNodeOrderListEntry(list:flight._hl.NodeOrderList, node:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_remove_node_order_list_entry")
	public static function removeNodeOrderListEntry(list:flight._hl.NodeOrderList, node:flight._hl.FlightNode):Bool;
	@:hlNative("flight", "flight_set_node_order_list_entry")
	public static function setNodeOrderListEntry(list:flight._hl.NodeOrderList, node:flight._hl.FlightNode, sortKey:Float):Void;
	@:hlNative("flight", "flight_set_node_order_list_entry_above")
	public static function setNodeOrderListEntryAbove(list:flight._hl.NodeOrderList, node:flight._hl.FlightNode, target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_set_node_order_list_entry_below")
	public static function setNodeOrderListEntryBelow(list:flight._hl.NodeOrderList, node:flight._hl.FlightNode, target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_set_node_order_list_from_node_children")
	public static function setNodeOrderListFromNodeChildren(list:flight._hl.NodeOrderList, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_swap_node_order_list_entries")
	public static function swapNodeOrderListEntries(list:flight._hl.NodeOrderList, nodeA:flight._hl.FlightNode, nodeB:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_get_node_local_matrix")
	public static function getNodeLocalMatrix(target:flight._hl.FlightNode):flight._hl.Matrix;
	@:hlNative("flight", "flight_get_node_transform2d")
	public static function getNodeTransform2d(out:flight._hl.Transform2D, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_get_node_world_matrix")
	public static function getNodeWorldMatrix(target:flight._hl.FlightNode):flight._hl.Matrix;
	@:hlNative("flight", "flight_set_node_local_matrix")
	public static function setNodeLocalMatrix(target:flight._hl.FlightNode, source:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_set_node_transform2d")
	public static function setNodeTransform2d(target:flight._hl.FlightNode, source:flight._hl.Transform2D):Void;
	@:hlNative("flight", "flight_compute_node_world_transform_revision")
	public static function computeNodeWorldTransformRevision(target:flight._hl.FlightNode, parentWorldTransformId:haxe.Int64, root:flight._hl.NodeRuntime):Void;
	@:hlNative("flight", "flight_get_node_appearance_revision")
	public static function getNodeAppearanceRevision(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_node_children_revision")
	public static function getNodeChildrenRevision(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_node_local_bounds_revision")
	public static function getNodeLocalBoundsRevision(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_node_local_content_revision")
	public static function getNodeLocalContentRevision(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_node_local_transform_revision")
	public static function getNodeLocalTransformRevision(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_node_parent_reference_revision")
	public static function getNodeParentReferenceRevision(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_node_world_transform_revision")
	public static function getNodeWorldTransformRevision(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_invalidate_content")
	public static function invalidateContent(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_invalidate_node")
	public static function invalidateNode(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_invalidate_node_appearance")
	public static function invalidateNodeAppearance(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_invalidate_node_local_bounds")
	public static function invalidateNodeLocalBounds(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_invalidate_node_local_content")
	public static function invalidateNodeLocalContent(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_invalidate_node_local_transform")
	public static function invalidateNodeLocalTransform(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_invalidate_node_parent_reference")
	public static function invalidateNodeParentReference(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_invalidate_node_render")
	public static function invalidateNodeRender(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_invalidate_node_world_bounds")
	public static function invalidateNodeWorldBounds(target:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_compute_scene2d_fit_align_x")
	public static function computeScene2dFitAlignX(scaledContentWidth:Float, viewWidth:Float, align:flight._hl.ViewportAlign):Float;
	@:hlNative("flight", "flight_compute_scene2d_fit_align_y")
	public static function computeScene2dFitAlignY(scaledContentHeight:Float, viewHeight:Float, align:flight._hl.ViewportAlign):Float;
	@:hlNative("flight", "flight_compute_scene2d_fit_fill_scale")
	public static function computeScene2dFitFillScale(contentWidth:Float, contentHeight:Float, viewWidth:Float, viewHeight:Float):Float;
	@:hlNative("flight", "flight_compute_scene2d_fit_scale")
	public static function computeScene2dFitScale(contentWidth:Float, contentHeight:Float, viewWidth:Float, viewHeight:Float):Float;
	@:hlNative("flight", "flight_compute_scene2d_fit_transform")
	public static function computeScene2dFitTransform(out:flight._hl.Matrix, scene2d:flight._hl.Scene2DFitContext, viewWidth:Float, viewHeight:Float):Void;
	@:hlNative("flight", "flight_find_node")
	public static function findNode(source:flight._hl.FlightNode, predicateFn:hl.Bytes, predicateCtx:hl.Bytes):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_find_node_by_name")
	public static function findNodeByName(source:flight._hl.FlightNode, name:hl.Bytes):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_for_each_node_ancestor")
	public static function forEachNodeAncestor(source:flight._hl.FlightNode, callback_Fn:hl.Bytes, callback_Ctx:hl.Bytes):Void;
	@:hlNative("flight", "flight_for_each_node_descendant")
	public static function forEachNodeDescendant(source:flight._hl.FlightNode, callback_Fn:hl.Bytes, callback_Ctx:hl.Bytes):Void;
	@:hlNative("flight", "flight_get_node_children")
	public static function getNodeChildren(out:flight._hl.FlightNodeArray, source:flight._hl.FlightNode):Void;
	@:hlNative("flight", "flight_get_node_depth")
	public static function getNodeDepth(source:flight._hl.FlightNode):Int;
	@:hlNative("flight", "flight_get_node_next_sibling")
	public static function getNodeNextSibling(source:flight._hl.FlightNode):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_get_node_previous_sibling")
	public static function getNodePreviousSibling(source:flight._hl.FlightNode):Null<flight._hl.FlightNode>;
	@:hlNative("flight", "flight_walk_node_descendants")
	public static function walkNodeDescendants(source:flight._hl.FlightNode, visitFn:hl.Bytes, visitCtx:hl.Bytes):Bool;
	@:hlNative("flight", "flight_create_viewport")
	public static function createViewport():flight._hl.Viewport;
	@:hlNative("flight", "flight_get_viewport_aspect")
	public static function getViewportAspect(viewport:flight._hl.Viewport):Float;
	@:hlNative("flight", "flight_free_node_signals_ref")
	public static function freeNodeSignalsRef(ptr:flight._hl.NodeSignals):Void;
	@:hlNative("flight", "flight_free_node_order_list")
	public static function freeNodeOrderList(ptr:flight._hl.NodeOrderList):Void;
	@:hlNative("flight", "flight_free_viewport")
	public static function freeViewport(ptr:flight._hl.Viewport):Void;
}
