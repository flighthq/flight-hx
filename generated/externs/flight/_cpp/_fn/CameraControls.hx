package flight._cpp._fn;

extern class CameraControls {
	@:native("flight_create_camera_shake")
	public static function createCameraShake():flight._cpp.CameraShake;
	@:native("flight_create_camera_shake_offset")
	public static function createCameraShakeOffset():flight._cpp.CameraShakeOffset;
	@:native("flight_add_camera_shake_trauma")
	public static function addCameraShakeTrauma(shake:flight._cpp.CameraShake, amount:Single):Void;
	@:native("flight_reset_camera_shake")
	public static function resetCameraShake(shake:flight._cpp.CameraShake):Void;
	@:native("flight_update_camera_shake")
	public static function updateCameraShake(shake:flight._cpp.CameraShake, dt:Single, out:flight._cpp.CameraShakeOffset):Void;
	@:native("flight_create_fly_camera_controller")
	public static function createFlyCameraController(options:flight._cpp.FlyCameraControllerOptions):flight._cpp.FlyCameraController;
	@:native("flight_clone_fly_camera_controller")
	public static function cloneFlyCameraController(source:flight._cpp.FlyCameraController):flight._cpp.FlyCameraController;
	@:native("flight_copy_fly_camera_controller")
	public static function copyFlyCameraController(out:flight._cpp.FlyCameraController, source:flight._cpp.FlyCameraController):Void;
	@:native("flight_look_fly_camera_controller")
	public static function lookFlyCameraController(controller:flight._cpp.FlyCameraController, deltaYaw:Single, deltaPitch:Single):Void;
	@:native("flight_move_fly_camera_controller")
	public static function moveFlyCameraController(controller:flight._cpp.FlyCameraController, forward:Single, right:Single, up:Single):Void;
	@:native("flight_reset_fly_camera_controller")
	public static function resetFlyCameraController(controller:flight._cpp.FlyCameraController, options:flight._cpp.FlyCameraControllerOptions):Void;
	@:native("flight_snap_fly_camera_controller")
	public static function snapFlyCameraController(controller:flight._cpp.FlyCameraController):Void;
	@:native("flight_update_fly_camera_controller")
	public static function updateFlyCameraController(controller:flight._cpp.FlyCameraController, camera:flight._cpp.Camera3D, deltaTime:Single):Void;
	@:native("flight_update_camera_2d_follow")
	public static function updateCamera2dFollow(guardState:cpp.Star<cpp.Void>, camera:flight._cpp.Camera2D, viewportWidth:Single, viewportHeight:Single, targetX:Single, targetY:Single, deltaTime:Single, options:flight._cpp.Camera2DFollowOptions):Void;
	@:native("flight_frame_orbit_camera_controller_to_sphere")
	public static function frameOrbitCameraControllerToSphere(controller:flight._cpp.OrbitCameraController, projection:flight._cpp.Projection, sphere:flight._cpp.BoundingSphere, aspect:Single, padding:Single):Bool;
	@:native("flight_get_perspective_projection_frame_distance_to_sphere")
	public static function getPerspectiveProjectionFrameDistanceToSphere(projection:flight._cpp.PerspectiveProjection, radius:Single, aspect:Single, padding:Single):Single;
	@:native("flight_set_orthographic_projection_frame_to_sphere")
	public static function setOrthographicProjectionFrameToSphere(projection:flight._cpp.OrthographicProjection, radius:Single, aspect:Single, padding:Single):Void;
	@:native("flight_create_orbit_camera_controller")
	public static function createOrbitCameraController(options:flight._cpp.OrbitCameraControllerOptions):flight._cpp.OrbitCameraController;
	@:native("flight_clone_orbit_camera_controller")
	public static function cloneOrbitCameraController(source:flight._cpp.OrbitCameraController):flight._cpp.OrbitCameraController;
	@:native("flight_copy_orbit_camera_controller")
	public static function copyOrbitCameraController(out:flight._cpp.OrbitCameraController, source:flight._cpp.OrbitCameraController):Void;
	@:native("flight_dolly_orbit_camera_controller")
	public static function dollyOrbitCameraController(controller:flight._cpp.OrbitCameraController, deltaDistance:Single):Void;
	@:native("flight_pan_orbit_camera_controller")
	public static function panOrbitCameraController(controller:flight._cpp.OrbitCameraController, deltaRight:Single, deltaUp:Single):Void;
	@:native("flight_pan_orbit_camera_controller_in_view_plane")
	public static function panOrbitCameraControllerInViewPlane(controller:flight._cpp.OrbitCameraController, deltaRight:Single, deltaUp:Single):Void;
	@:native("flight_reset_orbit_camera_controller")
	public static function resetOrbitCameraController(controller:flight._cpp.OrbitCameraController, options:flight._cpp.OrbitCameraControllerOptions):Void;
	@:native("flight_rotate_orbit_camera_controller")
	public static function rotateOrbitCameraController(controller:flight._cpp.OrbitCameraController, deltaAzimuth:Single, deltaPolar:Single):Void;
	@:native("flight_snap_orbit_camera_controller")
	public static function snapOrbitCameraController(controller:flight._cpp.OrbitCameraController):Void;
	@:native("flight_update_orbit_camera_controller")
	public static function updateOrbitCameraController(controller:flight._cpp.OrbitCameraController, camera:flight._cpp.Camera3D, deltaTime:Single):Void;
	@:native("flight_free_camera_shake")
	public static function freeCameraShake(ptr:flight._cpp.CameraShake):Void;
	@:native("flight_free_camera_shake_offset")
	public static function freeCameraShakeOffset(ptr:flight._cpp.CameraShakeOffset):Void;
	@:native("flight_free_fly_camera_controller")
	public static function freeFlyCameraController(ptr:flight._cpp.FlyCameraController):Void;
	@:native("flight_free_orbit_camera_controller")
	public static function freeOrbitCameraController(ptr:flight._cpp.OrbitCameraController):Void;
}
