package flight.esm.types.scene3d_contract;

#if (js && flight_esm)
typedef Billboard = flight.esm.types.scene3d.Types.Billboard;

typedef BillboardMode = flight.esm.types.scene3d.Types.BillboardMode;

typedef BillboardRuntime = flight.esm.types.scene3d.Types.BillboardRuntime;

typedef LodLevel = { mesh:flight.esm.types.meshgeometry.Types.Mesh, minDistance:Float };

typedef LodMesh = { activeLevelIndex:Float, levels:Array<flight.esm.types.scene3d_contract.Types.LodLevel>, data:Null<flight.esm.types.node.Types.NodeData>, enabled:Bool, kind:String, name:Null<String>, alpha:Float, visible:Bool, position:flight.esm.types.geometry.Types.Vector3, rotation:flight.esm.types.geometry.Types.Quaternion, scale:flight.esm.types.geometry.Types.Vector3 };

typedef LodMeshRuntime = flight.esm.types.scene3d.Types.Node3DRuntime;

typedef MeshDeformer = flight.esm.types.scene3d.Types.MeshDeformer;

typedef Node3D = flight.esm.types.scene3d.Types.Node3D;

typedef Node3DFields = flight.esm.types.scene3d.Types.Node3DFields;

typedef Node3DRuntime = flight.esm.types.scene3d.Types.Node3DRuntime;

typedef Node3DVisitor = ((node:flight.esm.types.scene3d.Types.Node3D, depth:Float) -> Dynamic);

typedef Scene3D = { animations:Dynamic, metadata:Null<flight.esm.types.scene3d_contract.Types.Scene3DMetadata>, resources:Array<flight.esm.types.image.Types.ImageResourceReference>, root:flight.esm.types.scene3d.Types.Node3D, raw:Dynamic };

typedef Scene3DAnimationPath = flight.esm.types.scene3d.Types.Scene3DAnimationPath;

typedef Scene3DAnimationTarget = flight.esm.types.scene3d.Types.Scene3DAnimationTarget;

typedef Scene3DDocument = { animations:Array<flight.esm.types.scene3d_contract.Types.Scene3DDocumentAnimation>, cameras:Array<flight.esm.types.scene3d_contract.Types.Scene3DDocumentCamera>, lights:Array<flight.esm.types.scene3d_contract.Types.Scene3DDocumentLight>, materials:Array<flight.esm.types.materials_contract.Types.MaterialLike>, meshes:Array<flight.esm.types.scene3d_contract.Types.Scene3DDocumentMesh>, metadata:Null<flight.esm.types.scene3d_contract.Types.Scene3DMetadata>, nodes:Array<flight.esm.types.scene3d_contract.Types.Scene3DDocumentNode>, resources:Array<flight.esm.types.image.Types.ImageResourceReference>, scenes:Array<flight.esm.types.scene3d_contract.Types.Scene3DDocumentScene>, skins:Array<flight.esm.types.scene3d_contract.Types.Scene3DDocumentSkin> };

typedef Scene3DDocumentAnimation = { channels:Array<flight.esm.types.scene3d_contract.Types.Scene3DDocumentAnimationChannel>, duration:Float, ?name:Null<String> };

typedef Scene3DDocumentAnimationChannel = { node:Float, path:flight.esm.types.scene3d.Types.Scene3DAnimationPath, track:flight.esm.types.animation.Types.AnimationTrack };

typedef Scene3DDocumentCamera = { far:Float, ?name:Null<String>, near:Float, ?node:Null<Float>, projection:flight.esm.types.camera.Types.Projection, transform:flight.esm.types.geometry.Types.Transform3D };

typedef Scene3DDocumentLight = { descriptor:flight.esm.types.lighting_contract.Types.Light, ?name:Null<String>, ?node:Null<Float>, transform:flight.esm.types.geometry.Types.Transform3D };

typedef Scene3DDocumentMesh = { geometry:flight.esm.types.meshgeometry.Types.MeshGeometry, materials:Array<Float>, ?morph:Null<flight.esm.types.meshgeometry.Types.MeshMorph>, ?name:Null<String>, ?skin:Null<Float> };

typedef Scene3DDocumentNode = { children:Array<Float>, kind:String, ?mesh:Null<Float>, ?name:Null<String>, transform:flight.esm.types.geometry.Types.Transform3D };

typedef Scene3DDocumentScene = { ?name:Null<String>, rootNodes:Array<Float> };

typedef Scene3DDocumentSkin = { inverseBind:Array<flight.esm.types.geometry.Types.Matrix4Like>, joints:Array<Float> };

typedef Scene3DKindUsage = flight.esm.types.scene3d.Types.Scene3DKindUsage;

typedef Scene3DMetadata = { copyright:Null<String>, generator:Null<String>, version:Null<String> };

typedef Scene3DRuntime = flight.esm.types.entity_contract.Types.EntityRuntime;

typedef Skeleton3D = flight.esm.types.scene3d.Types.Skeleton3D;

typedef Skin = flight.esm.types.scene3d.Types.Skin;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
