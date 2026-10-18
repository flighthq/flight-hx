// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function addCameraShakeTrauma(shake:flight.CameraShake, amount:Float):Void {
  flight._cpp._attempt.Attempt_CameraControls_addCameraShakeTrauma.addCameraShakeTrauma(shake, amount);
}

extern inline function cloneFlyCameraController(source:flight.FlyCameraController):flight.FlyCameraController {
  return flight._cpp._attempt.Attempt_CameraControls_cloneFlyCameraController.cloneFlyCameraController(source);
}

extern inline function cloneOrbitCameraController(source:flight.OrbitCameraController):flight.OrbitCameraController {
  return flight._cpp._attempt.Attempt_CameraControls_cloneOrbitCameraController.cloneOrbitCameraController(source);
}

extern inline function copyFlyCameraController(out:flight.FlyCameraController, source:flight.FlyCameraController):Void {
  flight._cpp._attempt.Attempt_CameraControls_copyFlyCameraController.copyFlyCameraController(out, source);
}

extern inline function copyOrbitCameraController(out:flight.OrbitCameraController, source:flight.OrbitCameraController):Void {
  flight._cpp._attempt.Attempt_CameraControls_copyOrbitCameraController.copyOrbitCameraController(out, source);
}

extern inline function createCameraShake(?options:flight.CameraShakeOptions):flight.CameraShake {
  return flight._cpp._attempt.Attempt_CameraControls_createCameraShake.createCameraShake(options);
}

extern inline function createCameraShakeOffset():flight.CameraShakeOffset {
  return flight._cpp._attempt.Attempt_CameraControls_createCameraShakeOffset.createCameraShakeOffset();
}

extern inline function createFlyCameraController(?options:flight.FlyCameraControllerOptions):flight.FlyCameraController {
  return flight._cpp._attempt.Attempt_CameraControls_createFlyCameraController.createFlyCameraController(options);
}

extern inline function createOrbitCameraController(?options:flight.OrbitCameraControllerOptions):flight.OrbitCameraController {
  return flight._cpp._attempt.Attempt_CameraControls_createOrbitCameraController.createOrbitCameraController(options);
}

extern inline function dollyOrbitCameraController(controller:flight.OrbitCameraController, deltaDistance:Float):Void {
  flight._cpp._attempt.Attempt_CameraControls_dollyOrbitCameraController.dollyOrbitCameraController(controller, deltaDistance);
}

extern inline function frameOrbitCameraControllerToSphere(controller:flight.OrbitCameraController, projection:flight.Projection, sphere:flight.BoundingSphereLike, aspect:Float, ?padding:Float):Bool {
  return flight._cpp._attempt.Attempt_CameraControls_frameOrbitCameraControllerToSphere.frameOrbitCameraControllerToSphere(controller, projection, sphere, aspect, padding);
}

extern inline function getPerspectiveProjectionFrameDistanceToSphere(projection:flight.PerspectiveProjection, radius:Float, aspect:Float, ?padding:Float):Float {
  return flight._cpp._attempt.Attempt_CameraControls_getPerspectiveProjectionFrameDistanceToSphere.getPerspectiveProjectionFrameDistanceToSphere(projection, radius, aspect, padding);
}

extern inline function initializeCameraShake(out:flight.EntityConstruction<flight.CameraShake>, ?options:flight.CameraShakeOptions):Void {
  flight._cpp._attempt.Attempt_CameraControls_initializeCameraShake.initializeCameraShake(out, options);
}

extern inline function initializeCameraShakeOffset(out:flight.EntityConstruction<flight.CameraShakeOffset>):Void {
  flight._cpp._attempt.Attempt_CameraControls_initializeCameraShakeOffset.initializeCameraShakeOffset(out);
}

extern inline function initializeFlyCameraController(out:flight.EntityConstruction<flight.FlyCameraController>, ?options:flight.FlyCameraControllerOptions):Void {
  flight._cpp._attempt.Attempt_CameraControls_initializeFlyCameraController.initializeFlyCameraController(out, options);
}

extern inline function initializeOrbitCameraController(out:flight.EntityConstruction<flight.OrbitCameraController>, ?options:flight.OrbitCameraControllerOptions):Void {
  flight._cpp._attempt.Attempt_CameraControls_initializeOrbitCameraController.initializeOrbitCameraController(out, options);
}

