package flight._cpp._fn;

extern class Camera {
	@:native("flight_get_camera_3d_forward")
	public static function getCamera3dForward(out:flight._cpp.Vector3, camera:flight._cpp.Camera3D):Void;
	@:native("flight_get_camera_3d_position")
	public static function getCamera3dPosition(out:flight._cpp.Vector3, camera:flight._cpp.Camera3D):Void;
	@:native("flight_get_camera_3d_right")
	public static function getCamera3dRight(out:flight._cpp.Vector3, camera:flight._cpp.Camera3D):Void;
	@:native("flight_get_camera_3d_up")
	public static function getCamera3dUp(out:flight._cpp.Vector3, camera:flight._cpp.Camera3D):Void;
	@:native("flight_create_camera_3d")
	public static function createCamera3d():flight._cpp.Camera3D;
	@:native("flight_get_camera_3d_inverse_view_projection_matrix4")
	public static function getCamera3dInverseViewProjectionMatrix4(out:flight._cpp.Matrix4, camera:flight._cpp.Camera3D, aspect:Single):Bool;
	@:native("flight_get_camera_3d_view_projection_matrix4")
	public static function getCamera3dViewProjectionMatrix4(out:flight._cpp.Matrix4, camera:flight._cpp.Camera3D, aspect:Single):Void;
	@:native("flight_set_camera_3d_aspect")
	public static function setCamera3dAspect(camera:flight._cpp.Camera3D, aspect:Single):Void;
	@:native("flight_set_camera_3d_jitter")
	public static function setCamera3dJitter(camera:flight._cpp.Camera3D, x:Single, y:Single):Void;
	@:native("flight_set_camera_3d_view_matrix4_from_look_at")
	public static function setCamera3dViewMatrix4FromLookAt(camera:flight._cpp.Camera3D, eye:flight._cpp.Vector3, target:flight._cpp.Vector3, up:flight._cpp.Vector3):Void;
	@:native("flight_set_camera_3d_view_matrix4_from_matrix4")
	public static function setCamera3dViewMatrix4FromMatrix4(guardState:cpp.Star<cpp.Void>, camera:flight._cpp.Camera3D, view:flight._cpp.Matrix4):Void;
	@:native("flight_update_camera_3d_inverse_view_projection")
	public static function updateCamera3dInverseViewProjection(camera:flight._cpp.Camera3D, aspect:Single):Bool;
	@:native("flight_create_camera_2d")
	public static function createCamera2d():flight._cpp.Camera2D;
	@:native("flight_set_camera_2d_look_at")
	public static function setCamera2dLookAt(camera:flight._cpp.Camera2D, x:Single, y:Single):Void;
	@:native("flight_get_cube_capture_face_camera_3d")
	public static function getCubeCaptureFaceCamera3d(out:flight._cpp.Camera3D, position:flight._cpp.Vector3, face:Int):Void;
	@:native("flight_get_camera_3d_frustum")
	public static function getCamera3dFrustum(out:flight._cpp.Frustum, camera:flight._cpp.Camera3D, aspect:Single):Void;
	@:native("flight_is_box_in_camera_3d_frustum")
	public static function isBoxInCamera3dFrustum(camera:flight._cpp.Camera3D, aabb:flight._cpp.Aabb, aspect:Single):Bool;
	@:native("flight_is_point_in_camera_3d_frustum")
	public static function isPointInCamera3dFrustum(camera:flight._cpp.Camera3D, point:flight._cpp.Vector3, aspect:Single):Bool;
	@:native("flight_is_sphere_in_camera_3d_frustum")
	public static function isSphereInCamera3dFrustum(camera:flight._cpp.Camera3D, sphere:flight._cpp.BoundingSphere, aspect:Single):Bool;
	@:native("flight_get_camera_3d_linear_depth")
	public static function getCamera3dLinearDepth(camera:flight._cpp.Camera3D, ndcZ:Single):Single;
	@:native("flight_get_camera_3d_view_space_z")
	public static function getCamera3dViewSpaceZ(camera:flight._cpp.Camera3D, ndcZ:Single):Single;
	@:native("flight_are_camera_guards_enabled")
	public static function areCameraGuardsEnabled(guardState:cpp.Star<cpp.Void>):Bool;
	@:native("flight_disable_camera_guards")
	public static function disableCameraGuards(guardState:cpp.Star<cpp.Void>):Void;
	@:native("flight_enable_camera_guards")
	public static function enableCameraGuards(guardState:cpp.Star<cpp.Void>, logState:cpp.Star<cpp.Void>, clockFn:cpp.Star<cpp.Void>, clockCtx:cpp.Star<cpp.Void>):Void;
	@:native("flight_explain_camera_3d_view")
	public static function explainCamera3dView(camera:flight._cpp.Camera3D):flight._cpp.Camera3DViewExplanation;
	@:native("flight_get_camera_3d_frustum_corners")
	public static function getCamera3dFrustumCorners(out:cpp.Star<cpp.Void>, camera:flight._cpp.Camera3D, aspect:Single):Bool;
	@:native("flight_get_camera_3d_ray_through_bounding_sphere")
	public static function getCamera3dRayThroughBoundingSphere(out:flight._cpp.Ray3D, camera:flight._cpp.Camera3D, sphere:flight._cpp.BoundingSphere, aspect:Single):Bool;
	@:native("flight_intersect_camera_3d_ray_with_plane")
	public static function intersectCamera3dRayWithPlane(out:flight._cpp.Vector3, ray:flight._cpp.Ray3D, plane:flight._cpp.Plane):Bool;
	@:native("flight_get_camera_2d_parallax_point")
	public static function getCamera2dParallaxPoint(camera:flight._cpp.Camera2D, viewportWidth:Single, viewportHeight:Single, factor:Single, out:flight._cpp.Vector2):Void;
	@:native("flight_get_camera_3d_screen_to_world_ray")
	public static function getCamera3dScreenToWorldRay(out:flight._cpp.Ray3D, camera:flight._cpp.Camera3D, ndcX:Single, ndcY:Single, aspect:Single):Bool;
	@:native("flight_get_camera_3d_world_to_screen")
	public static function getCamera3dWorldToScreen(out:flight._cpp.Vector3, camera:flight._cpp.Camera3D, worldPoint:flight._cpp.Vector3, aspect:Single):Bool;
	@:native("flight_create_orthographic_projection")
	public static function createOrthographicProjection():cpp.Star<cpp.Void>;
	@:native("flight_create_perspective_projection")
	public static function createPerspectiveProjection():cpp.Star<cpp.Void>;
	@:native("flight_create_raw_projection")
	public static function createRawProjection():cpp.Star<cpp.Void>;
	@:native("flight_get_orthographic_projection_texel_size")
	public static function getOrthographicProjectionTexelSize(projection:flight._cpp.OrthographicProjection, pixelWidth:Single, pixelHeight:Single):Single;
	@:native("flight_is_orthographic_projection")
	public static function isOrthographicProjection(projection:flight._cpp.Projection):Bool;
	@:native("flight_is_perspective_projection")
	public static function isPerspectiveProjection(projection:flight._cpp.Projection):Bool;
	@:native("flight_is_raw_projection")
	public static function isRawProjection(projection:flight._cpp.Projection):Bool;
	@:native("flight_set_projection_matrix4")
	public static function setProjectionMatrix4(out:flight._cpp.Matrix4, projection:flight._cpp.Projection, aspect:Single, near:Single, far:Single):Void;
	@:native("flight_project_camera_2d_point")
	public static function projectCamera2dPoint(camera:flight._cpp.Camera2D, viewportWidth:Single, viewportHeight:Single, worldX:Single, worldY:Single, out:flight._cpp.Vector2):Void;
	@:native("flight_unproject_camera_2d_point")
	public static function unprojectCamera2dPoint(camera:flight._cpp.Camera2D, viewportWidth:Single, viewportHeight:Single, screenX:Single, screenY:Single, out:flight._cpp.Vector2):Void;
	@:native("flight_apply_oblique_near_clip_plane")
	public static function applyObliqueNearClipPlane(projection:flight._cpp.Matrix4, viewSpacePlane:flight._cpp.Plane):Void;
	@:native("flight_reflect_camera_3d_by_plane")
	public static function reflectCamera3dByPlane(out:flight._cpp.Camera3D, camera:flight._cpp.Camera3D, plane:flight._cpp.Plane):Void;
	@:native("flight_configure_directional_shadow_camera_3d")
	public static function configureDirectionalShadowCamera3d(camera:flight._cpp.Camera3D, lightDirection:flight._cpp.Vector3, sceneBounds:flight._cpp.Aabb):Void;
	@:native("flight_configure_directional_shadow_camera_3d_tight_fit")
	public static function configureDirectionalShadowCamera3dTightFit(camera:flight._cpp.Camera3D, lightDirection:flight._cpp.Vector3, worldBounds:flight._cpp.Aabb, padding:Single):Void;
	@:native("flight_get_camera_2d_view_matrix")
	public static function getCamera2dViewMatrix(camera:flight._cpp.Camera2D, viewportWidth:Single, viewportHeight:Single, out:flight._cpp.Matrix):Void;
	@:native("flight_get_camera_2d_visible_bounds")
	public static function getCamera2dVisibleBounds(guardState:cpp.Star<cpp.Void>, camera:flight._cpp.Camera2D, viewportWidth:Single, viewportHeight:Single, out:flight._cpp.Rectangle):Void;
	@:native("flight_zoom_camera_2d_at_screen_point")
	public static function zoomCamera2dAtScreenPoint(camera:flight._cpp.Camera2D, viewportWidth:Single, viewportHeight:Single, screenX:Single, screenY:Single, zoom:Single):Void;
	@:native("flight_free_camera3_d")
	public static function freeCamera3D(ptr:flight._cpp.Camera3D):Void;
	@:native("flight_free_camera2_d")
	public static function freeCamera2D(ptr:flight._cpp.Camera2D):Void;
	@:native("flight_free_camera3_dview_explanation")
	public static function freeCamera3DviewExplanation(ptr:flight._cpp.Camera3DViewExplanation):Void;
}
