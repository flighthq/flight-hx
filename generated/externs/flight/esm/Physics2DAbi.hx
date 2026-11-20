package flight.esm;

#if (js && flight_esm)
@:jsRequire("@flighthq/physics2d-abi")
extern class Physics2DAbi {
  public static final Physics2DAbiBodyFlag:Dynamic;
  public static final Physics2DAbiBodyType:Dynamic;
  public static final Physics2DAbiBodyValue:Dynamic;
  public static final Physics2DAbiBodyValueStride:Float;
  public static final Physics2DAbiCapability:Dynamic;
  public static final Physics2DAbiCommandByteLength:Dynamic;
  public static final Physics2DAbiCommandHeaderByteLength:Float;
  public static final Physics2DAbiCommandHeaderOffset:Dynamic;
  public static final Physics2DAbiCommandKind:Dynamic;
  public static final Physics2DAbiCommandMagic:Float;
  public static final Physics2DAbiCommandRecordHeaderByteLength:Float;
  public static final Physics2DAbiCommandRecordOffset:Dynamic;
  public static final Physics2DAbiContactFlag:Dynamic;
  public static final Physics2DAbiContactId:Dynamic;
  public static final Physics2DAbiContactIdStride:Float;
  public static final Physics2DAbiContactPointValue:Dynamic;
  public static final Physics2DAbiContactPointValueStride:Float;
  public static final Physics2DAbiContactValue:Dynamic;
  public static final Physics2DAbiContactValueStride:Float;
  public static final Physics2DAbiJointCommonValue:Dynamic;
  public static final Physics2DAbiJointFlag:Dynamic;
  public static final Physics2DAbiJointKind:Dynamic;
  public static final Physics2DAbiJointKindValueCount:Float;
  public static final Physics2DAbiJointValue:Dynamic;
  public static final Physics2DAbiJointValueStride:Float;
  public static final Physics2DAbiMaxContactPoints:Float;
  public static final Physics2DAbiQueryValue:Dynamic;
  public static final Physics2DAbiQueryValueStride:Float;
  public static final Physics2DAbiSetBodyPayloadOffset:Dynamic;
  public static final Physics2DAbiSetColliderPayloadOffset:Dynamic;
  public static final Physics2DAbiSetJointPayloadOffset:Dynamic;
  public static final Physics2DAbiSetSolverConfigPayloadOffset:Dynamic;
  public static final Physics2DAbiShapeHeaderByteLength:Float;
  public static final Physics2DAbiShapeHeaderOffset:Dynamic;
  public static final Physics2DAbiShapeKind:Dynamic;
  public static final Physics2DAbiSolverConfigFlag:Dynamic;
  public static final Physics2DAbiSolverConfigValue:Dynamic;
  public static final Physics2DAbiVersion:Float;
  public static function clearPhysics2DAbiCommandBuffer(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer):Void;
  public static function createPhysics2DAbi():flight.esm.types.physics2d_abi.Types.Physics2DAbi;
  public static function createPhysics2DAbiBodyBuffer(capacity:Float):flight.esm.types.physics2d_abi.Types.Physics2DAbiBodyBuffer;
  public static function createPhysics2DAbiCommandBuffer(?byteCapacity:Float):flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer;
  public static function createPhysics2DAbiContactBuffer(contactCapacity:Float, pointCapacity:Float):flight.esm.types.physics2d_abi.Types.Physics2DAbiContactBuffer;
  public static function createPhysics2DAbiExecutionResult():flight.esm.types.physics2d_abi.Types.Physics2DAbiExecutionResult;
  public static function createPhysics2DAbiJointBuffer(capacity:Float):flight.esm.types.physics2d_abi.Types.Physics2DAbiJointBuffer;
  public static function createPhysics2DAbiQueryBuffer(capacity:Float):flight.esm.types.physics2d_abi.Types.Physics2DAbiQueryBuffer;
  public static function createPhysics2DAbiWorld(abi:flight.esm.types.physics2d_abi.Types.Physics2DAbi):Float;
  public static function createReferencePhysics2DAbi():flight.esm.types.physics2d_abi.Types.Physics2DAbi;
  public static function destroyPhysics2DAbiWorld(abi:flight.esm.types.physics2d_abi.Types.Physics2DAbi, world:Float):Bool;
  public static function executePhysics2DAbiCommands(abi:flight.esm.types.physics2d_abi.Types.Physics2DAbi, world:Float, commands:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiExecutionResult):Bool;
  public static function getPhysics2DAbiCommandBufferRemainingByteLength(buffer:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer):Float;
  public static function getPhysics2DAbiSetColliderCommandByteLength(collider:flight.esm.types.physics2d.Types.Physics2DCollider):Float;
  public static function getPhysics2DAbiWorldStatus(abi:flight.esm.types.physics2d_abi.Types.Physics2DAbi, world:Float):flight.esm.types.physics2d_abi.Types.Physics2DAbiWorldStatus;
  public static function queryPhysics2DAbiPoint(abi:flight.esm.types.physics2d_abi.Types.Physics2DAbi, world:Float, x:Float, y:Float, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiQueryBuffer, ?filter:Null<flight.esm.types.physics2d.Types.Physics2DQueryFilter>):Bool;
  public static function queryPhysics2DAbiRay(abi:flight.esm.types.physics2d_abi.Types.Physics2DAbi, world:Float, originX:Float, originY:Float, directionX:Float, directionY:Float, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiQueryBuffer, ?maxFraction:Float, ?filter:Null<flight.esm.types.physics2d.Types.Physics2DQueryFilter>):Bool;
  public static function queryPhysics2DAbiRayClosest(abi:flight.esm.types.physics2d_abi.Types.Physics2DAbi, world:Float, originX:Float, originY:Float, directionX:Float, directionY:Float, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiQueryBuffer, ?maxFraction:Float, ?filter:Null<flight.esm.types.physics2d.Types.Physics2DQueryFilter>):Bool;
  public static function queryPhysics2DAbiRegion(abi:flight.esm.types.physics2d_abi.Types.Physics2DAbi, world:Float, region:flight.esm.types.spatial.Types.SpatialAabb2D, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiQueryBuffer, ?filter:Null<flight.esm.types.physics2d.Types.Physics2DQueryFilter>):Bool;
  public static function queryPhysics2DAbiShapeCast(abi:flight.esm.types.physics2d_abi.Types.Physics2DAbi, world:Float, shape:flight.esm.types.collision.Types.CollisionBuiltInShape2D, dx:Float, dy:Float, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiQueryBuffer, ?maxFraction:Float, ?filter:Null<flight.esm.types.physics2d.Types.Physics2DQueryFilter>):Bool;
  public static function readPhysics2DAbiBodies(abi:flight.esm.types.physics2d_abi.Types.Physics2DAbi, world:Float, bodyIds:Null<js.lib.Uint32Array>, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiBodyBuffer):Bool;
  public static function readPhysics2DAbiContacts(abi:flight.esm.types.physics2d_abi.Types.Physics2DAbi, world:Float, selection:flight.esm.types.physics2d_abi.Types.Physics2DAbiContactSelection, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiContactBuffer):Bool;
  public static function readPhysics2DAbiJoints(abi:flight.esm.types.physics2d_abi.Types.Physics2DAbi, world:Float, out:flight.esm.types.physics2d_abi.Types.Physics2DAbiJointBuffer):Bool;
  public static function stepPhysics2DAbiWorld(abi:flight.esm.types.physics2d_abi.Types.Physics2DAbi, world:Float, dt:Float, ?hooks:Null<flight.esm.types.physics2d_abi.Types.Physics2DAbiContactHooks>):flight.esm.types.physics2d_abi.Types.Physics2DAbiStepStatus;
  public static function writePhysics2DAbiApplyForceAtPointCommand(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, bodyId:Float, x:Float, y:Float, pointX:Float, pointY:Float):Bool;
  public static function writePhysics2DAbiApplyForceCommand(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, bodyId:Float, x:Float, y:Float):Bool;
  public static function writePhysics2DAbiApplyLinearImpulseAtPointCommand(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, bodyId:Float, x:Float, y:Float, pointX:Float, pointY:Float):Bool;
  public static function writePhysics2DAbiApplyLinearImpulseCommand(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, bodyId:Float, x:Float, y:Float):Bool;
  public static function writePhysics2DAbiApplyTorqueCommand(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, bodyId:Float, torque:Float):Bool;
  public static function writePhysics2DAbiDestroyBodyCommand(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, bodyId:Float):Bool;
  public static function writePhysics2DAbiDestroyColliderCommand(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, colliderId:Float):Bool;
  public static function writePhysics2DAbiDestroyJointCommand(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, jointId:Float):Bool;
  public static function writePhysics2DAbiSetBodyCommand(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, bodyId:Float, body:flight.esm.types.physics2d.Types.RigidBody2D):Bool;
  public static function writePhysics2DAbiSetColliderCommand(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, colliderId:Float, bodyId:Float, collider:flight.esm.types.physics2d.Types.Physics2DCollider):Bool;
  public static function writePhysics2DAbiSetGravityCommand(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, x:Float, y:Float):Bool;
  public static function writePhysics2DAbiSetJointCommand(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, jointId:Float, bodyAId:Float, bodyBId:Float, joint:flight.esm.types.physics2d.Types.Physics2DJoint):Bool;
  public static function writePhysics2DAbiSetSolverConfigCommand(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, config:flight.esm.types.physics2d.Types.Physics2DSolverConfig):Bool;
  public static function writePhysics2DAbiWakeBodyCommand(out:flight.esm.types.physics2d_abi.Types.Physics2DAbiCommandBuffer, bodyId:Float):Bool;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