extern inline function lookFlyCameraController(controller:flight.FlyCameraController, deltaYaw:Float, deltaPitch:Float):Void {
  flight._cpp._attempt.Attempt_CameraControls_lookFlyCameraController.lookFlyCameraController(controller, deltaYaw, deltaPitch);
}

extern inline function moveFlyCameraController(controller:flight.FlyCameraController, forward:Float, right:Float, up:Float):Void {
  flight._cpp._attempt.Attempt_CameraControls_moveFlyCameraController.moveFlyCameraController(controller, forward, right, up);
}

extern inline function panOrbitCameraController(controller:flight.OrbitCameraController, deltaRight:Float, deltaUp:Float):Void {
  flight._cpp._attempt.Attempt_CameraControls_panOrbitCameraController.panOrbitCameraController(controller, deltaRight, deltaUp);
}

extern inline function panOrbitCameraControllerInViewPlane(controller:flight.OrbitCameraController, deltaRight:Float, deltaUp:Float):Void {
  flight._cpp._attempt.Attempt_CameraControls_panOrbitCameraControllerInViewPlane.panOrbitCameraControllerInViewPlane(controller, deltaRight, deltaUp);
}

extern inline function resetCameraShake(shake:flight.CameraShake):Void {
  flight._cpp._attempt.Attempt_CameraControls_resetCameraShake.resetCameraShake(shake);
}

extern inline function resetFlyCameraController(controller:flight.FlyCameraController, ?options:flight.FlyCameraControllerOptions):Void {
  flight._cpp._attempt.Attempt_CameraControls_resetFlyCameraController.resetFlyCameraController(controller, options);
}

extern inline function resetOrbitCameraController(controller:flight.OrbitCameraController, ?options:flight.OrbitCameraControllerOptions):Void {
  flight._cpp._attempt.Attempt_CameraControls_resetOrbitCameraController.resetOrbitCameraController(controller, options);
}

extern inline function rotateOrbitCameraController(controller:flight.OrbitCameraController, deltaAzimuth:Float, deltaPolar:Float):Void {
  flight._cpp._attempt.Attempt_CameraControls_rotateOrbitCameraController.rotateOrbitCameraController(controller, deltaAzimuth, deltaPolar);
}

extern inline function setOrthographicProjectionFrameToSphere(projection:flight.OrthographicProjection, radius:Float, aspect:Float, ?padding:Float):Void {
  flight._cpp._attempt.Attempt_CameraControls_setOrthographicProjectionFrameToSphere.setOrthographicProjectionFrameToSphere(projection, radius, aspect, padding);
}

extern inline function snapFlyCameraController(controller:flight.FlyCameraController):Void {
  flight._cpp._attempt.Attempt_CameraControls_snapFlyCameraController.snapFlyCameraController(controller);
}

extern inline function snapOrbitCameraController(controller:flight.OrbitCameraController):Void {
  flight._cpp._attempt.Attempt_CameraControls_snapOrbitCameraController.snapOrbitCameraController(controller);
}

extern inline function updateCamera2DFollow(camera:flight.Camera2D, viewportWidth:Float, viewportHeight:Float, targetX:Float, targetY:Float, deltaTime:Float, ?options:flight.Camera2DFollowOptions):Void {
  flight._cpp._attempt.Attempt_CameraControls_updateCamera2DFollow.updateCamera2DFollow(camera, viewportWidth, viewportHeight, targetX, targetY, deltaTime, options);
}

extern inline function updateCameraShake(shake:flight.CameraShake, dt:Float, out:flight.CameraShakeOffset):Void {
  flight._cpp._attempt.Attempt_CameraControls_updateCameraShake.updateCameraShake(shake, dt, out);
}

extern inline function updateFlyCameraController(controller:flight.FlyCameraController, camera:flight.Camera3D, deltaTime:Float):Void {
  flight._cpp._attempt.Attempt_CameraControls_updateFlyCameraController.updateFlyCameraController(controller, camera, deltaTime);
}

extern inline function updateOrbitCameraController(controller:flight.OrbitCameraController, camera:flight.Camera3D, deltaTime:Float):Void {
  flight._cpp._attempt.Attempt_CameraControls_updateOrbitCameraController.updateOrbitCameraController(controller, camera, deltaTime);
}
