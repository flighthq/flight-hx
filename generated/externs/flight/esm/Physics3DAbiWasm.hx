package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/physics3d-abi-wasm")
extern class Physics3DAbiWasm {
  public static final Physics3DAbiBodyFlag:Dynamic;
  public static final Physics3DAbiBodyType:Dynamic;
  public static final Physics3DAbiBodyValue:Dynamic;
  public static final Physics3DAbiBodyValueStride:Float;
  public static final Physics3DAbiCapability:Dynamic;
  public static final Physics3DAbiCommandByteLength:Dynamic;
  public static final Physics3DAbiCommandHeaderByteLength:Float;
  public static final Physics3DAbiCommandHeaderOffset:Dynamic;
  public static final Physics3DAbiCommandKind:Dynamic;
  public static final Physics3DAbiCommandMagic:Float;
  public static final Physics3DAbiCommandRecordHeaderByteLength:Float;
  public static final Physics3DAbiCommandRecordOffset:Dynamic;
  public static final Physics3DAbiContactFlag:Dynamic;
  public static final Physics3DAbiContactId:Dynamic;
  public static final Physics3DAbiContactIdStride:Float;
  public static final Physics3DAbiContactPointValue:Dynamic;
  public static final Physics3DAbiContactPointValueStride:Float;
  public static final Physics3DAbiContactValue:Dynamic;
  public static final Physics3DAbiContactValueStride:Float;
  public static final Physics3DAbiJointFlag:Dynamic;
  public static final Physics3DAbiJointKind:Dynamic;
  public static final Physics3DAbiJointValue:Dynamic;
  public static final Physics3DAbiJointValueStride:Float;
  public static final Physics3DAbiMaxContactPoints:Float;
  public static final Physics3DAbiQueryValue:Dynamic;
  public static final Physics3DAbiQueryValueStride:Float;
  public static final Physics3DAbiSetBodyPayloadOffset:Dynamic;
  public static final Physics3DAbiSetColliderPayloadOffset:Dynamic;
  public static final Physics3DAbiSetJointPayloadOffset:Dynamic;
  public static final Physics3DAbiSetSolverConfigPayloadOffset:Dynamic;
  public static final Physics3DAbiShapeHeaderByteLength:Float;
  public static final Physics3DAbiShapeHeaderOffset:Dynamic;
  public static final Physics3DAbiShapeKind:Dynamic;
  public static final Physics3DAbiVersion:Float;
  public static function clearPhysics3DAbiCommandBuffer(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer):Void;
  public static function createPhysics3DAbi():flight.esm.types.physics3d_abi.Types.Physics3DAbi;
  public static function createPhysics3DAbiBodyBuffer(capacity:Float):flight.esm.types.physics3d_abi.Types.Physics3DAbiBodyBuffer;
  public static function createPhysics3DAbiCommandBuffer(?byteCapacity:Float):flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer;
  public static function createPhysics3DAbiContactBuffer(contactCapacity:Float, pointCapacity:Float):flight.esm.types.physics3d_abi.Types.Physics3DAbiContactBuffer;
  public static function createPhysics3DAbiExecutionResult():flight.esm.types.physics3d_abi.Types.Physics3DAbiExecutionResult;
  public static function createPhysics3DAbiJointBuffer(capacity:Float):flight.esm.types.physics3d_abi.Types.Physics3DAbiJointBuffer;
  public static function createPhysics3DAbiQueryBuffer(capacity:Float):flight.esm.types.physics3d_abi.Types.Physics3DAbiQueryBuffer;
  public static function createPhysics3DAbiWorld(abi:flight.esm.types.physics3d_abi.Types.Physics3DAbi):Float;
  public static function createReferencePhysics3DAbi():flight.esm.types.physics3d_abi.Types.Physics3DAbi;
  public static function destroyPhysics3DAbiWorld(abi:flight.esm.types.physics3d_abi.Types.Physics3DAbi, world:Float):Bool;
  public static function executePhysics3DAbiCommands(abi:flight.esm.types.physics3d_abi.Types.Physics3DAbi, world:Float, commands:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiExecutionResult):Bool;
  public static function getPhysics3DAbiCommandBufferRemainingByteLength(buffer:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer):Float;
  public static function getPhysics3DAbiSetColliderCommandByteLength(collider:flight.esm.types.physics3d.Types.Physics3DCollider):Float;
  public static function getPhysics3DAbiWorldStatus(abi:flight.esm.types.physics3d_abi.Types.Physics3DAbi, world:Float):flight.esm.types.physics3d_abi.Types.Physics3DAbiWorldStatus;
  public static function initPhysics3DAbiWasm():Void;
  public static function queryPhysics3DAbiPoint(abi:flight.esm.types.physics3d_abi.Types.Physics3DAbi, world:Float, x:Float, y:Float, z:Float, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiQueryBuffer, ?filter:Null<flight.esm.types.physics3d.Types.Physics3DQueryFilter>):Bool;
  public static function queryPhysics3DAbiRay(abi:flight.esm.types.physics3d_abi.Types.Physics3DAbi, world:Float, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiQueryBuffer, ?maxFraction:Float, ?filter:Null<flight.esm.types.physics3d.Types.Physics3DQueryFilter>):Bool;
  public static function queryPhysics3DAbiRayClosest(abi:flight.esm.types.physics3d_abi.Types.Physics3DAbi, world:Float, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiQueryBuffer, ?maxFraction:Float, ?filter:Null<flight.esm.types.physics3d.Types.Physics3DQueryFilter>):Bool;
  public static function queryPhysics3DAbiRegion(abi:flight.esm.types.physics3d_abi.Types.Physics3DAbi, world:Float, region:flight.esm.types.spatial.Types.SpatialAabb3D, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiQueryBuffer, ?filter:Null<flight.esm.types.physics3d.Types.Physics3DQueryFilter>):Bool;
  public static function queryPhysics3DAbiShapeCast(abi:flight.esm.types.physics3d_abi.Types.Physics3DAbi, world:Float, shape:flight.esm.types.collision.Types.CollisionBuiltInShape3D, dx:Float, dy:Float, dz:Float, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiQueryBuffer, ?maxFraction:Float, ?filter:Null<flight.esm.types.physics3d.Types.Physics3DQueryFilter>):Bool;
  public static function readPhysics3DAbiBodies(abi:flight.esm.types.physics3d_abi.Types.Physics3DAbi, world:Float, bodyIds:Null<js.lib.Uint32Array>, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiBodyBuffer):Bool;
  public static function readPhysics3DAbiContacts(abi:flight.esm.types.physics3d_abi.Types.Physics3DAbi, world:Float, selection:flight.esm.types.physics3d_abi.Types.Physics3DAbiContactSelection, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiContactBuffer):Bool;
  public static function readPhysics3DAbiJoints(abi:flight.esm.types.physics3d_abi.Types.Physics3DAbi, world:Float, out:flight.esm.types.physics3d_abi.Types.Physics3DAbiJointBuffer):Bool;
  public static function stepPhysics3DAbiWorld(abi:flight.esm.types.physics3d_abi.Types.Physics3DAbi, world:Float, dt:Float, ?hooks:Null<flight.esm.types.physics3d_abi.Types.Physics3DAbiContactHooks>):flight.esm.types.physics3d_abi.Types.Physics3DAbiStepStatus;
  public static function writePhysics3DAbiApplyForceAtPointCommand(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, bodyId:Float, x:Float, y:Float, z:Float, pointX:Float, pointY:Float, pointZ:Float):Bool;
  public static function writePhysics3DAbiApplyForceCommand(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, bodyId:Float, x:Float, y:Float, z:Float):Bool;
  public static function writePhysics3DAbiApplyLinearImpulseAtPointCommand(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, bodyId:Float, x:Float, y:Float, z:Float, pointX:Float, pointY:Float, pointZ:Float):Bool;
  public static function writePhysics3DAbiApplyLinearImpulseCommand(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, bodyId:Float, x:Float, y:Float, z:Float):Bool;
  public static function writePhysics3DAbiApplyTorqueCommand(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, bodyId:Float, x:Float, y:Float, z:Float):Bool;
  public static function writePhysics3DAbiDestroyBodyCommand(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, bodyId:Float):Bool;
  public static function writePhysics3DAbiDestroyColliderCommand(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, colliderId:Float):Bool;
  public static function writePhysics3DAbiDestroyJointCommand(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, jointId:Float):Bool;
  public static function writePhysics3DAbiSetBodyCommand(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, bodyId:Float, body:flight.esm.types.physics3d.Types.RigidBody3D):Bool;
  public static function writePhysics3DAbiSetColliderCommand(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, colliderId:Float, bodyId:Float, collider:flight.esm.types.physics3d.Types.Physics3DCollider):Bool;
  public static function writePhysics3DAbiSetGravityCommand(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, x:Float, y:Float, z:Float):Bool;
  public static function writePhysics3DAbiSetJointCommand(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, jointId:Float, joint:flight.esm.types.physics3d.Types.Physics3DJoint):Bool;
  public static function writePhysics3DAbiSetSolverConfigCommand(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, config:flight.esm.types.physics3d.Types.Physics3DSolverConfig):Bool;
  public static function writePhysics3DAbiWakeBodyCommand(out:flight.esm.types.physics3d_abi.Types.Physics3DAbiCommandBuffer, bodyId:Float):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
