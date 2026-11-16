package flight._cpp._fn;

extern class Node {
	@:native("flight_compute_node_root_local_bounds_rectangle")
	public static function computeNodeRootLocalBoundsRectangle(out:flight._cpp.Rectangle, root:cpp.Star<cpp.Void>):Void;
	@:native("flight_ensure_node_local_bounds_rectangle")
	public static function ensureNodeLocalBoundsRectangle(target:cpp.Star<cpp.Void>):Void;
	@:native("flight_ensure_node_parent_bounds_rectangle")
	public static function ensureNodeParentBoundsRectangle(target:cpp.Star<cpp.Void>):Void;
	@:native("flight_ensure_node_world_bounds_rectangle")
	public static function ensureNodeWorldBoundsRectangle(target:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_node_height")
	public static function getNodeHeight(source:cpp.Star<cpp.Void>):Single;
	@:native("flight_get_node_local_bounds_rectangle")
	public static function getNodeLocalBoundsRectangle(target:cpp.Star<cpp.Void>):flight._cpp.Rectangle;
	@:native("flight_get_node_parent_bounds_rectangle")
	public static function getNodeParentBoundsRectangle(target:cpp.Star<cpp.Void>):flight._cpp.Rectangle;
	@:native("flight_get_node_width")
	public static function getNodeWidth(source:cpp.Star<cpp.Void>):Single;
	@:native("flight_get_node_world_bounds_rectangle")
	public static function getNodeWorldBoundsRectangle(target:cpp.Star<cpp.Void>):flight._cpp.Rectangle;
	@:native("flight_set_node_height")
	public static function setNodeHeight(target:cpp.Star<cpp.Void>, value:Single):Void;
	@:native("flight_set_node_width")
	public static function setNodeWidth(target:cpp.Star<cpp.Void>, value:Single):Void;
	@:native("flight_are_node_guards_enabled")
	public static function areNodeGuardsEnabled(guards:flight._cpp.NodeGuardState):Bool;
	@:native("flight_disable_node_guards")
	public static function disableNodeGuards(guards:flight._cpp.NodeGuardState):Void;
	@:native("flight_enable_node_guards")
	public static function enableNodeGuards(guards:flight._cpp.NodeGuardState, logState:cpp.Star<cpp.Void>, clockFn:cpp.Star<cpp.Void>, clockCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_init_appearance_runtime_trait")
	public static function initAppearanceRuntimeTrait(target:flight._cpp.HasAppearanceRuntime):Void;
	@:native("flight_init_appearance_trait")
	public static function initAppearanceTrait(target:flight._cpp.HasAppearance, obj:flight._cpp.HasAppearanceOptions):Void;
	@:native("flight_init_blend_mode_trait")
	public static function initBlendModeTrait(target:flight._cpp.HasBlendMode, obj:flight._cpp.HasBlendModeOptions):Void;
	@:native("flight_default_compute_local_bounds_rectangle")
	public static function defaultComputeLocalBoundsRectangle(out:flight._cpp.Rectangle, source:cpp.Star<cpp.Void>):Void;
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
	public static function addNodeChild(target:cpp.Star<cpp.Void>, child:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_add_node_child_at")
	public static function addNodeChildAt(target:cpp.Star<cpp.Void>, child:cpp.Star<cpp.Void>, index:Int):cpp.Star<cpp.Void>;
	@:native("flight_add_node_children")
	public static function addNodeChildren(target:cpp.Star<cpp.Void>, children:cpp.Star<cpp.Void>, childrenLen:Int):Void;
	@:native("flight_contains_node_child")
	public static function containsNodeChild(source:cpp.Star<cpp.Void>, child:cpp.Star<cpp.Void>):Bool;
	@:native("flight_for_each_node_child")
	public static function forEachNodeChild(source:cpp.Star<cpp.Void>, callback_Fn:cpp.Star<cpp.Void>, callback_Ctx:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_node_ancestors")
	public static function getNodeAncestors(out:cpp.Star<cpp.Void>, source:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_node_child_at")
	public static function getNodeChildAt(source:cpp.Star<cpp.Void>, index:Int):cpp.Star<cpp.Void>;
	@:native("flight_get_node_child_by_name")
	public static function getNodeChildByName(source:cpp.Star<cpp.Void>, name:cpp.ConstCharStar):cpp.Star<cpp.Void>;
	@:native("flight_get_node_child_count")
	public static function getNodeChildCount(source:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_node_child_index")
	public static function getNodeChildIndex(source:cpp.Star<cpp.Void>, child:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_node_common_ancestor")
	public static function getNodeCommonAncestor(a:cpp.Star<cpp.Void>, b:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_node_parent")
	public static function getNodeParent(source:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_node_root")
	public static function getNodeRoot(source:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_is_node_ancestor_of")
	public static function isNodeAncestorOf(ancestor:cpp.Star<cpp.Void>, descendant:cpp.Star<cpp.Void>):Bool;
	@:native("flight_remove_node_child")
	public static function removeNodeChild(target:cpp.Star<cpp.Void>, child:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_remove_node_child_at")
	public static function removeNodeChildAt(target:cpp.Star<cpp.Void>, index:Int):cpp.Star<cpp.Void>;
	@:native("flight_remove_node_children")
	public static function removeNodeChildren(target:cpp.Star<cpp.Void>, beginIndex:Int, endIndex:Int):Void;
	@:native("flight_reparent_node")
	public static function reparentNode(child:cpp.Star<cpp.Void>, newParent:cpp.Star<cpp.Void>, guards:flight._cpp.NodeGuardState):Bool;
	@:native("flight_replace_node_child")
	public static function replaceNodeChild(target:cpp.Star<cpp.Void>, oldChild:cpp.Star<cpp.Void>, newChild:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_node_child_index")
	public static function setNodeChildIndex(target:cpp.Star<cpp.Void>, child:cpp.Star<cpp.Void>, index:Int):Void;
	@:native("flight_swap_node_children")
	public static function swapNodeChildren(target:cpp.Star<cpp.Void>, child1:cpp.Star<cpp.Void>, child2:cpp.Star<cpp.Void>):Void;
	@:native("flight_swap_node_children_at")
	public static function swapNodeChildrenAt(target:cpp.Star<cpp.Void>, index1:Int, index2:Int):Void;
	@:native("flight_create_node_runtime")
	public static function createNodeRuntime(methods:flight._cpp.NodeRuntimeMethods):flight._cpp.NodeRuntime;
	@:native("flight_create_node_signals")
	public static function createNodeSignals():cpp.Star<cpp.Void>;
	@:native("flight_default_node_runtime_can_add_child")
	public static function defaultNodeRuntimeCanAddChild(target:cpp.Star<cpp.Void>, child:cpp.Star<cpp.Void>):Bool;
	@:native("flight_dispose_node")
	public static function disposeNode(target:cpp.Star<cpp.Void>):Void;
	@:native("flight_enable_node_signals")
	public static function enableNodeSignals(source:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_node_runtime")
	public static function getNodeRuntime(source:cpp.Star<cpp.Void>):flight._cpp.NodeRuntime;
	@:native("flight_get_node_signals")
	public static function getNodeSignals(source:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_set_node_enabled")
	public static function setNodeEnabled(target:cpp.Star<cpp.Void>, value:Bool):Void;
	@:native("flight_set_node_color_adjustments_tint")
	public static function setNodeColorAdjustmentsTint(source:cpp.Star<cpp.Void>, tint:Int):Void;
	@:native("flight_create_node_order_list")
	public static function createNodeOrderList():flight._cpp.NodeOrderList;
	@:native("flight_add_node_order_list_entry")
	public static function addNodeOrderListEntry(list:flight._cpp.NodeOrderList, node:cpp.Star<cpp.Void>, sortKey:Float):Void;
	@:native("flight_apply_node_order_list")
	public static function applyNodeOrderList(target:cpp.Star<cpp.Void>, list:flight._cpp.NodeOrderList):Void;
	@:native("flight_clear_node_order_list")
	public static function clearNodeOrderList(list:flight._cpp.NodeOrderList):Void;
	@:native("flight_dispose_node_order_list")
	public static function disposeNodeOrderList(list:flight._cpp.NodeOrderList):Void;
	@:native("flight_for_each_node_order_list_entry")
	public static function forEachNodeOrderListEntry(list:flight._cpp.NodeOrderList, callback_Fn:cpp.Star<cpp.Void>, callback_Ctx:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_node_order_list_entry_sort_key")
	public static function getNodeOrderListEntrySortKey(list:flight._cpp.NodeOrderList, node:cpp.Star<cpp.Void>):Float;
	@:native("flight_has_node_order_list_entry")
	public static function hasNodeOrderListEntry(list:flight._cpp.NodeOrderList, node:cpp.Star<cpp.Void>):Bool;
	@:native("flight_remove_node_order_list_entry")
	public static function removeNodeOrderListEntry(list:flight._cpp.NodeOrderList, node:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_node_order_list_entry")
	public static function setNodeOrderListEntry(list:flight._cpp.NodeOrderList, node:cpp.Star<cpp.Void>, sortKey:Float):Void;
	@:native("flight_set_node_order_list_entry_above")
	public static function setNodeOrderListEntryAbove(list:flight._cpp.NodeOrderList, node:cpp.Star<cpp.Void>, target:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_node_order_list_entry_below")
	public static function setNodeOrderListEntryBelow(list:flight._cpp.NodeOrderList, node:cpp.Star<cpp.Void>, target:cpp.Star<cpp.Void>):Void;
	@:native("flight_set_node_order_list_from_node_children")
	public static function setNodeOrderListFromNodeChildren(list:flight._cpp.NodeOrderList, source:cpp.Star<cpp.Void>):Void;
	@:native("flight_swap_node_order_list_entries")
	public static function swapNodeOrderListEntries(list:flight._cpp.NodeOrderList, nodeA:cpp.Star<cpp.Void>, nodeB:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_node_local_matrix")
	public static function getNodeLocalMatrix(target:cpp.Star<cpp.Void>):flight._cpp.Matrix;
	@:native("flight_get_node_transform2d")
	public static function getNodeTransform2d(out:flight._cpp.Transform2D, source:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_node_world_matrix")
	public static function getNodeWorldMatrix(target:cpp.Star<cpp.Void>):flight._cpp.Matrix;
	@:native("flight_set_node_local_matrix")
	public static function setNodeLocalMatrix(target:cpp.Star<cpp.Void>, source:flight._cpp.Matrix):Void;
	@:native("flight_set_node_transform2d")
	public static function setNodeTransform2d(target:cpp.Star<cpp.Void>, source:flight._cpp.Transform2D):Void;
	@:native("flight_compute_node_world_transform_revision")
	public static function computeNodeWorldTransformRevision(target:cpp.Star<cpp.Void>, parentWorldTransformId:haxe.Int64, root:flight._cpp.NodeRuntime):Void;
	@:native("flight_get_node_appearance_revision")
	public static function getNodeAppearanceRevision(source:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_node_children_revision")
	public static function getNodeChildrenRevision(source:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_node_local_bounds_revision")
	public static function getNodeLocalBoundsRevision(source:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_node_local_content_revision")
	public static function getNodeLocalContentRevision(source:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_node_local_transform_revision")
	public static function getNodeLocalTransformRevision(source:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_node_parent_reference_revision")
	public static function getNodeParentReferenceRevision(source:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_node_world_transform_revision")
	public static function getNodeWorldTransformRevision(source:cpp.Star<cpp.Void>):Int;
	@:native("flight_invalidate_content")
	public static function invalidateContent(target:cpp.Star<cpp.Void>):Void;
	@:native("flight_invalidate_node")
	public static function invalidateNode(target:cpp.Star<cpp.Void>):Void;
	@:native("flight_invalidate_node_appearance")
	public static function invalidateNodeAppearance(target:cpp.Star<cpp.Void>):Void;
	@:native("flight_invalidate_node_local_bounds")
	public static function invalidateNodeLocalBounds(target:cpp.Star<cpp.Void>):Void;
	@:native("flight_invalidate_node_local_content")
	public static function invalidateNodeLocalContent(target:cpp.Star<cpp.Void>):Void;
	@:native("flight_invalidate_node_local_transform")
	public static function invalidateNodeLocalTransform(target:cpp.Star<cpp.Void>):Void;
	@:native("flight_invalidate_node_parent_reference")
	public static function invalidateNodeParentReference(target:cpp.Star<cpp.Void>):Void;
	@:native("flight_invalidate_node_render")
	public static function invalidateNodeRender(target:cpp.Star<cpp.Void>):Void;
	@:native("flight_invalidate_node_world_bounds")
	public static function invalidateNodeWorldBounds(target:cpp.Star<cpp.Void>):Void;
	@:native("flight_compute_scene2d_fit_align_x")
	public static function computeScene2dFitAlignX(scaledContentWidth:Single, viewWidth:Single, align:flight._cpp.ViewportAlign):Single;
	@:native("flight_compute_scene2d_fit_align_y")
	public static function computeScene2dFitAlignY(scaledContentHeight:Single, viewHeight:Single, align:flight._cpp.ViewportAlign):Single;
	@:native("flight_compute_scene2d_fit_fill_scale")
	public static function computeScene2dFitFillScale(contentWidth:Single, contentHeight:Single, viewWidth:Single, viewHeight:Single):Single;
	@:native("flight_compute_scene2d_fit_scale")
	public static function computeScene2dFitScale(contentWidth:Single, contentHeight:Single, viewWidth:Single, viewHeight:Single):Single;
	@:native("flight_compute_scene2d_fit_transform")
	public static function computeScene2dFitTransform(out:flight._cpp.Matrix, scene2d:flight._cpp.Scene2DFitContext, viewWidth:Single, viewHeight:Single):Void;
	@:native("flight_find_node")
	public static function findNode(source:cpp.Star<cpp.Void>, predicateFn:cpp.Star<cpp.Void>, predicateCtx:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_find_node_by_name")
	public static function findNodeByName(source:cpp.Star<cpp.Void>, name:cpp.ConstCharStar):cpp.Star<cpp.Void>;
	@:native("flight_for_each_node_ancestor")
	public static function forEachNodeAncestor(source:cpp.Star<cpp.Void>, callback_Fn:cpp.Star<cpp.Void>, callback_Ctx:cpp.Star<cpp.Void>):Void;
	@:native("flight_for_each_node_descendant")
	public static function forEachNodeDescendant(source:cpp.Star<cpp.Void>, callback_Fn:cpp.Star<cpp.Void>, callback_Ctx:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_node_children")
	public static function getNodeChildren(out:cpp.Star<cpp.Void>, source:cpp.Star<cpp.Void>):Void;
	@:native("flight_get_node_depth")
	public static function getNodeDepth(source:cpp.Star<cpp.Void>):Int;
	@:native("flight_get_node_next_sibling")
	public static function getNodeNextSibling(source:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_get_node_previous_sibling")
	public static function getNodePreviousSibling(source:cpp.Star<cpp.Void>):cpp.Star<cpp.Void>;
	@:native("flight_walk_node_descendants")
	public static function walkNodeDescendants(source:cpp.Star<cpp.Void>, visitFn:cpp.Star<cpp.Void>, visitCtx:cpp.Star<cpp.Void>):Bool;
	@:native("flight_create_viewport")
	public static function createViewport():flight._cpp.Viewport;
	@:native("flight_get_viewport_aspect")
	public static function getViewportAspect(viewport:flight._cpp.Viewport):Single;
	@:native("flight_free_node_runtime")
	public static function freeNodeRuntime(ptr:flight._cpp.NodeRuntime):Void;
	@:native("flight_free_node_order_list")
	public static function freeNodeOrderList(ptr:flight._cpp.NodeOrderList):Void;
	@:native("flight_free_viewport")
	public static function freeViewport(ptr:flight._cpp.Viewport):Void;
}
