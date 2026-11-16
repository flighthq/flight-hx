package flight._js._fn;

@:jsRequire("@flighthq/physics2d-abi")
extern class Physics2dAbi {
	@:native("createPhysics2DAbi")
	public static function createPhysics2dAbi():flight._js.Physics2DAbi;
	@:native("createPhysics2DAbiWorld")
	public static function createPhysics2dAbiWorld(abi:flight._js.Physics2DAbi):Int;
	@:native("destroyPhysics2DAbiWorld")
	public static function destroyPhysics2dAbiWorld(abi:flight._js.Physics2DAbi, world:Int):Bool;
	@:native("executePhysics2DAbiCommands")
	public static function executePhysics2dAbiCommands(out:flight._js.Physics2DAbiExecutionResult, abi:flight._js.Physics2DAbi, world:Int, commands:flight._js.Physics2DAbiCommandBuffer):Bool;
	@:native("getPhysics2DAbiWorldStatus")
	public static function getPhysics2dAbiWorldStatus(abi:flight._js.Physics2DAbi, world:Int):Dynamic;
	@:native("readPhysics2DAbiBodies")
	public static function readPhysics2dAbiBodies(out:flight._js.Physics2DAbiBodyBuffer, abi:flight._js.Physics2DAbi, world:Int, bodyIds:Null<Dynamic>):Bool;
	@:native("readPhysics2DAbiContacts")
	public static function readPhysics2dAbiContacts(out:flight._js.Physics2DAbiContactBuffer, abi:flight._js.Physics2DAbi, world:Int, selection:Dynamic):Bool;
	@:native("readPhysics2DAbiJoints")
	public static function readPhysics2dAbiJoints(out:flight._js.Physics2DAbiJointBuffer, abi:flight._js.Physics2DAbi, world:Int):Bool;
	@:native("stepPhysics2DAbiWorld")
	public static function stepPhysics2dAbiWorld(abi:flight._js.Physics2DAbi, world:Int, dt:Float, hooks:Null<flight._js.Physics2DAbiContactHooks>):Dynamic;
	@:native("createPhysics2DAbiBodyBuffer")
	public static function createPhysics2dAbiBodyBuffer(capacity:Int):flight._js.Physics2DAbiBodyBuffer;
	@:native("createPhysics2DAbiCommandBuffer")
	public static function createPhysics2dAbiCommandBuffer(byteCapacity:Null<Int>):flight._js.Physics2DAbiCommandBuffer;
	@:native("createPhysics2DAbiContactBuffer")
	public static function createPhysics2dAbiContactBuffer(contactCapacity:Int, pointCapacity:Int):flight._js.Physics2DAbiContactBuffer;
	@:native("createPhysics2DAbiExecutionResult")
	public static function createPhysics2dAbiExecutionResult():flight._js.Physics2DAbiExecutionResult;
	@:native("createPhysics2DAbiJointBuffer")
	public static function createPhysics2dAbiJointBuffer(capacity:Int):flight._js.Physics2DAbiJointBuffer;
	@:native("createPhysics2DAbiQueryBuffer")
	public static function createPhysics2dAbiQueryBuffer(capacity:Int):flight._js.Physics2DAbiQueryBuffer;
	@:native("clearPhysics2DAbiCommandBuffer")
	public static function clearPhysics2dAbiCommandBuffer(out:flight._js.Physics2DAbiCommandBuffer):Void;
	@:native("getPhysics2DAbiCommandBufferRemainingByteLength")
	public static function getPhysics2dAbiCommandBufferRemainingByteLength(buffer:flight._js.Physics2DAbiCommandBuffer):Int;
	@:native("getPhysics2DAbiSetColliderCommandByteLength")
	public static function getPhysics2dAbiSetColliderCommandByteLength(collider:flight._js.Physics2DCollider):Float;
	@:native("writePhysics2DAbiApplyForceAtPointCommand")
	public static function writePhysics2dAbiApplyForceAtPointCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, pointX:Float, pointY:Float):Bool;
	@:native("writePhysics2DAbiApplyForceCommand")
	public static function writePhysics2dAbiApplyForceCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float):Bool;
	@:native("writePhysics2DAbiApplyLinearImpulseAtPointCommand")
	public static function writePhysics2dAbiApplyLinearImpulseAtPointCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, pointX:Float, pointY:Float):Bool;
	@:native("writePhysics2DAbiApplyLinearImpulseCommand")
	public static function writePhysics2dAbiApplyLinearImpulseCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float):Bool;
	@:native("writePhysics2DAbiApplyTorqueCommand")
	public static function writePhysics2dAbiApplyTorqueCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int, torque:Float):Bool;
	@:native("writePhysics2DAbiDestroyBodyCommand")
	public static function writePhysics2dAbiDestroyBodyCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int):Bool;
	@:native("writePhysics2DAbiDestroyColliderCommand")
	public static function writePhysics2dAbiDestroyColliderCommand(out:flight._js.Physics2DAbiCommandBuffer, colliderId:Int):Bool;
	@:native("writePhysics2DAbiDestroyJointCommand")
	public static function writePhysics2dAbiDestroyJointCommand(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int):Bool;
	@:native("writePhysics2DAbiSetBodyCommand")
	public static function writePhysics2dAbiSetBodyCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int, body:flight._js.RigidBody2D):Bool;
	@:native("writePhysics2DAbiSetColliderCommand")
	public static function writePhysics2dAbiSetColliderCommand(out:flight._js.Physics2DAbiCommandBuffer, colliderId:Int, bodyId:Int, collider:flight._js.Physics2DCollider):Bool;
	@:native("writePhysics2DAbiSetGravityCommand")
	public static function writePhysics2dAbiSetGravityCommand(out:flight._js.Physics2DAbiCommandBuffer, x:Float, y:Float):Bool;
	@:native("writePhysics2DAbiSetJointCommand")
	public static function writePhysics2dAbiSetJointCommandPhysics2DdistanceJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DDistanceJoint):Bool;
	@:native("writePhysics2DAbiSetJointCommand")
	public static function writePhysics2dAbiSetJointCommandPhysics2DgearJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DGearJoint):Bool;
	@:native("writePhysics2DAbiSetJointCommand")
	public static function writePhysics2dAbiSetJointCommandPhysics2DmouseJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DMouseJoint):Bool;
	@:native("writePhysics2DAbiSetJointCommand")
	public static function writePhysics2dAbiSetJointCommandPhysics2DprismaticJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DPrismaticJoint):Bool;
	@:native("writePhysics2DAbiSetJointCommand")
	public static function writePhysics2dAbiSetJointCommandPhysics2DpulleyJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DPulleyJoint):Bool;
	@:native("writePhysics2DAbiSetJointCommand")
	public static function writePhysics2dAbiSetJointCommandPhysics2DrevoluteJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DRevoluteJoint):Bool;
	@:native("writePhysics2DAbiSetJointCommand")
	public static function writePhysics2dAbiSetJointCommandPhysics2DropeJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DRopeJoint):Bool;
	@:native("writePhysics2DAbiSetJointCommand")
	public static function writePhysics2dAbiSetJointCommandPhysics2DweldJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DWeldJoint):Bool;
	@:native("writePhysics2DAbiSetJointCommand")
	public static function writePhysics2dAbiSetJointCommandPhysics2DwheelJoint(out:flight._js.Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:flight._js.Physics2DWheelJoint):Bool;
	@:native("writePhysics2DAbiSetSolverConfigCommand")
	public static function writePhysics2dAbiSetSolverConfigCommand(out:flight._js.Physics2DAbiCommandBuffer, config:flight._js.Physics2DSolverConfig):Bool;
	@:native("writePhysics2DAbiWakeBodyCommand")
	public static function writePhysics2dAbiWakeBodyCommand(out:flight._js.Physics2DAbiCommandBuffer, bodyId:Int):Bool;
	@:native("queryPhysics2DAbiPoint")
	public static function queryPhysics2dAbiPoint(out:flight._js.Physics2DAbiQueryBuffer, abi:flight._js.Physics2DAbi, world:Int, x:Float, y:Float, filter:Null<flight._js.Physics2DQueryFilter>):Bool;
	@:native("queryPhysics2DAbiRay")
	public static function queryPhysics2dAbiRay(out:flight._js.Physics2DAbiQueryBuffer, abi:flight._js.Physics2DAbi, world:Int, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Null<Float>, filter:Null<flight._js.Physics2DQueryFilter>):Bool;
	@:native("queryPhysics2DAbiRayClosest")
	public static function queryPhysics2dAbiRayClosest(out:flight._js.Physics2DAbiQueryBuffer, abi:flight._js.Physics2DAbi, world:Int, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Null<Float>, filter:Null<flight._js.Physics2DQueryFilter>):Bool;
	@:native("queryPhysics2DAbiRegion")
	public static function queryPhysics2dAbiRegion(out:flight._js.Physics2DAbiQueryBuffer, abi:flight._js.Physics2DAbi, world:Int, region:flight._js.SpatialAabb2D, filter:Null<flight._js.Physics2DQueryFilter>):Bool;
	@:native("queryPhysics2DAbiShapeCast")
	public static function queryPhysics2dAbiShapeCast(out:flight._js.Physics2DAbiQueryBuffer, abi:flight._js.Physics2DAbi, world:Int, shape:flight._js.CollisionShape2D, dx:Float, dy:Float, maxFraction:Null<Float>, filter:Null<flight._js.Physics2DQueryFilter>):Bool;
	@:native("createReferencePhysics2DAbi")
	public static function createReferencePhysics2dAbi():flight._js.Physics2DAbi;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2Dabi(ptr:flight._js.Physics2DAbi):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DabiBodyBuffer(ptr:flight._js.Physics2DAbiBodyBuffer):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DabiCommandBuffer(ptr:flight._js.Physics2DAbiCommandBuffer):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DabiContactBuffer(ptr:flight._js.Physics2DAbiContactBuffer):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DabiExecutionResult(ptr:flight._js.Physics2DAbiExecutionResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DabiJointBuffer(ptr:flight._js.Physics2DAbiJointBuffer):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DabiQueryBuffer(ptr:flight._js.Physics2DAbiQueryBuffer):Void {}
}
