package flight.esm.types.sdk_scene3d;

#if (js && flight_esm)
typedef Billboard = flight.esm.types.scene3d.Types.Billboard;

typedef BillboardMode = flight.esm.types.scene3d.Types.BillboardMode;

typedef BillboardRuntime = flight.esm.types.scene3d.Types.BillboardRuntime;

typedef MeshDeformer = flight.esm.types.scene3d.Types.MeshDeformer;

typedef Node3D = flight.esm.types.scene3d.Types.Node3D;

typedef Node3DFields = flight.esm.types.scene3d.Types.Node3DFields;

typedef Node3DRuntime = flight.esm.types.scene3d.Types.Node3DRuntime;

typedef Scene3DAnimationPath = flight.esm.types.scene3d.Types.Scene3DAnimationPath;

typedef Scene3DAnimationTarget = flight.esm.types.scene3d.Types.Scene3DAnimationTarget;

typedef Scene3DKindUsage = flight.esm.types.scene3d.Types.Scene3DKindUsage;

typedef Skeleton3D = flight.esm.types.scene3d.Types.Skeleton3D;

typedef Skin = flight.esm.types.scene3d.Types.Skin;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
