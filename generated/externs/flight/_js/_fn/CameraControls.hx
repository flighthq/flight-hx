package flight._js._fn;

@:jsRequire("@flighthq/camera-controls")
extern class CameraControls {
	@:native("createCameraShake")
	public static function createCameraShake():flight._js.CameraShake;
	@:native("createCameraShakeOffset")
	public static function createCameraShakeOffset():flight._js.CameraShakeOffset;
	@:native("addCameraShakeTrauma")
	public static function addCameraShakeTrauma(shake:flight._js.CameraShake, amount:Float):Void;
	@:native("resetCameraShake")
	public static function resetCameraShake(shake:flight._js.CameraShake):Void;
	@:native("updateCameraShake")
	public static function updateCameraShake(shake:flight._js.CameraShake, dt:Float, out:flight._js.CameraShakeOffset):Void;
	@:native("createFlyCameraController")
	public static function createFlyCameraController(options:Null<flight._js.FlyCameraControllerOptions>):flight._js.FlyCameraController;
	@:native("cloneFlyCameraController")
	public static function cloneFlyCameraController(source:flight._js.FlyCameraController):flight._js.FlyCameraController;
	@:native("copyFlyCameraController")
	public static function copyFlyCameraController(out:flight._js.FlyCameraController, source:flight._js.FlyCameraController):Void;
	@:native("lookFlyCameraController")
	public static function lookFlyCameraController(controller:flight._js.FlyCameraController, deltaYaw:Float, deltaPitch:Float):Void;
	@:native("moveFlyCameraController")
	public static function moveFlyCameraController(controller:flight._js.FlyCameraController, forward:Float, right:Float, up:Float):Void;
	@:native("resetFlyCameraController")
	public static function resetFlyCameraController(controller:flight._js.FlyCameraController, options:Null<flight._js.FlyCameraControllerOptions>):Void;
	@:native("snapFlyCameraController")
	public static function snapFlyCameraController(controller:flight._js.FlyCameraController):Void;
	@:native("updateFlyCameraController")
	public static function updateFlyCameraController(controller:flight._js.FlyCameraController, camera:flight._js.Camera3D, deltaTime:Float):Void;
	@:native("updateCamera2DFollow")
	public static function updateCamera2dFollow(guardState:Dynamic, camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float, targetX:Float, targetY:Float, deltaTime:Float, options:Null<flight._js.Camera2DFollowOptions>):Void;
	@:native("frameOrbitCameraControllerToSphere")
	public static function frameOrbitCameraControllerToSphere(controller:flight._js.OrbitCameraController, projection:flight._js.Projection, sphere:flight._js.BoundingSphere, aspect:Float, padding:Null<Float>):Bool;
	@:native("getPerspectiveProjectionFrameDistanceToSphere")
	public static function getPerspectiveProjectionFrameDistanceToSphere(projection:flight._js.PerspectiveProjection, radius:Float, aspect:Float, padding:Null<Float>):Float;
	@:native("setOrthographicProjectionFrameToSphere")
	public static function setOrthographicProjectionFrameToSphere(projection:flight._js.OrthographicProjection, radius:Float, aspect:Float, padding:Null<Float>):Void;
	@:native("createOrbitCameraController")
	public static function createOrbitCameraController(options:Null<flight._js.OrbitCameraControllerOptions>):flight._js.OrbitCameraController;
	@:native("cloneOrbitCameraController")
	public static function cloneOrbitCameraController(source:flight._js.OrbitCameraController):flight._js.OrbitCameraController;
	@:native("copyOrbitCameraController")
	public static function copyOrbitCameraController(out:flight._js.OrbitCameraController, source:flight._js.OrbitCameraController):Void;
	@:native("dollyOrbitCameraController")
	public static function dollyOrbitCameraController(controller:flight._js.OrbitCameraController, deltaDistance:Float):Void;
	@:native("panOrbitCameraController")
	public static function panOrbitCameraController(controller:flight._js.OrbitCameraController, deltaRight:Float, deltaUp:Float):Void;
	@:native("panOrbitCameraControllerInViewPlane")
	public static function panOrbitCameraControllerInViewPlane(controller:flight._js.OrbitCameraController, deltaRight:Float, deltaUp:Float):Void;
	@:native("resetOrbitCameraController")
	public static function resetOrbitCameraController(controller:flight._js.OrbitCameraController, options:Null<flight._js.OrbitCameraControllerOptions>):Void;
	@:native("rotateOrbitCameraController")
	public static function rotateOrbitCameraController(controller:flight._js.OrbitCameraController, deltaAzimuth:Float, deltaPolar:Float):Void;
	@:native("snapOrbitCameraController")
	public static function snapOrbitCameraController(controller:flight._js.OrbitCameraController):Void;
	@:native("updateOrbitCameraController")
	public static function updateOrbitCameraController(controller:flight._js.OrbitCameraController, camera:flight._js.Camera3D, deltaTime:Float):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCameraShake(ptr:flight._js.CameraShake):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCameraShakeOffset(ptr:flight._js.CameraShakeOffset):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeFlyCameraController(ptr:flight._js.FlyCameraController):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeOrbitCameraController(ptr:flight._js.OrbitCameraController):Void {}
}
