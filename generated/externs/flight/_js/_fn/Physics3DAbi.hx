package flight._js._fn;

@:jsRequire("@flighthq/physics3d-abi")
extern class Physics3DAbi {
	@:native("createPhysics3DAbi")
	public static function createPhysics3dAbi():flight._js.Physics3DAbi;
	@:native("createPhysics3DAbiWorld")
	public static function createPhysics3dAbiWorld(abi:flight._js.Physics3DAbi):Int;
	@:native("destroyPhysics3DAbiWorld")
	public static function destroyPhysics3dAbiWorld(abi:flight._js.Physics3DAbi, world:Int):Bool;
	@:native("executePhysics3DAbiCommands")
	public static function executePhysics3dAbiCommands(out:flight._js.Physics3DAbiExecutionResult, abi:flight._js.Physics3DAbi, world:Int, commands:flight._js.Physics3DAbiCommandBuffer):Bool;
	@:native("getPhysics3DAbiWorldStatus")
	public static function getPhysics3dAbiWorldStatus(abi:flight._js.Physics3DAbi, world:Int):Dynamic;
	@:native("readPhysics3DAbiBodies")
	public static function readPhysics3dAbiBodies(out:flight._js.Physics3DAbiBodyBuffer, abi:flight._js.Physics3DAbi, world:Int, bodyIds:Null<Dynamic>):Bool;
	@:native("readPhysics3DAbiContacts")
	public static function readPhysics3dAbiContacts(out:flight._js.Physics3DAbiContactBuffer, abi:flight._js.Physics3DAbi, world:Int, selection:Dynamic):Bool;
	@:native("readPhysics3DAbiJoints")
	public static function readPhysics3dAbiJoints(out:flight._js.Physics3DAbiJointBuffer, abi:flight._js.Physics3DAbi, world:Int):Bool;
	@:native("stepPhysics3DAbiWorld")
	public static function stepPhysics3dAbiWorld(abi:flight._js.Physics3DAbi, world:Int, dt:Float, hooks:Null<flight._js.Physics3DAbiContactHooks>):Dynamic;
	@:native("createPhysics3DAbiBodyBuffer")
	public static function createPhysics3dAbiBodyBuffer(capacity:Int):flight._js.Physics3DAbiBodyBuffer;
	@:native("createPhysics3DAbiCommandBuffer")
	public static function createPhysics3dAbiCommandBuffer(byteCapacity:Null<Int>):flight._js.Physics3DAbiCommandBuffer;
	@:native("createPhysics3DAbiContactBuffer")
	public static function createPhysics3dAbiContactBuffer(contactCapacity:Int, pointCapacity:Int):flight._js.Physics3DAbiContactBuffer;
	@:native("createPhysics3DAbiExecutionResult")
	public static function createPhysics3dAbiExecutionResult():flight._js.Physics3DAbiExecutionResult;
	@:native("createPhysics3DAbiJointBuffer")
	public static function createPhysics3dAbiJointBuffer(capacity:Int):flight._js.Physics3DAbiJointBuffer;
	@:native("createPhysics3DAbiQueryBuffer")
	public static function createPhysics3dAbiQueryBuffer(capacity:Int):flight._js.Physics3DAbiQueryBuffer;
	@:native("clearPhysics3DAbiCommandBuffer")
	public static function clearPhysics3dAbiCommandBuffer(out:flight._js.Physics3DAbiCommandBuffer):Void;
	@:native("getPhysics3DAbiCommandBufferRemainingByteLength")
	public static function getPhysics3dAbiCommandBufferRemainingByteLength(buffer:flight._js.Physics3DAbiCommandBuffer):Int;
	@:native("getPhysics3DAbiSetColliderCommandByteLength")
	public static function getPhysics3dAbiSetColliderCommandByteLength(collider:flight._js.Physics3DCollider):Float;
	@:native("writePhysics3DAbiApplyForceAtPointCommand")
	public static function writePhysics3dAbiApplyForceAtPointCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float, pointX:Float, pointY:Float, pointZ:Float):Bool;
	@:native("writePhysics3DAbiApplyForceCommand")
	public static function writePhysics3dAbiApplyForceCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool;
	@:native("writePhysics3DAbiApplyLinearImpulseAtPointCommand")
	public static function writePhysics3dAbiApplyLinearImpulseAtPointCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float, pointX:Float, pointY:Float, pointZ:Float):Bool;
	@:native("writePhysics3DAbiApplyLinearImpulseCommand")
	public static function writePhysics3dAbiApplyLinearImpulseCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool;
	@:native("writePhysics3DAbiApplyTorqueCommand")
	public static function writePhysics3dAbiApplyTorqueCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool;
	@:native("writePhysics3DAbiDestroyBodyCommand")
	public static function writePhysics3dAbiDestroyBodyCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int):Bool;
	@:native("writePhysics3DAbiDestroyColliderCommand")
	public static function writePhysics3dAbiDestroyColliderCommand(out:flight._js.Physics3DAbiCommandBuffer, colliderId:Int):Bool;
	@:native("writePhysics3DAbiDestroyJointCommand")
	public static function writePhysics3dAbiDestroyJointCommand(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int):Bool;
	@:native("writePhysics3DAbiSetBodyCommand")
	public static function writePhysics3dAbiSetBodyCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int, body:flight._js.RigidBody3D):Bool;
	@:native("writePhysics3DAbiSetColliderCommand")
	public static function writePhysics3dAbiSetColliderCommand(out:flight._js.Physics3DAbiCommandBuffer, colliderId:Int, bodyId:Int, collider:flight._js.Physics3DCollider):Bool;
	@:native("writePhysics3DAbiSetGravityCommand")
	public static function writePhysics3dAbiSetGravityCommand(out:flight._js.Physics3DAbiCommandBuffer, x:Float, y:Float, z:Float):Bool;
	@:native("writePhysics3DAbiSetJointCommand")
	public static function writePhysics3dAbiSetJointCommandPhysics3DballAndSocketJoint(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._js.Physics3DBallAndSocketJoint):Bool;
	@:native("writePhysics3DAbiSetJointCommand")
	public static function writePhysics3dAbiSetJointCommandPhysics3DconeTwistJoint(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._js.Physics3DConeTwistJoint):Bool;
	@:native("writePhysics3DAbiSetJointCommand")
	public static function writePhysics3dAbiSetJointCommandPhysics3DdistanceJoint(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._js.Physics3DDistanceJoint):Bool;
	@:native("writePhysics3DAbiSetJointCommand")
	public static function writePhysics3dAbiSetJointCommandPhysics3DfixedJoint(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._js.Physics3DFixedJoint):Bool;
	@:native("writePhysics3DAbiSetJointCommand")
	public static function writePhysics3dAbiSetJointCommandPhysics3Dgeneric6DofJoint(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._js.Physics3DGeneric6DofJoint):Bool;
	@:native("writePhysics3DAbiSetJointCommand")
	public static function writePhysics3dAbiSetJointCommandPhysics3DhingeJoint(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._js.Physics3DHingeJoint):Bool;
	@:native("writePhysics3DAbiSetJointCommand")
	public static function writePhysics3dAbiSetJointCommandPhysics3DsliderJoint(out:flight._js.Physics3DAbiCommandBuffer, jointId:Int, joint:flight._js.Physics3DSliderJoint):Bool;
	@:native("writePhysics3DAbiSetSolverConfigCommand")
	public static function writePhysics3dAbiSetSolverConfigCommand(out:flight._js.Physics3DAbiCommandBuffer, config:flight._js.Physics3DSolverConfig):Bool;
	@:native("writePhysics3DAbiWakeBodyCommand")
	public static function writePhysics3dAbiWakeBodyCommand(out:flight._js.Physics3DAbiCommandBuffer, bodyId:Int):Bool;
	@:native("queryPhysics3DAbiPoint")
	public static function queryPhysics3dAbiPoint(out:flight._js.Physics3DAbiQueryBuffer, abi:flight._js.Physics3DAbi, world:Int, x:Float, y:Float, z:Float, filter:Null<flight._js.Physics3DQueryFilter>):Bool;
	@:native("queryPhysics3DAbiRay")
	public static function queryPhysics3dAbiRay(out:flight._js.Physics3DAbiQueryBuffer, abi:flight._js.Physics3DAbi, world:Int, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Null<Float>, filter:Null<flight._js.Physics3DQueryFilter>):Bool;
	@:native("queryPhysics3DAbiRayClosest")
	public static function queryPhysics3dAbiRayClosest(out:flight._js.Physics3DAbiQueryBuffer, abi:flight._js.Physics3DAbi, world:Int, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Null<Float>, filter:Null<flight._js.Physics3DQueryFilter>):Bool;
	@:native("queryPhysics3DAbiRegion")
	public static function queryPhysics3dAbiRegion(out:flight._js.Physics3DAbiQueryBuffer, abi:flight._js.Physics3DAbi, world:Int, region:flight._js.SpatialAabb3D, filter:Null<flight._js.Physics3DQueryFilter>):Bool;
	@:native("queryPhysics3DAbiShapeCast")
	public static function queryPhysics3dAbiShapeCast(out:flight._js.Physics3DAbiQueryBuffer, abi:flight._js.Physics3DAbi, world:Int, shape:flight._js.CollisionShape3D, dx:Float, dy:Float, dz:Float, maxFraction:Null<Float>, filter:Null<flight._js.Physics3DQueryFilter>):Bool;
	@:native("createReferencePhysics3DAbi")
	public static function createReferencePhysics3dAbi():flight._js.Physics3DAbi;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics3Dabi(ptr:flight._js.Physics3DAbi):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics3DabiBodyBuffer(ptr:flight._js.Physics3DAbiBodyBuffer):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics3DabiCommandBuffer(ptr:flight._js.Physics3DAbiCommandBuffer):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics3DabiContactBuffer(ptr:flight._js.Physics3DAbiContactBuffer):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics3DabiExecutionResult(ptr:flight._js.Physics3DAbiExecutionResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics3DabiJointBuffer(ptr:flight._js.Physics3DAbiJointBuffer):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics3DabiQueryBuffer(ptr:flight._js.Physics3DAbiQueryBuffer):Void {}
}
