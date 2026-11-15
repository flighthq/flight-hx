package flight._hl._fn;

extern class CameraControls {
	@:hlNative("flight", "flight_create_camera_shake")
	public static function createCameraShake():flight._hl.CameraShake;
	@:hlNative("flight", "flight_create_camera_shake_offset")
	public static function createCameraShakeOffset():flight._hl.CameraShakeOffset;
	@:hlNative("flight", "flight_add_camera_shake_trauma")
	public static function addCameraShakeTrauma(shake:flight._hl.CameraShake, amount:Single):Void;
	@:hlNative("flight", "flight_reset_camera_shake")
	public static function resetCameraShake(shake:flight._hl.CameraShake):Void;
	@:hlNative("flight", "flight_update_camera_shake")
	public static function updateCameraShake(shake:flight._hl.CameraShake, dt:Single, out:flight._hl.CameraShakeOffset):Void;
	@:hlNative("flight", "flight_create_fly_camera_controller")
	public static function createFlyCameraController(options:flight._hl.FlyCameraControllerOptions):flight._hl.FlyCameraController;
	@:hlNative("flight", "flight_clone_fly_camera_controller")
	public static function cloneFlyCameraController(source:flight._hl.FlyCameraController):flight._hl.FlyCameraController;
	@:hlNative("flight", "flight_copy_fly_camera_controller")
	public static function copyFlyCameraController(out:flight._hl.FlyCameraController, source:flight._hl.FlyCameraController):Void;
	@:hlNative("flight", "flight_look_fly_camera_controller")
	public static function lookFlyCameraController(controller:flight._hl.FlyCameraController, deltaYaw:Single, deltaPitch:Single):Void;
	@:hlNative("flight", "flight_move_fly_camera_controller")
	public static function moveFlyCameraController(controller:flight._hl.FlyCameraController, forward:Single, right:Single, up:Single):Void;
	@:hlNative("flight", "flight_reset_fly_camera_controller")
	public static function resetFlyCameraController(controller:flight._hl.FlyCameraController, options:flight._hl.FlyCameraControllerOptions):Void;
	@:hlNative("flight", "flight_snap_fly_camera_controller")
	public static function snapFlyCameraController(controller:flight._hl.FlyCameraController):Void;
	@:hlNative("flight", "flight_update_fly_camera_controller")
	public static function updateFlyCameraController(controller:flight._hl.FlyCameraController, camera:flight._hl.Camera3D, deltaTime:Single):Void;
	@:hlNative("flight", "flight_update_camera_2d_follow")
	public static function updateCamera2dFollow(guardState:Dynamic, camera:flight._hl.Camera2D, viewportWidth:Single, viewportHeight:Single, targetX:Single, targetY:Single, deltaTime:Single, options:flight._hl.Camera2DFollowOptions):Void;
	@:hlNative("flight", "flight_frame_orbit_camera_controller_to_sphere")
	public static function frameOrbitCameraControllerToSphere(controller:flight._hl.OrbitCameraController, projection:flight._hl.Projection, sphere:flight._hl.BoundingSphere, aspect:Single, padding:Single):Bool;
	@:hlNative("flight", "flight_get_perspective_projection_frame_distance_to_sphere")
	public static function getPerspectiveProjectionFrameDistanceToSphere(projection:flight._hl.PerspectiveProjection, radius:Single, aspect:Single, padding:Single):Single;
	@:hlNative("flight", "flight_set_orthographic_projection_frame_to_sphere")
	public static function setOrthographicProjectionFrameToSphere(projection:flight._hl.OrthographicProjection, radius:Single, aspect:Single, padding:Single):Void;
	@:hlNative("flight", "flight_create_orbit_camera_controller")
	public static function createOrbitCameraController(options:flight._hl.OrbitCameraControllerOptions):flight._hl.OrbitCameraController;
	@:hlNative("flight", "flight_clone_orbit_camera_controller")
	public static function cloneOrbitCameraController(source:flight._hl.OrbitCameraController):flight._hl.OrbitCameraController;
	@:hlNative("flight", "flight_copy_orbit_camera_controller")
	public static function copyOrbitCameraController(out:flight._hl.OrbitCameraController, source:flight._hl.OrbitCameraController):Void;
	@:hlNative("flight", "flight_dolly_orbit_camera_controller")
	public static function dollyOrbitCameraController(controller:flight._hl.OrbitCameraController, deltaDistance:Single):Void;
	@:hlNative("flight", "flight_pan_orbit_camera_controller")
	public static function panOrbitCameraController(controller:flight._hl.OrbitCameraController, deltaRight:Single, deltaUp:Single):Void;
	@:hlNative("flight", "flight_pan_orbit_camera_controller_in_view_plane")
	public static function panOrbitCameraControllerInViewPlane(controller:flight._hl.OrbitCameraController, deltaRight:Single, deltaUp:Single):Void;
	@:hlNative("flight", "flight_reset_orbit_camera_controller")
	public static function resetOrbitCameraController(controller:flight._hl.OrbitCameraController, options:flight._hl.OrbitCameraControllerOptions):Void;
	@:hlNative("flight", "flight_rotate_orbit_camera_controller")
	public static function rotateOrbitCameraController(controller:flight._hl.OrbitCameraController, deltaAzimuth:Single, deltaPolar:Single):Void;
	@:hlNative("flight", "flight_snap_orbit_camera_controller")
	public static function snapOrbitCameraController(controller:flight._hl.OrbitCameraController):Void;
	@:hlNative("flight", "flight_update_orbit_camera_controller")
	public static function updateOrbitCameraController(controller:flight._hl.OrbitCameraController, camera:flight._hl.Camera3D, deltaTime:Single):Void;
	@:hlNative("flight", "flight_free_camera_shake")
	public static function freeCameraShake(ptr:flight._hl.CameraShake):Void;
	@:hlNative("flight", "flight_free_camera_shake_offset")
	public static function freeCameraShakeOffset(ptr:flight._hl.CameraShakeOffset):Void;
	@:hlNative("flight", "flight_free_fly_camera_controller")
	public static function freeFlyCameraController(ptr:flight._hl.FlyCameraController):Void;
	@:hlNative("flight", "flight_free_orbit_camera_controller")
	public static function freeOrbitCameraController(ptr:flight._hl.OrbitCameraController):Void;
}
