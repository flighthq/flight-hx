package flight;

#if hl

typedef Physics3DAbi = flight._hl.Physics3DAbi;

#elseif cpp

typedef Physics3DAbi = flight._cpp.Physics3DAbi;

#elseif (js && flight_esm)

typedef Physics3DAbi = flight._js.Physics3DAbi;

#elseif js

#error "flight.Physics3DAbi on js requires flight_esm."

#else

#error "flight.Physics3DAbi: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createPhysics3dAbi():Physics3DAbi {
	return flight._js._fn.Physics3DAbi.createPhysics3dAbi();
}
#else
extern inline function createPhysics3dAbi():Physics3DAbi {
#if hl
	return flight._hl._fn.Physics3DAbi.createPhysics3dAbi();
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.createPhysics3dAbi();
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.createPhysics3dAbi();
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics3dAbiWorld(abi:Physics3DAbi):Int {
	return flight._js._fn.Physics3DAbi.createPhysics3dAbiWorld(abi);
}
#else
extern inline function createPhysics3dAbiWorld(abi:Physics3DAbi):Int {
#if hl
	return flight._hl._fn.Physics3DAbi.createPhysics3dAbiWorld(abi);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.createPhysics3dAbiWorld(abi);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.createPhysics3dAbiWorld(abi);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function destroyPhysics3dAbiWorld(abi:Physics3DAbi, world:Int):Bool {
	return flight._js._fn.Physics3DAbi.destroyPhysics3dAbiWorld(abi, world);
}
#else
extern inline function destroyPhysics3dAbiWorld(abi:Physics3DAbi, world:Int):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.destroyPhysics3dAbiWorld(abi, world);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.destroyPhysics3dAbiWorld(abi, world);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.destroyPhysics3dAbiWorld(abi, world);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function executePhysics3dAbiCommands(out:Physics3DAbiExecutionResult, abi:Physics3DAbi, world:Int, commands:Physics3DAbiCommandBuffer):Bool {
	return flight._js._fn.Physics3DAbi.executePhysics3dAbiCommands(out, abi, world, commands);
}
#else
extern inline function executePhysics3dAbiCommands(out:Physics3DAbiExecutionResult, abi:Physics3DAbi, world:Int, commands:Physics3DAbiCommandBuffer):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.executePhysics3dAbiCommands(out, abi, world, commands);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.executePhysics3dAbiCommands(out, abi, world, commands);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.executePhysics3dAbiCommands(out, abi, world, commands);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPhysics3dAbiWorldStatus(abi:Physics3DAbi, world:Int):Dynamic {
	return flight._js._fn.Physics3DAbi.getPhysics3dAbiWorldStatus(abi, world);
}
#else
extern inline function getPhysics3dAbiWorldStatus(abi:Physics3DAbi, world:Int):flight.Physics3DAbiWorldStatus {
#if hl
	return flight._hl._fn.Physics3DAbi.getPhysics3dAbiWorldStatus(abi, world);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.getPhysics3dAbiWorldStatus(abi, world);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.getPhysics3dAbiWorldStatus(abi, world);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function readPhysics3dAbiBodies(out:Physics3DAbiBodyBuffer, abi:Physics3DAbi, world:Int, bodyIds:Null<Dynamic>):Bool {
	return flight._js._fn.Physics3DAbi.readPhysics3dAbiBodies(out, abi, world, bodyIds);
}
#else
extern inline function readPhysics3dAbiBodies(out:Physics3DAbiBodyBuffer, abi:Physics3DAbi, world:Int, bodyIds:Dynamic, bodyIdsLen:Int):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.readPhysics3dAbiBodies(out, abi, world, bodyIds, bodyIdsLen);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.readPhysics3dAbiBodies(out, abi, world, bodyIds, bodyIdsLen);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.readPhysics3dAbiBodies(out, abi, world, bodyIds, bodyIdsLen);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function readPhysics3dAbiContacts(out:Physics3DAbiContactBuffer, abi:Physics3DAbi, world:Int, selection:Dynamic):Bool {
	return flight._js._fn.Physics3DAbi.readPhysics3dAbiContacts(out, abi, world, selection);
}
#else
extern inline function readPhysics3dAbiContacts(out:Physics3DAbiContactBuffer, abi:Physics3DAbi, world:Int, selection:flight.Physics3DAbiContactSelection):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.readPhysics3dAbiContacts(out, abi, world, selection);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.readPhysics3dAbiContacts(out, abi, world, selection);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.readPhysics3dAbiContacts(out, abi, world, selection);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function readPhysics3dAbiJoints(out:Physics3DAbiJointBuffer, abi:Physics3DAbi, world:Int):Bool {
	return flight._js._fn.Physics3DAbi.readPhysics3dAbiJoints(out, abi, world);
}
#else
extern inline function readPhysics3dAbiJoints(out:Physics3DAbiJointBuffer, abi:Physics3DAbi, world:Int):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.readPhysics3dAbiJoints(out, abi, world);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.readPhysics3dAbiJoints(out, abi, world);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.readPhysics3dAbiJoints(out, abi, world);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function stepPhysics3dAbiWorld(abi:Physics3DAbi, world:Int, dt:Float, hooks:Null<Physics3DAbiContactHooks>):Dynamic {
	return flight._js._fn.Physics3DAbi.stepPhysics3dAbiWorld(abi, world, dt, hooks);
}
#else
extern inline function stepPhysics3dAbiWorld(abi:Physics3DAbi, world:Int, dt:Float, hooks:Physics3DAbiContactHooks):flight.Physics3DAbiStepStatus {
#if hl
	return flight._hl._fn.Physics3DAbi.stepPhysics3dAbiWorld(abi, world, dt, hooks);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.stepPhysics3dAbiWorld(abi, world, dt, hooks);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.stepPhysics3dAbiWorld(abi, world, dt, hooks);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics3dAbiBodyBuffer(capacity:Int):Physics3DAbiBodyBuffer {
	return flight._js._fn.Physics3DAbi.createPhysics3dAbiBodyBuffer(capacity);
}
#else
extern inline function createPhysics3dAbiBodyBuffer(capacity:Int):Physics3DAbiBodyBuffer {
#if hl
	return flight._hl._fn.Physics3DAbi.createPhysics3dAbiBodyBuffer(capacity);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.createPhysics3dAbiBodyBuffer(capacity);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.createPhysics3dAbiBodyBuffer(capacity);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics3dAbiCommandBuffer(byteCapacity:Null<Int>):Physics3DAbiCommandBuffer {
	return flight._js._fn.Physics3DAbi.createPhysics3dAbiCommandBuffer(byteCapacity);
}
#else
extern inline function createPhysics3dAbiCommandBuffer(byteCapacity:haxe.Int64):Physics3DAbiCommandBuffer {
#if hl
	return flight._hl._fn.Physics3DAbi.createPhysics3dAbiCommandBuffer(byteCapacity);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.createPhysics3dAbiCommandBuffer(byteCapacity);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.createPhysics3dAbiCommandBuffer(byteCapacity);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics3dAbiContactBuffer(contactCapacity:Int, pointCapacity:Int):Physics3DAbiContactBuffer {
	return flight._js._fn.Physics3DAbi.createPhysics3dAbiContactBuffer(contactCapacity, pointCapacity);
}
#else
extern inline function createPhysics3dAbiContactBuffer(contactCapacity:Int, pointCapacity:Int):Physics3DAbiContactBuffer {
#if hl
	return flight._hl._fn.Physics3DAbi.createPhysics3dAbiContactBuffer(contactCapacity, pointCapacity);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.createPhysics3dAbiContactBuffer(contactCapacity, pointCapacity);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.createPhysics3dAbiContactBuffer(contactCapacity, pointCapacity);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics3dAbiExecutionResult():Physics3DAbiExecutionResult {
	return flight._js._fn.Physics3DAbi.createPhysics3dAbiExecutionResult();
}
#else
extern inline function createPhysics3dAbiExecutionResult():Physics3DAbiExecutionResult {
#if hl
	return flight._hl._fn.Physics3DAbi.createPhysics3dAbiExecutionResult();
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.createPhysics3dAbiExecutionResult();
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.createPhysics3dAbiExecutionResult();
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics3dAbiJointBuffer(capacity:Int):Physics3DAbiJointBuffer {
	return flight._js._fn.Physics3DAbi.createPhysics3dAbiJointBuffer(capacity);
}
#else
extern inline function createPhysics3dAbiJointBuffer(capacity:Int):Physics3DAbiJointBuffer {
#if hl
	return flight._hl._fn.Physics3DAbi.createPhysics3dAbiJointBuffer(capacity);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.createPhysics3dAbiJointBuffer(capacity);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.createPhysics3dAbiJointBuffer(capacity);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createPhysics3dAbiQueryBuffer(capacity:Int):Physics3DAbiQueryBuffer {
	return flight._js._fn.Physics3DAbi.createPhysics3dAbiQueryBuffer(capacity);
}
#else
extern inline function createPhysics3dAbiQueryBuffer(capacity:Int):Physics3DAbiQueryBuffer {
#if hl
	return flight._hl._fn.Physics3DAbi.createPhysics3dAbiQueryBuffer(capacity);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.createPhysics3dAbiQueryBuffer(capacity);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.createPhysics3dAbiQueryBuffer(capacity);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearPhysics3dAbiCommandBuffer(out:Physics3DAbiCommandBuffer):Void {
	flight._js._fn.Physics3DAbi.clearPhysics3dAbiCommandBuffer(out);
}
#else
extern inline function clearPhysics3dAbiCommandBuffer(out:Physics3DAbiCommandBuffer):Void {
#if hl
	flight._hl._fn.Physics3DAbi.clearPhysics3dAbiCommandBuffer(out);
#elseif cpp
	flight._cpp._fn.Physics3DAbi.clearPhysics3dAbiCommandBuffer(out);
#elseif (js && flight_esm)
	flight._js._fn.Physics3DAbi.clearPhysics3dAbiCommandBuffer(out);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPhysics3dAbiCommandBufferRemainingByteLength(buffer:Physics3DAbiCommandBuffer):Int {
	return flight._js._fn.Physics3DAbi.getPhysics3dAbiCommandBufferRemainingByteLength(buffer);
}
#else
extern inline function getPhysics3dAbiCommandBufferRemainingByteLength(buffer:Physics3DAbiCommandBuffer):Int {
#if hl
	return flight._hl._fn.Physics3DAbi.getPhysics3dAbiCommandBufferRemainingByteLength(buffer);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.getPhysics3dAbiCommandBufferRemainingByteLength(buffer);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.getPhysics3dAbiCommandBufferRemainingByteLength(buffer);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function getPhysics3dAbiSetColliderCommandByteLength(collider:Physics3DCollider):Float {
	return flight._js._fn.Physics3DAbi.getPhysics3dAbiSetColliderCommandByteLength(collider);
}
#else
extern inline function getPhysics3dAbiSetColliderCommandByteLength(collider:Physics3DCollider):haxe.Int64 {
#if hl
	return flight._hl._fn.Physics3DAbi.getPhysics3dAbiSetColliderCommandByteLength(collider);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.getPhysics3dAbiSetColliderCommandByteLength(collider);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.getPhysics3dAbiSetColliderCommandByteLength(collider);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiApplyForceAtPointCommand(out:Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float, pointX:Float, pointY:Float, pointZ:Float):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiApplyForceAtPointCommand(out, bodyId, x, y, z, pointX, pointY, pointZ);
}
#else
extern inline function writePhysics3dAbiApplyForceAtPointCommand(out:Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float, pointX:Float, pointY:Float, pointZ:Float):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiApplyForceAtPointCommand(out, bodyId, x, y, z, pointX, pointY, pointZ);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiApplyForceAtPointCommand(out, bodyId, x, y, z, pointX, pointY, pointZ);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiApplyForceAtPointCommand(out, bodyId, x, y, z, pointX, pointY, pointZ);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiApplyForceCommand(out:Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiApplyForceCommand(out, bodyId, x, y, z);
}
#else
extern inline function writePhysics3dAbiApplyForceCommand(out:Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiApplyForceCommand(out, bodyId, x, y, z);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiApplyForceCommand(out, bodyId, x, y, z);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiApplyForceCommand(out, bodyId, x, y, z);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiApplyLinearImpulseAtPointCommand(out:Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float, pointX:Float, pointY:Float, pointZ:Float):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiApplyLinearImpulseAtPointCommand(out, bodyId, x, y, z, pointX, pointY, pointZ);
}
#else
extern inline function writePhysics3dAbiApplyLinearImpulseAtPointCommand(out:Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float, pointX:Float, pointY:Float, pointZ:Float):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiApplyLinearImpulseAtPointCommand(out, bodyId, x, y, z, pointX, pointY, pointZ);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiApplyLinearImpulseAtPointCommand(out, bodyId, x, y, z, pointX, pointY, pointZ);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiApplyLinearImpulseAtPointCommand(out, bodyId, x, y, z, pointX, pointY, pointZ);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiApplyLinearImpulseCommand(out:Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiApplyLinearImpulseCommand(out, bodyId, x, y, z);
}
#else
extern inline function writePhysics3dAbiApplyLinearImpulseCommand(out:Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiApplyLinearImpulseCommand(out, bodyId, x, y, z);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiApplyLinearImpulseCommand(out, bodyId, x, y, z);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiApplyLinearImpulseCommand(out, bodyId, x, y, z);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiApplyTorqueCommand(out:Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiApplyTorqueCommand(out, bodyId, x, y, z);
}
#else
extern inline function writePhysics3dAbiApplyTorqueCommand(out:Physics3DAbiCommandBuffer, bodyId:Int, x:Float, y:Float, z:Float):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiApplyTorqueCommand(out, bodyId, x, y, z);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiApplyTorqueCommand(out, bodyId, x, y, z);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiApplyTorqueCommand(out, bodyId, x, y, z);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiDestroyBodyCommand(out:Physics3DAbiCommandBuffer, bodyId:Int):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiDestroyBodyCommand(out, bodyId);
}
#else
extern inline function writePhysics3dAbiDestroyBodyCommand(out:Physics3DAbiCommandBuffer, bodyId:Int):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiDestroyBodyCommand(out, bodyId);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiDestroyBodyCommand(out, bodyId);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiDestroyBodyCommand(out, bodyId);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiDestroyColliderCommand(out:Physics3DAbiCommandBuffer, colliderId:Int):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiDestroyColliderCommand(out, colliderId);
}
#else
extern inline function writePhysics3dAbiDestroyColliderCommand(out:Physics3DAbiCommandBuffer, colliderId:Int):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiDestroyColliderCommand(out, colliderId);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiDestroyColliderCommand(out, colliderId);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiDestroyColliderCommand(out, colliderId);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiDestroyJointCommand(out:Physics3DAbiCommandBuffer, jointId:Int):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiDestroyJointCommand(out, jointId);
}
#else
extern inline function writePhysics3dAbiDestroyJointCommand(out:Physics3DAbiCommandBuffer, jointId:Int):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiDestroyJointCommand(out, jointId);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiDestroyJointCommand(out, jointId);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiDestroyJointCommand(out, jointId);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiSetBodyCommand(out:Physics3DAbiCommandBuffer, bodyId:Int, body:RigidBody3D):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetBodyCommand(out, bodyId, body);
}
#else
extern inline function writePhysics3dAbiSetBodyCommand(out:Physics3DAbiCommandBuffer, bodyId:Int, body:RigidBody3D):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiSetBodyCommand(out, bodyId, body);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiSetBodyCommand(out, bodyId, body);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetBodyCommand(out, bodyId, body);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiSetColliderCommand(out:Physics3DAbiCommandBuffer, colliderId:Int, bodyId:Int, collider:Physics3DCollider):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetColliderCommand(out, colliderId, bodyId, collider);
}
#else
extern inline function writePhysics3dAbiSetColliderCommand(out:Physics3DAbiCommandBuffer, colliderId:Int, bodyId:Int, collider:Physics3DCollider):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiSetColliderCommand(out, colliderId, bodyId, collider);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiSetColliderCommand(out, colliderId, bodyId, collider);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetColliderCommand(out, colliderId, bodyId, collider);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiSetGravityCommand(out:Physics3DAbiCommandBuffer, x:Float, y:Float, z:Float):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetGravityCommand(out, x, y, z);
}
#else
extern inline function writePhysics3dAbiSetGravityCommand(out:Physics3DAbiCommandBuffer, x:Float, y:Float, z:Float):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiSetGravityCommand(out, x, y, z);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiSetGravityCommand(out, x, y, z);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetGravityCommand(out, x, y, z);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiSetJointCommandPhysics3DballAndSocketJoint(out:Physics3DAbiCommandBuffer, jointId:Int, joint:Physics3DBallAndSocketJoint):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DballAndSocketJoint(out, jointId, joint);
}
#else
extern inline function writePhysics3dAbiSetJointCommandPhysics3DballAndSocketJoint(out:Physics3DAbiCommandBuffer, jointId:Int, joint:Physics3DBallAndSocketJoint):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DballAndSocketJoint(out, jointId, joint);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DballAndSocketJoint(out, jointId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DballAndSocketJoint(out, jointId, joint);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiSetJointCommandPhysics3DconeTwistJoint(out:Physics3DAbiCommandBuffer, jointId:Int, joint:Physics3DConeTwistJoint):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DconeTwistJoint(out, jointId, joint);
}
#else
extern inline function writePhysics3dAbiSetJointCommandPhysics3DconeTwistJoint(out:Physics3DAbiCommandBuffer, jointId:Int, joint:Physics3DConeTwistJoint):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DconeTwistJoint(out, jointId, joint);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DconeTwistJoint(out, jointId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DconeTwistJoint(out, jointId, joint);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiSetJointCommandPhysics3DdistanceJoint(out:Physics3DAbiCommandBuffer, jointId:Int, joint:Physics3DDistanceJoint):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DdistanceJoint(out, jointId, joint);
}
#else
extern inline function writePhysics3dAbiSetJointCommandPhysics3DdistanceJoint(out:Physics3DAbiCommandBuffer, jointId:Int, joint:Physics3DDistanceJoint):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DdistanceJoint(out, jointId, joint);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DdistanceJoint(out, jointId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DdistanceJoint(out, jointId, joint);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiSetJointCommandPhysics3DfixedJoint(out:Physics3DAbiCommandBuffer, jointId:Int, joint:Physics3DFixedJoint):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DfixedJoint(out, jointId, joint);
}
#else
extern inline function writePhysics3dAbiSetJointCommandPhysics3DfixedJoint(out:Physics3DAbiCommandBuffer, jointId:Int, joint:Physics3DFixedJoint):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DfixedJoint(out, jointId, joint);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DfixedJoint(out, jointId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DfixedJoint(out, jointId, joint);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiSetJointCommandPhysics3Dgeneric6DofJoint(out:Physics3DAbiCommandBuffer, jointId:Int, joint:Physics3DGeneric6DofJoint):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3Dgeneric6DofJoint(out, jointId, joint);
}
#else
extern inline function writePhysics3dAbiSetJointCommandPhysics3Dgeneric6DofJoint(out:Physics3DAbiCommandBuffer, jointId:Int, joint:Physics3DGeneric6DofJoint):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3Dgeneric6DofJoint(out, jointId, joint);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3Dgeneric6DofJoint(out, jointId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3Dgeneric6DofJoint(out, jointId, joint);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiSetJointCommandPhysics3DhingeJoint(out:Physics3DAbiCommandBuffer, jointId:Int, joint:Physics3DHingeJoint):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DhingeJoint(out, jointId, joint);
}
#else
extern inline function writePhysics3dAbiSetJointCommandPhysics3DhingeJoint(out:Physics3DAbiCommandBuffer, jointId:Int, joint:Physics3DHingeJoint):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DhingeJoint(out, jointId, joint);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DhingeJoint(out, jointId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DhingeJoint(out, jointId, joint);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiSetJointCommandPhysics3DsliderJoint(out:Physics3DAbiCommandBuffer, jointId:Int, joint:Physics3DSliderJoint):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DsliderJoint(out, jointId, joint);
}
#else
extern inline function writePhysics3dAbiSetJointCommandPhysics3DsliderJoint(out:Physics3DAbiCommandBuffer, jointId:Int, joint:Physics3DSliderJoint):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DsliderJoint(out, jointId, joint);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DsliderJoint(out, jointId, joint);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetJointCommandPhysics3DsliderJoint(out, jointId, joint);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiSetSolverConfigCommand(out:Physics3DAbiCommandBuffer, config:Physics3DSolverConfig):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetSolverConfigCommand(out, config);
}
#else
extern inline function writePhysics3dAbiSetSolverConfigCommand(out:Physics3DAbiCommandBuffer, config:Physics3DSolverConfig):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiSetSolverConfigCommand(out, config);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiSetSolverConfigCommand(out, config);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiSetSolverConfigCommand(out, config);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function writePhysics3dAbiWakeBodyCommand(out:Physics3DAbiCommandBuffer, bodyId:Int):Bool {
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiWakeBodyCommand(out, bodyId);
}
#else
extern inline function writePhysics3dAbiWakeBodyCommand(out:Physics3DAbiCommandBuffer, bodyId:Int):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.writePhysics3dAbiWakeBodyCommand(out, bodyId);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.writePhysics3dAbiWakeBodyCommand(out, bodyId);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.writePhysics3dAbiWakeBodyCommand(out, bodyId);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics3dAbiPoint(out:Physics3DAbiQueryBuffer, abi:Physics3DAbi, world:Int, x:Float, y:Float, z:Float, filter:Null<Physics3DQueryFilter>):Bool {
	return flight._js._fn.Physics3DAbi.queryPhysics3dAbiPoint(out, abi, world, x, y, z, filter);
}
#else
extern inline function queryPhysics3dAbiPoint(out:Physics3DAbiQueryBuffer, abi:Physics3DAbi, world:Int, x:Float, y:Float, z:Float, filter:Physics3DQueryFilter):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.queryPhysics3dAbiPoint(out, abi, world, x, y, z, filter);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.queryPhysics3dAbiPoint(out, abi, world, x, y, z, filter);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.queryPhysics3dAbiPoint(out, abi, world, x, y, z, filter);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics3dAbiRay(out:Physics3DAbiQueryBuffer, abi:Physics3DAbi, world:Int, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Null<Float>, filter:Null<Physics3DQueryFilter>):Bool {
	return flight._js._fn.Physics3DAbi.queryPhysics3dAbiRay(out, abi, world, originX, originY, originZ, directionX, directionY, directionZ, maxFraction, filter);
}
#else
extern inline function queryPhysics3dAbiRay(out:Physics3DAbiQueryBuffer, abi:Physics3DAbi, world:Int, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Float, filter:Physics3DQueryFilter):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.queryPhysics3dAbiRay(out, abi, world, originX, originY, originZ, directionX, directionY, directionZ, maxFraction, filter);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.queryPhysics3dAbiRay(out, abi, world, originX, originY, originZ, directionX, directionY, directionZ, maxFraction, filter);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.queryPhysics3dAbiRay(out, abi, world, originX, originY, originZ, directionX, directionY, directionZ, maxFraction, filter);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics3dAbiRayClosest(out:Physics3DAbiQueryBuffer, abi:Physics3DAbi, world:Int, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Null<Float>, filter:Null<Physics3DQueryFilter>):Bool {
	return flight._js._fn.Physics3DAbi.queryPhysics3dAbiRayClosest(out, abi, world, originX, originY, originZ, directionX, directionY, directionZ, maxFraction, filter);
}
#else
extern inline function queryPhysics3dAbiRayClosest(out:Physics3DAbiQueryBuffer, abi:Physics3DAbi, world:Int, originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float, maxFraction:Float, filter:Physics3DQueryFilter):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.queryPhysics3dAbiRayClosest(out, abi, world, originX, originY, originZ, directionX, directionY, directionZ, maxFraction, filter);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.queryPhysics3dAbiRayClosest(out, abi, world, originX, originY, originZ, directionX, directionY, directionZ, maxFraction, filter);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.queryPhysics3dAbiRayClosest(out, abi, world, originX, originY, originZ, directionX, directionY, directionZ, maxFraction, filter);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics3dAbiRegion(out:Physics3DAbiQueryBuffer, abi:Physics3DAbi, world:Int, region:SpatialAabb3D, filter:Null<Physics3DQueryFilter>):Bool {
	return flight._js._fn.Physics3DAbi.queryPhysics3dAbiRegion(out, abi, world, region, filter);
}
#else
extern inline function queryPhysics3dAbiRegion(out:Physics3DAbiQueryBuffer, abi:Physics3DAbi, world:Int, region:SpatialAabb3D, filter:Physics3DQueryFilter):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.queryPhysics3dAbiRegion(out, abi, world, region, filter);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.queryPhysics3dAbiRegion(out, abi, world, region, filter);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.queryPhysics3dAbiRegion(out, abi, world, region, filter);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function queryPhysics3dAbiShapeCast(out:Physics3DAbiQueryBuffer, abi:Physics3DAbi, world:Int, shape:CollisionShape3D, dx:Float, dy:Float, dz:Float, maxFraction:Null<Float>, filter:Null<Physics3DQueryFilter>):Bool {
	return flight._js._fn.Physics3DAbi.queryPhysics3dAbiShapeCast(out, abi, world, shape, dx, dy, dz, maxFraction, filter);
}
#else
extern inline function queryPhysics3dAbiShapeCast(out:Physics3DAbiQueryBuffer, abi:Physics3DAbi, world:Int, shape:CollisionShape3D, dx:Float, dy:Float, dz:Float, maxFraction:Float, filter:Physics3DQueryFilter):Bool {
#if hl
	return flight._hl._fn.Physics3DAbi.queryPhysics3dAbiShapeCast(out, abi, world, shape, dx, dy, dz, maxFraction, filter);
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.queryPhysics3dAbiShapeCast(out, abi, world, shape, dx, dy, dz, maxFraction, filter);
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.queryPhysics3dAbiShapeCast(out, abi, world, shape, dx, dy, dz, maxFraction, filter);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createReferencePhysics3dAbi():Physics3DAbi {
	return flight._js._fn.Physics3DAbi.createReferencePhysics3dAbi();
}
#else
extern inline function createReferencePhysics3dAbi():Physics3DAbi {
#if hl
	return flight._hl._fn.Physics3DAbi.createReferencePhysics3dAbi();
#elseif cpp
	return flight._cpp._fn.Physics3DAbi.createReferencePhysics3dAbi();
#elseif (js && flight_esm)
	return flight._js._fn.Physics3DAbi.createReferencePhysics3dAbi();
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics3Dabi(ptr:Physics3DAbi):Void {
	flight._js._fn.Physics3DAbi.freePhysics3Dabi(ptr);
}
#else
extern inline function freePhysics3Dabi(ptr:Physics3DAbi):Void {
#if hl
	flight._hl._fn.Physics3DAbi.freePhysics3Dabi(ptr);
#elseif cpp
	flight._cpp._fn.Physics3DAbi.freePhysics3Dabi(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics3DAbi.freePhysics3Dabi(ptr);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics3DabiBodyBuffer(ptr:Physics3DAbiBodyBuffer):Void {
	flight._js._fn.Physics3DAbi.freePhysics3DabiBodyBuffer(ptr);
}
#else
extern inline function freePhysics3DabiBodyBuffer(ptr:Physics3DAbiBodyBuffer):Void {
#if hl
	flight._hl._fn.Physics3DAbi.freePhysics3DabiBodyBuffer(ptr);
#elseif cpp
	flight._cpp._fn.Physics3DAbi.freePhysics3DabiBodyBuffer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics3DAbi.freePhysics3DabiBodyBuffer(ptr);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics3DabiCommandBuffer(ptr:Physics3DAbiCommandBuffer):Void {
	flight._js._fn.Physics3DAbi.freePhysics3DabiCommandBuffer(ptr);
}
#else
extern inline function freePhysics3DabiCommandBuffer(ptr:Physics3DAbiCommandBuffer):Void {
#if hl
	flight._hl._fn.Physics3DAbi.freePhysics3DabiCommandBuffer(ptr);
#elseif cpp
	flight._cpp._fn.Physics3DAbi.freePhysics3DabiCommandBuffer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics3DAbi.freePhysics3DabiCommandBuffer(ptr);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics3DabiContactBuffer(ptr:Physics3DAbiContactBuffer):Void {
	flight._js._fn.Physics3DAbi.freePhysics3DabiContactBuffer(ptr);
}
#else
extern inline function freePhysics3DabiContactBuffer(ptr:Physics3DAbiContactBuffer):Void {
#if hl
	flight._hl._fn.Physics3DAbi.freePhysics3DabiContactBuffer(ptr);
#elseif cpp
	flight._cpp._fn.Physics3DAbi.freePhysics3DabiContactBuffer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics3DAbi.freePhysics3DabiContactBuffer(ptr);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics3DabiExecutionResult(ptr:Physics3DAbiExecutionResult):Void {
	flight._js._fn.Physics3DAbi.freePhysics3DabiExecutionResult(ptr);
}
#else
extern inline function freePhysics3DabiExecutionResult(ptr:Physics3DAbiExecutionResult):Void {
#if hl
	flight._hl._fn.Physics3DAbi.freePhysics3DabiExecutionResult(ptr);
#elseif cpp
	flight._cpp._fn.Physics3DAbi.freePhysics3DabiExecutionResult(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics3DAbi.freePhysics3DabiExecutionResult(ptr);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics3DabiJointBuffer(ptr:Physics3DAbiJointBuffer):Void {
	flight._js._fn.Physics3DAbi.freePhysics3DabiJointBuffer(ptr);
}
#else
extern inline function freePhysics3DabiJointBuffer(ptr:Physics3DAbiJointBuffer):Void {
#if hl
	flight._hl._fn.Physics3DAbi.freePhysics3DabiJointBuffer(ptr);
#elseif cpp
	flight._cpp._fn.Physics3DAbi.freePhysics3DabiJointBuffer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics3DAbi.freePhysics3DabiJointBuffer(ptr);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freePhysics3DabiQueryBuffer(ptr:Physics3DAbiQueryBuffer):Void {
	flight._js._fn.Physics3DAbi.freePhysics3DabiQueryBuffer(ptr);
}
#else
extern inline function freePhysics3DabiQueryBuffer(ptr:Physics3DAbiQueryBuffer):Void {
#if hl
	flight._hl._fn.Physics3DAbi.freePhysics3DabiQueryBuffer(ptr);
#elseif cpp
	flight._cpp._fn.Physics3DAbi.freePhysics3DabiQueryBuffer(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Physics3DAbi.freePhysics3DabiQueryBuffer(ptr);
#else
	#error "flight.Physics3DAbi: no backend for this target."
#end
}
#end
