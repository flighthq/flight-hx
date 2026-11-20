package flight;

#if (js && flight_esm)
extern inline function synchronizePhysics2dBroadphase(world:Physics2DWorld):Void {
	flight._js._fn.Physics2d.synchronizePhysics2dBroadphase(world);
}
#else
extern inline function synchronizePhysics2dBroadphase(world:Physics2DWorld):Void {
#if hl
	flight._hl._fn.Physics2d.synchronizePhysics2dBroadphase(world);
#elseif cpp
	flight._cpp._fn.Physics2d.synchronizePhysics2dBroadphase(world);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.synchronizePhysics2dBroadphase(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function synchronizePhysics2dSweptBroadphase(world:Physics2DWorld, dt:Float):Void {
	flight._js._fn.Physics2d.synchronizePhysics2dSweptBroadphase(world, dt);
}
#else
extern inline function synchronizePhysics2dSweptBroadphase(world:Physics2DWorld, dt:Float):Void {
#if hl
	flight._hl._fn.Physics2d.synchronizePhysics2dSweptBroadphase(world, dt);
#elseif cpp
	flight._cpp._fn.Physics2d.synchronizePhysics2dSweptBroadphase(world, dt);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.synchronizePhysics2dSweptBroadphase(world, dt);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dColliderWorldShape(local:CollisionShape2D):CollisionShape2D {
	return flight._js._fn.Physics2d.createPhysics2dColliderWorldShape(local);
}
#else
extern inline function createPhysics2dColliderWorldShape(local:CollisionShape2D):CollisionShape2D {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dColliderWorldShape(local);
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dColliderWorldShape(local);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dColliderWorldShape(local);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updatePhysics2dColliderWorldShape(collider:Physics2DCollider, body:RigidBody2D):Void {
	flight._js._fn.Physics2d.updatePhysics2dColliderWorldShape(collider, body);
}
#else
extern inline function updatePhysics2dColliderWorldShape(collider:Physics2DCollider, body:RigidBody2D):Void {
#if hl
	flight._hl._fn.Physics2d.updatePhysics2dColliderWorldShape(collider, body);
#elseif cpp
	flight._cpp._fn.Physics2d.updatePhysics2dColliderWorldShape(collider, body);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.updatePhysics2dColliderWorldShape(collider, body);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dColliderBounds(out:SpatialAabb2D, collider:Physics2DCollider):Void {
	flight._js._fn.Physics2d.writePhysics2dColliderBounds(out, collider);
}
#else
extern inline function writePhysics2dColliderBounds(out:SpatialAabb2D, collider:Physics2DCollider):Void {
#if hl
	flight._hl._fn.Physics2d.writePhysics2dColliderBounds(out, collider);
#elseif cpp
	flight._cpp._fn.Physics2d.writePhysics2dColliderBounds(out, collider);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.writePhysics2dColliderBounds(out, collider);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dDebugGeometry():Physics2DDebugGeometry {
	return flight._js._fn.Physics2d.createPhysics2dDebugGeometry();
}
#else
extern inline function createPhysics2dDebugGeometry():Physics2DDebugGeometry {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dDebugGeometry();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dDebugGeometry();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dDebugGeometry();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dDebugGeometry(out:Physics2DDebugGeometry, world:Physics2DWorld, options:Null<Physics2DDebugGeometryOptions>):Void {
	flight._js._fn.Physics2d.writePhysics2dDebugGeometry(out, world, options);
}
#else
extern inline function writePhysics2dDebugGeometry(out:Physics2DDebugGeometry, world:Physics2DWorld, options:Physics2DDebugGeometryOptions):Void {
#if hl
	flight._hl._fn.Physics2d.writePhysics2dDebugGeometry(out, world, options);
#elseif cpp
	flight._cpp._fn.Physics2d.writePhysics2dDebugGeometry(out, world, options);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.writePhysics2dDebugGeometry(out, world, options);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function arePhysics2dGuardsEnabled(guards:Physics2DGuardState):Bool {
	return flight._js._fn.Physics2d.arePhysics2dGuardsEnabled(guards);
}
#else
extern inline function arePhysics2dGuardsEnabled(guards:Physics2DGuardState):Bool {
#if hl
	return flight._hl._fn.Physics2d.arePhysics2dGuardsEnabled(guards);
#elseif cpp
	return flight._cpp._fn.Physics2d.arePhysics2dGuardsEnabled(guards);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.arePhysics2dGuardsEnabled(guards);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disablePhysics2dGuards(guards:Physics2DGuardState):Void {
	flight._js._fn.Physics2d.disablePhysics2dGuards(guards);
}
#else
extern inline function disablePhysics2dGuards(guards:Physics2DGuardState):Void {
#if hl
	flight._hl._fn.Physics2d.disablePhysics2dGuards(guards);
#elseif cpp
	flight._cpp._fn.Physics2d.disablePhysics2dGuards(guards);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.disablePhysics2dGuards(guards);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function enablePhysics2dGuards(guards:Physics2DGuardState, logState:Dynamic, clock:Dynamic):Void {
	flight._js._fn.Physics2d.enablePhysics2dGuards(guards, logState, clock);
}
#end
#if (js && flight_esm)
extern inline function explainPhysics2dCollision(world:Physics2DWorld):Physics2DCollisionExplanation {
	return flight._js._fn.Physics2d.explainPhysics2dCollision(world);
}
#else
extern inline function explainPhysics2dCollision(world:Physics2DWorld):Physics2DCollisionExplanation {
#if hl
	return flight._hl._fn.Physics2d.explainPhysics2dCollision(world);
#elseif cpp
	return flight._cpp._fn.Physics2d.explainPhysics2dCollision(world);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.explainPhysics2dCollision(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainPhysics2dJoints(world:Physics2DWorld):Physics2DJointResolutionExplanation {
	return flight._js._fn.Physics2d.explainPhysics2dJoints(world);
}
#else
extern inline function explainPhysics2dJoints(world:Physics2DWorld):Physics2DJointResolutionExplanation {
#if hl
	return flight._hl._fn.Physics2d.explainPhysics2dJoints(world);
#elseif cpp
	return flight._cpp._fn.Physics2d.explainPhysics2dJoints(world);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.explainPhysics2dJoints(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function explainPhysics2dStep(world:Physics2DWorld, dt:Float):Physics2DStepExplanation {
	return flight._js._fn.Physics2d.explainPhysics2dStep(world, dt);
}
#else
extern inline function explainPhysics2dStep(world:Physics2DWorld, dt:Float):Physics2DStepExplanation {
#if hl
	return flight._hl._fn.Physics2d.explainPhysics2dStep(world, dt);
#elseif cpp
	return flight._cpp._fn.Physics2d.explainPhysics2dStep(world, dt);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.explainPhysics2dStep(world, dt);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function buildPhysics2dSolveIslands(world:Physics2DWorld):Void {
	flight._js._fn.Physics2d.buildPhysics2dSolveIslands(world);
}
#else
extern inline function buildPhysics2dSolveIslands(world:Physics2DWorld):Void {
#if hl
	flight._hl._fn.Physics2d.buildPhysics2dSolveIslands(world);
#elseif cpp
	flight._cpp._fn.Physics2d.buildPhysics2dSolveIslands(world);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.buildPhysics2dSolveIslands(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isRigidBody2dPairAwake(a:RigidBody2D, b:RigidBody2D):Bool {
	return flight._js._fn.Physics2d.isRigidBody2dPairAwake(a, b);
}
#else
extern inline function isRigidBody2dPairAwake(a:RigidBody2D, b:RigidBody2D):Bool {
#if hl
	return flight._hl._fn.Physics2d.isRigidBody2dPairAwake(a, b);
#elseif cpp
	return flight._cpp._fn.Physics2d.isRigidBody2dPairAwake(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.isRigidBody2dPairAwake(a, b);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updatePhysics2dSleep(world:Physics2DWorld, dt:Float):Void {
	flight._js._fn.Physics2d.updatePhysics2dSleep(world, dt);
}
#else
extern inline function updatePhysics2dSleep(world:Physics2DWorld, dt:Float):Void {
#if hl
	flight._hl._fn.Physics2d.updatePhysics2dSleep(world, dt);
#elseif cpp
	flight._cpp._fn.Physics2d.updatePhysics2dSleep(world, dt);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.updatePhysics2dSleep(world, dt);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function wakePhysics2dBody(body:RigidBody2D):Void {
	flight._js._fn.Physics2d.wakePhysics2dBody(body);
}
#else
extern inline function wakePhysics2dBody(body:RigidBody2D):Void {
#if hl
	flight._hl._fn.Physics2d.wakePhysics2dBody(body);
#elseif cpp
	flight._cpp._fn.Physics2d.wakePhysics2dBody(body);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.wakePhysics2dBody(body);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPhysics2dPairJointSuppressed(world:Physics2DWorld, bodyA:Int, bodyB:Int):Bool {
	return flight._js._fn.Physics2d.isPhysics2dPairJointSuppressed(world, bodyA, bodyB);
}
#else
extern inline function isPhysics2dPairJointSuppressed(world:Physics2DWorld, bodyA:Int, bodyB:Int):Bool {
#if hl
	return flight._hl._fn.Physics2d.isPhysics2dPairJointSuppressed(world, bodyA, bodyB);
#elseif cpp
	return flight._cpp._fn.Physics2d.isPhysics2dPairJointSuppressed(world, bodyA, bodyB);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.isPhysics2dPairJointSuppressed(world, bodyA, bodyB);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function rebuildPhysics2dJointCollisionSuppressions(world:Physics2DWorld):Void {
	flight._js._fn.Physics2d.rebuildPhysics2dJointCollisionSuppressions(world);
}
#else
extern inline function rebuildPhysics2dJointCollisionSuppressions(world:Physics2DWorld):Void {
#if hl
	flight._hl._fn.Physics2d.rebuildPhysics2dJointCollisionSuppressions(world);
#elseif cpp
	flight._cpp._fn.Physics2d.rebuildPhysics2dJointCollisionSuppressions(world);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.rebuildPhysics2dJointCollisionSuppressions(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dDistanceJoint():Dynamic {
	return flight._js._fn.Physics2d.createPhysics2dDistanceJoint();
}
#else
extern inline function createPhysics2dDistanceJoint():Dynamic {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dDistanceJoint();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dDistanceJoint();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dDistanceJoint();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dGearJoint():Dynamic {
	return flight._js._fn.Physics2d.createPhysics2dGearJoint();
}
#else
extern inline function createPhysics2dGearJoint():Dynamic {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dGearJoint();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dGearJoint();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dGearJoint();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dMouseJoint():Dynamic {
	return flight._js._fn.Physics2d.createPhysics2dMouseJoint();
}
#else
extern inline function createPhysics2dMouseJoint():Dynamic {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dMouseJoint();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dMouseJoint();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dMouseJoint();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dPrismaticJoint():Dynamic {
	return flight._js._fn.Physics2d.createPhysics2dPrismaticJoint();
}
#else
extern inline function createPhysics2dPrismaticJoint():Dynamic {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dPrismaticJoint();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dPrismaticJoint();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dPrismaticJoint();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dPulleyJoint():Dynamic {
	return flight._js._fn.Physics2d.createPhysics2dPulleyJoint();
}
#else
extern inline function createPhysics2dPulleyJoint():Dynamic {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dPulleyJoint();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dPulleyJoint();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dPulleyJoint();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dRevoluteJoint():Dynamic {
	return flight._js._fn.Physics2d.createPhysics2dRevoluteJoint();
}
#else
extern inline function createPhysics2dRevoluteJoint():Dynamic {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dRevoluteJoint();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dRevoluteJoint();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dRevoluteJoint();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dRopeJoint():Dynamic {
	return flight._js._fn.Physics2d.createPhysics2dRopeJoint();
}
#else
extern inline function createPhysics2dRopeJoint():Dynamic {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dRopeJoint();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dRopeJoint();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dRopeJoint();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dWeldJoint():Dynamic {
	return flight._js._fn.Physics2d.createPhysics2dWeldJoint();
}
#else
extern inline function createPhysics2dWeldJoint():Dynamic {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dWeldJoint();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dWeldJoint();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dWeldJoint();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dWheelJoint():Dynamic {
	return flight._js._fn.Physics2d.createPhysics2dWheelJoint();
}
#else
extern inline function createPhysics2dWheelJoint():Dynamic {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dWheelJoint();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dWheelJoint();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dWheelJoint();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dJointReaction():Physics2DJointReaction {
	return flight._js._fn.Physics2d.createPhysics2dJointReaction();
}
#else
extern inline function createPhysics2dJointReaction():Physics2DJointReaction {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dJointReaction();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dJointReaction();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dJointReaction();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dJointReactionPhysics2DdistanceJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DDistanceJoint, dt:Float):Bool {
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DdistanceJoint(out, world, joint, dt);
}
#else
extern inline function writePhysics2dJointReactionPhysics2DdistanceJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DDistanceJoint, dt:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.writePhysics2dJointReactionPhysics2DdistanceJoint(out, world, joint, dt);
#elseif cpp
	return flight._cpp._fn.Physics2d.writePhysics2dJointReactionPhysics2DdistanceJoint(out, world, joint, dt);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DdistanceJoint(out, world, joint, dt);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dJointReactionPhysics2DgearJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DGearJoint, dt:Float):Bool {
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DgearJoint(out, world, joint, dt);
}
#else
extern inline function writePhysics2dJointReactionPhysics2DgearJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DGearJoint, dt:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.writePhysics2dJointReactionPhysics2DgearJoint(out, world, joint, dt);
#elseif cpp
	return flight._cpp._fn.Physics2d.writePhysics2dJointReactionPhysics2DgearJoint(out, world, joint, dt);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DgearJoint(out, world, joint, dt);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dJointReactionPhysics2DmouseJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DMouseJoint, dt:Float):Bool {
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DmouseJoint(out, world, joint, dt);
}
#else
extern inline function writePhysics2dJointReactionPhysics2DmouseJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DMouseJoint, dt:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.writePhysics2dJointReactionPhysics2DmouseJoint(out, world, joint, dt);
#elseif cpp
	return flight._cpp._fn.Physics2d.writePhysics2dJointReactionPhysics2DmouseJoint(out, world, joint, dt);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DmouseJoint(out, world, joint, dt);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dJointReactionPhysics2DprismaticJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DPrismaticJoint, dt:Float):Bool {
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DprismaticJoint(out, world, joint, dt);
}
#else
extern inline function writePhysics2dJointReactionPhysics2DprismaticJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DPrismaticJoint, dt:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.writePhysics2dJointReactionPhysics2DprismaticJoint(out, world, joint, dt);
#elseif cpp
	return flight._cpp._fn.Physics2d.writePhysics2dJointReactionPhysics2DprismaticJoint(out, world, joint, dt);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DprismaticJoint(out, world, joint, dt);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dJointReactionPhysics2DpulleyJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DPulleyJoint, dt:Float):Bool {
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DpulleyJoint(out, world, joint, dt);
}
#else
extern inline function writePhysics2dJointReactionPhysics2DpulleyJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DPulleyJoint, dt:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.writePhysics2dJointReactionPhysics2DpulleyJoint(out, world, joint, dt);
#elseif cpp
	return flight._cpp._fn.Physics2d.writePhysics2dJointReactionPhysics2DpulleyJoint(out, world, joint, dt);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DpulleyJoint(out, world, joint, dt);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dJointReactionPhysics2DrevoluteJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DRevoluteJoint, dt:Float):Bool {
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DrevoluteJoint(out, world, joint, dt);
}
#else
extern inline function writePhysics2dJointReactionPhysics2DrevoluteJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DRevoluteJoint, dt:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.writePhysics2dJointReactionPhysics2DrevoluteJoint(out, world, joint, dt);
#elseif cpp
	return flight._cpp._fn.Physics2d.writePhysics2dJointReactionPhysics2DrevoluteJoint(out, world, joint, dt);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DrevoluteJoint(out, world, joint, dt);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dJointReactionPhysics2DropeJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DRopeJoint, dt:Float):Bool {
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DropeJoint(out, world, joint, dt);
}
#else
extern inline function writePhysics2dJointReactionPhysics2DropeJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DRopeJoint, dt:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.writePhysics2dJointReactionPhysics2DropeJoint(out, world, joint, dt);
#elseif cpp
	return flight._cpp._fn.Physics2d.writePhysics2dJointReactionPhysics2DropeJoint(out, world, joint, dt);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DropeJoint(out, world, joint, dt);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dJointReactionPhysics2DweldJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DWeldJoint, dt:Float):Bool {
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DweldJoint(out, world, joint, dt);
}
#else
extern inline function writePhysics2dJointReactionPhysics2DweldJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DWeldJoint, dt:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.writePhysics2dJointReactionPhysics2DweldJoint(out, world, joint, dt);
#elseif cpp
	return flight._cpp._fn.Physics2d.writePhysics2dJointReactionPhysics2DweldJoint(out, world, joint, dt);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DweldJoint(out, world, joint, dt);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dJointReactionPhysics2DwheelJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DWheelJoint, dt:Float):Bool {
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DwheelJoint(out, world, joint, dt);
}
#else
extern inline function writePhysics2dJointReactionPhysics2DwheelJoint(out:Physics2DJointReaction, world:Physics2DWorld, joint:Physics2DWheelJoint, dt:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.writePhysics2dJointReactionPhysics2DwheelJoint(out, world, joint, dt);
#elseif cpp
	return flight._cpp._fn.Physics2d.writePhysics2dJointReactionPhysics2DwheelJoint(out, world, joint, dt);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.writePhysics2dJointReactionPhysics2DwheelJoint(out, world, joint, dt);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addPhysics2dJoint(world:Physics2DWorld, joint:Physics2DJointRef):Void {
	flight._js._fn.Physics2d.addPhysics2dJoint(world, joint);
}
#else
extern inline function addPhysics2dJoint(world:Physics2DWorld, joint:Physics2DJointRef):Void {
#if hl
	flight._hl._fn.Physics2d.addPhysics2dJoint(world, joint);
#elseif cpp
	flight._cpp._fn.Physics2d.addPhysics2dJoint(world, joint);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.addPhysics2dJoint(world, joint);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPhysics2dJointSolver(world:Physics2DWorld, kind:String):Null<Physics2DJointSolverRef> {
	return flight._js._fn.Physics2d.getPhysics2dJointSolver(world, kind);
}
#else
extern inline function getPhysics2dJointSolver(world:Physics2DWorld, kind:String):Physics2DJointSolverRef {
#if hl
	return flight._hl._fn.Physics2d.getPhysics2dJointSolver(world, cast kind);
#elseif cpp
	return flight._cpp._fn.Physics2d.getPhysics2dJointSolver(world, cast kind);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.getPhysics2dJointSolver(world, kind);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function invalidatePhysics2dJoint(world:Physics2DWorld, joint:Physics2DJointRef):Bool {
	return flight._js._fn.Physics2d.invalidatePhysics2dJoint(world, joint);
}
#else
extern inline function invalidatePhysics2dJoint(world:Physics2DWorld, joint:Physics2DJointRef):Bool {
#if hl
	return flight._hl._fn.Physics2d.invalidatePhysics2dJoint(world, joint);
#elseif cpp
	return flight._cpp._fn.Physics2d.invalidatePhysics2dJoint(world, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.invalidatePhysics2dJoint(world, joint);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerPhysics2dJointSolver(world:Physics2DWorld, kind:String, solver:Physics2DJointSolverRef):Void {
	flight._js._fn.Physics2d.registerPhysics2dJointSolver(world, kind, solver);
}
#else
extern inline function registerPhysics2dJointSolver(world:Physics2DWorld, kind:String, solver:Physics2DJointSolverRef):Void {
#if hl
	flight._hl._fn.Physics2d.registerPhysics2dJointSolver(world, cast kind, solver);
#elseif cpp
	flight._cpp._fn.Physics2d.registerPhysics2dJointSolver(world, cast kind, solver);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.registerPhysics2dJointSolver(world, kind, solver);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function removePhysics2dJoint(world:Physics2DWorld, joint:Physics2DJointRef):Bool {
	return flight._js._fn.Physics2d.removePhysics2dJoint(world, joint);
}
#else
extern inline function removePhysics2dJoint(world:Physics2DWorld, joint:Physics2DJointRef):Bool {
#if hl
	return flight._hl._fn.Physics2d.removePhysics2dJoint(world, joint);
#elseif cpp
	return flight._cpp._fn.Physics2d.removePhysics2dJoint(world, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.removePhysics2dJoint(world, joint);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dSoftRowParameters(out:Dynamic, mass:Float, frequencyHz:Float, dampingRatio:Float, dt:Float, hardBiasFactor:Float):Void {
	flight._js._fn.Physics2d.writePhysics2dSoftRowParameters(out, mass, frequencyHz, dampingRatio, dt, hardBiasFactor);
}
#else
extern inline function writePhysics2dSoftRowParameters(out:Dynamic, outLen:Int, mass:Float, frequencyHz:Float, dampingRatio:Float, dt:Float, hardBiasFactor:Float):Void {
#if hl
	flight._hl._fn.Physics2d.writePhysics2dSoftRowParameters(out, outLen, mass, frequencyHz, dampingRatio, dt, hardBiasFactor);
#elseif cpp
	flight._cpp._fn.Physics2d.writePhysics2dSoftRowParameters(out, outLen, mass, frequencyHz, dampingRatio, dt, hardBiasFactor);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.writePhysics2dSoftRowParameters(out, outLen, mass, frequencyHz, dampingRatio, dt, hardBiasFactor);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function computePhysics2dColliderMassData(out:Physics2DMassData, collider:Physics2DCollider):Void {
	flight._js._fn.Physics2d.computePhysics2dColliderMassData(out, collider);
}
#else
extern inline function computePhysics2dColliderMassData(out:Physics2DMassData, collider:Physics2DCollider):Void {
#if hl
	flight._hl._fn.Physics2d.computePhysics2dColliderMassData(out, collider);
#elseif cpp
	flight._cpp._fn.Physics2d.computePhysics2dColliderMassData(out, collider);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.computePhysics2dColliderMassData(out, collider);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateRigidBody2dMassData(body:RigidBody2D):Void {
	flight._js._fn.Physics2d.updateRigidBody2dMassData(body);
}
#else
extern inline function updateRigidBody2dMassData(body:RigidBody2D):Void {
#if hl
	flight._hl._fn.Physics2d.updateRigidBody2dMassData(body);
#elseif cpp
	flight._cpp._fn.Physics2d.updateRigidBody2dMassData(body);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.updateRigidBody2dMassData(body);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function mixPhysics2dFriction(first:Float, second:Float):Float {
	return flight._js._fn.Physics2d.mixPhysics2dFriction(first, second);
}
#else
extern inline function mixPhysics2dFriction(first:Float, second:Float):Float {
#if hl
	return flight._hl._fn.Physics2d.mixPhysics2dFriction(first, second);
#elseif cpp
	return flight._cpp._fn.Physics2d.mixPhysics2dFriction(first, second);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.mixPhysics2dFriction(first, second);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function mixPhysics2dRestitution(first:Float, second:Float):Float {
	return flight._js._fn.Physics2d.mixPhysics2dRestitution(first, second);
}
#else
extern inline function mixPhysics2dRestitution(first:Float, second:Float):Float {
#if hl
	return flight._hl._fn.Physics2d.mixPhysics2dRestitution(first, second);
#elseif cpp
	return flight._cpp._fn.Physics2d.mixPhysics2dRestitution(first, second);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.mixPhysics2dRestitution(first, second);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function syncPhysics2dBodyToNode2d(body:RigidBody2D, node:Dynamic):Void {
	flight._js._fn.Physics2d.syncPhysics2dBodyToNode2d(body, node);
}
#else
extern inline function syncPhysics2dBodyToNode2d(body:RigidBody2D, node:flight.FlightNode):Void {
#if hl
	flight._hl._fn.Physics2d.syncPhysics2dBodyToNode2d(body, node);
#elseif cpp
	flight._cpp._fn.Physics2d.syncPhysics2dBodyToNode2d(body, node);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.syncPhysics2dBodyToNode2d(body, node);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function assertPhysics2dBodyNotStepping(body:RigidBody2D):Void {
	flight._js._fn.Physics2d.assertPhysics2dBodyNotStepping(body);
}
#else
extern inline function assertPhysics2dBodyNotStepping(body:RigidBody2D):Void {
#if hl
	flight._hl._fn.Physics2d.assertPhysics2dBodyNotStepping(body);
#elseif cpp
	flight._cpp._fn.Physics2d.assertPhysics2dBodyNotStepping(body);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.assertPhysics2dBodyNotStepping(body);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function assertPhysics2dWorldNotStepping(world:Physics2DWorld):Void {
	flight._js._fn.Physics2d.assertPhysics2dWorldNotStepping(world);
}
#else
extern inline function assertPhysics2dWorldNotStepping(world:Physics2DWorld):Void {
#if hl
	flight._hl._fn.Physics2d.assertPhysics2dWorldNotStepping(world);
#elseif cpp
	flight._cpp._fn.Physics2d.assertPhysics2dWorldNotStepping(world);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.assertPhysics2dWorldNotStepping(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function registerBuiltInPhysics2dJointSolvers(world:Physics2DWorld):Void {
	flight._js._fn.Physics2d.registerBuiltInPhysics2dJointSolvers(world);
}
#else
extern inline function registerBuiltInPhysics2dJointSolvers(world:Physics2DWorld):Void {
#if hl
	flight._hl._fn.Physics2d.registerBuiltInPhysics2dJointSolvers(world);
#elseif cpp
	flight._cpp._fn.Physics2d.registerBuiltInPhysics2dJointSolvers(world);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.registerBuiltInPhysics2dJointSolvers(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyPhysics2dImpulse(bodyA:RigidBody2D, bodyB:RigidBody2D, rAx:Float, rAy:Float, rBx:Float, rBy:Float, impulseX:Float, impulseY:Float):Void {
	flight._js._fn.Physics2d.applyPhysics2dImpulse(bodyA, bodyB, rAx, rAy, rBx, rBy, impulseX, impulseY);
}
#else
extern inline function applyPhysics2dImpulse(bodyA:RigidBody2D, bodyB:RigidBody2D, rAx:Float, rAy:Float, rBx:Float, rBy:Float, impulseX:Float, impulseY:Float):Void {
#if hl
	flight._hl._fn.Physics2d.applyPhysics2dImpulse(bodyA, bodyB, rAx, rAy, rBx, rBy, impulseX, impulseY);
#elseif cpp
	flight._cpp._fn.Physics2d.applyPhysics2dImpulse(bodyA, bodyB, rAx, rAy, rBx, rBy, impulseX, impulseY);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.applyPhysics2dImpulse(bodyA, bodyB, rAx, rAy, rBx, rBy, impulseX, impulseY);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function relativeNormalVelocity(bodyA:RigidBody2D, bodyB:RigidBody2D, point:Physics2DContactPoint, normalX:Float, normalY:Float):Float {
	return flight._js._fn.Physics2d.relativeNormalVelocity(bodyA, bodyB, point, normalX, normalY);
}
#else
extern inline function relativeNormalVelocity(bodyA:RigidBody2D, bodyB:RigidBody2D, point:Physics2DContactPoint, normalX:Float, normalY:Float):Float {
#if hl
	return flight._hl._fn.Physics2d.relativeNormalVelocity(bodyA, bodyB, point, normalX, normalY);
#elseif cpp
	return flight._cpp._fn.Physics2d.relativeNormalVelocity(bodyA, bodyB, point, normalX, normalY);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.relativeNormalVelocity(bodyA, bodyB, point, normalX, normalY);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function solvePhysics2dContactIndicesOnce(world:Physics2DWorld, indices:Dynamic, start:Int, count:Int):Void {
	flight._js._fn.Physics2d.solvePhysics2dContactIndicesOnce(world, indices, start, count);
}
#else
extern inline function solvePhysics2dContactIndicesOnce(world:Physics2DWorld, indices:Dynamic, indicesLen:Int, start:Int, count:Int):Void {
#if hl
	flight._hl._fn.Physics2d.solvePhysics2dContactIndicesOnce(world, indices, indicesLen, start, count);
#elseif cpp
	flight._cpp._fn.Physics2d.solvePhysics2dContactIndicesOnce(world, indices, indicesLen, start, count);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.solvePhysics2dContactIndicesOnce(world, indices, indicesLen, start, count);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function solvePhysics2dContacts(world:Physics2DWorld):Void {
	flight._js._fn.Physics2d.solvePhysics2dContacts(world);
}
#else
extern inline function solvePhysics2dContacts(world:Physics2DWorld):Void {
#if hl
	flight._hl._fn.Physics2d.solvePhysics2dContacts(world);
#elseif cpp
	flight._cpp._fn.Physics2d.solvePhysics2dContacts(world);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.solvePhysics2dContacts(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function solvePhysics2dContactsOnce(world:Physics2DWorld):Void {
	flight._js._fn.Physics2d.solvePhysics2dContactsOnce(world);
}
#else
extern inline function solvePhysics2dContactsOnce(world:Physics2DWorld):Void {
#if hl
	flight._hl._fn.Physics2d.solvePhysics2dContactsOnce(world);
#elseif cpp
	flight._cpp._fn.Physics2d.solvePhysics2dContactsOnce(world);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.solvePhysics2dContactsOnce(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function warmStartPhysics2dContactIndices(world:Physics2DWorld, indices:Dynamic, start:Int, count:Int):Void {
	flight._js._fn.Physics2d.warmStartPhysics2dContactIndices(world, indices, start, count);
}
#else
extern inline function warmStartPhysics2dContactIndices(world:Physics2DWorld, indices:Dynamic, indicesLen:Int, start:Int, count:Int):Void {
#if hl
	flight._hl._fn.Physics2d.warmStartPhysics2dContactIndices(world, indices, indicesLen, start, count);
#elseif cpp
	flight._cpp._fn.Physics2d.warmStartPhysics2dContactIndices(world, indices, indicesLen, start, count);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.warmStartPhysics2dContactIndices(world, indices, indicesLen, start, count);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function warmStartPhysics2dContacts(world:Physics2DWorld):Void {
	flight._js._fn.Physics2d.warmStartPhysics2dContacts(world);
}
#else
extern inline function warmStartPhysics2dContacts(world:Physics2DWorld):Void {
#if hl
	flight._hl._fn.Physics2d.warmStartPhysics2dContacts(world);
#elseif cpp
	flight._cpp._fn.Physics2d.warmStartPhysics2dContacts(world);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.warmStartPhysics2dContacts(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function stepPhysics2d(world:Physics2DWorld, dt:Float, registry:CollisionRegistry2D, guards:Null<Physics2DGuardState>):Void {
	flight._js._fn.Physics2d.stepPhysics2d(world, dt, registry, guards);
}
#else
extern inline function stepPhysics2d(world:Physics2DWorld, dt:Float, registry:CollisionRegistry2D, guards:Physics2DGuardState):Void {
#if hl
	flight._hl._fn.Physics2d.stepPhysics2d(world, dt, registry, guards);
#elseif cpp
	flight._cpp._fn.Physics2d.stepPhysics2d(world, dt, registry, guards);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.stepPhysics2d(world, dt, registry, guards);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPhysics2dBodyStateValid(world:Physics2DWorld):Bool {
	return flight._js._fn.Physics2d.isPhysics2dBodyStateValid(world);
}
#else
extern inline function isPhysics2dBodyStateValid(world:Physics2DWorld):Bool {
#if hl
	return flight._hl._fn.Physics2d.isPhysics2dBodyStateValid(world);
#elseif cpp
	return flight._cpp._fn.Physics2d.isPhysics2dBodyStateValid(world);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.isPhysics2dBodyStateValid(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPhysics2dContactStateValid(world:Physics2DWorld):Bool {
	return flight._js._fn.Physics2d.isPhysics2dContactStateValid(world);
}
#else
extern inline function isPhysics2dContactStateValid(world:Physics2DWorld):Bool {
#if hl
	return flight._hl._fn.Physics2d.isPhysics2dContactStateValid(world);
#elseif cpp
	return flight._cpp._fn.Physics2d.isPhysics2dContactStateValid(world);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.isPhysics2dContactStateValid(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPhysics2dContactValid(contact:Physics2DContact):Bool {
	return flight._js._fn.Physics2d.isPhysics2dContactValid(contact);
}
#else
extern inline function isPhysics2dContactValid(contact:Physics2DContact):Bool {
#if hl
	return flight._hl._fn.Physics2d.isPhysics2dContactValid(contact);
#elseif cpp
	return flight._cpp._fn.Physics2d.isPhysics2dContactValid(contact);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.isPhysics2dContactValid(contact);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPhysics2dGravityValid(world:Physics2DWorld):Bool {
	return flight._js._fn.Physics2d.isPhysics2dGravityValid(world);
}
#else
extern inline function isPhysics2dGravityValid(world:Physics2DWorld):Bool {
#if hl
	return flight._hl._fn.Physics2d.isPhysics2dGravityValid(world);
#elseif cpp
	return flight._cpp._fn.Physics2d.isPhysics2dGravityValid(world);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.isPhysics2dGravityValid(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPhysics2dJointStateValid(world:Physics2DWorld):Bool {
	return flight._js._fn.Physics2d.isPhysics2dJointStateValid(world);
}
#else
extern inline function isPhysics2dJointStateValid(world:Physics2DWorld):Bool {
#if hl
	return flight._hl._fn.Physics2d.isPhysics2dJointStateValid(world);
#elseif cpp
	return flight._cpp._fn.Physics2d.isPhysics2dJointStateValid(world);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.isPhysics2dJointStateValid(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPhysics2dPreviousTimestepValid(world:Physics2DWorld):Bool {
	return flight._js._fn.Physics2d.isPhysics2dPreviousTimestepValid(world);
}
#else
extern inline function isPhysics2dPreviousTimestepValid(world:Physics2DWorld):Bool {
#if hl
	return flight._hl._fn.Physics2d.isPhysics2dPreviousTimestepValid(world);
#elseif cpp
	return flight._cpp._fn.Physics2d.isPhysics2dPreviousTimestepValid(world);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.isPhysics2dPreviousTimestepValid(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPhysics2dSolverConfigValid(config:Physics2DSolverConfig):Bool {
	return flight._js._fn.Physics2d.isPhysics2dSolverConfigValid(config);
}
#else
extern inline function isPhysics2dSolverConfigValid(config:Physics2DSolverConfig):Bool {
#if hl
	return flight._hl._fn.Physics2d.isPhysics2dSolverConfigValid(config);
#elseif cpp
	return flight._cpp._fn.Physics2d.isPhysics2dSolverConfigValid(config);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.isPhysics2dSolverConfigValid(config);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPhysics2dTimestepValid(dt:Float):Bool {
	return flight._js._fn.Physics2d.isPhysics2dTimestepValid(dt);
}
#else
extern inline function isPhysics2dTimestepValid(dt:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.isPhysics2dTimestepValid(dt);
#elseif cpp
	return flight._cpp._fn.Physics2d.isPhysics2dTimestepValid(dt);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.isPhysics2dTimestepValid(dt);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dCollider(local:CollisionShape2D):Dynamic {
	return flight._js._fn.Physics2d.createPhysics2dCollider(local);
}
#else
extern inline function createPhysics2dCollider(local:CollisionShape2D):Dynamic {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dCollider(local);
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dCollider(local);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dCollider(local);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dSolverConfig(options:Null<Physics2DSolverConfigOptions>):Physics2DSolverConfig {
	return flight._js._fn.Physics2d.createPhysics2dSolverConfig(options);
}
#else
extern inline function createPhysics2dSolverConfig(options:Physics2DSolverConfigOptions):Physics2DSolverConfig {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dSolverConfig(options);
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dSolverConfig(options);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dSolverConfig(options);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dWorld():Physics2DWorld {
	return flight._js._fn.Physics2d.createPhysics2dWorld();
}
#else
extern inline function createPhysics2dWorld():Physics2DWorld {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dWorld();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dWorld();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dWorld();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createRigidBody2d():Dynamic {
	return flight._js._fn.Physics2d.createRigidBody2d();
}
#else
extern inline function createRigidBody2d():Dynamic {
#if hl
	return flight._hl._fn.Physics2d.createRigidBody2d();
#elseif cpp
	return flight._cpp._fn.Physics2d.createRigidBody2d();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createRigidBody2d();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addPhysics2dBody(world:Physics2DWorld, body:Dynamic):Void {
	flight._js._fn.Physics2d.addPhysics2dBody(world, body);
}
#else
extern inline function addPhysics2dBody(world:Physics2DWorld, body:Dynamic):Void {
#if hl
	flight._hl._fn.Physics2d.addPhysics2dBody(world, body);
#elseif cpp
	flight._cpp._fn.Physics2d.addPhysics2dBody(world, body);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.addPhysics2dBody(world, body);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addPhysics2dCollider(world:Physics2DWorld, body:Dynamic, collider:Dynamic):Void {
	flight._js._fn.Physics2d.addPhysics2dCollider(world, body, collider);
}
#else
extern inline function addPhysics2dCollider(world:Physics2DWorld, body:Dynamic, collider:Dynamic):Void {
#if hl
	flight._hl._fn.Physics2d.addPhysics2dCollider(world, body, collider);
#elseif cpp
	flight._cpp._fn.Physics2d.addPhysics2dCollider(world, body, collider);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.addPhysics2dCollider(world, body, collider);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyPhysics2dForce(body:RigidBody2D, forceX:Float, forceY:Float):Bool {
	return flight._js._fn.Physics2d.applyPhysics2dForce(body, forceX, forceY);
}
#else
extern inline function applyPhysics2dForce(body:RigidBody2D, forceX:Float, forceY:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.applyPhysics2dForce(body, forceX, forceY);
#elseif cpp
	return flight._cpp._fn.Physics2d.applyPhysics2dForce(body, forceX, forceY);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.applyPhysics2dForce(body, forceX, forceY);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyPhysics2dForceAtPoint(body:RigidBody2D, forceX:Float, forceY:Float, pointX:Float, pointY:Float):Bool {
	return flight._js._fn.Physics2d.applyPhysics2dForceAtPoint(body, forceX, forceY, pointX, pointY);
}
#else
extern inline function applyPhysics2dForceAtPoint(body:RigidBody2D, forceX:Float, forceY:Float, pointX:Float, pointY:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.applyPhysics2dForceAtPoint(body, forceX, forceY, pointX, pointY);
#elseif cpp
	return flight._cpp._fn.Physics2d.applyPhysics2dForceAtPoint(body, forceX, forceY, pointX, pointY);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.applyPhysics2dForceAtPoint(body, forceX, forceY, pointX, pointY);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyPhysics2dLinearImpulse(body:RigidBody2D, impulseX:Float, impulseY:Float):Bool {
	return flight._js._fn.Physics2d.applyPhysics2dLinearImpulse(body, impulseX, impulseY);
}
#else
extern inline function applyPhysics2dLinearImpulse(body:RigidBody2D, impulseX:Float, impulseY:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.applyPhysics2dLinearImpulse(body, impulseX, impulseY);
#elseif cpp
	return flight._cpp._fn.Physics2d.applyPhysics2dLinearImpulse(body, impulseX, impulseY);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.applyPhysics2dLinearImpulse(body, impulseX, impulseY);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyPhysics2dLinearImpulseAtPoint(body:RigidBody2D, impulseX:Float, impulseY:Float, pointX:Float, pointY:Float):Bool {
	return flight._js._fn.Physics2d.applyPhysics2dLinearImpulseAtPoint(body, impulseX, impulseY, pointX, pointY);
}
#else
extern inline function applyPhysics2dLinearImpulseAtPoint(body:RigidBody2D, impulseX:Float, impulseY:Float, pointX:Float, pointY:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.applyPhysics2dLinearImpulseAtPoint(body, impulseX, impulseY, pointX, pointY);
#elseif cpp
	return flight._cpp._fn.Physics2d.applyPhysics2dLinearImpulseAtPoint(body, impulseX, impulseY, pointX, pointY);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.applyPhysics2dLinearImpulseAtPoint(body, impulseX, impulseY, pointX, pointY);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function applyPhysics2dTorque(body:RigidBody2D, torque:Float):Bool {
	return flight._js._fn.Physics2d.applyPhysics2dTorque(body, torque);
}
#else
extern inline function applyPhysics2dTorque(body:RigidBody2D, torque:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.applyPhysics2dTorque(body, torque);
#elseif cpp
	return flight._cpp._fn.Physics2d.applyPhysics2dTorque(body, torque);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.applyPhysics2dTorque(body, torque);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function findPhysics2dBody(world:Physics2DWorld, index:Int):Null<Dynamic> {
	return flight._js._fn.Physics2d.findPhysics2dBody(world, index);
}
#else
extern inline function findPhysics2dBody(world:Physics2DWorld, index:Int):Dynamic {
#if hl
	return flight._hl._fn.Physics2d.findPhysics2dBody(world, index);
#elseif cpp
	return flight._cpp._fn.Physics2d.findPhysics2dBody(world, index);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.findPhysics2dBody(world, index);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function hydratePhysics2dWorld(world:Physics2DWorld):Bool {
	return flight._js._fn.Physics2d.hydratePhysics2dWorld(world);
}
#else
extern inline function hydratePhysics2dWorld(world:Physics2DWorld):Bool {
#if hl
	return flight._hl._fn.Physics2d.hydratePhysics2dWorld(world);
#elseif cpp
	return flight._cpp._fn.Physics2d.hydratePhysics2dWorld(world);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.hydratePhysics2dWorld(world);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function invalidatePhysics2dCollider(world:Physics2DWorld, body:Dynamic, collider:Dynamic):Bool {
	return flight._js._fn.Physics2d.invalidatePhysics2dCollider(world, body, collider);
}
#else
extern inline function invalidatePhysics2dCollider(world:Physics2DWorld, body:Dynamic, collider:Dynamic):Bool {
#if hl
	return flight._hl._fn.Physics2d.invalidatePhysics2dCollider(world, body, collider);
#elseif cpp
	return flight._cpp._fn.Physics2d.invalidatePhysics2dCollider(world, body, collider);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.invalidatePhysics2dCollider(world, body, collider);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isPhysics2dPairOrdered(a:RigidBody2D, b:RigidBody2D):Bool {
	return flight._js._fn.Physics2d.isPhysics2dPairOrdered(a, b);
}
#else
extern inline function isPhysics2dPairOrdered(a:RigidBody2D, b:RigidBody2D):Bool {
#if hl
	return flight._hl._fn.Physics2d.isPhysics2dPairOrdered(a, b);
#elseif cpp
	return flight._cpp._fn.Physics2d.isPhysics2dPairOrdered(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.isPhysics2dPairOrdered(a, b);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function removePhysics2dBody(world:Physics2DWorld, body:Dynamic):Bool {
	return flight._js._fn.Physics2d.removePhysics2dBody(world, body);
}
#else
extern inline function removePhysics2dBody(world:Physics2DWorld, body:Dynamic):Bool {
#if hl
	return flight._hl._fn.Physics2d.removePhysics2dBody(world, body);
#elseif cpp
	return flight._cpp._fn.Physics2d.removePhysics2dBody(world, body);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.removePhysics2dBody(world, body);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function removePhysics2dCollider(world:Physics2DWorld, body:Dynamic, collider:Dynamic):Bool {
	return flight._js._fn.Physics2d.removePhysics2dCollider(world, body, collider);
}
#else
extern inline function removePhysics2dCollider(world:Physics2DWorld, body:Dynamic, collider:Dynamic):Bool {
#if hl
	return flight._hl._fn.Physics2d.removePhysics2dCollider(world, body, collider);
#elseif cpp
	return flight._cpp._fn.Physics2d.removePhysics2dCollider(world, body, collider);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.removePhysics2dCollider(world, body, collider);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setPhysics2dBodyBullet(world:Physics2DWorld, body:Dynamic, bullet:Bool):Bool {
	return flight._js._fn.Physics2d.setPhysics2dBodyBullet(world, body, bullet);
}
#else
extern inline function setPhysics2dBodyBullet(world:Physics2DWorld, body:Dynamic, bullet:Bool):Bool {
#if hl
	return flight._hl._fn.Physics2d.setPhysics2dBodyBullet(world, body, bullet);
#elseif cpp
	return flight._cpp._fn.Physics2d.setPhysics2dBodyBullet(world, body, bullet);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.setPhysics2dBodyBullet(world, body, bullet);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setPhysics2dBodyFixedRotation(world:Physics2DWorld, body:Dynamic, fixedRotation:Bool):Bool {
	return flight._js._fn.Physics2d.setPhysics2dBodyFixedRotation(world, body, fixedRotation);
}
#else
extern inline function setPhysics2dBodyFixedRotation(world:Physics2DWorld, body:Dynamic, fixedRotation:Bool):Bool {
#if hl
	return flight._hl._fn.Physics2d.setPhysics2dBodyFixedRotation(world, body, fixedRotation);
#elseif cpp
	return flight._cpp._fn.Physics2d.setPhysics2dBodyFixedRotation(world, body, fixedRotation);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.setPhysics2dBodyFixedRotation(world, body, fixedRotation);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setPhysics2dBodySleepEnabled(world:Physics2DWorld, body:Dynamic, sleepEnabled:Bool):Bool {
	return flight._js._fn.Physics2d.setPhysics2dBodySleepEnabled(world, body, sleepEnabled);
}
#else
extern inline function setPhysics2dBodySleepEnabled(world:Physics2DWorld, body:Dynamic, sleepEnabled:Bool):Bool {
#if hl
	return flight._hl._fn.Physics2d.setPhysics2dBodySleepEnabled(world, body, sleepEnabled);
#elseif cpp
	return flight._cpp._fn.Physics2d.setPhysics2dBodySleepEnabled(world, body, sleepEnabled);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.setPhysics2dBodySleepEnabled(world, body, sleepEnabled);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setPhysics2dBodyTransform(world:Physics2DWorld, body:Dynamic, x:Float, y:Float, angle:Float):Bool {
	return flight._js._fn.Physics2d.setPhysics2dBodyTransform(world, body, x, y, angle);
}
#else
extern inline function setPhysics2dBodyTransform(world:Physics2DWorld, body:Dynamic, x:Float, y:Float, angle:Float):Bool {
#if hl
	return flight._hl._fn.Physics2d.setPhysics2dBodyTransform(world, body, x, y, angle);
#elseif cpp
	return flight._cpp._fn.Physics2d.setPhysics2dBodyTransform(world, body, x, y, angle);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.setPhysics2dBodyTransform(world, body, x, y, angle);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setPhysics2dBodyType(world:Physics2DWorld, body:Dynamic, bodyType:Dynamic):Bool {
	return flight._js._fn.Physics2d.setPhysics2dBodyType(world, body, bodyType);
}
#else
extern inline function setPhysics2dBodyType(world:Physics2DWorld, body:Dynamic, bodyType:flight.Physics2DBodyType):Bool {
#if hl
	return flight._hl._fn.Physics2d.setPhysics2dBodyType(world, body, bodyType);
#elseif cpp
	return flight._cpp._fn.Physics2d.setPhysics2dBodyType(world, body, bodyType);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.setPhysics2dBodyType(world, body, bodyType);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dQueryFilter():Physics2DQueryFilter {
	return flight._js._fn.Physics2d.createPhysics2dQueryFilter();
}
#else
extern inline function createPhysics2dQueryFilter():Physics2DQueryFilter {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dQueryFilter();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dQueryFilter();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dQueryFilter();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dQueryResult():Physics2DQueryResult {
	return flight._js._fn.Physics2d.createPhysics2dQueryResult();
}
#else
extern inline function createPhysics2dQueryResult():Physics2DQueryResult {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dQueryResult();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dQueryResult();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dQueryResult();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dRayResult():Physics2DRayResult {
	return flight._js._fn.Physics2d.createPhysics2dRayResult();
}
#else
extern inline function createPhysics2dRayResult():Physics2DRayResult {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dRayResult();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dRayResult();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dRayResult();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dShapeCastResult():Physics2DShapeCastResult {
	return flight._js._fn.Physics2d.createPhysics2dShapeCastResult();
}
#else
extern inline function createPhysics2dShapeCastResult():Physics2DShapeCastResult {
#if hl
	return flight._hl._fn.Physics2d.createPhysics2dShapeCastResult();
#elseif cpp
	return flight._cpp._fn.Physics2d.createPhysics2dShapeCastResult();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2d.createPhysics2dShapeCastResult();
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics2dPoint(out:Physics2DQueryResult, world:Physics2DWorld, x:Float, y:Float, filter:Null<Physics2DQueryFilter>):Void {
	flight._js._fn.Physics2d.queryPhysics2dPoint(out, world, x, y, filter);
}
#else
extern inline function queryPhysics2dPoint(out:Physics2DQueryResult, world:Physics2DWorld, x:Float, y:Float, filter:Physics2DQueryFilter):Void {
#if hl
	flight._hl._fn.Physics2d.queryPhysics2dPoint(out, world, x, y, filter);
#elseif cpp
	flight._cpp._fn.Physics2d.queryPhysics2dPoint(out, world, x, y, filter);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.queryPhysics2dPoint(out, world, x, y, filter);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics2dRay(out:Physics2DRayResult, world:Physics2DWorld, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Null<Float>, filter:Null<Physics2DQueryFilter>):Void {
	flight._js._fn.Physics2d.queryPhysics2dRay(out, world, originX, originY, directionX, directionY, maxFraction, filter);
}
#else
extern inline function queryPhysics2dRay(out:Physics2DRayResult, world:Physics2DWorld, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Float, filter:Physics2DQueryFilter):Void {
#if hl
	flight._hl._fn.Physics2d.queryPhysics2dRay(out, world, originX, originY, directionX, directionY, maxFraction, filter);
#elseif cpp
	flight._cpp._fn.Physics2d.queryPhysics2dRay(out, world, originX, originY, directionX, directionY, maxFraction, filter);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.queryPhysics2dRay(out, world, originX, originY, directionX, directionY, maxFraction, filter);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics2dRayClosest(out:Physics2DRayResult, world:Physics2DWorld, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Null<Float>, filter:Null<Physics2DQueryFilter>):Void {
	flight._js._fn.Physics2d.queryPhysics2dRayClosest(out, world, originX, originY, directionX, directionY, maxFraction, filter);
}
#else
extern inline function queryPhysics2dRayClosest(out:Physics2DRayResult, world:Physics2DWorld, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Float, filter:Physics2DQueryFilter):Void {
#if hl
	flight._hl._fn.Physics2d.queryPhysics2dRayClosest(out, world, originX, originY, directionX, directionY, maxFraction, filter);
#elseif cpp
	flight._cpp._fn.Physics2d.queryPhysics2dRayClosest(out, world, originX, originY, directionX, directionY, maxFraction, filter);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.queryPhysics2dRayClosest(out, world, originX, originY, directionX, directionY, maxFraction, filter);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics2dRegion(out:Physics2DQueryResult, world:Physics2DWorld, region:SpatialAabb2D, filter:Null<Physics2DQueryFilter>):Void {
	flight._js._fn.Physics2d.queryPhysics2dRegion(out, world, region, filter);
}
#else
extern inline function queryPhysics2dRegion(out:Physics2DQueryResult, world:Physics2DWorld, region:SpatialAabb2D, filter:Physics2DQueryFilter):Void {
#if hl
	flight._hl._fn.Physics2d.queryPhysics2dRegion(out, world, region, filter);
#elseif cpp
	flight._cpp._fn.Physics2d.queryPhysics2dRegion(out, world, region, filter);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.queryPhysics2dRegion(out, world, region, filter);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics2dShapeCast(out:Physics2DShapeCastResult, world:Physics2DWorld, registry:CollisionRegistry2D, shape:CollisionShape2D, dx:Float, dy:Float, maxFraction:Null<Float>, filter:Null<Physics2DQueryFilter>):Void {
	flight._js._fn.Physics2d.queryPhysics2dShapeCast(out, world, registry, shape, dx, dy, maxFraction, filter);
}
#else
extern inline function queryPhysics2dShapeCast(out:Physics2DShapeCastResult, world:Physics2DWorld, registry:CollisionRegistry2D, shape:CollisionShape2D, dx:Float, dy:Float, maxFraction:Float, filter:Physics2DQueryFilter):Void {
#if hl
	flight._hl._fn.Physics2d.queryPhysics2dShapeCast(out, world, registry, shape, dx, dy, maxFraction, filter);
#elseif cpp
	flight._cpp._fn.Physics2d.queryPhysics2dShapeCast(out, world, registry, shape, dx, dy, maxFraction, filter);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.queryPhysics2dShapeCast(out, world, registry, shape, dx, dy, maxFraction, filter);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeCollisionShape2D(ptr:CollisionShape2D):Void {
	flight._js._fn.Physics2d.freeCollisionShape2D(ptr);
}
#else
extern inline function freeCollisionShape2D(ptr:CollisionShape2D):Void {
#if hl
	flight._hl._fn.Physics2d.freeCollisionShape2D(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freeCollisionShape2D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freeCollisionShape2D(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DdebugGeometry(ptr:Physics2DDebugGeometry):Void {
	flight._js._fn.Physics2d.freePhysics2DdebugGeometry(ptr);
}
#else
extern inline function freePhysics2DdebugGeometry(ptr:Physics2DDebugGeometry):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DdebugGeometry(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DdebugGeometry(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DdebugGeometry(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DcollisionExplanation(ptr:Physics2DCollisionExplanation):Void {
	flight._js._fn.Physics2d.freePhysics2DcollisionExplanation(ptr);
}
#else
extern inline function freePhysics2DcollisionExplanation(ptr:Physics2DCollisionExplanation):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DcollisionExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DcollisionExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DcollisionExplanation(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DjointResolutionExplanation(ptr:Physics2DJointResolutionExplanation):Void {
	flight._js._fn.Physics2d.freePhysics2DjointResolutionExplanation(ptr);
}
#else
extern inline function freePhysics2DjointResolutionExplanation(ptr:Physics2DJointResolutionExplanation):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DjointResolutionExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DjointResolutionExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DjointResolutionExplanation(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DstepExplanation(ptr:Physics2DStepExplanation):Void {
	flight._js._fn.Physics2d.freePhysics2DstepExplanation(ptr);
}
#else
extern inline function freePhysics2DstepExplanation(ptr:Physics2DStepExplanation):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DstepExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DstepExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DstepExplanation(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DdistanceJointRef(ptr:Physics2DDistanceJoint):Void {
	flight._js._fn.Physics2d.freePhysics2DdistanceJointRef(ptr);
}
#else
extern inline function freePhysics2DdistanceJointRef(ptr:Physics2DDistanceJoint):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DdistanceJointRef(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DdistanceJointRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DdistanceJointRef(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DgearJointRef(ptr:Physics2DGearJoint):Void {
	flight._js._fn.Physics2d.freePhysics2DgearJointRef(ptr);
}
#else
extern inline function freePhysics2DgearJointRef(ptr:Physics2DGearJoint):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DgearJointRef(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DgearJointRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DgearJointRef(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DmouseJointRef(ptr:Physics2DMouseJoint):Void {
	flight._js._fn.Physics2d.freePhysics2DmouseJointRef(ptr);
}
#else
extern inline function freePhysics2DmouseJointRef(ptr:Physics2DMouseJoint):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DmouseJointRef(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DmouseJointRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DmouseJointRef(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DprismaticJointRef(ptr:Physics2DPrismaticJoint):Void {
	flight._js._fn.Physics2d.freePhysics2DprismaticJointRef(ptr);
}
#else
extern inline function freePhysics2DprismaticJointRef(ptr:Physics2DPrismaticJoint):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DprismaticJointRef(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DprismaticJointRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DprismaticJointRef(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DpulleyJointRef(ptr:Physics2DPulleyJoint):Void {
	flight._js._fn.Physics2d.freePhysics2DpulleyJointRef(ptr);
}
#else
extern inline function freePhysics2DpulleyJointRef(ptr:Physics2DPulleyJoint):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DpulleyJointRef(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DpulleyJointRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DpulleyJointRef(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DrevoluteJointRef(ptr:Physics2DRevoluteJoint):Void {
	flight._js._fn.Physics2d.freePhysics2DrevoluteJointRef(ptr);
}
#else
extern inline function freePhysics2DrevoluteJointRef(ptr:Physics2DRevoluteJoint):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DrevoluteJointRef(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DrevoluteJointRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DrevoluteJointRef(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DropeJointRef(ptr:Physics2DRopeJoint):Void {
	flight._js._fn.Physics2d.freePhysics2DropeJointRef(ptr);
}
#else
extern inline function freePhysics2DropeJointRef(ptr:Physics2DRopeJoint):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DropeJointRef(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DropeJointRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DropeJointRef(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DweldJointRef(ptr:Physics2DWeldJoint):Void {
	flight._js._fn.Physics2d.freePhysics2DweldJointRef(ptr);
}
#else
extern inline function freePhysics2DweldJointRef(ptr:Physics2DWeldJoint):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DweldJointRef(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DweldJointRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DweldJointRef(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DwheelJointRef(ptr:Physics2DWheelJoint):Void {
	flight._js._fn.Physics2d.freePhysics2DwheelJointRef(ptr);
}
#else
extern inline function freePhysics2DwheelJointRef(ptr:Physics2DWheelJoint):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DwheelJointRef(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DwheelJointRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DwheelJointRef(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DjointReaction(ptr:Physics2DJointReaction):Void {
	flight._js._fn.Physics2d.freePhysics2DjointReaction(ptr);
}
#else
extern inline function freePhysics2DjointReaction(ptr:Physics2DJointReaction):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DjointReaction(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DjointReaction(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DjointReaction(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DjointSolverRef(ptr:Physics2DJointSolver):Void {
	flight._js._fn.Physics2d.freePhysics2DjointSolverRef(ptr);
}
#else
extern inline function freePhysics2DjointSolverRef(ptr:Physics2DJointSolver):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DjointSolverRef(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DjointSolverRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DjointSolverRef(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DcolliderRef(ptr:Physics2DCollider):Void {
	flight._js._fn.Physics2d.freePhysics2DcolliderRef(ptr);
}
#else
extern inline function freePhysics2DcolliderRef(ptr:Physics2DCollider):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DcolliderRef(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DcolliderRef(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DcolliderRef(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DsolverConfig(ptr:Physics2DSolverConfig):Void {
	flight._js._fn.Physics2d.freePhysics2DsolverConfig(ptr);
}
#else
extern inline function freePhysics2DsolverConfig(ptr:Physics2DSolverConfig):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DsolverConfig(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DsolverConfig(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DsolverConfig(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2Dworld(ptr:Physics2DWorld):Void {
	flight._js._fn.Physics2d.freePhysics2Dworld(ptr);
}
#else
extern inline function freePhysics2Dworld(ptr:Physics2DWorld):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2Dworld(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2Dworld(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2Dworld(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DqueryFilter(ptr:Physics2DQueryFilter):Void {
	flight._js._fn.Physics2d.freePhysics2DqueryFilter(ptr);
}
#else
extern inline function freePhysics2DqueryFilter(ptr:Physics2DQueryFilter):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DqueryFilter(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DqueryFilter(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DqueryFilter(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DqueryResult(ptr:Physics2DQueryResult):Void {
	flight._js._fn.Physics2d.freePhysics2DqueryResult(ptr);
}
#else
extern inline function freePhysics2DqueryResult(ptr:Physics2DQueryResult):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DqueryResult(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DqueryResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DqueryResult(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DrayResult(ptr:Physics2DRayResult):Void {
	flight._js._fn.Physics2d.freePhysics2DrayResult(ptr);
}
#else
extern inline function freePhysics2DrayResult(ptr:Physics2DRayResult):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DrayResult(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DrayResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DrayResult(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DshapeCastResult(ptr:Physics2DShapeCastResult):Void {
	flight._js._fn.Physics2d.freePhysics2DshapeCastResult(ptr);
}
#else
extern inline function freePhysics2DshapeCastResult(ptr:Physics2DShapeCastResult):Void {
#if hl
	flight._hl._fn.Physics2d.freePhysics2DshapeCastResult(ptr);
#elseif cpp
	flight._cpp._fn.Physics2d.freePhysics2DshapeCastResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2d.freePhysics2DshapeCastResult(ptr);
#else
	#error "flight.Physics2d: no backend for this target."
#end
}
#end
