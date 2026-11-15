package flight._js._fn;

@:jsRequire("flight")
extern class Node {
	@:native("flight_compute_node_root_local_bounds_rectangle")
	public static function computeNodeRootLocalBoundsRectangle(out:flight._js.Rectangle, root:Dynamic):Void;
	@:native("flight_ensure_node_local_bounds_rectangle")
	public static function ensureNodeLocalBoundsRectangle(target:Dynamic):Void;
	@:native("flight_ensure_node_parent_bounds_rectangle")
	public static function ensureNodeParentBoundsRectangle(target:Dynamic):Void;
	@:native("flight_ensure_node_world_bounds_rectangle")
	public static function ensureNodeWorldBoundsRectangle(target:Dynamic):Void;
	@:native("flight_get_node_height")
	public static function getNodeHeight(source:Dynamic):Float;
	@:native("flight_get_node_local_bounds_rectangle")
	public static function getNodeLocalBoundsRectangle(target:Dynamic):flight._js.Rectangle;
	@:native("flight_get_node_parent_bounds_rectangle")
	public static function getNodeParentBoundsRectangle(target:Dynamic):flight._js.Rectangle;
	@:native("flight_get_node_width")
	public static function getNodeWidth(source:Dynamic):Float;
	@:native("flight_get_node_world_bounds_rectangle")
	public static function getNodeWorldBoundsRectangle(target:Dynamic):flight._js.Rectangle;
	@:native("flight_set_node_height")
	public static function setNodeHeight(target:Dynamic, value:Float):Void;
	@:native("flight_set_node_width")
	public static function setNodeWidth(target:Dynamic, value:Float):Void;
	@:native("flight_are_node_guards_enabled")
	public static function areNodeGuardsEnabled(guards:flight._js.NodeGuardState):Bool;
	@:native("flight_disable_node_guards")
	public static function disableNodeGuards(guards:flight._js.NodeGuardState):Void;
	@:native("flight_enable_node_guards")
	public static function enableNodeGuards(guards:flight._js.NodeGuardState, logState:Dynamic, clock:flight._js.NodeGuardClock):Void;
	@:native("flight_init_appearance_runtime_trait")
	public static function initAppearanceRuntimeTrait(target:flight._js.HasAppearanceRuntime):Void;
	@:native("flight_init_appearance_trait")
	public static function initAppearanceTrait(target:flight._js.HasAppearance, obj:flight._js.HasAppearanceOptions):Void;
	@:native("flight_init_blend_mode_trait")
	public static function initBlendModeTrait(target:flight._js.HasBlendMode, obj:flight._js.HasBlendModeOptions):Void;
	@:native("flight_default_compute_local_bounds_rectangle")
	public static function defaultComputeLocalBoundsRectangle(out:flight._js.Rectangle, source:Dynamic):Void;
	@:native("flight_init_bounds_rectangle_trait")
	public static function initBoundsRectangleTrait(target:flight._js.HasBoundsRectangle, obj:flight._js.HasBoundsRectangleOptions):Void;
	@:native("flight_init_clip_trait")
	public static function initClipTrait(target:flight._js.HasClip, obj:flight._js.HasClipOptions):Void;
	@:native("flight_init_material_trait")
	public static function initMaterialTrait(target:flight._js.HasMaterial, obj:flight._js.HasMaterialOptions):Void;
	@:native("flight_init_transform2d_trait")
	public static function initTransform2dTrait(target:flight._js.HasTransform2D, obj:flight._js.HasTransform2DOptions):Void;
	@:native("flight_init_transform3d_runtime_trait")
	public static function initTransform3dRuntimeTrait(target:flight._js.HasTransform3DRuntime):Void;
	@:native("flight_init_transform3d_trait")
	public static function initTransform3dTrait(target:flight._js.HasTransform3D, obj:flight._js.HasTransform3DOptions):Void;
	@:native("flight_add_node_child")
	public static function addNodeChild(target:Dynamic, child:Dynamic):Dynamic;
	@:native("flight_add_node_child_at")
	public static function addNodeChildAt(target:Dynamic, child:Dynamic, index:Int):Dynamic;
	@:native("flight_add_node_children")
	public static function addNodeChildren(target:Dynamic, children:Dynamic, childrenLen:Int):Void;
	@:native("flight_contains_node_child")
	public static function containsNodeChild(source:Dynamic, child:Dynamic):Bool;
	@:native("flight_for_each_node_child")
	public static function forEachNodeChild(source:Dynamic, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void;
	@:native("flight_get_node_ancestors")
	public static function getNodeAncestors(out:Dynamic, source:Dynamic):Void;
	@:native("flight_get_node_child_at")
	public static function getNodeChildAt(source:Dynamic, index:Int):Dynamic;
	@:native("flight_get_node_child_by_name")
	public static function getNodeChildByName(source:Dynamic, name:String):Dynamic;
	@:native("flight_get_node_child_count")
	public static function getNodeChildCount(source:Dynamic):Int;
	@:native("flight_get_node_child_index")
	public static function getNodeChildIndex(source:Dynamic, child:Dynamic):Int;
	@:native("flight_get_node_common_ancestor")
	public static function getNodeCommonAncestor(a:Dynamic, b:Dynamic):Dynamic;
	@:native("flight_get_node_parent")
	public static function getNodeParent(source:Dynamic):Dynamic;
	@:native("flight_get_node_root")
	public static function getNodeRoot(source:Dynamic):Dynamic;
	@:native("flight_is_node_ancestor_of")
	public static function isNodeAncestorOf(ancestor:Dynamic, descendant:Dynamic):Bool;
	@:native("flight_remove_node_child")
	public static function removeNodeChild(target:Dynamic, child:Dynamic):Dynamic;
	@:native("flight_remove_node_child_at")
	public static function removeNodeChildAt(target:Dynamic, index:Int):Dynamic;
	@:native("flight_remove_node_children")
	public static function removeNodeChildren(target:Dynamic, beginIndex:Int, endIndex:Int):Void;
	@:native("flight_reparent_node")
	public static function reparentNode(child:Dynamic, newParent:Dynamic, guards:flight._js.NodeGuardState):Bool;
	@:native("flight_replace_node_child")
	public static function replaceNodeChild(target:Dynamic, oldChild:Dynamic, newChild:Dynamic):Void;
	@:native("flight_set_node_child_index")
	public static function setNodeChildIndex(target:Dynamic, child:Dynamic, index:Int):Void;
	@:native("flight_swap_node_children")
	public static function swapNodeChildren(target:Dynamic, child1:Dynamic, child2:Dynamic):Void;
	@:native("flight_swap_node_children_at")
	public static function swapNodeChildrenAt(target:Dynamic, index1:Int, index2:Int):Void;
	@:native("flight_create_node_runtime")
	public static function createNodeRuntime(methods:flight._js.NodeRuntimeMethods):flight._js.NodeRuntime;
	@:native("flight_create_node_signals")
	public static function createNodeSignals():Dynamic;
	@:native("flight_default_node_runtime_can_add_child")
	public static function defaultNodeRuntimeCanAddChild(target:Dynamic, child:Dynamic):Bool;
	@:native("flight_dispose_node")
	public static function disposeNode(target:Dynamic):Void;
	@:native("flight_enable_node_signals")
	public static function enableNodeSignals(source:Dynamic):Dynamic;
	@:native("flight_get_node_runtime")
	public static function getNodeRuntime(source:Dynamic):flight._js.NodeRuntime;
	@:native("flight_get_node_signals")
	public static function getNodeSignals(source:Dynamic):Dynamic;
	@:native("flight_set_node_enabled")
	public static function setNodeEnabled(target:Dynamic, value:Bool):Void;
	@:native("flight_set_node_color_adjustments_tint")
	public static function setNodeColorAdjustmentsTint(source:Dynamic, tint:Int):Void;
	@:native("flight_create_node_order_list")
	public static function createNodeOrderList():flight._js.NodeOrderList;
	@:native("flight_add_node_order_list_entry")
	public static function addNodeOrderListEntry(list:flight._js.NodeOrderList, node:Dynamic, sortKey:Float):Void;
	@:native("flight_apply_node_order_list")
	public static function applyNodeOrderList(target:Dynamic, list:flight._js.NodeOrderList):Void;
	@:native("flight_clear_node_order_list")
	public static function clearNodeOrderList(list:flight._js.NodeOrderList):Void;
	@:native("flight_dispose_node_order_list")
	public static function disposeNodeOrderList(list:flight._js.NodeOrderList):Void;
	@:native("flight_for_each_node_order_list_entry")
	public static function forEachNodeOrderListEntry(list:flight._js.NodeOrderList, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void;
	@:native("flight_get_node_order_list_entry_sort_key")
	public static function getNodeOrderListEntrySortKey(list:flight._js.NodeOrderList, node:Dynamic):Float;
	@:native("flight_has_node_order_list_entry")
	public static function hasNodeOrderListEntry(list:flight._js.NodeOrderList, node:Dynamic):Bool;
	@:native("flight_remove_node_order_list_entry")
	public static function removeNodeOrderListEntry(list:flight._js.NodeOrderList, node:Dynamic):Bool;
	@:native("flight_set_node_order_list_entry")
	public static function setNodeOrderListEntry(list:flight._js.NodeOrderList, node:Dynamic, sortKey:Float):Void;
	@:native("flight_set_node_order_list_entry_above")
	public static function setNodeOrderListEntryAbove(list:flight._js.NodeOrderList, node:Dynamic, target:Dynamic):Void;
	@:native("flight_set_node_order_list_entry_below")
	public static function setNodeOrderListEntryBelow(list:flight._js.NodeOrderList, node:Dynamic, target:Dynamic):Void;
	@:native("flight_set_node_order_list_from_node_children")
	public static function setNodeOrderListFromNodeChildren(list:flight._js.NodeOrderList, source:Dynamic):Void;
	@:native("flight_swap_node_order_list_entries")
	public static function swapNodeOrderListEntries(list:flight._js.NodeOrderList, nodeA:Dynamic, nodeB:Dynamic):Void;
	@:native("flight_get_node_local_matrix")
	public static function getNodeLocalMatrix(target:Dynamic):flight._js.Matrix;
	@:native("flight_get_node_transform2d")
	public static function getNodeTransform2d(out:flight._js.Transform2D, source:Dynamic):Void;
	@:native("flight_get_node_world_matrix")
	public static function getNodeWorldMatrix(target:Dynamic):flight._js.Matrix;
	@:native("flight_set_node_local_matrix")
	public static function setNodeLocalMatrix(target:Dynamic, source:flight._js.Matrix):Void;
	@:native("flight_set_node_transform2d")
	public static function setNodeTransform2d(target:Dynamic, source:flight._js.Transform2D):Void;
	@:native("flight_compute_node_world_transform_revision")
	public static function computeNodeWorldTransformRevision(target:Dynamic, parentWorldTransformId:Int, root:flight._js.NodeRuntime):Void;
	@:native("flight_get_node_appearance_revision")
	public static function getNodeAppearanceRevision(source:Dynamic):Int;
	@:native("flight_get_node_children_revision")
	public static function getNodeChildrenRevision(source:Dynamic):Int;
	@:native("flight_get_node_local_bounds_revision")
	public static function getNodeLocalBoundsRevision(source:Dynamic):Int;
	@:native("flight_get_node_local_content_revision")
	public static function getNodeLocalContentRevision(source:Dynamic):Int;
	@:native("flight_get_node_local_transform_revision")
	public static function getNodeLocalTransformRevision(source:Dynamic):Int;
	@:native("flight_get_node_parent_reference_revision")
	public static function getNodeParentReferenceRevision(source:Dynamic):Int;
	@:native("flight_get_node_world_transform_revision")
	public static function getNodeWorldTransformRevision(source:Dynamic):Int;
	@:native("flight_invalidate_content")
	public static function invalidateContent(target:Dynamic):Void;
	@:native("flight_invalidate_node")
	public static function invalidateNode(target:Dynamic):Void;
	@:native("flight_invalidate_node_appearance")
	public static function invalidateNodeAppearance(target:Dynamic):Void;
	@:native("flight_invalidate_node_local_bounds")
	public static function invalidateNodeLocalBounds(target:Dynamic):Void;
	@:native("flight_invalidate_node_local_content")
	public static function invalidateNodeLocalContent(target:Dynamic):Void;
	@:native("flight_invalidate_node_local_transform")
	public static function invalidateNodeLocalTransform(target:Dynamic):Void;
	@:native("flight_invalidate_node_parent_reference")
	public static function invalidateNodeParentReference(target:Dynamic):Void;
	@:native("flight_invalidate_node_render")
	public static function invalidateNodeRender(target:Dynamic):Void;
	@:native("flight_invalidate_node_world_bounds")
	public static function invalidateNodeWorldBounds(target:Dynamic):Void;
	@:native("flight_compute_scene2d_fit_align_x")
	public static function computeScene2dFitAlignX(scaledContentWidth:Float, viewWidth:Float, align:Int):Float;
	@:native("flight_compute_scene2d_fit_align_y")
	public static function computeScene2dFitAlignY(scaledContentHeight:Float, viewHeight:Float, align:Int):Float;
	@:native("flight_compute_scene2d_fit_fill_scale")
	public static function computeScene2dFitFillScale(contentWidth:Float, contentHeight:Float, viewWidth:Float, viewHeight:Float):Float;
	@:native("flight_compute_scene2d_fit_scale")
	public static function computeScene2dFitScale(contentWidth:Float, contentHeight:Float, viewWidth:Float, viewHeight:Float):Float;
	@:native("flight_compute_scene2d_fit_transform")
	public static function computeScene2dFitTransform(out:flight._js.Matrix, scene2d:flight._js.Scene2DFitContext, viewWidth:Float, viewHeight:Float):Void;
	@:native("flight_find_node")
	public static function findNode(source:Dynamic, predicateFn:Dynamic, predicateCtx:Dynamic):Dynamic;
	@:native("flight_find_node_by_name")
	public static function findNodeByName(source:Dynamic, name:String):Dynamic;
	@:native("flight_for_each_node_ancestor")
	public static function forEachNodeAncestor(source:Dynamic, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void;
	@:native("flight_for_each_node_descendant")
	public static function forEachNodeDescendant(source:Dynamic, callback_Fn:Dynamic, callback_Ctx:Dynamic):Void;
	@:native("flight_get_node_children")
	public static function getNodeChildren(out:Dynamic, source:Dynamic):Void;
	@:native("flight_get_node_depth")
	public static function getNodeDepth(source:Dynamic):Int;
	@:native("flight_get_node_next_sibling")
	public static function getNodeNextSibling(source:Dynamic):Dynamic;
	@:native("flight_get_node_previous_sibling")
	public static function getNodePreviousSibling(source:Dynamic):Dynamic;
	@:native("flight_walk_node_descendants")
	public static function walkNodeDescendants(source:Dynamic, visitFn:Dynamic, visitCtx:Dynamic):Bool;
	@:native("flight_create_viewport")
	public static function createViewport():flight._js.Viewport;
	@:native("flight_get_viewport_aspect")
	public static function getViewportAspect(viewport:flight._js.Viewport):Float;
	@:native("flight_free_node_runtime")
	public static function freeNodeRuntime(ptr:flight._js.NodeRuntime):Void;
	@:native("flight_free_node_order_list")
	public static function freeNodeOrderList(ptr:flight._js.NodeOrderList):Void;
	@:native("flight_free_viewport")
	public static function freeViewport(ptr:flight._js.Viewport):Void;
}
