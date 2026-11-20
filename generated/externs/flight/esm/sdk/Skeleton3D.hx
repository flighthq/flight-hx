package flight.esm.sdk;

#if (js && flight_esm)
@:jsRequire("@flighthq/sdk/skeleton3d")
extern class Skeleton3D {
  public static function areSkeleton3DGuardsEnabled():Bool;
  public static function captureMeshSkinBindPose(geometry:flight.esm.types.meshgeometry.Types.MeshGeometry):flight.esm.types.meshgeometry.Types.MeshSkinBindPose;
  public static function cloneSkeleton3D(skeleton:flight.esm.types.scene3d.Types.Skeleton3D):flight.esm.types.scene3d.Types.Skeleton3D;
  public static function cloneSkeleton3DJointHierarchy(skeleton:flight.esm.types.scene3d.Types.Skeleton3D, cloneJoint:((joint:flight.esm.types.scene3d.Types.Node3D, jointIndex:Float) -> flight.esm.types.scene3d.Types.Node3D)):flight.esm.types.scene3d.Types.Skeleton3D;
  public static function computeSkeleton3DJointMatrices(skeleton:flight.esm.types.scene3d.Types.Skeleton3D):Void;
  public static function createSkeleton3D(joints:Array<flight.esm.types.scene3d.Types.Node3D>, ?inverseBindMatrices:Null<js.lib.Float32Array>, ?names:Null<Array<String>>):flight.esm.types.scene3d.Types.Skeleton3D;
  public static function disableSkeleton3DGuards():Void;
  public static function disposeSkeleton3D(skeleton:flight.esm.types.scene3d.Types.Skeleton3D):Void;
  public static function enableSkeleton3DGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function equalsSkeleton3D(a:flight.esm.types.scene3d.Types.Skeleton3D, b:flight.esm.types.scene3d.Types.Skeleton3D):Bool;
  public static function getMeshSkinConservativeBounds(out:flight.esm.types.geometry.Types.AabbLike, bindPose:flight.esm.types.meshgeometry.Types.MeshSkinBindPose, skeleton:flight.esm.types.scene3d.Types.Skeleton3D):Void;
  public static function getMeshSkinExactBounds(out:flight.esm.types.geometry.Types.AabbLike, bindPose:flight.esm.types.meshgeometry.Types.MeshSkinBindPose, skeleton:flight.esm.types.scene3d.Types.Skeleton3D):Void;
  public static function getSkeleton3DJointIndexByName(skeleton:flight.esm.types.scene3d.Types.Skeleton3D, name:String):Float;
  public static function getSkeleton3DJointWorldMatrix(out:flight.esm.types.geometry.Types.Matrix4Like, skeleton:flight.esm.types.scene3d.Types.Skeleton3D, jointIndex:Float):Bool;
  public static function getSkeleton3DJointWorldMatrixByName(out:flight.esm.types.geometry.Types.Matrix4Like, skeleton:flight.esm.types.scene3d.Types.Skeleton3D, name:String):Bool;
  public static function prepareMeshSkinning(mesh:flight.esm.types.meshgeometry.Types.Mesh):Void;
  public static function prepareScene3DSkinning(scene:flight.esm.types.node.Types.NodeAny):Void;
  public static function setSkeleton3DBindPose(skeleton:flight.esm.types.scene3d.Types.Skeleton3D):Void;
  public static function skinMeshGeometry(geometry:flight.esm.types.meshgeometry.Types.MeshGeometry, skeleton:flight.esm.types.scene3d.Types.Skeleton3D, bindPose:flight.esm.types.meshgeometry.Types.MeshSkinBindPose):Void;
  public static function skinTangents(outTangents:js.lib.Float32Array, tangents:js.lib.Float32Array, joints:Dynamic, weights:js.lib.Float32Array, jointMatrices:js.lib.Float32Array):Void;
  public static function skinVertices(outPositions:js.lib.Float32Array, outNormals:js.lib.Float32Array, positions:js.lib.Float32Array, normals:js.lib.Float32Array, joints:Dynamic, weights:js.lib.Float32Array, jointMatrices:js.lib.Float32Array, normalMatrices:js.lib.Float32Array):Void;
  public static function updateMeshDeformation(mesh:flight.esm.types.meshgeometry.Types.Mesh):Void;
  public static function updateMeshSkin(mesh:flight.esm.types.meshgeometry.Types.Mesh):Void;
  public static function updateMeshSkinBindPoseDeformInput(bindPose:flight.esm.types.meshgeometry.Types.MeshSkinBindPose, geometry:flight.esm.types.meshgeometry.Types.MeshGeometry):Void;
  public static function validateSkeleton3D(skeleton:flight.esm.types.scene3d.Types.Skeleton3D):Null<flight.esm.types.skeleton3d.Types.Skeleton3DValidationDiagnostic>;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
