package flight.esm.types.sdk_gizmo;

#if (js && flight_esm)
typedef GizmoAlignment = flight.esm.types.gizmo.Types.GizmoAlignment;

typedef GizmoCreateOptions<NodeType> = flight.esm.types.gizmo.Types.GizmoCreateOptions<NodeType>;

typedef GizmoHandleKind = flight.esm.types.gizmo.Types.GizmoHandleKind;

typedef GizmoMode = flight.esm.types.gizmo.Types.GizmoMode;

typedef GizmoNode2DFeatures<NodeType> = flight.esm.types.gizmo.Types.GizmoNode2DFeatures<NodeType>;

typedef GizmoPivot = flight.esm.types.gizmo.Types.GizmoPivot;

typedef GizmoSignals = flight.esm.types.gizmo.Types.GizmoSignals;

typedef GizmoSmartGuideResult = flight.esm.types.gizmo.Types.GizmoSmartGuideResult;

typedef GizmoSpace = flight.esm.types.gizmo.Types.GizmoSpace;

typedef GizmoState<NodeType> = flight.esm.types.gizmo.Types.GizmoState<NodeType>;

typedef GizmoTransformMode = flight.esm.types.gizmo.Types.GizmoTransformMode;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
