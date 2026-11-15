package flight._hl._fn;

extern class Node {
	@:hlNative("flight", "flight_compute_node_root_local_bounds_rectangle")
	public static function computeNodeRootLocalBoundsRectangle(out:flight._hl.Rectangle, root:Dynamic):Void;
	@:hlNative("flight", "flight_ensure_node_local_bounds_rectangle")
	public static function ensureNodeLocalBoundsRectangle(target:Dynamic):Void;
	@:hlNative("flight", "flight_ensure_node_parent_bounds_rectangle")
	public static function ensureNodeParentBoundsRectangle(target:Dynamic):Void;
	@:hlNative("flight", "flight_ensure_node_world_bounds_rectangle")
	public static function ensureNodeWorldBoundsRectangle(target:Dynamic):Void;
	@:hlNative("flight", "flight_get_node_height")
	public static function getNodeHeight(source:Dynamic):Single;
	@:hlNative("flight", "flight_get_node_local_bounds_rectangle")
	public static function getNodeLocalBoundsRectangle(target:Dynamic):flight._hl.Rectangle;
	@:hlNative("flight", "flight_get_node_parent_bounds_rectangle")
	public static function getNodeParentBoundsRectangle(target:Dynamic):flight._hl.Rectangle;
	@:hlNative("flight", "flight_get_node_width")
	public static function getNodeWidth(source:Dynamic):Single;
	@:hlNative("flight", "flight_get_node_world_bounds_rectangle")
	public static function getNodeWorldBoundsRectangle(target:Dynamic):flight._hl.Rectangle;
	@:hlNative("flight", "flight_set_node_height")
	public static function setNodeHeight(target:Dynamic, value:Single):Void;
	@:hlNative("flight", "flight_set_node_width")
	public static function setNodeWidth(target:Dynamic, value:Single):Void;
	@:hlNative("flight", "flight_are_node_guards_enabled")
	public static function areNodeGuardsEnabled(guards:flight._hl.NodeGuardState):Bool;
	@:hlNative("flight", "flight_disable_node_guards")
	public static function disableNodeGuards(guards:flight._hl.NodeGuardState):Void;
	@:hlNative("flight", "flight_enable_node_guards")
	public static function enableNodeGuards(guards:flight._hl.NodeGuardState, logState:Dynamic, clock:flight._hl.NodeGuardClock):Void;
	@:hlNative("flight", "flight_init_appearance_runtime_trait")
	public static function initAppearanceRuntimeTrait(target:flight._hl.HasAppearanceRuntime):Void;
	@:hlNative("flight", "flight_init_appearance_trait")
	public static function initAppearanceTrait(target:flight._hl.HasAppearance, obj:flight._hl.HasAppearanceOptions):Void;
	@:hlNative("flight", "flight_init_blend_mode_trait")
	public static function initBlendModeTrait(target:flight._hl.HasBlendMode, obj:flight._hl.HasBlendModeOptions):Void;
	@:hlNative("flight", "flight_default_compute_local_bounds_rectangle")
	public static function defaultComputeLocalBoundsRectangle(out:flight._hl.Rectangle, source:Dynamic):Void;
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
	public static function addNodeChild(target:Dynamic, child:Dynamic):Dynamic;
	@:hlNative("flight", "flight_add_node_child_at")
	public static function addNodeChildAt(target:Dynamic, child:Dynamic, index:Int):Dynamic;
	@:hlNative("flight", "flight_add_node_children")
	public static function addNodeChildren(target:Dynamic, children:hl.Bytes, childrenLen:Int):Void;
	@:hlNative("flight", "flight_contains_node_child")
	public static function containsNodeChild(source:Dynamic, child:Dynamic):Bool;
	@:hlNative("flight", "flight_for_each_node_child")
	public static function forEachNodeChild(source:Dynamic, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void;
	@:hlNative("flight", "flight_get_node_ancestors")
	public static function getNodeAncestors(out:Dynamic, source:Dynamic):Void;
	@:hlNative("flight", "flight_get_node_child_at")
	public static function getNodeChildAt(source:Dynamic, index:Int):Dynamic;
	@:hlNative("flight", "flight_get_node_child_by_name")
	public static function getNodeChildByName(source:Dynamic, name:hl.Bytes):Dynamic;
	@:hlNative("flight", "flight_get_node_child_count")
	public static function getNodeChildCount(source:Dynamic):Int;
	@:hlNative("flight", "flight_get_node_child_index")
	public static function getNodeChildIndex(source:Dynamic, child:Dynamic):Int;
	@:hlNative("flight", "flight_get_node_common_ancestor")
	public static function getNodeCommonAncestor(a:Dynamic, b:Dynamic):Dynamic;
	@:hlNative("flight", "flight_get_node_parent")
	public static function getNodeParent(source:Dynamic):Dynamic;
	@:hlNative("flight", "flight_get_node_root")
	public static function getNodeRoot(source:Dynamic):Dynamic;
	@:hlNative("flight", "flight_is_node_ancestor_of")
	public static function isNodeAncestorOf(ancestor:Dynamic, descendant:Dynamic):Bool;
	@:hlNative("flight", "flight_remove_node_child")
	public static function removeNodeChild(target:Dynamic, child:Dynamic):Dynamic;
	@:hlNative("flight", "flight_remove_node_child_at")
	public static function removeNodeChildAt(target:Dynamic, index:Int):Dynamic;
	@:hlNative("flight", "flight_remove_node_children")
	public static function removeNodeChildren(target:Dynamic, beginIndex:Int, endIndex:Int):Void;
	@:hlNative("flight", "flight_reparent_node")
	public static function reparentNode(child:Dynamic, newParent:Dynamic, guards:flight._hl.NodeGuardState):Bool;
	@:hlNative("flight", "flight_replace_node_child")
	public static function replaceNodeChild(target:Dynamic, oldChild:Dynamic, newChild:Dynamic):Void;
	@:hlNative("flight", "flight_set_node_child_index")
	public static function setNodeChildIndex(target:Dynamic, child:Dynamic, index:Int):Void;
	@:hlNative("flight", "flight_swap_node_children")
	public static function swapNodeChildren(target:Dynamic, child1:Dynamic, child2:Dynamic):Void;
	@:hlNative("flight", "flight_swap_node_children_at")
	public static function swapNodeChildrenAt(target:Dynamic, index1:Int, index2:Int):Void;
	@:hlNative("flight", "flight_create_node_runtime")
	public static function createNodeRuntime(methods:flight._hl.NodeRuntimeMethods):flight._hl.NodeRuntime;
	@:hlNative("flight", "flight_create_node_signals")
	public static function createNodeSignals():Dynamic;
	@:hlNative("flight", "flight_default_node_runtime_can_add_child")
	public static function defaultNodeRuntimeCanAddChild(target:Dynamic, child:Dynamic):Bool;
	@:hlNative("flight", "flight_dispose_node")
	public static function disposeNode(target:Dynamic):Void;
	@:hlNative("flight", "flight_enable_node_signals")
	public static function enableNodeSignals(source:Dynamic):Dynamic;
	@:hlNative("flight", "flight_get_node_runtime")
	public static function getNodeRuntime(source:Dynamic):flight._hl.NodeRuntime;
	@:hlNative("flight", "flight_get_node_signals")
	public static function getNodeSignals(source:Dynamic):Dynamic;
	@:hlNative("flight", "flight_set_node_enabled")
	public static function setNodeEnabled(target:Dynamic, value:Bool):Void;
	@:hlNative("flight", "flight_set_node_color_adjustments_tint")
	public static function setNodeColorAdjustmentsTint(source:Dynamic, tint:Int):Void;
	@:hlNative("flight", "flight_create_node_order_list")
	public static function createNodeOrderList():flight._hl.NodeOrderList;
	@:hlNative("flight", "flight_add_node_order_list_entry")
	public static function addNodeOrderListEntry(list:flight._hl.NodeOrderList, node:Dynamic, sortKey:Float):Void;
	@:hlNative("flight", "flight_apply_node_order_list")
	public static function applyNodeOrderList(target:Dynamic, list:flight._hl.NodeOrderList):Void;
	@:hlNative("flight", "flight_clear_node_order_list")
	public static function clearNodeOrderList(list:flight._hl.NodeOrderList):Void;
	@:hlNative("flight", "flight_dispose_node_order_list")
	public static function disposeNodeOrderList(list:flight._hl.NodeOrderList):Void;
	@:hlNative("flight", "flight_for_each_node_order_list_entry")
	public static function forEachNodeOrderListEntry(list:flight._hl.NodeOrderList, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void;
	@:hlNative("flight", "flight_get_node_order_list_entry_sort_key")
	public static function getNodeOrderListEntrySortKey(list:flight._hl.NodeOrderList, node:Dynamic):Float;
	@:hlNative("flight", "flight_has_node_order_list_entry")
	public static function hasNodeOrderListEntry(list:flight._hl.NodeOrderList, node:Dynamic):Bool;
	@:hlNative("flight", "flight_remove_node_order_list_entry")
	public static function removeNodeOrderListEntry(list:flight._hl.NodeOrderList, node:Dynamic):Bool;
	@:hlNative("flight", "flight_set_node_order_list_entry")
	public static function setNodeOrderListEntry(list:flight._hl.NodeOrderList, node:Dynamic, sortKey:Float):Void;
	@:hlNative("flight", "flight_set_node_order_list_entry_above")
	public static function setNodeOrderListEntryAbove(list:flight._hl.NodeOrderList, node:Dynamic, target:Dynamic):Void;
	@:hlNative("flight", "flight_set_node_order_list_entry_below")
	public static function setNodeOrderListEntryBelow(list:flight._hl.NodeOrderList, node:Dynamic, target:Dynamic):Void;
	@:hlNative("flight", "flight_set_node_order_list_from_node_children")
	public static function setNodeOrderListFromNodeChildren(list:flight._hl.NodeOrderList, source:Dynamic):Void;
	@:hlNative("flight", "flight_swap_node_order_list_entries")
	public static function swapNodeOrderListEntries(list:flight._hl.NodeOrderList, nodeA:Dynamic, nodeB:Dynamic):Void;
	@:hlNative("flight", "flight_get_node_local_matrix")
	public static function getNodeLocalMatrix(target:Dynamic):flight._hl.Matrix;
	@:hlNative("flight", "flight_get_node_transform2d")
	public static function getNodeTransform2d(out:flight._hl.Transform2D, source:Dynamic):Void;
	@:hlNative("flight", "flight_get_node_world_matrix")
	public static function getNodeWorldMatrix(target:Dynamic):flight._hl.Matrix;
	@:hlNative("flight", "flight_set_node_local_matrix")
	public static function setNodeLocalMatrix(target:Dynamic, source:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_set_node_transform2d")
	public static function setNodeTransform2d(target:Dynamic, source:flight._hl.Transform2D):Void;
	@:hlNative("flight", "flight_compute_node_world_transform_revision")
	public static function computeNodeWorldTransformRevision(target:Dynamic, parentWorldTransformId:Int, root:flight._hl.NodeRuntime):Void;
	@:hlNative("flight", "flight_get_node_appearance_revision")
	public static function getNodeAppearanceRevision(source:Dynamic):Int;
	@:hlNative("flight", "flight_get_node_children_revision")
	public static function getNodeChildrenRevision(source:Dynamic):Int;
	@:hlNative("flight", "flight_get_node_local_bounds_revision")
	public static function getNodeLocalBoundsRevision(source:Dynamic):Int;
	@:hlNative("flight", "flight_get_node_local_content_revision")
	public static function getNodeLocalContentRevision(source:Dynamic):Int;
	@:hlNative("flight", "flight_get_node_local_transform_revision")
	public static function getNodeLocalTransformRevision(source:Dynamic):Int;
	@:hlNative("flight", "flight_get_node_parent_reference_revision")
	public static function getNodeParentReferenceRevision(source:Dynamic):Int;
	@:hlNative("flight", "flight_get_node_world_transform_revision")
	public static function getNodeWorldTransformRevision(source:Dynamic):Int;
	@:hlNative("flight", "flight_invalidate_content")
	public static function invalidateContent(target:Dynamic):Void;
	@:hlNative("flight", "flight_invalidate_node")
	public static function invalidateNode(target:Dynamic):Void;
	@:hlNative("flight", "flight_invalidate_node_appearance")
	public static function invalidateNodeAppearance(target:Dynamic):Void;
	@:hlNative("flight", "flight_invalidate_node_local_bounds")
	public static function invalidateNodeLocalBounds(target:Dynamic):Void;
	@:hlNative("flight", "flight_invalidate_node_local_content")
	public static function invalidateNodeLocalContent(target:Dynamic):Void;
	@:hlNative("flight", "flight_invalidate_node_local_transform")
	public static function invalidateNodeLocalTransform(target:Dynamic):Void;
	@:hlNative("flight", "flight_invalidate_node_parent_reference")
	public static function invalidateNodeParentReference(target:Dynamic):Void;
	@:hlNative("flight", "flight_invalidate_node_render")
	public static function invalidateNodeRender(target:Dynamic):Void;
	@:hlNative("flight", "flight_invalidate_node_world_bounds")
	public static function invalidateNodeWorldBounds(target:Dynamic):Void;
	@:hlNative("flight", "flight_compute_scene2d_fit_align_x")
	public static function computeScene2dFitAlignX(scaledContentWidth:Single, viewWidth:Single, align:Int):Single;
	@:hlNative("flight", "flight_compute_scene2d_fit_align_y")
	public static function computeScene2dFitAlignY(scaledContentHeight:Single, viewHeight:Single, align:Int):Single;
	@:hlNative("flight", "flight_compute_scene2d_fit_fill_scale")
	public static function computeScene2dFitFillScale(contentWidth:Single, contentHeight:Single, viewWidth:Single, viewHeight:Single):Single;
	@:hlNative("flight", "flight_compute_scene2d_fit_scale")
	public static function computeScene2dFitScale(contentWidth:Single, contentHeight:Single, viewWidth:Single, viewHeight:Single):Single;
	@:hlNative("flight", "flight_compute_scene2d_fit_transform")
	public static function computeScene2dFitTransform(out:flight._hl.Matrix, scene2d:flight._hl.Scene2DFitContext, viewWidth:Single, viewHeight:Single):Void;
	@:hlNative("flight", "flight_find_node")
	public static function findNode(source:Dynamic, predicateFn:Dynamic, predicateCtx:Dynamic):Dynamic;
	@:hlNative("flight", "flight_find_node_by_name")
	public static function findNodeByName(source:Dynamic, name:hl.Bytes):Dynamic;
	@:hlNative("flight", "flight_for_each_node_ancestor")
	public static function forEachNodeAncestor(source:Dynamic, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void;
	@:hlNative("flight", "flight_for_each_node_descendant")
	public static function forEachNodeDescendant(source:Dynamic, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void;
	@:hlNative("flight", "flight_get_node_children")
	public static function getNodeChildren(out:Dynamic, source:Dynamic):Void;
	@:hlNative("flight", "flight_get_node_depth")
	public static function getNodeDepth(source:Dynamic):Int;
	@:hlNative("flight", "flight_get_node_next_sibling")
	public static function getNodeNextSibling(source:Dynamic):Dynamic;
	@:hlNative("flight", "flight_get_node_previous_sibling")
	public static function getNodePreviousSibling(source:Dynamic):Dynamic;
	@:hlNative("flight", "flight_walk_node_descendants")
	public static function walkNodeDescendants(source:Dynamic, visitFn:Dynamic, visitCtx:Dynamic):Bool;
	@:hlNative("flight", "flight_create_viewport")
	public static function createViewport():flight._hl.Viewport;
	@:hlNative("flight", "flight_get_viewport_aspect")
	public static function getViewportAspect(viewport:flight._hl.Viewport):Single;
	@:hlNative("flight", "flight_free_node_runtime")
	public static function freeNodeRuntime(ptr:flight._hl.NodeRuntime):Void;
	@:hlNative("flight", "flight_free_node_order_list")
	public static function freeNodeOrderList(ptr:flight._hl.NodeOrderList):Void;
	@:hlNative("flight", "flight_free_viewport")
	public static function freeViewport(ptr:flight._hl.Viewport):Void;
}
