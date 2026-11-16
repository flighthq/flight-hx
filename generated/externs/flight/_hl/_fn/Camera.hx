package flight._hl._fn;

extern class Camera {
	@:hlNative("flight", "flight_get_camera_3d_forward")
	public static function getCamera3dForward(out:flight._hl.Vector3, camera:flight._hl.Camera3D):Void;
	@:hlNative("flight", "flight_get_camera_3d_position")
	public static function getCamera3dPosition(out:flight._hl.Vector3, camera:flight._hl.Camera3D):Void;
	@:hlNative("flight", "flight_get_camera_3d_right")
	public static function getCamera3dRight(out:flight._hl.Vector3, camera:flight._hl.Camera3D):Void;
	@:hlNative("flight", "flight_get_camera_3d_up")
	public static function getCamera3dUp(out:flight._hl.Vector3, camera:flight._hl.Camera3D):Void;
	@:hlNative("flight", "flight_create_camera_3d")
	public static function createCamera3d():flight._hl.Camera3D;
	@:hlNative("flight", "flight_get_camera_3d_inverse_view_projection_matrix4")
	public static function getCamera3dInverseViewProjectionMatrix4(out:flight._hl.Matrix4, camera:flight._hl.Camera3D, aspect:Single):Bool;
	@:hlNative("flight", "flight_get_camera_3d_view_projection_matrix4")
	public static function getCamera3dViewProjectionMatrix4(out:flight._hl.Matrix4, camera:flight._hl.Camera3D, aspect:Single):Void;
	@:hlNative("flight", "flight_set_camera_3d_aspect")
	public static function setCamera3dAspect(camera:flight._hl.Camera3D, aspect:Single):Void;
	@:hlNative("flight", "flight_set_camera_3d_jitter")
	public static function setCamera3dJitter(camera:flight._hl.Camera3D, x:Single, y:Single):Void;
	@:hlNative("flight", "flight_set_camera_3d_view_matrix4_from_look_at")
	public static function setCamera3dViewMatrix4FromLookAt(camera:flight._hl.Camera3D, eye:flight._hl.Vector3, target:flight._hl.Vector3, up:flight._hl.Vector3):Void;
	@:hlNative("flight", "flight_set_camera_3d_view_matrix4_from_matrix4")
	public static function setCamera3dViewMatrix4FromMatrix4(guardState:hl.Bytes, camera:flight._hl.Camera3D, view:flight._hl.Matrix4):Void;
	@:hlNative("flight", "flight_update_camera_3d_inverse_view_projection")
	public static function updateCamera3dInverseViewProjection(camera:flight._hl.Camera3D, aspect:Single):Bool;
	@:hlNative("flight", "flight_create_camera_2d")
	public static function createCamera2d():flight._hl.Camera2D;
	@:hlNative("flight", "flight_set_camera_2d_look_at")
	public static function setCamera2dLookAt(camera:flight._hl.Camera2D, x:Single, y:Single):Void;
	@:hlNative("flight", "flight_get_cube_capture_face_camera_3d")
	public static function getCubeCaptureFaceCamera3d(out:flight._hl.Camera3D, position:flight._hl.Vector3, face:Int):Void;
	@:hlNative("flight", "flight_get_camera_3d_frustum")
	public static function getCamera3dFrustum(out:flight._hl.Frustum, camera:flight._hl.Camera3D, aspect:Single):Void;
	@:hlNative("flight", "flight_is_box_in_camera_3d_frustum")
	public static function isBoxInCamera3dFrustum(camera:flight._hl.Camera3D, aabb:flight._hl.Aabb, aspect:Single):Bool;
	@:hlNative("flight", "flight_is_point_in_camera_3d_frustum")
	public static function isPointInCamera3dFrustum(camera:flight._hl.Camera3D, point:flight._hl.Vector3, aspect:Single):Bool;
	@:hlNative("flight", "flight_is_sphere_in_camera_3d_frustum")
	public static function isSphereInCamera3dFrustum(camera:flight._hl.Camera3D, sphere:flight._hl.BoundingSphere, aspect:Single):Bool;
	@:hlNative("flight", "flight_get_camera_3d_linear_depth")
	public static function getCamera3dLinearDepth(camera:flight._hl.Camera3D, ndcZ:Single):Single;
	@:hlNative("flight", "flight_get_camera_3d_view_space_z")
	public static function getCamera3dViewSpaceZ(camera:flight._hl.Camera3D, ndcZ:Single):Single;
	@:hlNative("flight", "flight_are_camera_guards_enabled")
	public static function areCameraGuardsEnabled(guardState:hl.Bytes):Bool;
	@:hlNative("flight", "flight_disable_camera_guards")
	public static function disableCameraGuards(guardState:hl.Bytes):Void;
	@:hlNative("flight", "flight_enable_camera_guards")
	public static function enableCameraGuards(guardState:hl.Bytes, logState:hl.Bytes, clockFn:hl.Bytes, clockCtx:hl.Bytes):Void;
	@:hlNative("flight", "flight_explain_camera_3d_view")
	public static function explainCamera3dView(camera:flight._hl.Camera3D):flight._hl.Camera3DViewExplanation;
	@:hlNative("flight", "flight_get_camera_3d_frustum_corners")
	public static function getCamera3dFrustumCorners(out:hl.Bytes, camera:flight._hl.Camera3D, aspect:Single):Bool;
	@:hlNative("flight", "flight_get_camera_3d_ray_through_bounding_sphere")
	public static function getCamera3dRayThroughBoundingSphere(out:flight._hl.Ray3D, camera:flight._hl.Camera3D, sphere:flight._hl.BoundingSphere, aspect:Single):Bool;
	@:hlNative("flight", "flight_intersect_camera_3d_ray_with_plane")
	public static function intersectCamera3dRayWithPlane(out:flight._hl.Vector3, ray:flight._hl.Ray3D, plane:flight._hl.Plane):Bool;
	@:hlNative("flight", "flight_get_camera_2d_parallax_point")
	public static function getCamera2dParallaxPoint(camera:flight._hl.Camera2D, viewportWidth:Single, viewportHeight:Single, factor:Single, out:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_get_camera_3d_screen_to_world_ray")
	public static function getCamera3dScreenToWorldRay(out:flight._hl.Ray3D, camera:flight._hl.Camera3D, ndcX:Single, ndcY:Single, aspect:Single):Bool;
	@:hlNative("flight", "flight_get_camera_3d_world_to_screen")
	public static function getCamera3dWorldToScreen(out:flight._hl.Vector3, camera:flight._hl.Camera3D, worldPoint:flight._hl.Vector3, aspect:Single):Bool;
	@:hlNative("flight", "flight_create_orthographic_projection")
	public static function createOrthographicProjection():hl.Bytes;
	@:hlNative("flight", "flight_create_perspective_projection")
	public static function createPerspectiveProjection():hl.Bytes;
	@:hlNative("flight", "flight_create_raw_projection")
	public static function createRawProjection():hl.Bytes;
	@:hlNative("flight", "flight_get_orthographic_projection_texel_size")
	public static function getOrthographicProjectionTexelSize(projection:flight._hl.OrthographicProjection, pixelWidth:Single, pixelHeight:Single):Single;
	@:hlNative("flight", "flight_is_orthographic_projection")
	public static function isOrthographicProjection(projection:flight._hl.Projection):Bool;
	@:hlNative("flight", "flight_is_perspective_projection")
	public static function isPerspectiveProjection(projection:flight._hl.Projection):Bool;
	@:hlNative("flight", "flight_is_raw_projection")
	public static function isRawProjection(projection:flight._hl.Projection):Bool;
	@:hlNative("flight", "flight_set_projection_matrix4")
	public static function setProjectionMatrix4(out:flight._hl.Matrix4, projection:flight._hl.Projection, aspect:Single, near:Single, far:Single):Void;
	@:hlNative("flight", "flight_project_camera_2d_point")
	public static function projectCamera2dPoint(camera:flight._hl.Camera2D, viewportWidth:Single, viewportHeight:Single, worldX:Single, worldY:Single, out:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_unproject_camera_2d_point")
	public static function unprojectCamera2dPoint(camera:flight._hl.Camera2D, viewportWidth:Single, viewportHeight:Single, screenX:Single, screenY:Single, out:flight._hl.Vector2):Void;
	@:hlNative("flight", "flight_apply_oblique_near_clip_plane")
	public static function applyObliqueNearClipPlane(projection:flight._hl.Matrix4, viewSpacePlane:flight._hl.Plane):Void;
	@:hlNative("flight", "flight_reflect_camera_3d_by_plane")
	public static function reflectCamera3dByPlane(out:flight._hl.Camera3D, camera:flight._hl.Camera3D, plane:flight._hl.Plane):Void;
	@:hlNative("flight", "flight_configure_directional_shadow_camera_3d")
	public static function configureDirectionalShadowCamera3d(camera:flight._hl.Camera3D, lightDirection:flight._hl.Vector3, sceneBounds:flight._hl.Aabb):Void;
	@:hlNative("flight", "flight_configure_directional_shadow_camera_3d_tight_fit")
	public static function configureDirectionalShadowCamera3dTightFit(camera:flight._hl.Camera3D, lightDirection:flight._hl.Vector3, worldBounds:flight._hl.Aabb, padding:Single):Void;
	@:hlNative("flight", "flight_get_camera_2d_view_matrix")
	public static function getCamera2dViewMatrix(camera:flight._hl.Camera2D, viewportWidth:Single, viewportHeight:Single, out:flight._hl.Matrix):Void;
	@:hlNative("flight", "flight_get_camera_2d_visible_bounds")
	public static function getCamera2dVisibleBounds(guardState:hl.Bytes, camera:flight._hl.Camera2D, viewportWidth:Single, viewportHeight:Single, out:flight._hl.Rectangle):Void;
	@:hlNative("flight", "flight_zoom_camera_2d_at_screen_point")
	public static function zoomCamera2dAtScreenPoint(camera:flight._hl.Camera2D, viewportWidth:Single, viewportHeight:Single, screenX:Single, screenY:Single, zoom:Single):Void;
	@:hlNative("flight", "flight_free_camera3_d")
	public static function freeCamera3D(ptr:flight._hl.Camera3D):Void;
	@:hlNative("flight", "flight_free_camera2_d")
	public static function freeCamera2D(ptr:flight._hl.Camera2D):Void;
	@:hlNative("flight", "flight_free_camera3_dview_explanation")
	public static function freeCamera3DviewExplanation(ptr:flight._hl.Camera3DViewExplanation):Void;
}
