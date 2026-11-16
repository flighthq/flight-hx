package flight;

#if hl

typedef Spring = flight._hl.Spring;

#elseif cpp

typedef Spring = flight._cpp.Spring;

#elseif (js && flight_esm)

typedef Spring = flight._js.Spring;

#elseif js

#error "flight.Spring on js requires flight_esm."

#else

#error "flight.Spring: no backend for this target."

#end

#if (js && flight_esm)
extern inline function createSpring(value:Float, velocity:Float):Spring {
	return flight._js._fn.Spring.createSpring(value, velocity);
}
#else
extern inline function createSpring(value:Float, velocity:Float):Spring {
#if hl
	return flight._hl._fn.Spring.createSpring(value, velocity);
#elseif cpp
	return flight._cpp._fn.Spring.createSpring(value, velocity);
#elseif (js && flight_esm)
	return flight._js._fn.Spring.createSpring(value, velocity);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addSpringImpulse(spring:Spring, velocity:Float):Void {
	flight._js._fn.Spring.addSpringImpulse(spring, velocity);
}
#else
extern inline function addSpringImpulse(spring:Spring, velocity:Float):Void {
#if hl
	flight._hl._fn.Spring.addSpringImpulse(spring, velocity);
#elseif cpp
	flight._cpp._fn.Spring.addSpringImpulse(spring, velocity);
#elseif (js && flight_esm)
	flight._js._fn.Spring.addSpringImpulse(spring, velocity);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isSpringSettled(spring:Spring, target:Float, positionEpsilon:Null<Float>, velocityEpsilon:Null<Float>):Bool {
	return flight._js._fn.Spring.isSpringSettled(spring, target, positionEpsilon, velocityEpsilon);
}
#else
extern inline function isSpringSettled(spring:Spring, target:Float, positionEpsilon:Float, velocityEpsilon:Float):Bool {
#if hl
	return flight._hl._fn.Spring.isSpringSettled(spring, target, positionEpsilon, velocityEpsilon);
#elseif cpp
	return flight._cpp._fn.Spring.isSpringSettled(spring, target, positionEpsilon, velocityEpsilon);
#elseif (js && flight_esm)
	return flight._js._fn.Spring.isSpringSettled(spring, target, positionEpsilon, velocityEpsilon);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resetSpring(spring:Spring, value:Float, velocity:Null<Float>):Void {
	flight._js._fn.Spring.resetSpring(spring, value, velocity);
}
#else
extern inline function resetSpring(spring:Spring, value:Float, velocity:Float):Void {
#if hl
	flight._hl._fn.Spring.resetSpring(spring, value, velocity);
#elseif cpp
	flight._cpp._fn.Spring.resetSpring(spring, value, velocity);
#elseif (js && flight_esm)
	flight._js._fn.Spring.resetSpring(spring, value, velocity);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateSpring(spring:Spring, target:Float, config:SpringConfig, deltaTime:Float):Void {
	flight._js._fn.Spring.updateSpring(spring, target, config, deltaTime);
}
#else
extern inline function updateSpring(spring:Spring, target:Float, config:SpringConfig, deltaTime:Float):Void {
#if hl
	flight._hl._fn.Spring.updateSpring(spring, target, config, deltaTime);
#elseif cpp
	flight._cpp._fn.Spring.updateSpring(spring, target, config, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.Spring.updateSpring(spring, target, config, deltaTime);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateSpringAngle(spring:Spring, target:Float, fullTurn:Float, config:SpringConfig, deltaTime:Float):Void {
	flight._js._fn.Spring.updateSpringAngle(spring, target, fullTurn, config, deltaTime);
}
#else
extern inline function updateSpringAngle(spring:Spring, target:Float, fullTurn:Float, config:SpringConfig, deltaTime:Float):Void {
#if hl
	flight._hl._fn.Spring.updateSpringAngle(spring, target, fullTurn, config, deltaTime);
#elseif cpp
	flight._cpp._fn.Spring.updateSpringAngle(spring, target, fullTurn, config, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.Spring.updateSpringAngle(spring, target, fullTurn, config, deltaTime);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpring2d(valueX:Float, valueY:Float, velocityX:Float, velocityY:Float):Spring2D {
	return flight._js._fn.Spring.createSpring2d(valueX, valueY, velocityX, velocityY);
}
#else
extern inline function createSpring2d(valueX:Float, valueY:Float, velocityX:Float, velocityY:Float):Spring2D {
#if hl
	return flight._hl._fn.Spring.createSpring2d(valueX, valueY, velocityX, velocityY);
#elseif cpp
	return flight._cpp._fn.Spring.createSpring2d(valueX, valueY, velocityX, velocityY);
#elseif (js && flight_esm)
	return flight._js._fn.Spring.createSpring2d(valueX, valueY, velocityX, velocityY);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addSpringImpulse2d(spring2d:Spring2D, velocityX:Float, velocityY:Float):Void {
	flight._js._fn.Spring.addSpringImpulse2d(spring2d, velocityX, velocityY);
}
#else
extern inline function addSpringImpulse2d(spring2d:Spring2D, velocityX:Float, velocityY:Float):Void {
#if hl
	flight._hl._fn.Spring.addSpringImpulse2d(spring2d, velocityX, velocityY);
#elseif cpp
	flight._cpp._fn.Spring.addSpringImpulse2d(spring2d, velocityX, velocityY);
#elseif (js && flight_esm)
	flight._js._fn.Spring.addSpringImpulse2d(spring2d, velocityX, velocityY);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isSpring2dSettled(spring2d:Spring2D, targetX:Float, targetY:Float, positionEpsilon:Null<Float>, velocityEpsilon:Null<Float>):Bool {
	return flight._js._fn.Spring.isSpring2dSettled(spring2d, targetX, targetY, positionEpsilon, velocityEpsilon);
}
#else
extern inline function isSpring2dSettled(spring2d:Spring2D, targetX:Float, targetY:Float, positionEpsilon:Float, velocityEpsilon:Float):Bool {
#if hl
	return flight._hl._fn.Spring.isSpring2dSettled(spring2d, targetX, targetY, positionEpsilon, velocityEpsilon);
#elseif cpp
	return flight._cpp._fn.Spring.isSpring2dSettled(spring2d, targetX, targetY, positionEpsilon, velocityEpsilon);
#elseif (js && flight_esm)
	return flight._js._fn.Spring.isSpring2dSettled(spring2d, targetX, targetY, positionEpsilon, velocityEpsilon);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resetSpring2d(spring2d:Spring2D, valueX:Float, valueY:Float, velocityX:Null<Float>, velocityY:Null<Float>):Void {
	flight._js._fn.Spring.resetSpring2d(spring2d, valueX, valueY, velocityX, velocityY);
}
#else
extern inline function resetSpring2d(spring2d:Spring2D, valueX:Float, valueY:Float, velocityX:Float, velocityY:Float):Void {
#if hl
	flight._hl._fn.Spring.resetSpring2d(spring2d, valueX, valueY, velocityX, velocityY);
#elseif cpp
	flight._cpp._fn.Spring.resetSpring2d(spring2d, valueX, valueY, velocityX, velocityY);
#elseif (js && flight_esm)
	flight._js._fn.Spring.resetSpring2d(spring2d, valueX, valueY, velocityX, velocityY);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateSpring2d(spring2d:Spring2D, targetX:Float, targetY:Float, config:SpringConfig, deltaTime:Float):Void {
	flight._js._fn.Spring.updateSpring2d(spring2d, targetX, targetY, config, deltaTime);
}
#else
extern inline function updateSpring2d(spring2d:Spring2D, targetX:Float, targetY:Float, config:SpringConfig, deltaTime:Float):Void {
#if hl
	flight._hl._fn.Spring.updateSpring2d(spring2d, targetX, targetY, config, deltaTime);
#elseif cpp
	flight._cpp._fn.Spring.updateSpring2d(spring2d, targetX, targetY, config, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.Spring.updateSpring2d(spring2d, targetX, targetY, config, deltaTime);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpring3d(valueX:Float, valueY:Float, valueZ:Float, velocityX:Float, velocityY:Float, velocityZ:Float):Spring3D {
	return flight._js._fn.Spring.createSpring3d(valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
}
#else
extern inline function createSpring3d(valueX:Float, valueY:Float, valueZ:Float, velocityX:Float, velocityY:Float, velocityZ:Float):Spring3D {
#if hl
	return flight._hl._fn.Spring.createSpring3d(valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
#elseif cpp
	return flight._cpp._fn.Spring.createSpring3d(valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
#elseif (js && flight_esm)
	return flight._js._fn.Spring.createSpring3d(valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function addSpringImpulse3d(spring3d:Spring3D, velocityX:Float, velocityY:Float, velocityZ:Float):Void {
	flight._js._fn.Spring.addSpringImpulse3d(spring3d, velocityX, velocityY, velocityZ);
}
#else
extern inline function addSpringImpulse3d(spring3d:Spring3D, velocityX:Float, velocityY:Float, velocityZ:Float):Void {
#if hl
	flight._hl._fn.Spring.addSpringImpulse3d(spring3d, velocityX, velocityY, velocityZ);
#elseif cpp
	flight._cpp._fn.Spring.addSpringImpulse3d(spring3d, velocityX, velocityY, velocityZ);
#elseif (js && flight_esm)
	flight._js._fn.Spring.addSpringImpulse3d(spring3d, velocityX, velocityY, velocityZ);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function isSpring3dSettled(spring3d:Spring3D, targetX:Float, targetY:Float, targetZ:Float, positionEpsilon:Null<Float>, velocityEpsilon:Null<Float>):Bool {
	return flight._js._fn.Spring.isSpring3dSettled(spring3d, targetX, targetY, targetZ, positionEpsilon, velocityEpsilon);
}
#else
extern inline function isSpring3dSettled(spring3d:Spring3D, targetX:Float, targetY:Float, targetZ:Float, positionEpsilon:Float, velocityEpsilon:Float):Bool {
#if hl
	return flight._hl._fn.Spring.isSpring3dSettled(spring3d, targetX, targetY, targetZ, positionEpsilon, velocityEpsilon);
#elseif cpp
	return flight._cpp._fn.Spring.isSpring3dSettled(spring3d, targetX, targetY, targetZ, positionEpsilon, velocityEpsilon);
#elseif (js && flight_esm)
	return flight._js._fn.Spring.isSpring3dSettled(spring3d, targetX, targetY, targetZ, positionEpsilon, velocityEpsilon);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function resetSpring3d(spring3d:Spring3D, valueX:Float, valueY:Float, valueZ:Float, velocityX:Null<Float>, velocityY:Null<Float>, velocityZ:Null<Float>):Void {
	flight._js._fn.Spring.resetSpring3d(spring3d, valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
}
#else
extern inline function resetSpring3d(spring3d:Spring3D, valueX:Float, valueY:Float, valueZ:Float, velocityX:Float, velocityY:Float, velocityZ:Float):Void {
#if hl
	flight._hl._fn.Spring.resetSpring3d(spring3d, valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
#elseif cpp
	flight._cpp._fn.Spring.resetSpring3d(spring3d, valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
#elseif (js && flight_esm)
	flight._js._fn.Spring.resetSpring3d(spring3d, valueX, valueY, valueZ, velocityX, velocityY, velocityZ);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function updateSpring3d(spring3d:Spring3D, targetX:Float, targetY:Float, targetZ:Float, config:SpringConfig, deltaTime:Float):Void {
	flight._js._fn.Spring.updateSpring3d(spring3d, targetX, targetY, targetZ, config, deltaTime);
}
#else
extern inline function updateSpring3d(spring3d:Spring3D, targetX:Float, targetY:Float, targetZ:Float, config:SpringConfig, deltaTime:Float):Void {
#if hl
	flight._hl._fn.Spring.updateSpring3d(spring3d, targetX, targetY, targetZ, config, deltaTime);
#elseif cpp
	flight._cpp._fn.Spring.updateSpring3d(spring3d, targetX, targetY, targetZ, config, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.Spring.updateSpring3d(spring3d, targetX, targetY, targetZ, config, deltaTime);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpringConfig(frequency:Float, dampingRatio:Float):SpringConfig {
	return flight._js._fn.Spring.createSpringConfig(frequency, dampingRatio);
}
#else
extern inline function createSpringConfig(frequency:Float, dampingRatio:Float):SpringConfig {
#if hl
	return flight._hl._fn.Spring.createSpringConfig(frequency, dampingRatio);
#elseif cpp
	return flight._cpp._fn.Spring.createSpringConfig(frequency, dampingRatio);
#elseif (js && flight_esm)
	return flight._js._fn.Spring.createSpringConfig(frequency, dampingRatio);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function createSpringConfigFromPhysical(stiffness:Float, damping:Float, mass:Float):SpringConfig {
	return flight._js._fn.Spring.createSpringConfigFromPhysical(stiffness, damping, mass);
}
#else
extern inline function createSpringConfigFromPhysical(stiffness:Float, damping:Float, mass:Float):SpringConfig {
#if hl
	return flight._hl._fn.Spring.createSpringConfigFromPhysical(stiffness, damping, mass);
#elseif cpp
	return flight._cpp._fn.Spring.createSpringConfigFromPhysical(stiffness, damping, mass);
#elseif (js && flight_esm)
	return flight._js._fn.Spring.createSpringConfigFromPhysical(stiffness, damping, mass);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSpring(ptr:Spring):Void {
	flight._js._fn.Spring.freeSpring(ptr);
}
#else
extern inline function freeSpring(ptr:Spring):Void {
#if hl
	flight._hl._fn.Spring.freeSpring(ptr);
#elseif cpp
	flight._cpp._fn.Spring.freeSpring(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Spring.freeSpring(ptr);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSpring2D(ptr:Spring2D):Void {
	flight._js._fn.Spring.freeSpring2D(ptr);
}
#else
extern inline function freeSpring2D(ptr:Spring2D):Void {
#if hl
	flight._hl._fn.Spring.freeSpring2D(ptr);
#elseif cpp
	flight._cpp._fn.Spring.freeSpring2D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Spring.freeSpring2D(ptr);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSpring3D(ptr:Spring3D):Void {
	flight._js._fn.Spring.freeSpring3D(ptr);
}
#else
extern inline function freeSpring3D(ptr:Spring3D):Void {
#if hl
	flight._hl._fn.Spring.freeSpring3D(ptr);
#elseif cpp
	flight._cpp._fn.Spring.freeSpring3D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Spring.freeSpring3D(ptr);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeSpringConfig(ptr:SpringConfig):Void {
	flight._js._fn.Spring.freeSpringConfig(ptr);
}
#else
extern inline function freeSpringConfig(ptr:SpringConfig):Void {
#if hl
	flight._hl._fn.Spring.freeSpringConfig(ptr);
#elseif cpp
	flight._cpp._fn.Spring.freeSpringConfig(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Spring.freeSpringConfig(ptr);
#else
	#error "flight.Spring: no backend for this target."
#end
}
#end
