package flight.esm.types.gizmo;

#if (js && flight_esm)
typedef GizmoAlignment = String;

typedef GizmoCreateOptions<NodeType> = { camera:flight.esm.types.camera.Types.Camera2D, features:flight.esm.types.gizmo.Types.GizmoNode2DFeatures<NodeType>, overlayScene:flight.esm.types.scene2d_contract.Types.Scene2D, selection:flight.esm.types.selection.Types.SelectionState<NodeType>, viewportHeight:Float, viewportWidth:Float };

typedef GizmoHandleKind = String;

typedef GizmoMode = String;

typedef GizmoNode2DFeatures<NodeType> = { getWorldBoundsRectangle:((out:flight.esm.types.geometry.Types.Rectangle, node:NodeType) -> Bool), getWorldOrigin:((out:flight.esm.types.geometry.Types.Vector2Like, node:NodeType) -> Void), getWorldRotation:((node:NodeType) -> Float) };

typedef GizmoPivot = String;

typedef GizmoSignals = { onRotate:flight.esm.types.signals.Types.Signal<Float>, onScale:flight.esm.types.signals.Types.Signal<Array<Float>>, onTransformBegin:flight.esm.types.signals.Types.Signal<Void>, onTransformEnd:flight.esm.types.signals.Types.Signal<Void>, onTranslate:flight.esm.types.signals.Types.Signal<Array<Float>> };

typedef GizmoSmartGuideResult = { deltaX:Float, deltaY:Float, guideX:Null<Float>, guideY:Null<Float> };

typedef GizmoSpace = String;

typedef GizmoState<NodeType> = Dynamic;

typedef GizmoTransformMode = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
