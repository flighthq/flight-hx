package flight;

#if hl

typedef Physics2DAbi = flight._hl.Physics2DAbi;

#elseif cpp

typedef Physics2DAbi = flight._cpp.Physics2DAbi;

#elseif (js && flight_esm)

typedef Physics2DAbi = flight._js.Physics2DAbi;

#elseif js

#error "flight.Physics2DAbi on js requires flight_esm."

#else

#error "flight.Physics2DAbi: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createPhysics2dAbi():Physics2DAbi {
	return flight._js._fn.Physics2DAbi.createPhysics2dAbi();
}
#else
extern inline function createPhysics2dAbi():Physics2DAbi {
#if hl
	return flight._hl._fn.Physics2DAbi.createPhysics2dAbi();
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.createPhysics2dAbi();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.createPhysics2dAbi();
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dAbiWorld(abi:Physics2DAbi):Int {
	return flight._js._fn.Physics2DAbi.createPhysics2dAbiWorld(abi);
}
#else
extern inline function createPhysics2dAbiWorld(abi:Physics2DAbi):Int {
#if hl
	return flight._hl._fn.Physics2DAbi.createPhysics2dAbiWorld(abi);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.createPhysics2dAbiWorld(abi);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.createPhysics2dAbiWorld(abi);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function destroyPhysics2dAbiWorld(abi:Physics2DAbi, world:Int):Bool {
	return flight._js._fn.Physics2DAbi.destroyPhysics2dAbiWorld(abi, world);
}
#else
extern inline function destroyPhysics2dAbiWorld(abi:Physics2DAbi, world:Int):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.destroyPhysics2dAbiWorld(abi, world);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.destroyPhysics2dAbiWorld(abi, world);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.destroyPhysics2dAbiWorld(abi, world);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function executePhysics2dAbiCommands(out:Physics2DAbiExecutionResult, abi:Physics2DAbi, world:Int, commands:Physics2DAbiCommandBuffer):Bool {
	return flight._js._fn.Physics2DAbi.executePhysics2dAbiCommands(out, abi, world, commands);
}
#else
extern inline function executePhysics2dAbiCommands(out:Physics2DAbiExecutionResult, abi:Physics2DAbi, world:Int, commands:Physics2DAbiCommandBuffer):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.executePhysics2dAbiCommands(out, abi, world, commands);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.executePhysics2dAbiCommands(out, abi, world, commands);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.executePhysics2dAbiCommands(out, abi, world, commands);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPhysics2dAbiWorldStatus(abi:Physics2DAbi, world:Int):Dynamic {
	return flight._js._fn.Physics2DAbi.getPhysics2dAbiWorldStatus(abi, world);
}
#else
extern inline function getPhysics2dAbiWorldStatus(abi:Physics2DAbi, world:Int):flight.Physics2DAbiWorldStatus {
#if hl
	return flight._hl._fn.Physics2DAbi.getPhysics2dAbiWorldStatus(abi, world);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.getPhysics2dAbiWorldStatus(abi, world);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.getPhysics2dAbiWorldStatus(abi, world);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function readPhysics2dAbiBodies(out:Physics2DAbiBodyBuffer, abi:Physics2DAbi, world:Int, bodyIds:Null<Dynamic>):Bool {
	return flight._js._fn.Physics2DAbi.readPhysics2dAbiBodies(out, abi, world, bodyIds);
}
#else
extern inline function readPhysics2dAbiBodies(out:Physics2DAbiBodyBuffer, abi:Physics2DAbi, world:Int, bodyIds:Dynamic, bodyIdsLen:Int):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.readPhysics2dAbiBodies(out, abi, world, bodyIds, bodyIdsLen);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.readPhysics2dAbiBodies(out, abi, world, bodyIds, bodyIdsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.readPhysics2dAbiBodies(out, abi, world, bodyIds, bodyIdsLen);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function readPhysics2dAbiContacts(out:Physics2DAbiContactBuffer, abi:Physics2DAbi, world:Int, selection:Dynamic):Bool {
	return flight._js._fn.Physics2DAbi.readPhysics2dAbiContacts(out, abi, world, selection);
}
#else
extern inline function readPhysics2dAbiContacts(out:Physics2DAbiContactBuffer, abi:Physics2DAbi, world:Int, selection:flight.Physics2DAbiContactSelection):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.readPhysics2dAbiContacts(out, abi, world, selection);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.readPhysics2dAbiContacts(out, abi, world, selection);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.readPhysics2dAbiContacts(out, abi, world, selection);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function readPhysics2dAbiJoints(out:Physics2DAbiJointBuffer, abi:Physics2DAbi, world:Int):Bool {
	return flight._js._fn.Physics2DAbi.readPhysics2dAbiJoints(out, abi, world);
}
#else
extern inline function readPhysics2dAbiJoints(out:Physics2DAbiJointBuffer, abi:Physics2DAbi, world:Int):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.readPhysics2dAbiJoints(out, abi, world);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.readPhysics2dAbiJoints(out, abi, world);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.readPhysics2dAbiJoints(out, abi, world);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function stepPhysics2dAbiWorld(abi:Physics2DAbi, world:Int, dt:Float, hooks:Null<Physics2DAbiContactHooks>):Dynamic {
	return flight._js._fn.Physics2DAbi.stepPhysics2dAbiWorld(abi, world, dt, hooks);
}
#else
extern inline function stepPhysics2dAbiWorld(abi:Physics2DAbi, world:Int, dt:Float, hooks:Physics2DAbiContactHooks):flight.Physics2DAbiStepStatus {
#if hl
	return flight._hl._fn.Physics2DAbi.stepPhysics2dAbiWorld(abi, world, dt, hooks);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.stepPhysics2dAbiWorld(abi, world, dt, hooks);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.stepPhysics2dAbiWorld(abi, world, dt, hooks);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dAbiBodyBuffer(capacity:Int):Physics2DAbiBodyBuffer {
	return flight._js._fn.Physics2DAbi.createPhysics2dAbiBodyBuffer(capacity);
}
#else
extern inline function createPhysics2dAbiBodyBuffer(capacity:Int):Physics2DAbiBodyBuffer {
#if hl
	return flight._hl._fn.Physics2DAbi.createPhysics2dAbiBodyBuffer(capacity);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.createPhysics2dAbiBodyBuffer(capacity);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.createPhysics2dAbiBodyBuffer(capacity);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dAbiCommandBuffer(byteCapacity:Null<Int>):Physics2DAbiCommandBuffer {
	return flight._js._fn.Physics2DAbi.createPhysics2dAbiCommandBuffer(byteCapacity);
}
#else
extern inline function createPhysics2dAbiCommandBuffer(byteCapacity:haxe.Int64):Physics2DAbiCommandBuffer {
#if hl
	return flight._hl._fn.Physics2DAbi.createPhysics2dAbiCommandBuffer(byteCapacity);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.createPhysics2dAbiCommandBuffer(byteCapacity);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.createPhysics2dAbiCommandBuffer(byteCapacity);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dAbiContactBuffer(contactCapacity:Int, pointCapacity:Int):Physics2DAbiContactBuffer {
	return flight._js._fn.Physics2DAbi.createPhysics2dAbiContactBuffer(contactCapacity, pointCapacity);
}
#else
extern inline function createPhysics2dAbiContactBuffer(contactCapacity:Int, pointCapacity:Int):Physics2DAbiContactBuffer {
#if hl
	return flight._hl._fn.Physics2DAbi.createPhysics2dAbiContactBuffer(contactCapacity, pointCapacity);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.createPhysics2dAbiContactBuffer(contactCapacity, pointCapacity);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.createPhysics2dAbiContactBuffer(contactCapacity, pointCapacity);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dAbiExecutionResult():Physics2DAbiExecutionResult {
	return flight._js._fn.Physics2DAbi.createPhysics2dAbiExecutionResult();
}
#else
extern inline function createPhysics2dAbiExecutionResult():Physics2DAbiExecutionResult {
#if hl
	return flight._hl._fn.Physics2DAbi.createPhysics2dAbiExecutionResult();
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.createPhysics2dAbiExecutionResult();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.createPhysics2dAbiExecutionResult();
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dAbiJointBuffer(capacity:Int):Physics2DAbiJointBuffer {
	return flight._js._fn.Physics2DAbi.createPhysics2dAbiJointBuffer(capacity);
}
#else
extern inline function createPhysics2dAbiJointBuffer(capacity:Int):Physics2DAbiJointBuffer {
#if hl
	return flight._hl._fn.Physics2DAbi.createPhysics2dAbiJointBuffer(capacity);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.createPhysics2dAbiJointBuffer(capacity);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.createPhysics2dAbiJointBuffer(capacity);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics2dAbiQueryBuffer(capacity:Int):Physics2DAbiQueryBuffer {
	return flight._js._fn.Physics2DAbi.createPhysics2dAbiQueryBuffer(capacity);
}
#else
extern inline function createPhysics2dAbiQueryBuffer(capacity:Int):Physics2DAbiQueryBuffer {
#if hl
	return flight._hl._fn.Physics2DAbi.createPhysics2dAbiQueryBuffer(capacity);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.createPhysics2dAbiQueryBuffer(capacity);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.createPhysics2dAbiQueryBuffer(capacity);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearPhysics2dAbiCommandBuffer(out:Physics2DAbiCommandBuffer):Void {
	flight._js._fn.Physics2DAbi.clearPhysics2dAbiCommandBuffer(out);
}
#else
extern inline function clearPhysics2dAbiCommandBuffer(out:Physics2DAbiCommandBuffer):Void {
#if hl
	flight._hl._fn.Physics2DAbi.clearPhysics2dAbiCommandBuffer(out);
#elseif cpp
	flight._cpp._fn.Physics2DAbi.clearPhysics2dAbiCommandBuffer(out);
#elseif (js && flight_esm)
	flight._js._fn.Physics2DAbi.clearPhysics2dAbiCommandBuffer(out);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPhysics2dAbiCommandBufferRemainingByteLength(buffer:Physics2DAbiCommandBuffer):Int {
	return flight._js._fn.Physics2DAbi.getPhysics2dAbiCommandBufferRemainingByteLength(buffer);
}
#else
extern inline function getPhysics2dAbiCommandBufferRemainingByteLength(buffer:Physics2DAbiCommandBuffer):Int {
#if hl
	return flight._hl._fn.Physics2DAbi.getPhysics2dAbiCommandBufferRemainingByteLength(buffer);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.getPhysics2dAbiCommandBufferRemainingByteLength(buffer);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.getPhysics2dAbiCommandBufferRemainingByteLength(buffer);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPhysics2dAbiSetColliderCommandByteLength(collider:Physics2DCollider):Float {
	return flight._js._fn.Physics2DAbi.getPhysics2dAbiSetColliderCommandByteLength(collider);
}
#else
extern inline function getPhysics2dAbiSetColliderCommandByteLength(collider:Physics2DCollider):haxe.Int64 {
#if hl
	return flight._hl._fn.Physics2DAbi.getPhysics2dAbiSetColliderCommandByteLength(collider);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.getPhysics2dAbiSetColliderCommandByteLength(collider);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.getPhysics2dAbiSetColliderCommandByteLength(collider);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiApplyForceAtPointCommand(out:Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, pointX:Float, pointY:Float):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiApplyForceAtPointCommand(out, bodyId, x, y, pointX, pointY);
}
#else
extern inline function writePhysics2dAbiApplyForceAtPointCommand(out:Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, pointX:Float, pointY:Float):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiApplyForceAtPointCommand(out, bodyId, x, y, pointX, pointY);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiApplyForceAtPointCommand(out, bodyId, x, y, pointX, pointY);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiApplyForceAtPointCommand(out, bodyId, x, y, pointX, pointY);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiApplyForceCommand(out:Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiApplyForceCommand(out, bodyId, x, y);
}
#else
extern inline function writePhysics2dAbiApplyForceCommand(out:Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiApplyForceCommand(out, bodyId, x, y);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiApplyForceCommand(out, bodyId, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiApplyForceCommand(out, bodyId, x, y);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiApplyLinearImpulseAtPointCommand(out:Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, pointX:Float, pointY:Float):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiApplyLinearImpulseAtPointCommand(out, bodyId, x, y, pointX, pointY);
}
#else
extern inline function writePhysics2dAbiApplyLinearImpulseAtPointCommand(out:Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, pointX:Float, pointY:Float):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiApplyLinearImpulseAtPointCommand(out, bodyId, x, y, pointX, pointY);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiApplyLinearImpulseAtPointCommand(out, bodyId, x, y, pointX, pointY);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiApplyLinearImpulseAtPointCommand(out, bodyId, x, y, pointX, pointY);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiApplyLinearImpulseCommand(out:Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiApplyLinearImpulseCommand(out, bodyId, x, y);
}
#else
extern inline function writePhysics2dAbiApplyLinearImpulseCommand(out:Physics2DAbiCommandBuffer, bodyId:Int, x:Float, y:Float):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiApplyLinearImpulseCommand(out, bodyId, x, y);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiApplyLinearImpulseCommand(out, bodyId, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiApplyLinearImpulseCommand(out, bodyId, x, y);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiApplyTorqueCommand(out:Physics2DAbiCommandBuffer, bodyId:Int, torque:Float):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiApplyTorqueCommand(out, bodyId, torque);
}
#else
extern inline function writePhysics2dAbiApplyTorqueCommand(out:Physics2DAbiCommandBuffer, bodyId:Int, torque:Float):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiApplyTorqueCommand(out, bodyId, torque);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiApplyTorqueCommand(out, bodyId, torque);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiApplyTorqueCommand(out, bodyId, torque);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiDestroyBodyCommand(out:Physics2DAbiCommandBuffer, bodyId:Int):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiDestroyBodyCommand(out, bodyId);
}
#else
extern inline function writePhysics2dAbiDestroyBodyCommand(out:Physics2DAbiCommandBuffer, bodyId:Int):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiDestroyBodyCommand(out, bodyId);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiDestroyBodyCommand(out, bodyId);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiDestroyBodyCommand(out, bodyId);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiDestroyColliderCommand(out:Physics2DAbiCommandBuffer, colliderId:Int):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiDestroyColliderCommand(out, colliderId);
}
#else
extern inline function writePhysics2dAbiDestroyColliderCommand(out:Physics2DAbiCommandBuffer, colliderId:Int):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiDestroyColliderCommand(out, colliderId);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiDestroyColliderCommand(out, colliderId);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiDestroyColliderCommand(out, colliderId);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiDestroyJointCommand(out:Physics2DAbiCommandBuffer, jointId:Int):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiDestroyJointCommand(out, jointId);
}
#else
extern inline function writePhysics2dAbiDestroyJointCommand(out:Physics2DAbiCommandBuffer, jointId:Int):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiDestroyJointCommand(out, jointId);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiDestroyJointCommand(out, jointId);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiDestroyJointCommand(out, jointId);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiSetBodyCommand(out:Physics2DAbiCommandBuffer, bodyId:Int, body:RigidBody2D):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetBodyCommand(out, bodyId, body);
}
#else
extern inline function writePhysics2dAbiSetBodyCommand(out:Physics2DAbiCommandBuffer, bodyId:Int, body:RigidBody2D):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiSetBodyCommand(out, bodyId, body);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiSetBodyCommand(out, bodyId, body);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetBodyCommand(out, bodyId, body);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiSetColliderCommand(out:Physics2DAbiCommandBuffer, colliderId:Int, bodyId:Int, collider:Physics2DCollider):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetColliderCommand(out, colliderId, bodyId, collider);
}
#else
extern inline function writePhysics2dAbiSetColliderCommand(out:Physics2DAbiCommandBuffer, colliderId:Int, bodyId:Int, collider:Physics2DCollider):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiSetColliderCommand(out, colliderId, bodyId, collider);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiSetColliderCommand(out, colliderId, bodyId, collider);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetColliderCommand(out, colliderId, bodyId, collider);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiSetGravityCommand(out:Physics2DAbiCommandBuffer, x:Float, y:Float):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetGravityCommand(out, x, y);
}
#else
extern inline function writePhysics2dAbiSetGravityCommand(out:Physics2DAbiCommandBuffer, x:Float, y:Float):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiSetGravityCommand(out, x, y);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiSetGravityCommand(out, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetGravityCommand(out, x, y);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiSetJointCommandPhysics2DdistanceJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DDistanceJoint):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DdistanceJoint(out, jointId, bodyAId, bodyBId, joint);
}
#else
extern inline function writePhysics2dAbiSetJointCommandPhysics2DdistanceJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DDistanceJoint):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DdistanceJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DdistanceJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DdistanceJoint(out, jointId, bodyAId, bodyBId, joint);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiSetJointCommandPhysics2DgearJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DGearJoint):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DgearJoint(out, jointId, bodyAId, bodyBId, joint);
}
#else
extern inline function writePhysics2dAbiSetJointCommandPhysics2DgearJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DGearJoint):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DgearJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DgearJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DgearJoint(out, jointId, bodyAId, bodyBId, joint);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiSetJointCommandPhysics2DmouseJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DMouseJoint):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DmouseJoint(out, jointId, bodyAId, bodyBId, joint);
}
#else
extern inline function writePhysics2dAbiSetJointCommandPhysics2DmouseJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DMouseJoint):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DmouseJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DmouseJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DmouseJoint(out, jointId, bodyAId, bodyBId, joint);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiSetJointCommandPhysics2DprismaticJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DPrismaticJoint):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DprismaticJoint(out, jointId, bodyAId, bodyBId, joint);
}
#else
extern inline function writePhysics2dAbiSetJointCommandPhysics2DprismaticJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DPrismaticJoint):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DprismaticJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DprismaticJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DprismaticJoint(out, jointId, bodyAId, bodyBId, joint);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiSetJointCommandPhysics2DpulleyJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DPulleyJoint):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DpulleyJoint(out, jointId, bodyAId, bodyBId, joint);
}
#else
extern inline function writePhysics2dAbiSetJointCommandPhysics2DpulleyJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DPulleyJoint):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DpulleyJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DpulleyJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DpulleyJoint(out, jointId, bodyAId, bodyBId, joint);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiSetJointCommandPhysics2DrevoluteJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DRevoluteJoint):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DrevoluteJoint(out, jointId, bodyAId, bodyBId, joint);
}
#else
extern inline function writePhysics2dAbiSetJointCommandPhysics2DrevoluteJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DRevoluteJoint):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DrevoluteJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DrevoluteJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DrevoluteJoint(out, jointId, bodyAId, bodyBId, joint);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiSetJointCommandPhysics2DropeJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DRopeJoint):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DropeJoint(out, jointId, bodyAId, bodyBId, joint);
}
#else
extern inline function writePhysics2dAbiSetJointCommandPhysics2DropeJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DRopeJoint):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DropeJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DropeJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DropeJoint(out, jointId, bodyAId, bodyBId, joint);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiSetJointCommandPhysics2DweldJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DWeldJoint):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DweldJoint(out, jointId, bodyAId, bodyBId, joint);
}
#else
extern inline function writePhysics2dAbiSetJointCommandPhysics2DweldJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DWeldJoint):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DweldJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DweldJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DweldJoint(out, jointId, bodyAId, bodyBId, joint);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiSetJointCommandPhysics2DwheelJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DWheelJoint):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DwheelJoint(out, jointId, bodyAId, bodyBId, joint);
}
#else
extern inline function writePhysics2dAbiSetJointCommandPhysics2DwheelJoint(out:Physics2DAbiCommandBuffer, jointId:Int, bodyAId:Int, bodyBId:Int, joint:Physics2DWheelJoint):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DwheelJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DwheelJoint(out, jointId, bodyAId, bodyBId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetJointCommandPhysics2DwheelJoint(out, jointId, bodyAId, bodyBId, joint);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiSetSolverConfigCommand(out:Physics2DAbiCommandBuffer, config:Physics2DSolverConfig):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetSolverConfigCommand(out, config);
}
#else
extern inline function writePhysics2dAbiSetSolverConfigCommand(out:Physics2DAbiCommandBuffer, config:Physics2DSolverConfig):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiSetSolverConfigCommand(out, config);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiSetSolverConfigCommand(out, config);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiSetSolverConfigCommand(out, config);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics2dAbiWakeBodyCommand(out:Physics2DAbiCommandBuffer, bodyId:Int):Bool {
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiWakeBodyCommand(out, bodyId);
}
#else
extern inline function writePhysics2dAbiWakeBodyCommand(out:Physics2DAbiCommandBuffer, bodyId:Int):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.writePhysics2dAbiWakeBodyCommand(out, bodyId);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.writePhysics2dAbiWakeBodyCommand(out, bodyId);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.writePhysics2dAbiWakeBodyCommand(out, bodyId);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics2dAbiPoint(out:Physics2DAbiQueryBuffer, abi:Physics2DAbi, world:Int, x:Float, y:Float, filter:Null<Physics2DQueryFilter>):Bool {
	return flight._js._fn.Physics2DAbi.queryPhysics2dAbiPoint(out, abi, world, x, y, filter);
}
#else
extern inline function queryPhysics2dAbiPoint(out:Physics2DAbiQueryBuffer, abi:Physics2DAbi, world:Int, x:Float, y:Float, filter:Physics2DQueryFilter):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.queryPhysics2dAbiPoint(out, abi, world, x, y, filter);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.queryPhysics2dAbiPoint(out, abi, world, x, y, filter);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.queryPhysics2dAbiPoint(out, abi, world, x, y, filter);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics2dAbiRay(out:Physics2DAbiQueryBuffer, abi:Physics2DAbi, world:Int, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Null<Float>, filter:Null<Physics2DQueryFilter>):Bool {
	return flight._js._fn.Physics2DAbi.queryPhysics2dAbiRay(out, abi, world, originX, originY, directionX, directionY, maxFraction, filter);
}
#else
extern inline function queryPhysics2dAbiRay(out:Physics2DAbiQueryBuffer, abi:Physics2DAbi, world:Int, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Float, filter:Physics2DQueryFilter):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.queryPhysics2dAbiRay(out, abi, world, originX, originY, directionX, directionY, maxFraction, filter);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.queryPhysics2dAbiRay(out, abi, world, originX, originY, directionX, directionY, maxFraction, filter);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.queryPhysics2dAbiRay(out, abi, world, originX, originY, directionX, directionY, maxFraction, filter);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics2dAbiRayClosest(out:Physics2DAbiQueryBuffer, abi:Physics2DAbi, world:Int, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Null<Float>, filter:Null<Physics2DQueryFilter>):Bool {
	return flight._js._fn.Physics2DAbi.queryPhysics2dAbiRayClosest(out, abi, world, originX, originY, directionX, directionY, maxFraction, filter);
}
#else
extern inline function queryPhysics2dAbiRayClosest(out:Physics2DAbiQueryBuffer, abi:Physics2DAbi, world:Int, originX:Float, originY:Float, directionX:Float, directionY:Float, maxFraction:Float, filter:Physics2DQueryFilter):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.queryPhysics2dAbiRayClosest(out, abi, world, originX, originY, directionX, directionY, maxFraction, filter);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.queryPhysics2dAbiRayClosest(out, abi, world, originX, originY, directionX, directionY, maxFraction, filter);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.queryPhysics2dAbiRayClosest(out, abi, world, originX, originY, directionX, directionY, maxFraction, filter);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics2dAbiRegion(out:Physics2DAbiQueryBuffer, abi:Physics2DAbi, world:Int, region:SpatialAabb2D, filter:Null<Physics2DQueryFilter>):Bool {
	return flight._js._fn.Physics2DAbi.queryPhysics2dAbiRegion(out, abi, world, region, filter);
}
#else
extern inline function queryPhysics2dAbiRegion(out:Physics2DAbiQueryBuffer, abi:Physics2DAbi, world:Int, region:SpatialAabb2D, filter:Physics2DQueryFilter):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.queryPhysics2dAbiRegion(out, abi, world, region, filter);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.queryPhysics2dAbiRegion(out, abi, world, region, filter);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.queryPhysics2dAbiRegion(out, abi, world, region, filter);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics2dAbiShapeCast(out:Physics2DAbiQueryBuffer, abi:Physics2DAbi, world:Int, shape:CollisionShape2D, dx:Float, dy:Float, maxFraction:Null<Float>, filter:Null<Physics2DQueryFilter>):Bool {
	return flight._js._fn.Physics2DAbi.queryPhysics2dAbiShapeCast(out, abi, world, shape, dx, dy, maxFraction, filter);
}
#else
extern inline function queryPhysics2dAbiShapeCast(out:Physics2DAbiQueryBuffer, abi:Physics2DAbi, world:Int, shape:CollisionShape2D, dx:Float, dy:Float, maxFraction:Float, filter:Physics2DQueryFilter):Bool {
#if hl
	return flight._hl._fn.Physics2DAbi.queryPhysics2dAbiShapeCast(out, abi, world, shape, dx, dy, maxFraction, filter);
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.queryPhysics2dAbiShapeCast(out, abi, world, shape, dx, dy, maxFraction, filter);
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.queryPhysics2dAbiShapeCast(out, abi, world, shape, dx, dy, maxFraction, filter);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createReferencePhysics2dAbi():Physics2DAbi {
	return flight._js._fn.Physics2DAbi.createReferencePhysics2dAbi();
}
#else
extern inline function createReferencePhysics2dAbi():Physics2DAbi {
#if hl
	return flight._hl._fn.Physics2DAbi.createReferencePhysics2dAbi();
#elseif cpp
	return flight._cpp._fn.Physics2DAbi.createReferencePhysics2dAbi();
#elseif (js && flight_esm)
	return flight._js._fn.Physics2DAbi.createReferencePhysics2dAbi();
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2Dabi(ptr:Physics2DAbi):Void {
	flight._js._fn.Physics2DAbi.freePhysics2Dabi(ptr);
}
#else
extern inline function freePhysics2Dabi(ptr:Physics2DAbi):Void {
#if hl
	flight._hl._fn.Physics2DAbi.freePhysics2Dabi(ptr);
#elseif cpp
	flight._cpp._fn.Physics2DAbi.freePhysics2Dabi(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2DAbi.freePhysics2Dabi(ptr);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DabiBodyBuffer(ptr:Physics2DAbiBodyBuffer):Void {
	flight._js._fn.Physics2DAbi.freePhysics2DabiBodyBuffer(ptr);
}
#else
extern inline function freePhysics2DabiBodyBuffer(ptr:Physics2DAbiBodyBuffer):Void {
#if hl
	flight._hl._fn.Physics2DAbi.freePhysics2DabiBodyBuffer(ptr);
#elseif cpp
	flight._cpp._fn.Physics2DAbi.freePhysics2DabiBodyBuffer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2DAbi.freePhysics2DabiBodyBuffer(ptr);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DabiCommandBuffer(ptr:Physics2DAbiCommandBuffer):Void {
	flight._js._fn.Physics2DAbi.freePhysics2DabiCommandBuffer(ptr);
}
#else
extern inline function freePhysics2DabiCommandBuffer(ptr:Physics2DAbiCommandBuffer):Void {
#if hl
	flight._hl._fn.Physics2DAbi.freePhysics2DabiCommandBuffer(ptr);
#elseif cpp
	flight._cpp._fn.Physics2DAbi.freePhysics2DabiCommandBuffer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2DAbi.freePhysics2DabiCommandBuffer(ptr);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DabiContactBuffer(ptr:Physics2DAbiContactBuffer):Void {
	flight._js._fn.Physics2DAbi.freePhysics2DabiContactBuffer(ptr);
}
#else
extern inline function freePhysics2DabiContactBuffer(ptr:Physics2DAbiContactBuffer):Void {
#if hl
	flight._hl._fn.Physics2DAbi.freePhysics2DabiContactBuffer(ptr);
#elseif cpp
	flight._cpp._fn.Physics2DAbi.freePhysics2DabiContactBuffer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2DAbi.freePhysics2DabiContactBuffer(ptr);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DabiExecutionResult(ptr:Physics2DAbiExecutionResult):Void {
	flight._js._fn.Physics2DAbi.freePhysics2DabiExecutionResult(ptr);
}
#else
extern inline function freePhysics2DabiExecutionResult(ptr:Physics2DAbiExecutionResult):Void {
#if hl
	flight._hl._fn.Physics2DAbi.freePhysics2DabiExecutionResult(ptr);
#elseif cpp
	flight._cpp._fn.Physics2DAbi.freePhysics2DabiExecutionResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2DAbi.freePhysics2DabiExecutionResult(ptr);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DabiJointBuffer(ptr:Physics2DAbiJointBuffer):Void {
	flight._js._fn.Physics2DAbi.freePhysics2DabiJointBuffer(ptr);
}
#else
extern inline function freePhysics2DabiJointBuffer(ptr:Physics2DAbiJointBuffer):Void {
#if hl
	flight._hl._fn.Physics2DAbi.freePhysics2DabiJointBuffer(ptr);
#elseif cpp
	flight._cpp._fn.Physics2DAbi.freePhysics2DabiJointBuffer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2DAbi.freePhysics2DabiJointBuffer(ptr);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics2DabiQueryBuffer(ptr:Physics2DAbiQueryBuffer):Void {
	flight._js._fn.Physics2DAbi.freePhysics2DabiQueryBuffer(ptr);
}
#else
extern inline function freePhysics2DabiQueryBuffer(ptr:Physics2DAbiQueryBuffer):Void {
#if hl
	flight._hl._fn.Physics2DAbi.freePhysics2DabiQueryBuffer(ptr);
#elseif cpp
	flight._cpp._fn.Physics2DAbi.freePhysics2DabiQueryBuffer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics2DAbi.freePhysics2DabiQueryBuffer(ptr);
#else
	#error "flight.Physics2DAbi: no backend for this target."
#end
}
#end
