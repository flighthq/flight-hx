package flight._js._fn;

@:jsRequire("flight")
extern class CameraControls {
	@:native("flight_create_camera_shake")
	public static function createCameraShake():flight._js.CameraShake;
	@:native("flight_create_camera_shake_offset")
	public static function createCameraShakeOffset():flight._js.CameraShakeOffset;
	@:native("flight_add_camera_shake_trauma")
	public static function addCameraShakeTrauma(shake:flight._js.CameraShake, amount:Float):Void;
	@:native("flight_reset_camera_shake")
	public static function resetCameraShake(shake:flight._js.CameraShake):Void;
	@:native("flight_update_camera_shake")
	public static function updateCameraShake(shake:flight._js.CameraShake, dt:Float, out:flight._js.CameraShakeOffset):Void;
	@:native("flight_create_fly_camera_controller")
	public static function createFlyCameraController(options:flight._js.FlyCameraControllerOptions):flight._js.FlyCameraController;
	@:native("flight_clone_fly_camera_controller")
	public static function cloneFlyCameraController(source:flight._js.FlyCameraController):flight._js.FlyCameraController;
	@:native("flight_copy_fly_camera_controller")
	public static function copyFlyCameraController(out:flight._js.FlyCameraController, source:flight._js.FlyCameraController):Void;
	@:native("flight_look_fly_camera_controller")
	public static function lookFlyCameraController(controller:flight._js.FlyCameraController, deltaYaw:Float, deltaPitch:Float):Void;
	@:native("flight_move_fly_camera_controller")
	public static function moveFlyCameraController(controller:flight._js.FlyCameraController, forward:Float, right:Float, up:Float):Void;
	@:native("flight_reset_fly_camera_controller")
	public static function resetFlyCameraController(controller:flight._js.FlyCameraController, options:flight._js.FlyCameraControllerOptions):Void;
	@:native("flight_snap_fly_camera_controller")
	public static function snapFlyCameraController(controller:flight._js.FlyCameraController):Void;
	@:native("flight_update_fly_camera_controller")
	public static function updateFlyCameraController(controller:flight._js.FlyCameraController, camera:flight._js.Camera3D, deltaTime:Float):Void;
	@:native("flight_update_camera_2d_follow")
	public static function updateCamera2dFollow(guardState:Dynamic, camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float, targetX:Float, targetY:Float, deltaTime:Float, options:flight._js.Camera2DFollowOptions):Void;
	@:native("flight_frame_orbit_camera_controller_to_sphere")
	public static function frameOrbitCameraControllerToSphere(controller:flight._js.OrbitCameraController, projection:flight._js.Projection, sphere:flight._js.BoundingSphere, aspect:Float, padding:Float):Bool;
	@:native("flight_get_perspective_projection_frame_distance_to_sphere")
	public static function getPerspectiveProjectionFrameDistanceToSphere(projection:flight._js.PerspectiveProjection, radius:Float, aspect:Float, padding:Float):Float;
	@:native("flight_set_orthographic_projection_frame_to_sphere")
	public static function setOrthographicProjectionFrameToSphere(projection:flight._js.OrthographicProjection, radius:Float, aspect:Float, padding:Float):Void;
	@:native("flight_create_orbit_camera_controller")
	public static function createOrbitCameraController(options:flight._js.OrbitCameraControllerOptions):flight._js.OrbitCameraController;
	@:native("flight_clone_orbit_camera_controller")
	public static function cloneOrbitCameraController(source:flight._js.OrbitCameraController):flight._js.OrbitCameraController;
	@:native("flight_copy_orbit_camera_controller")
	public static function copyOrbitCameraController(out:flight._js.OrbitCameraController, source:flight._js.OrbitCameraController):Void;
	@:native("flight_dolly_orbit_camera_controller")
	public static function dollyOrbitCameraController(controller:flight._js.OrbitCameraController, deltaDistance:Float):Void;
	@:native("flight_pan_orbit_camera_controller")
	public static function panOrbitCameraController(controller:flight._js.OrbitCameraController, deltaRight:Float, deltaUp:Float):Void;
	@:native("flight_pan_orbit_camera_controller_in_view_plane")
	public static function panOrbitCameraControllerInViewPlane(controller:flight._js.OrbitCameraController, deltaRight:Float, deltaUp:Float):Void;
	@:native("flight_reset_orbit_camera_controller")
	public static function resetOrbitCameraController(controller:flight._js.OrbitCameraController, options:flight._js.OrbitCameraControllerOptions):Void;
	@:native("flight_rotate_orbit_camera_controller")
	public static function rotateOrbitCameraController(controller:flight._js.OrbitCameraController, deltaAzimuth:Float, deltaPolar:Float):Void;
	@:native("flight_snap_orbit_camera_controller")
	public static function snapOrbitCameraController(controller:flight._js.OrbitCameraController):Void;
	@:native("flight_update_orbit_camera_controller")
	public static function updateOrbitCameraController(controller:flight._js.OrbitCameraController, camera:flight._js.Camera3D, deltaTime:Float):Void;
	@:native("flight_free_camera_shake")
	public static function freeCameraShake(ptr:flight._js.CameraShake):Void;
	@:native("flight_free_camera_shake_offset")
	public static function freeCameraShakeOffset(ptr:flight._js.CameraShakeOffset):Void;
	@:native("flight_free_fly_camera_controller")
	public static function freeFlyCameraController(ptr:flight._js.FlyCameraController):Void;
	@:native("flight_free_orbit_camera_controller")
	public static function freeOrbitCameraController(ptr:flight._js.OrbitCameraController):Void;
}
