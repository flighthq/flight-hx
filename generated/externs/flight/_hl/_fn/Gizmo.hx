package flight._hl._fn;

extern class Gizmo {
	@:hlNative("flight", "flight_compute_gizmo_alignment_deltas")
	public static function computeGizmoAlignmentDeltas(out:hl.Bytes, bounds:hl.Bytes, boundsLen:Int, alignment:Int):Void;
	@:hlNative("flight", "flight_find_gizmo_smart_guides")
	public static function findGizmoSmartGuides(out:flight._hl.GizmoSmartGuideResult, movingBounds:flight._hl.Rectangle, candidateBounds:hl.Bytes, candidateBoundsLen:Int, threshold:Float):Bool;
	@:hlNative("flight", "flight_create_gizmo_state")
	public static function createGizmoState(options:flight._hl.GizmoCreateOptions):flight._hl.GizmoState;
	@:hlNative("flight", "flight_dispose_gizmo_state")
	public static function disposeGizmoState(state:flight._hl.GizmoState):Void;
	@:hlNative("flight", "flight_get_gizmo_mode")
	public static function getGizmoMode(state:flight._hl.GizmoState):Int;
	@:hlNative("flight", "flight_get_gizmo_signals")
	public static function getGizmoSignals(state:flight._hl.GizmoState):flight._hl.GizmoSignals;
	@:hlNative("flight", "flight_get_gizmo_space")
	public static function getGizmoSpace(state:flight._hl.GizmoState):Int;
	@:hlNative("flight", "flight_set_gizmo_custom_pivot")
	public static function setGizmoCustomPivot(state:flight._hl.GizmoState, x:Float, y:Float):Void;
	@:hlNative("flight", "flight_set_gizmo_mode")
	public static function setGizmoMode(state:flight._hl.GizmoState, mode:Int):Void;
	@:hlNative("flight", "flight_set_gizmo_pivot")
	public static function setGizmoPivot(state:flight._hl.GizmoState, pivot:Int):Void;
	@:hlNative("flight", "flight_set_gizmo_selection_outline_color")
	public static function setGizmoSelectionOutlineColor(state:flight._hl.GizmoState, color:Int):Void;
	@:hlNative("flight", "flight_set_gizmo_selection_outline_enabled")
	public static function setGizmoSelectionOutlineEnabled(state:flight._hl.GizmoState, enabled:Bool):Void;
	@:hlNative("flight", "flight_set_gizmo_snap_rotation")
	public static function setGizmoSnapRotation(state:flight._hl.GizmoState, degrees:Float):Void;
	@:hlNative("flight", "flight_set_gizmo_snap_scale")
	public static function setGizmoSnapScale(state:flight._hl.GizmoState, step:Float):Void;
	@:hlNative("flight", "flight_set_gizmo_snap_translate")
	public static function setGizmoSnapTranslate(state:flight._hl.GizmoState, worldUnits:Float):Void;
	@:hlNative("flight", "flight_set_gizmo_space")
	public static function setGizmoSpace(state:flight._hl.GizmoState, space:Int):Void;
	@:hlNative("flight", "flight_update_gizmo")
	public static function updateGizmo(state:flight._hl.GizmoState):Void;
	@:hlNative("flight", "flight_create_node2d_gizmo_features")
	public static function createNode2dGizmoFeatures():flight._hl.GizmoNode2DFeatures;
	@:hlNative("flight", "flight_free_gizmo_state")
	public static function freeGizmoState(ptr:flight._hl.GizmoState):Void;
	@:hlNative("flight", "flight_free_gizmo_signals")
	public static function freeGizmoSignals(ptr:flight._hl.GizmoSignals):Void;
	@:hlNative("flight", "flight_free_gizmo_node2_dfeatures")
	public static function freeGizmoNode2Dfeatures(ptr:flight._hl.GizmoNode2DFeatures):Void;
}
