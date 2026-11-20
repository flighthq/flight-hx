package flight._js._fn;

@:jsRequire("@flighthq/gizmo")
extern class Gizmo {
	@:native("computeGizmoAlignmentDeltas")
	public static function computeGizmoAlignmentDeltas(out:Dynamic, bounds:Dynamic, alignment:Dynamic):Void;
	@:native("findGizmoSmartGuides")
	public static function findGizmoSmartGuides(out:flight._js.GizmoSmartGuideResult, movingBounds:flight._js.Rectangle, candidateBounds:Dynamic, threshold:Float):Bool;
	@:native("createGizmoState")
	public static function createGizmoState(options:flight._js.GizmoCreateOptions):flight._js.GizmoState;
	@:native("disposeGizmoState")
	public static function disposeGizmoState(state:flight._js.GizmoState):Void;
	@:native("getGizmoMode")
	public static function getGizmoMode(state:flight._js.GizmoState):Dynamic;
	@:native("getGizmoSignals")
	public static function getGizmoSignals(state:flight._js.GizmoState):flight._js.GizmoSignals;
	@:native("getGizmoSpace")
	public static function getGizmoSpace(state:flight._js.GizmoState):Dynamic;
	@:native("setGizmoCustomPivot")
	public static function setGizmoCustomPivot(state:flight._js.GizmoState, x:Float, y:Float):Void;
	@:native("setGizmoMode")
	public static function setGizmoMode(state:flight._js.GizmoState, mode:Dynamic):Void;
	@:native("setGizmoPivot")
	public static function setGizmoPivot(state:flight._js.GizmoState, pivot:Dynamic):Void;
	@:native("setGizmoSelectionOutlineColor")
	public static function setGizmoSelectionOutlineColor(state:flight._js.GizmoState, color:Int):Void;
	@:native("setGizmoSelectionOutlineEnabled")
	public static function setGizmoSelectionOutlineEnabled(state:flight._js.GizmoState, enabled:Bool):Void;
	@:native("setGizmoSnapRotation")
	public static function setGizmoSnapRotation(state:flight._js.GizmoState, degrees:Float):Void;
	@:native("setGizmoSnapScale")
	public static function setGizmoSnapScale(state:flight._js.GizmoState, step:Float):Void;
	@:native("setGizmoSnapTranslate")
	public static function setGizmoSnapTranslate(state:flight._js.GizmoState, worldUnits:Float):Void;
	@:native("setGizmoSpace")
	public static function setGizmoSpace(state:flight._js.GizmoState, space:Dynamic):Void;
	@:native("updateGizmo")
	public static function updateGizmo(state:flight._js.GizmoState):Void;
	@:native("createNode2DGizmoFeatures")
	public static function createNode2dGizmoFeatures():flight._js.GizmoNode2DFeatures;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeGizmoState(ptr:flight._js.GizmoState):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeGizmoSignals(ptr:flight._js.GizmoSignals):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeGizmoNode2Dfeatures(ptr:flight._js.GizmoNode2DFeatures):Void {}
}
