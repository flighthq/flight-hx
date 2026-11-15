package flight;

inline function createCameraShake():CameraShake {
#if hl
	return flight._hl._fn.CameraControls.createCameraShake();
#elseif cpp
	return flight._cpp._fn.CameraControls.createCameraShake();
#elseif (js && flight_esm)
	return flight._js._fn.CameraControls.createCameraShake();
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function createCameraShakeOffset():CameraShakeOffset {
#if hl
	return flight._hl._fn.CameraControls.createCameraShakeOffset();
#elseif cpp
	return flight._cpp._fn.CameraControls.createCameraShakeOffset();
#elseif (js && flight_esm)
	return flight._js._fn.CameraControls.createCameraShakeOffset();
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function addCameraShakeTrauma(shake:CameraShake, amount:Float):Void {
#if hl
	flight._hl._fn.CameraControls.addCameraShakeTrauma(shake, amount);
#elseif cpp
	flight._cpp._fn.CameraControls.addCameraShakeTrauma(shake, amount);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.addCameraShakeTrauma(shake, amount);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function resetCameraShake(shake:CameraShake):Void {
#if hl
	flight._hl._fn.CameraControls.resetCameraShake(shake);
#elseif cpp
	flight._cpp._fn.CameraControls.resetCameraShake(shake);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.resetCameraShake(shake);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function updateCameraShake(shake:CameraShake, dt:Float, out:CameraShakeOffset):Void {
#if hl
	flight._hl._fn.CameraControls.updateCameraShake(shake, dt, out);
#elseif cpp
	flight._cpp._fn.CameraControls.updateCameraShake(shake, dt, out);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.updateCameraShake(shake, dt, out);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function createFlyCameraController(options:FlyCameraControllerOptions):FlyCameraController {
#if hl
	return flight._hl._fn.CameraControls.createFlyCameraController(options);
#elseif cpp
	return flight._cpp._fn.CameraControls.createFlyCameraController(options);
#elseif (js && flight_esm)
	return flight._js._fn.CameraControls.createFlyCameraController(options);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function cloneFlyCameraController(source:FlyCameraController):FlyCameraController {
#if hl
	return flight._hl._fn.CameraControls.cloneFlyCameraController(source);
#elseif cpp
	return flight._cpp._fn.CameraControls.cloneFlyCameraController(source);
#elseif (js && flight_esm)
	return flight._js._fn.CameraControls.cloneFlyCameraController(source);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function copyFlyCameraController(out:FlyCameraController, source:FlyCameraController):Void {
#if hl
	flight._hl._fn.CameraControls.copyFlyCameraController(out, source);
#elseif cpp
	flight._cpp._fn.CameraControls.copyFlyCameraController(out, source);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.copyFlyCameraController(out, source);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function lookFlyCameraController(controller:FlyCameraController, deltaYaw:Float, deltaPitch:Float):Void {
#if hl
	flight._hl._fn.CameraControls.lookFlyCameraController(controller, deltaYaw, deltaPitch);
#elseif cpp
	flight._cpp._fn.CameraControls.lookFlyCameraController(controller, deltaYaw, deltaPitch);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.lookFlyCameraController(controller, deltaYaw, deltaPitch);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function moveFlyCameraController(controller:FlyCameraController, forward:Float, right:Float, up:Float):Void {
#if hl
	flight._hl._fn.CameraControls.moveFlyCameraController(controller, forward, right, up);
#elseif cpp
	flight._cpp._fn.CameraControls.moveFlyCameraController(controller, forward, right, up);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.moveFlyCameraController(controller, forward, right, up);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function resetFlyCameraController(controller:FlyCameraController, options:FlyCameraControllerOptions):Void {
#if hl
	flight._hl._fn.CameraControls.resetFlyCameraController(controller, options);
#elseif cpp
	flight._cpp._fn.CameraControls.resetFlyCameraController(controller, options);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.resetFlyCameraController(controller, options);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function snapFlyCameraController(controller:FlyCameraController):Void {
#if hl
	flight._hl._fn.CameraControls.snapFlyCameraController(controller);
#elseif cpp
	flight._cpp._fn.CameraControls.snapFlyCameraController(controller);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.snapFlyCameraController(controller);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function updateFlyCameraController(controller:FlyCameraController, camera:Camera3D, deltaTime:Float):Void {
#if hl
	flight._hl._fn.CameraControls.updateFlyCameraController(controller, camera, deltaTime);
#elseif cpp
	flight._cpp._fn.CameraControls.updateFlyCameraController(controller, camera, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.updateFlyCameraController(controller, camera, deltaTime);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function updateCamera2dFollow(guardState:Dynamic, camera:Camera2D, viewportWidth:Float, viewportHeight:Float, targetX:Float, targetY:Float, deltaTime:Float, options:Camera2DFollowOptions):Void {
#if hl
	flight._hl._fn.CameraControls.updateCamera2dFollow(guardState, camera, viewportWidth, viewportHeight, targetX, targetY, deltaTime, options);
#elseif cpp
	flight._cpp._fn.CameraControls.updateCamera2dFollow(guardState, camera, viewportWidth, viewportHeight, targetX, targetY, deltaTime, options);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.updateCamera2dFollow(guardState, camera, viewportWidth, viewportHeight, targetX, targetY, deltaTime, options);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function frameOrbitCameraControllerToSphere(controller:OrbitCameraController, projection:Projection, sphere:BoundingSphere, aspect:Float, padding:Float):Bool {
#if hl
	return flight._hl._fn.CameraControls.frameOrbitCameraControllerToSphere(controller, projection, sphere, aspect, padding);
#elseif cpp
	return flight._cpp._fn.CameraControls.frameOrbitCameraControllerToSphere(controller, projection, sphere, aspect, padding);
#elseif (js && flight_esm)
	return flight._js._fn.CameraControls.frameOrbitCameraControllerToSphere(controller, projection, sphere, aspect, padding);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function getPerspectiveProjectionFrameDistanceToSphere(projection:PerspectiveProjection, radius:Float, aspect:Float, padding:Float):Float {
#if hl
	return flight._hl._fn.CameraControls.getPerspectiveProjectionFrameDistanceToSphere(projection, radius, aspect, padding);
#elseif cpp
	return flight._cpp._fn.CameraControls.getPerspectiveProjectionFrameDistanceToSphere(projection, radius, aspect, padding);
#elseif (js && flight_esm)
	return flight._js._fn.CameraControls.getPerspectiveProjectionFrameDistanceToSphere(projection, radius, aspect, padding);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function setOrthographicProjectionFrameToSphere(projection:OrthographicProjection, radius:Float, aspect:Float, padding:Float):Void {
#if hl
	flight._hl._fn.CameraControls.setOrthographicProjectionFrameToSphere(projection, radius, aspect, padding);
#elseif cpp
	flight._cpp._fn.CameraControls.setOrthographicProjectionFrameToSphere(projection, radius, aspect, padding);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.setOrthographicProjectionFrameToSphere(projection, radius, aspect, padding);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function createOrbitCameraController(options:OrbitCameraControllerOptions):OrbitCameraController {
#if hl
	return flight._hl._fn.CameraControls.createOrbitCameraController(options);
#elseif cpp
	return flight._cpp._fn.CameraControls.createOrbitCameraController(options);
#elseif (js && flight_esm)
	return flight._js._fn.CameraControls.createOrbitCameraController(options);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function cloneOrbitCameraController(source:OrbitCameraController):OrbitCameraController {
#if hl
	return flight._hl._fn.CameraControls.cloneOrbitCameraController(source);
#elseif cpp
	return flight._cpp._fn.CameraControls.cloneOrbitCameraController(source);
#elseif (js && flight_esm)
	return flight._js._fn.CameraControls.cloneOrbitCameraController(source);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function copyOrbitCameraController(out:OrbitCameraController, source:OrbitCameraController):Void {
#if hl
	flight._hl._fn.CameraControls.copyOrbitCameraController(out, source);
#elseif cpp
	flight._cpp._fn.CameraControls.copyOrbitCameraController(out, source);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.copyOrbitCameraController(out, source);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function dollyOrbitCameraController(controller:OrbitCameraController, deltaDistance:Float):Void {
#if hl
	flight._hl._fn.CameraControls.dollyOrbitCameraController(controller, deltaDistance);
#elseif cpp
	flight._cpp._fn.CameraControls.dollyOrbitCameraController(controller, deltaDistance);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.dollyOrbitCameraController(controller, deltaDistance);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function panOrbitCameraController(controller:OrbitCameraController, deltaRight:Float, deltaUp:Float):Void {
#if hl
	flight._hl._fn.CameraControls.panOrbitCameraController(controller, deltaRight, deltaUp);
#elseif cpp
	flight._cpp._fn.CameraControls.panOrbitCameraController(controller, deltaRight, deltaUp);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.panOrbitCameraController(controller, deltaRight, deltaUp);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function panOrbitCameraControllerInViewPlane(controller:OrbitCameraController, deltaRight:Float, deltaUp:Float):Void {
#if hl
	flight._hl._fn.CameraControls.panOrbitCameraControllerInViewPlane(controller, deltaRight, deltaUp);
#elseif cpp
	flight._cpp._fn.CameraControls.panOrbitCameraControllerInViewPlane(controller, deltaRight, deltaUp);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.panOrbitCameraControllerInViewPlane(controller, deltaRight, deltaUp);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function resetOrbitCameraController(controller:OrbitCameraController, options:OrbitCameraControllerOptions):Void {
#if hl
	flight._hl._fn.CameraControls.resetOrbitCameraController(controller, options);
#elseif cpp
	flight._cpp._fn.CameraControls.resetOrbitCameraController(controller, options);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.resetOrbitCameraController(controller, options);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function rotateOrbitCameraController(controller:OrbitCameraController, deltaAzimuth:Float, deltaPolar:Float):Void {
#if hl
	flight._hl._fn.CameraControls.rotateOrbitCameraController(controller, deltaAzimuth, deltaPolar);
#elseif cpp
	flight._cpp._fn.CameraControls.rotateOrbitCameraController(controller, deltaAzimuth, deltaPolar);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.rotateOrbitCameraController(controller, deltaAzimuth, deltaPolar);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function snapOrbitCameraController(controller:OrbitCameraController):Void {
#if hl
	flight._hl._fn.CameraControls.snapOrbitCameraController(controller);
#elseif cpp
	flight._cpp._fn.CameraControls.snapOrbitCameraController(controller);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.snapOrbitCameraController(controller);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function updateOrbitCameraController(controller:OrbitCameraController, camera:Camera3D, deltaTime:Float):Void {
#if hl
	flight._hl._fn.CameraControls.updateOrbitCameraController(controller, camera, deltaTime);
#elseif cpp
	flight._cpp._fn.CameraControls.updateOrbitCameraController(controller, camera, deltaTime);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.updateOrbitCameraController(controller, camera, deltaTime);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function freeCameraShake(ptr:CameraShake):Void {
#if hl
	flight._hl._fn.CameraControls.freeCameraShake(ptr);
#elseif cpp
	flight._cpp._fn.CameraControls.freeCameraShake(ptr);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.freeCameraShake(ptr);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function freeCameraShakeOffset(ptr:CameraShakeOffset):Void {
#if hl
	flight._hl._fn.CameraControls.freeCameraShakeOffset(ptr);
#elseif cpp
	flight._cpp._fn.CameraControls.freeCameraShakeOffset(ptr);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.freeCameraShakeOffset(ptr);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function freeFlyCameraController(ptr:FlyCameraController):Void {
#if hl
	flight._hl._fn.CameraControls.freeFlyCameraController(ptr);
#elseif cpp
	flight._cpp._fn.CameraControls.freeFlyCameraController(ptr);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.freeFlyCameraController(ptr);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
inline function freeOrbitCameraController(ptr:OrbitCameraController):Void {
#if hl
	flight._hl._fn.CameraControls.freeOrbitCameraController(ptr);
#elseif cpp
	flight._cpp._fn.CameraControls.freeOrbitCameraController(ptr);
#elseif (js && flight_esm)
	flight._js._fn.CameraControls.freeOrbitCameraController(ptr);
#else
	#error "flight.CameraControls: no backend for this target."
#end
}
