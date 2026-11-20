package flight.esm.camera_controls;

#if (js && flight_esm)
@:jsRequire("@flighthq/camera-controls/contract")
extern class Contract {
  public static function addCameraShakeTrauma(shake:flight.esm.types.camera_controls.Types.CameraShake, amount:Float):Void;
  public static function cloneFlyCameraController(source:flight.esm.types.camera_controls.Types.FlyCameraController):flight.esm.types.camera_controls.Types.FlyCameraController;
  public static function cloneOrbitCameraController(source:flight.esm.types.camera_controls.Types.OrbitCameraController):flight.esm.types.camera_controls.Types.OrbitCameraController;
  public static function copyFlyCameraController(out:flight.esm.types.camera_controls.Types.FlyCameraController, source:flight.esm.types.camera_controls.Types.FlyCameraController):Void;
  public static function copyOrbitCameraController(out:flight.esm.types.camera_controls.Types.OrbitCameraController, source:flight.esm.types.camera_controls.Types.OrbitCameraController):Void;
  public static function createCameraShake(?options:Null<flight.esm.types.camera_controls.Types.CameraShakeOptions>):flight.esm.types.camera_controls.Types.CameraShake;
  public static function createCameraShakeOffset():flight.esm.types.camera_controls.Types.CameraShakeOffset;
  public static function createFlyCameraController(?options:Null<flight.esm.types.camera_controls.Types.FlyCameraControllerOptions>):flight.esm.types.camera_controls.Types.FlyCameraController;
  public static function createOrbitCameraController(?options:Null<flight.esm.types.camera_controls.Types.OrbitCameraControllerOptions>):flight.esm.types.camera_controls.Types.OrbitCameraController;
  public static function dollyOrbitCameraController(controller:flight.esm.types.camera_controls.Types.OrbitCameraController, deltaDistance:Float):Void;
  public static function frameOrbitCameraControllerToSphere(controller:flight.esm.types.camera_controls.Types.OrbitCameraController, projection:flight.esm.types.camera.Types.Projection, sphere:flight.esm.types.geometry.Types.BoundingSphereLike, aspect:Float, ?padding:Float):Bool;
  public static function getPerspectiveProjectionFrameDistanceToSphere(projection:flight.esm.types.camera.Types.PerspectiveProjection, radius:Float, aspect:Float, ?padding:Float):Float;
  public static function initializeCameraShake(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.camera_controls.Types.CameraShake>, ?options:Null<flight.esm.types.camera_controls.Types.CameraShakeOptions>):Void;
  public static function initializeCameraShakeOffset(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.camera_controls.Types.CameraShakeOffset>):Void;
  public static function initializeFlyCameraController(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.camera_controls.Types.FlyCameraController>, ?options:Null<flight.esm.types.camera_controls.Types.FlyCameraControllerOptions>):Void;
  public static function initializeOrbitCameraController(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.camera_controls.Types.OrbitCameraController>, ?options:Null<flight.esm.types.camera_controls.Types.OrbitCameraControllerOptions>):Void;
  public static function lookFlyCameraController(controller:flight.esm.types.camera_controls.Types.FlyCameraController, deltaYaw:Float, deltaPitch:Float):Void;
  public static function moveFlyCameraController(controller:flight.esm.types.camera_controls.Types.FlyCameraController, forward:Float, right:Float, up:Float):Void;
  public static function panOrbitCameraController(controller:flight.esm.types.camera_controls.Types.OrbitCameraController, deltaRight:Float, deltaUp:Float):Void;
  public static function panOrbitCameraControllerInViewPlane(controller:flight.esm.types.camera_controls.Types.OrbitCameraController, deltaRight:Float, deltaUp:Float):Void;
  public static function resetCameraShake(shake:flight.esm.types.camera_controls.Types.CameraShake):Void;
  public static function resetFlyCameraController(controller:flight.esm.types.camera_controls.Types.FlyCameraController, ?options:Null<flight.esm.types.camera_controls.Types.FlyCameraControllerOptions>):Void;
  public static function resetOrbitCameraController(controller:flight.esm.types.camera_controls.Types.OrbitCameraController, ?options:Null<flight.esm.types.camera_controls.Types.OrbitCameraControllerOptions>):Void;
  public static function rotateOrbitCameraController(controller:flight.esm.types.camera_controls.Types.OrbitCameraController, deltaAzimuth:Float, deltaPolar:Float):Void;
  public static function setOrthographicProjectionFrameToSphere(projection:flight.esm.types.camera.Types.OrthographicProjection, radius:Float, aspect:Float, ?padding:Float):Void;
  public static function snapFlyCameraController(controller:flight.esm.types.camera_controls.Types.FlyCameraController):Void;
  public static function snapOrbitCameraController(controller:flight.esm.types.camera_controls.Types.OrbitCameraController):Void;
  public static function updateCamera2DFollow(camera:flight.esm.types.camera.Types.Camera2D, viewportWidth:Float, viewportHeight:Float, targetX:Float, targetY:Float, deltaTime:Float, ?options:Null<flight.esm.types.camera.Types.Camera2DFollowOptions>):Void;
  public static function updateCameraShake(shake:flight.esm.types.camera_controls.Types.CameraShake, dt:Float, out:flight.esm.types.camera_controls.Types.CameraShakeOffset):Void;
  public static function updateFlyCameraController(controller:flight.esm.types.camera_controls.Types.FlyCameraController, camera:flight.esm.types.camera.Types.Camera3D, deltaTime:Float):Void;
  public static function updateOrbitCameraController(controller:flight.esm.types.camera_controls.Types.OrbitCameraController, camera:flight.esm.types.camera.Types.Camera3D, deltaTime:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
