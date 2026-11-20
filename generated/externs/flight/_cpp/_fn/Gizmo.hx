package flight._cpp._fn;

extern class Gizmo {
	@:native("flight_compute_gizmo_alignment_deltas")
	public static function computeGizmoAlignmentDeltas(out:cpp.Star<cpp.Void>, bounds:cpp.Star<cpp.Void>, boundsLen:Int, alignment:Int):Void;
	@:native("flight_find_gizmo_smart_guides")
	public static function findGizmoSmartGuides(out:flight._cpp.GizmoSmartGuideResult, movingBounds:flight._cpp.Rectangle, candidateBounds:cpp.Star<cpp.Void>, candidateBoundsLen:Int, threshold:Float):Bool;
	@:native("flight_create_gizmo_state")
	public static function createGizmoState(options:flight._cpp.GizmoCreateOptions):flight._cpp.GizmoState;
	@:native("flight_dispose_gizmo_state")
	public static function disposeGizmoState(state:flight._cpp.GizmoState):Void;
	@:native("flight_get_gizmo_mode")
	public static function getGizmoMode(state:flight._cpp.GizmoState):Int;
	@:native("flight_get_gizmo_signals")
	public static function getGizmoSignals(state:flight._cpp.GizmoState):flight._cpp.GizmoSignals;
	@:native("flight_get_gizmo_space")
	public static function getGizmoSpace(state:flight._cpp.GizmoState):Int;
	@:native("flight_set_gizmo_custom_pivot")
	public static function setGizmoCustomPivot(state:flight._cpp.GizmoState, x:Float, y:Float):Void;
	@:native("flight_set_gizmo_mode")
	public static function setGizmoMode(state:flight._cpp.GizmoState, mode:Int):Void;
	@:native("flight_set_gizmo_pivot")
	public static function setGizmoPivot(state:flight._cpp.GizmoState, pivot:Int):Void;
	@:native("flight_set_gizmo_selection_outline_color")
	public static function setGizmoSelectionOutlineColor(state:flight._cpp.GizmoState, color:Int):Void;
	@:native("flight_set_gizmo_selection_outline_enabled")
	public static function setGizmoSelectionOutlineEnabled(state:flight._cpp.GizmoState, enabled:Bool):Void;
	@:native("flight_set_gizmo_snap_rotation")
	public static function setGizmoSnapRotation(state:flight._cpp.GizmoState, degrees:Float):Void;
	@:native("flight_set_gizmo_snap_scale")
	public static function setGizmoSnapScale(state:flight._cpp.GizmoState, step:Float):Void;
	@:native("flight_set_gizmo_snap_translate")
	public static function setGizmoSnapTranslate(state:flight._cpp.GizmoState, worldUnits:Float):Void;
	@:native("flight_set_gizmo_space")
	public static function setGizmoSpace(state:flight._cpp.GizmoState, space:Int):Void;
	@:native("flight_update_gizmo")
	public static function updateGizmo(state:flight._cpp.GizmoState):Void;
	@:native("flight_create_node2d_gizmo_features")
	public static function createNode2dGizmoFeatures():flight._cpp.GizmoNode2DFeatures;
	@:native("flight_free_gizmo_state")
	public static function freeGizmoState(ptr:flight._cpp.GizmoState):Void;
	@:native("flight_free_gizmo_signals")
	public static function freeGizmoSignals(ptr:flight._cpp.GizmoSignals):Void;
	@:native("flight_free_gizmo_node2_dfeatures")
	public static function freeGizmoNode2Dfeatures(ptr:flight._cpp.GizmoNode2DFeatures):Void;
}
