package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/gizmo")
extern class Gizmo {
  public static function computeGizmoAlignmentDeltas(out:Array<Float>, bounds:Array<flight.esm.types.geometry.Types.RectangleLike>, alignment:flight.esm.types.gizmo.Types.GizmoAlignment):Void;
  public static function createGizmoState<NodeType>(options:flight.esm.types.gizmo.Types.GizmoCreateOptions<NodeType>):flight.esm.types.gizmo.Types.GizmoState<NodeType>;
  public static function createNode2DGizmoFeatures():flight.esm.types.gizmo.Types.GizmoNode2DFeatures<flight.esm.types.scene2d_contract.Types.Node2D>;
  public static function disposeGizmoState<NodeType>(state:flight.esm.types.gizmo.Types.GizmoState<NodeType>):Void;
  public static function findGizmoSmartGuides(out:flight.esm.types.gizmo.Types.GizmoSmartGuideResult, movingBounds:flight.esm.types.geometry.Types.RectangleLike, candidateBounds:Array<flight.esm.types.geometry.Types.RectangleLike>, threshold:Float):Bool;
  public static function getGizmoMode<NodeType>(state:flight.esm.types.gizmo.Types.GizmoState<NodeType>):flight.esm.types.gizmo.Types.GizmoMode;
  public static function getGizmoSignals<NodeType>(state:flight.esm.types.gizmo.Types.GizmoState<NodeType>):flight.esm.types.gizmo.Types.GizmoSignals;
  public static function getGizmoSpace<NodeType>(state:flight.esm.types.gizmo.Types.GizmoState<NodeType>):flight.esm.types.gizmo.Types.GizmoSpace;
  public static function setGizmoCustomPivot<NodeType>(state:flight.esm.types.gizmo.Types.GizmoState<NodeType>, x:Float, y:Float):Void;
  public static function setGizmoMode<NodeType>(state:flight.esm.types.gizmo.Types.GizmoState<NodeType>, mode:flight.esm.types.gizmo.Types.GizmoMode):Void;
  public static function setGizmoPivot<NodeType>(state:flight.esm.types.gizmo.Types.GizmoState<NodeType>, pivot:flight.esm.types.gizmo.Types.GizmoPivot):Void;
  public static function setGizmoSelectionOutlineColor<NodeType>(state:flight.esm.types.gizmo.Types.GizmoState<NodeType>, color:Float):Void;
  public static function setGizmoSelectionOutlineEnabled<NodeType>(state:flight.esm.types.gizmo.Types.GizmoState<NodeType>, enabled:Bool):Void;
  public static function setGizmoSnapRotation<NodeType>(state:flight.esm.types.gizmo.Types.GizmoState<NodeType>, degrees:Float):Void;
  public static function setGizmoSnapScale<NodeType>(state:flight.esm.types.gizmo.Types.GizmoState<NodeType>, step:Float):Void;
  public static function setGizmoSnapTranslate<NodeType>(state:flight.esm.types.gizmo.Types.GizmoState<NodeType>, worldUnits:Float):Void;
  public static function setGizmoSpace<NodeType>(state:flight.esm.types.gizmo.Types.GizmoState<NodeType>, space:flight.esm.types.gizmo.Types.GizmoSpace):Void;
  public static function updateGizmo<NodeType>(state:flight.esm.types.gizmo.Types.GizmoState<NodeType>):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
