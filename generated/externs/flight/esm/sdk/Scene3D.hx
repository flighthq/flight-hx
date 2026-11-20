package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/scene3d")
extern class Scene3D {
  public static final BillboardKind:String;
  public static final InstancedMeshKind:String;
  public static final MeshDeformerMorph:String;
  public static final MeshDeformerNone:String;
  public static final MeshDeformerSkeletal:String;
  public static final MeshKind:String;
  public static final Node3DFieldsKey:Dynamic;
  public static final Node3DKind:String;
  public static final Scene3DAnimationPathRotation:String;
  public static final Scene3DAnimationPathScale:String;
  public static final Scene3DAnimationPathTranslation:String;
  public static final Scene3DAnimationPathWeights:String;
  public static function appendInstancedMeshInstance(target:flight.esm.types.meshgeometry.Types.InstancedMesh, matrix:flight.esm.types.geometry.Types.Matrix4):Float;
  public static function applyAnimationClipToScene3D(clip:flight.esm.types.animation.Types.AnimationClip, time:Float):Void;
  public static function areScene3DGuardsEnabled():Bool;
  public static function buildScene3DFrustum(out:flight.esm.types.geometry.Types.FrustumLike, viewProjection:flight.esm.types.geometry.Types.Matrix4Like):Void;
  public static function clearInstancedMesh(target:flight.esm.types.meshgeometry.Types.InstancedMesh):Void;
  public static function cloneInstancedMesh(source:flight.esm.types.meshgeometry.Types.InstancedMesh):flight.esm.types.meshgeometry.Types.InstancedMesh;
  public static function cloneMesh(source:flight.esm.types.meshgeometry.Types.Mesh):flight.esm.types.meshgeometry.Types.Mesh;
  public static function cloneNode3DSubtree(source:flight.esm.types.scene3d.Types.Node3D, ?materialOverride:Null<((material:Null<flight.esm.types.materials_contract.Types.Material3D>) -> Null<flight.esm.types.materials_contract.Types.Material3D>)>):flight.esm.types.scene3d.Types.Node3D;
  public static function computeInstancedMeshLocalBoundsAabb(out:flight.esm.types.geometry.Types.Aabb, source:flight.esm.types.meshgeometry.Types.InstancedMesh):Void;
  public static function createBillboard(geometry:flight.esm.types.meshgeometry.Types.MeshGeometry, materials:Array<Null<flight.esm.types.materials_contract.Types.Material3D>>):flight.esm.types.scene3d.Types.Billboard;
  public static function createInstancedMesh(geometry:flight.esm.types.meshgeometry.Types.MeshGeometry, materials:Array<Null<flight.esm.types.materials_contract.Types.Material3D>>, ?capacity:Null<Float>, ?kind:String):flight.esm.types.meshgeometry.Types.InstancedMesh;
  public static function createInstancedMeshSignals():flight.esm.types.meshgeometry.Types.InstancedMeshSignals;
  public static function createMesh(geometry:flight.esm.types.meshgeometry.Types.MeshGeometry, materials:Array<Null<flight.esm.types.materials_contract.Types.Material3D>>):flight.esm.types.meshgeometry.Types.Mesh;
  public static function createNode3D(?kind:String):flight.esm.types.scene3d.Types.Node3D;
  public static function createScene3D():flight.esm.types.scene3d_contract.Types.Scene3D;
  public static function createScene3DFromDocument(document:flight.esm.types.scene3d_contract.Types.Scene3DDocument, ?sceneIndex:Float):flight.esm.types.scene3d_contract.Types.Scene3D;
  public static function createScene3DKindUsage():flight.esm.types.scene3d.Types.Scene3DKindUsage;
  public static function createScene3DLightsFromDocument(document:flight.esm.types.scene3d_contract.Types.Scene3DDocument):flight.esm.types.lighting_contract.Types.Scene3DLights;
  public static function createScene3DsFromDocument(document:flight.esm.types.scene3d_contract.Types.Scene3DDocument):Array<flight.esm.types.scene3d_contract.Types.Scene3D>;
  public static function cullNode3DByFrustum(out:Array<flight.esm.types.scene3d.Types.Node3D>, root:flight.esm.types.scene3d.Types.Node3D, frustum:flight.esm.types.geometry.Types.FrustumLike):Void;
  public static function disableScene3DGuards():Void;
  public static function disposeNode3D(node:flight.esm.types.scene3d.Types.Node3D):Void;
  public static function enableBillboardSignals(source:flight.esm.types.scene3d.Types.Billboard):flight.esm.types.node.Types.NodeSignals;
  public static function enableInstancedMeshSignals(target:flight.esm.types.meshgeometry.Types.InstancedMesh):flight.esm.types.meshgeometry.Types.InstancedMeshSignals;
  public static function enableMeshSignals(source:flight.esm.types.meshgeometry.Types.Mesh):flight.esm.types.node.Types.NodeSignals;
  public static function enableNode3DSignals(source:flight.esm.types.scene3d.Types.Node3D):flight.esm.types.node.Types.NodeSignals;
  public static function enableScene3DGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function findScene3DMaterialByName(root:flight.esm.types.scene3d.Types.Node3D, name:String):Null<flight.esm.types.materials_contract.Types.Material>;
  public static function getBillboardSignals(source:flight.esm.types.scene3d.Types.Billboard):Null<flight.esm.types.node.Types.NodeSignals>;
  public static function getInstancedMeshCapacity(source:flight.esm.types.meshgeometry.Types.InstancedMesh):Float;
  public static function getInstancedMeshInstanceColor(source:flight.esm.types.meshgeometry.Types.InstancedMesh, index:Float):Float;
  public static function getInstancedMeshInstanceMatrix(out:flight.esm.types.geometry.Types.Matrix4, source:flight.esm.types.meshgeometry.Types.InstancedMesh, index:Float):Bool;
  public static function getInstancedMeshSignals(source:flight.esm.types.meshgeometry.Types.InstancedMesh):Null<flight.esm.types.meshgeometry.Types.InstancedMeshSignals>;
  public static function getMeshDeformer(source:flight.esm.types.meshgeometry.Types.Mesh):flight.esm.types.scene3d.Types.MeshDeformer;
  public static function getMeshSignals(source:flight.esm.types.meshgeometry.Types.Mesh):Null<flight.esm.types.node.Types.NodeSignals>;
  public static function getNode3DSignals(source:flight.esm.types.scene3d.Types.Node3D):Null<flight.esm.types.node.Types.NodeSignals>;
  public static function getNode3DWorldAlpha(source:flight.esm.types.scene3d.Types.Node3D):Float;
  public static function getNode3DWorldBounds(out:flight.esm.types.geometry.Types.AabbLike, node:flight.esm.types.scene3d.Types.Node3D):Void;
  public static function getScene3DKindUsage(out:flight.esm.types.scene3d.Types.Scene3DKindUsage, scene:flight.esm.types.scene3d_contract.Types.Scene3D):Void;
  public static function getScene3DMaterials(root:flight.esm.types.scene3d.Types.Node3D, out:Array<flight.esm.types.materials_contract.Types.Material>):Void;
  public static function invalidateInstancedMesh(target:flight.esm.types.meshgeometry.Types.InstancedMesh):Void;
  public static function isBillboard(source:flight.esm.types.scene3d.Types.Node3D):Bool;
  public static function isInstancedMesh(source:Dynamic):Bool;
  public static function isMesh(source:Dynamic):Bool;
  public static function isNode3D(node:flight.esm.types.node.Types.NodeAny):Bool;
  public static function iterateInstancedMeshInstances(source:flight.esm.types.meshgeometry.Types.InstancedMesh, visitor:((index:Float, matrix:flight.esm.types.geometry.Types.Matrix4) -> Void)):Void;
  public static function orientBillboardToCamera(billboard:flight.esm.types.scene3d.Types.Billboard, camera:flight.esm.types.camera.Types.Camera3D):Bool;
  public static function orientScene3DBillboardsToCamera(scene:flight.esm.types.scene3d.Types.Node3D, camera:flight.esm.types.camera.Types.Camera3D):Bool;
  public static function prepareScene3DMorph(scene:flight.esm.types.node.Types.NodeAny):Void;
  public static function removeInstancedMeshInstance(target:flight.esm.types.meshgeometry.Types.InstancedMesh, index:Float):Void;
  public static function reserveInstancedMesh(target:flight.esm.types.meshgeometry.Types.InstancedMesh, capacity:Float):Void;
  public static function setInstancedMeshInstanceColor(target:flight.esm.types.meshgeometry.Types.InstancedMesh, index:Float, color:Float):Void;
  public static function setInstancedMeshInstanceCount(target:flight.esm.types.meshgeometry.Types.InstancedMesh, count:Float):Void;
  public static function setInstancedMeshInstanceMatrix(target:flight.esm.types.meshgeometry.Types.InstancedMesh, index:Float, matrix:flight.esm.types.geometry.Types.Matrix4):Void;
  public static function setInstancedMeshInstanceMatrixRange(target:flight.esm.types.meshgeometry.Types.InstancedMesh, startIndex:Float, count:Float, source:js.lib.Float32Array):Void;
  public static function setNode3DAlpha(source:flight.esm.types.scene3d.Types.Node3D, alpha:Float):Void;
  public static function setNode3DLookAt(node:flight.esm.types.scene3d.Types.Node3D, eye:flight.esm.types.geometry.Types.Vector3Like, target:flight.esm.types.geometry.Types.Vector3Like, up:flight.esm.types.geometry.Types.Vector3Like):Void;
  public static function updateMeshMorph(mesh:flight.esm.types.meshgeometry.Types.Mesh):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
