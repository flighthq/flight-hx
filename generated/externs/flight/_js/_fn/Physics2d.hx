package flight._js._fn;

@:jsRequire("@flighthq/physics2d")
extern class Physics2d {
	@:native("synchronizePhysics2DBroadphase")
	public static function synchronizePhysics2dBroadphase(world:flight._js.Physics2DWorld):Void;
	@:native("synchronizePhysics2DSweptBroadphase")
	public static function synchronizePhysics2dSweptBroadphase(world:flight._js.Physics2DWorld, dt:Float):Void;
	@:native("createPhysics2DColliderWorldShape")
	public static function createPhysics2dColliderWorldShape(local:flight._js.CollisionShape2D):flight._js.CollisionShape2D;
	@:native("updatePhysics2DColliderWorldShape")
	public static function updatePhysics2dColliderWorldShape(collider:flight._js.Physics2DCollider, body:flight._js.RigidBody2D):Void;
	@:native("writePhysics2DColliderBounds")
	public static function writePhysics2dColliderBounds(out:flight._js.SpatialAabb2D, collider:flight._js.Physics2DCollider):Void;
	@:native("createPhysics2DDebugGeometry")
	public static function createPhysics2dDebugGeometry():flight._js.Physics2DDebugGeometry;
	@:native("writePhysics2DDebugGeometry")
	public static function writePhysics2dDebugGeometry(out:flight._js.Physics2DDebugGeometry, world:flight._js.Physics2DWorld, options:Null<flight._js.Physics2DDebugGeometryOptions>):Void;
	@:native("arePhysics2DGuardsEnabled")
	public static function arePhysics2dGuardsEnabled(guards:flight._js.Physics2DGuardState):Bool;
	@:native("disablePhysics2DGuards")
	public static function disablePhysics2dGuards(guards:flight._js.Physics2DGuardState):Void;
	@:native("enablePhysics2DGuards")
	public static function enablePhysics2dGuards(guards:flight._js.Physics2DGuardState, logState:Dynamic, clock:Dynamic):Void;
	@:native("explainPhysics2DCollision")
	public static function explainPhysics2dCollision(world:flight._js.Physics2DWorld):flight._js.Physics2DCollisionExplanation;
	@:native("explainPhysics2DJoints")
	public static function explainPhysics2dJoints(world:flight._js.Physics2DWorld):flight._js.Physics2DJointResolutionExplanation;
	@:native("explainPhysics2DStep")
	public static function explainPhysics2dStep(world:flight._js.Physics2DWorld, dt:Float):flight._js.Physics2DStepExplanation;
	@:native("buildPhysics2DSolveIslands")
	public static function buildPhysics2dSolveIslands(world:flight._js.Physics2DWorld):Void;
	@:native("isRigidBody2DPairAwake")
	public static function isRigidBody2dPairAwake(a:flight._js.RigidBody2D, b:flight._js.RigidBody2D):Bool;
	@:native("updatePhysics2DSleep")
	public static function updatePhysics2dSleep(world:flight._js.Physics2DWorld, dt:Float):Void;
	@:native("wakePhysics2DBody")
	public static function wakePhysics2dBody(body:flight._js.RigidBody2D):Void;
	@:native("isPhysics2DPairJointSuppressed")
	public static function isPhysics2dPairJointSuppressed(world:flight._js.Physics2DWorld, bodyA:Int, bodyB:Int):Bool;
	@:native("rebuildPhysics2DJointCollisionSuppressions")
	public static function rebuildPhysics2dJointCollisionSuppressions(world:flight._js.Physics2DWorld):Void;
	@:native("createPhysics2DDistanceJoint")
	public static function createPhysics2dDistanceJoint():Dynamic;
	@:native("createPhysics2DGearJoint")
	public static function createPhysics2dGearJoint():Dynamic;
	@:native("createPhysics2DMouseJoint")
	public static function createPhysics2dMouseJoint():Dynamic;
	@:native("createPhysics2DPrismaticJoint")
	public static function createPhysics2dPrismaticJoint():Dynamic;
	@:native("createPhysics2DPulleyJoint")
	public static function createPhysics2dPulleyJoint():Dynamic;
	@:native("createPhysics2DRevoluteJoint")
	public static function createPhysics2dRevoluteJoint():Dynamic;
	@:native("createPhysics2DRopeJoint")
	public static function createPhysics2dRopeJoint():Dynamic;
	@:native("createPhysics2DWeldJoint")
	public static function createPhysics2dWeldJoint():Dynamic;
	@:native("createPhysics2DWheelJoint")
	public static function createPhysics2dWheelJoint():Dynamic;
	@:native("createPhysics2DJointReaction")
	public static function createPhysics2dJointReaction():flight._js.Physics2DJointReaction;
	@:native("writePhysics2DJointReaction")
	public static function writePhysics2dJointReactionPhysics2DdistanceJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DDistanceJoint, dt:Float):Bool;
	@:native("writePhysics2DJointReaction")
	public static function writePhysics2dJointReactionPhysics2DgearJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DGearJoint, dt:Float):Bool;
	@:native("writePhysics2DJointReaction")
	public static function writePhysics2dJointReactionPhysics2DmouseJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DMouseJoint, dt:Float):Bool;
	@:native("writePhysics2DJointReaction")
	public static function writePhysics2dJointReactionPhysics2DprismaticJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DPrismaticJoint, dt:Float):Bool;
	@:native("writePhysics2DJointReaction")
	public static function writePhysics2dJointReactionPhysics2DpulleyJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DPulleyJoint, dt:Float):Bool;
	@:native("writePhysics2DJointReaction")
	public static function writePhysics2dJointReactionPhysics2DrevoluteJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DRevoluteJoint, dt:Float):Bool;
	@:native("writePhysics2DJointReaction")
	public static function writePhysics2dJointReactionPhysics2DropeJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DRopeJoint, dt:Float):Bool;
	@:native("writePhysics2DJointReaction")
	public static function writePhysics2dJointReactionPhysics2DweldJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DWeldJoint, dt:Float):Bool;
	@:native("writePhysics2DJointReaction")
	public static function writePhysics2dJointReactionPhysics2DwheelJoint(out:flight._js.Physics2DJointReaction, world:flight._js.Physics2DWorld, joint:flight._js.Physics2DWheelJoint, dt:Float):Bool;
	@:native("addPhysics2DJoint")
	public static function addPhysics2dJoint(world:flight._js.Physics2DWorld, joint:flight._js.Physics2DJointRef):Void;
	@:native("getPhysics2DJointSolver")
	public static function getPhysics2dJointSolver(world:flight._js.Physics2DWorld, kind:String):Null<flight._js.Physics2DJointSolverRef>;
	@:native("invalidatePhysics2DJoint")
	public static function invalidatePhysics2dJoint(world:flight._js.Physics2DWorld, joint:flight._js.Physics2DJointRef):Bool;
	@:native("registerPhysics2DJointSolver")
	public static function registerPhysics2dJointSolver(world:flight._js.Physics2DWorld, kind:String, solver:flight._js.Physics2DJointSolverRef):Void;
	@:native("removePhysics2DJoint")
	public static function removePhysics2dJoint(world:flight._js.Physics2DWorld, joint:flight._js.Physics2DJointRef):Bool;
	@:native("writePhysics2DSoftRowParameters")
	public static function writePhysics2dSoftRowParameters(out:Dynamic, mass:Float, frequencyHz:Float, dampingRatio:Float, dt:Float, hardBiasFactor:Float):Void;
	@:native("computePhysics2DColliderMassData")
	public static function computePhysics2dColliderMassData(out:flight._js.Physics2DMassData, collider:flight._js.Physics2DCollider):Void;
	@:native("updateRigidBody2DMassData")
	public static function updateRigidBody2dMassData(body:flight._js.RigidBody2D):Void;
	@:native("mixPhysics2DFriction")
	public static function mixPhysics2dFriction(first:Float, second:Float):Float;
	@:native("mixPhysics2DRestitution")
	public static function mixPhysics2dRestitution(first:Float, second:Float):Float;
	@:native("syncPhysics2DBodyToNode2D")
	public static function syncPhysics2dBodyToNode2d(body:flight._js.RigidBody2D, node:Dynamic):Void;
	@:native("assertPhysics2DBodyNotStepping")
	public static function assertPhysics2dBodyNotStepping(body:flight._js.RigidBody2D):Void;
	@:native("assertPhysics2DWorldNotStepping")
	public static function assertPhysics2dWorldNotStepping(world:flight._js.Physics2DWorld):Void;
	@:native("registerBuiltInPhysics2DJointSolvers")
	public static function registerBuiltInPhysics2dJointSolvers(world:flight._js.Physics2DWorld):Void;
	@:native("applyPhysics2DImpulse")
	public static function applyPhysics2dImpulse(bodyA:flight._js.RigidBody2D, bodyB:flight._js.RigidBody2D, rAx:Float, rAy:Float, rBx:Float, rBy:Float, impulseX:Float, impulseY:Float):Void;
	@:native("relativeNormalVelocity")
	public static function relativeNormalVelocity(bodyA:flight._js.RigidBody2D, bodyB:flight._js.RigidBody2D, point:flight._js.Physics2DContactPoint, normalX:Float, normalY:Float):Float;
	@:native("solvePhysics2DContactIndicesOnce")
	public static function solvePhysics2dContactIndicesOnce(world:flight._js.Physics2DWorld, indices:Dynamic, start:Int, count:Int):Void;
	@:native("solvePhysics2DContacts")
	public static function solvePhysics2dContacts(world:flight._js.Physics2DWorld):Void;
	@:native("solvePhysics2DContactsOnce")
	public static function solvePhysics2dContactsOnce(world:flight._js.Physics2DWorld):Void;
	@:native("warmStartPhysics2DContactIndices")
	public static function warmStartPhysics2dContactIndices(world:flight._js.Physics2DWorld, indices:Dynamic, start:Int, count:Int):Void;
	@:native("warmStartPhysics2DContacts")
	public static function warmStartPhysics2dContacts(world:flight._js.Physics2DWorld):Void;
	@:native("stepPhysics2D")
	public static function stepPhysics2d(world:flight._js.Physics2DWorld, dt:Float, registry:flight._js.CollisionRegistry2D, guards:Null<flight._js.Physics2DGuardState>):Void;
	@:native("isPhysics2DBodyStateValid")
	public static function isPhysics2dBodyStateValid(world:flight._js.Physics2DWorld):Bool;
	@:native("isPhysics2DContactStateValid")
	public static function isPhysics2dContactStateValid(world:flight._js.Physics2DWorld):Bool;
	@:native("isPhysics2DContactValid")
	public static function isPhysics2dContactValid(contact:flight._js.Physics2DContact):Bool;
	@:native("isPhysics2DGravityValid")
	public static function isPhysics2dGravityValid(world:flight._js.Physics2DWorld):Bool;
	@:native("isPhysics2DJointStateValid")
	public static function isPhysics2dJointStateValid(world:flight._js.Physics2DWorld):Bool;
	@:native("isPhysics2DPreviousTimestepValid")
	public static function isPhysics2dPreviousTimestepValid(world:flight._js.Physics2DWorld):Bool;
	@:native("isPhysics2DSolverConfigValid")
	public static function isPhysics2dSolverConfigValid(config:flight._js.Physics2DSolverConfig):Bool;
	@:native("isPhysics2DTimestepValid")
	public static function isPhysics2dTimestepValid(dt:Float):Bool;
	@:native("createPhysics2DCollider")
	public static function createPhysics2dCollider(local:flight._js.CollisionShape2D):Dynamic;
	@:native("createPhysics2DSolverConfig")
	public static function createPhysics2dSolverConfig(options:Null<flight._js.Physics2DSolverConfigOptions>):flight._js.Physics2DSolverConfig;
	@:native("createPhysics2DWorld")
	public static function createPhysics2dWorld():flight._js.Physics2DWorld;
	@:native("createRigidBody2D")
	public static function createRigidBody2d():Dynamic;
	@:native("addPhysics2DBody")
	public static function addPhysics2dBody(world:flight._js.Physics2DWorld, body:Dynamic):Void;
	@:native("addPhysics2DCollider")
	public static function addPhysics2dCollider(world:flight._js.Physics2DWorld, body:Dynamic, collider:Dynamic):Void;
	@:native("applyPhysics2DForce")
	public static function applyPhysics2dForce(body:flight._js.RigidBody2D, forceX:Float, forceY:Float):Bool;
	@:native("applyPhysics2DForceAtPoint")
	public static function applyPhysics2dForceAtPoint(body:flight._js.RigidBody2D, forceX:Float, forceY:Float, pointX:Float, pointY:Float):Bool;
	@:native("applyPhysics2DLinearImpulse")
	public static function applyPhysics2dLinearImpulse(body:flight._js.RigidBody2D, impulseX:Float, impulseY:Float):Bool;
	@:native("applyPhysics2DLinearImpulseAtPoint")
	public static function applyPhysics2dLinearImpulseAtPoint(body:flight._js.RigidBody2D, impulseX:Float, impulseY:Float, pointX:Float, pointY:Float):Bool;
	@:native("applyPhysics2DTorque")
	public static function applyPhysics2dTorque(body:flight._js.RigidBody2D, torque:Float):Bool;
	@:native("findPhysics2DBody")
	public static function findPhysics2dBody(world:flight._js.Physics2DWorld, index:Int):Null<Dynamic>;
	@:native("hydratePhysics2DWorld")
	public static function hydratePhysics2dWorld(world:flight._js.Physics2DWorld):Bool;
	@:native("invalidatePhysics2DCollider")
	public static function invalidatePhysics2dCollider(world:flight._js.Physics2DWorld, body:Dynamic, collider:Dynamic):Bool;
	@:native("isPhysics2DPairOrdered")
	public static function isPhysics2dPairOrdered(a:flight._js.RigidBody2D, b:flight._js.RigidBody2D):Bool;
	@:native("removePhysics2DBody")
	public static function removePhysics2dBody(world:flight._js.Physics2DWorld, body:Dynamic):Bool;
	@:native("removePhysics2DCollider")
	public static function removePhysics2dCollider(world:flight._js.Physics2DWorld, body:Dynamic, collider:Dynamic):Bool;
	@:native("setPhysics2DBodyBullet")
	public static function setPhysics2dBodyBullet(world:flight._js.Physics2DWorld, body:Dynamic, bullet:Bool):Bool;
	@:native("setPhysics2DBodyFixedRotation")
	public static function setPhysics2dBodyFixedRotation(world:flight._js.Physics2DWorld, body:Dynamic, fixedRotation:Bool):Bool;
	@:native("setPhysics2DBodySleepEnabled")
	public static function setPhysics2dBodySleepEnabled(world:flight._js.Physics2DWorld, body:Dynamic, sleepEnabled:Bool):Bool;
	@:native("setPhysics2DBodyTransform")
	public static function setPhysics2dBodyTransform(world:flight._js.Physics2DWorld, body:Dynamic, x:Float, y:Float, angle:Float):Bool;
	@:native("setPhysics2DBodyType")
	public static function setPhysics2dBodyType(world:flight._js.Physics2DWorld, body:Dynamic, bodyType:Dynamic):Bool;
	@:native("createPhysics2DQueryFilter")
	public static function createPhysics2dQueryFilter():flight._js.Physics2DQueryFilter;
	@:native("createPhysics2DQueryResult")
	public static function createPhysics2dQueryResult():flight._js.Physics2DQueryResult;
	@:native("createPhysics2DRayResult")
	public static function createPhysics2dRayResult():flight._js.Physics2DRayResult;
	@:native("createPhysics2DShapeCastResult")
	public static function createPhysics2dShapeCastResult():flight._js.Physics2DShapeCastResult;
	@:native("queryPhysics2DPoint")
	public static function queryPhysics2dPoint(out:flight._js.Physics2DQueryResult, world:flight._js.Physics2DWorld, x:Float, y:Float, filter:Null<flight._js.Physics2DQueryFilter>):Void;
	@:native("queryPhysics2DRay")
	public static function queryPhysics2dRay(out:flight._js.Physics2DRayResult, world:flight._js.Physics2DWorld, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Null<Float>, filter:Null<flight._js.Physics2DQueryFilter>):Void;
	@:native("queryPhysics2DRayClosest")
	public static function queryPhysics2dRayClosest(out:flight._js.Physics2DRayResult, world:flight._js.Physics2DWorld, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Null<Float>, filter:Null<flight._js.Physics2DQueryFilter>):Void;
	@:native("queryPhysics2DRegion")
	public static function queryPhysics2dRegion(out:flight._js.Physics2DQueryResult, world:flight._js.Physics2DWorld, region:flight._js.SpatialAabb2D, filter:Null<flight._js.Physics2DQueryFilter>):Void;
	@:native("queryPhysics2DShapeCast")
	public static function queryPhysics2dShapeCast(out:flight._js.Physics2DShapeCastResult, world:flight._js.Physics2DWorld, registry:flight._js.CollisionRegistry2D, shape:flight._js.CollisionShape2D, dx:Float, dy:Float, maxFraction:Null<Float>, filter:Null<flight._js.Physics2DQueryFilter>):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DdebugGeometry(ptr:flight._js.Physics2DDebugGeometry):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DcollisionExplanation(ptr:flight._js.Physics2DCollisionExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DjointResolutionExplanation(ptr:flight._js.Physics2DJointResolutionExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DstepExplanation(ptr:flight._js.Physics2DStepExplanation):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DjointReaction(ptr:flight._js.Physics2DJointReaction):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DjointSolverRef(ptr:flight._js.Physics2DJointSolverRef):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DsolverConfig(ptr:flight._js.Physics2DSolverConfig):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2Dworld(ptr:flight._js.Physics2DWorld):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DqueryFilter(ptr:flight._js.Physics2DQueryFilter):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DqueryResult(ptr:flight._js.Physics2DQueryResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DrayResult(ptr:flight._js.Physics2DRayResult):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freePhysics2DshapeCastResult(ptr:flight._js.Physics2DShapeCastResult):Void {}
}
