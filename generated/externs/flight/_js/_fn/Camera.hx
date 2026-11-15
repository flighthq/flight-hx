package flight._js._fn;

@:jsRequire("flight")
extern class Camera {
	@:native("flight_get_camera_3d_forward")
	public static function getCamera3dForward(out:flight._js.Vector3, camera:flight._js.Camera3D):Void;
	@:native("flight_get_camera_3d_position")
	public static function getCamera3dPosition(out:flight._js.Vector3, camera:flight._js.Camera3D):Void;
	@:native("flight_get_camera_3d_right")
	public static function getCamera3dRight(out:flight._js.Vector3, camera:flight._js.Camera3D):Void;
	@:native("flight_get_camera_3d_up")
	public static function getCamera3dUp(out:flight._js.Vector3, camera:flight._js.Camera3D):Void;
	@:native("flight_create_camera_3d")
	public static function createCamera3d():flight._js.Camera3D;
	@:native("flight_get_camera_3d_inverse_view_projection_matrix4")
	public static function getCamera3dInverseViewProjectionMatrix4(out:flight._js.Matrix4, camera:flight._js.Camera3D, aspect:Float):Bool;
	@:native("flight_get_camera_3d_view_projection_matrix4")
	public static function getCamera3dViewProjectionMatrix4(out:flight._js.Matrix4, camera:flight._js.Camera3D, aspect:Float):Void;
	@:native("flight_set_camera_3d_aspect")
	public static function setCamera3dAspect(camera:flight._js.Camera3D, aspect:Float):Void;
	@:native("flight_set_camera_3d_jitter")
	public static function setCamera3dJitter(camera:flight._js.Camera3D, x:Float, y:Float):Void;
	@:native("flight_set_camera_3d_view_matrix4_from_look_at")
	public static function setCamera3dViewMatrix4FromLookAt(camera:flight._js.Camera3D, eye:flight._js.Vector3, target:flight._js.Vector3, up:flight._js.Vector3):Void;
	@:native("flight_set_camera_3d_view_matrix4_from_matrix4")
	public static function setCamera3dViewMatrix4FromMatrix4(guardState:Dynamic, camera:flight._js.Camera3D, view:flight._js.Matrix4):Void;
	@:native("flight_update_camera_3d_inverse_view_projection")
	public static function updateCamera3dInverseViewProjection(camera:flight._js.Camera3D, aspect:Float):Bool;
	@:native("flight_create_camera_2d")
	public static function createCamera2d():flight._js.Camera2D;
	@:native("flight_set_camera_2d_look_at")
	public static function setCamera2dLookAt(camera:flight._js.Camera2D, x:Float, y:Float):Void;
	@:native("flight_get_cube_capture_face_camera_3d")
	public static function getCubeCaptureFaceCamera3d(out:flight._js.Camera3D, position:flight._js.Vector3, face:Int):Void;
	@:native("flight_get_camera_3d_frustum")
	public static function getCamera3dFrustum(out:flight._js.Frustum, camera:flight._js.Camera3D, aspect:Float):Void;
	@:native("flight_is_box_in_camera_3d_frustum")
	public static function isBoxInCamera3dFrustum(camera:flight._js.Camera3D, aabb:flight._js.Aabb, aspect:Float):Bool;
	@:native("flight_is_point_in_camera_3d_frustum")
	public static function isPointInCamera3dFrustum(camera:flight._js.Camera3D, point:flight._js.Vector3, aspect:Float):Bool;
	@:native("flight_is_sphere_in_camera_3d_frustum")
	public static function isSphereInCamera3dFrustum(camera:flight._js.Camera3D, sphere:flight._js.BoundingSphere, aspect:Float):Bool;
	@:native("flight_get_camera_3d_linear_depth")
	public static function getCamera3dLinearDepth(camera:flight._js.Camera3D, ndcZ:Float):Float;
	@:native("flight_get_camera_3d_view_space_z")
	public static function getCamera3dViewSpaceZ(camera:flight._js.Camera3D, ndcZ:Float):Float;
	@:native("flight_are_camera_guards_enabled")
	public static function areCameraGuardsEnabled(guardState:Dynamic):Bool;
	@:native("flight_disable_camera_guards")
	public static function disableCameraGuards(guardState:Dynamic):Void;
	@:native("flight_enable_camera_guards")
	public static function enableCameraGuards(guardState:Dynamic, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void;
	@:native("flight_explain_camera_3d_view")
	public static function explainCamera3dView(camera:flight._js.Camera3D):flight._js.Camera3DViewExplanation;
	@:native("flight_get_camera_3d_frustum_corners")
	public static function getCamera3dFrustumCorners(out:Dynamic, outLen:Int, camera:flight._js.Camera3D, aspect:Float):Bool;
	@:native("flight_get_camera_3d_ray_through_bounding_sphere")
	public static function getCamera3dRayThroughBoundingSphere(out:flight._js.Ray3D, camera:flight._js.Camera3D, sphere:flight._js.BoundingSphere, aspect:Float):Bool;
	@:native("flight_intersect_camera_3d_ray_with_plane")
	public static function intersectCamera3dRayWithPlane(out:flight._js.Vector3, ray:flight._js.Ray3D, plane:flight._js.Plane):Bool;
	@:native("flight_get_camera_2d_parallax_point")
	public static function getCamera2dParallaxPoint(camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float, factor:Float, out:flight._js.Vector2):Void;
	@:native("flight_get_camera_3d_screen_to_world_ray")
	public static function getCamera3dScreenToWorldRay(out:flight._js.Ray3D, camera:flight._js.Camera3D, ndcX:Float, ndcY:Float, aspect:Float):Bool;
	@:native("flight_get_camera_3d_world_to_screen")
	public static function getCamera3dWorldToScreen(out:flight._js.Vector3, camera:flight._js.Camera3D, worldPoint:flight._js.Vector3, aspect:Float):Bool;
	@:native("flight_create_orthographic_projection")
	public static function createOrthographicProjection():Dynamic;
	@:native("flight_create_perspective_projection")
	public static function createPerspectiveProjection():Dynamic;
	@:native("flight_create_raw_projection")
	public static function createRawProjection():Dynamic;
	@:native("flight_get_orthographic_projection_texel_size")
	public static function getOrthographicProjectionTexelSize(projection:flight._js.OrthographicProjection, pixelWidth:Float, pixelHeight:Float):Float;
	@:native("flight_is_orthographic_projection")
	public static function isOrthographicProjection(projection:flight._js.Projection):Bool;
	@:native("flight_is_perspective_projection")
	public static function isPerspectiveProjection(projection:flight._js.Projection):Bool;
	@:native("flight_is_raw_projection")
	public static function isRawProjection(projection:flight._js.Projection):Bool;
	@:native("flight_set_projection_matrix4")
	public static function setProjectionMatrix4(out:flight._js.Matrix4, projection:flight._js.Projection, aspect:Float, near:Float, far:Float):Void;
	@:native("flight_project_camera_2d_point")
	public static function projectCamera2dPoint(camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float, worldX:Float, worldY:Float, out:flight._js.Vector2):Void;
	@:native("flight_unproject_camera_2d_point")
	public static function unprojectCamera2dPoint(camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float, screenX:Float, screenY:Float, out:flight._js.Vector2):Void;
	@:native("flight_apply_oblique_near_clip_plane")
	public static function applyObliqueNearClipPlane(projection:flight._js.Matrix4, viewSpacePlane:flight._js.Plane):Void;
	@:native("flight_reflect_camera_3d_by_plane")
	public static function reflectCamera3dByPlane(out:flight._js.Camera3D, camera:flight._js.Camera3D, plane:flight._js.Plane):Void;
	@:native("flight_configure_directional_shadow_camera_3d")
	public static function configureDirectionalShadowCamera3d(camera:flight._js.Camera3D, lightDirection:flight._js.Vector3, sceneBounds:flight._js.Aabb):Void;
	@:native("flight_configure_directional_shadow_camera_3d_tight_fit")
	public static function configureDirectionalShadowCamera3dTightFit(camera:flight._js.Camera3D, lightDirection:flight._js.Vector3, worldBounds:flight._js.Aabb, padding:Float):Void;
	@:native("flight_get_camera_2d_view_matrix")
	public static function getCamera2dViewMatrix(camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float, out:flight._js.Matrix):Void;
	@:native("flight_get_camera_2d_visible_bounds")
	public static function getCamera2dVisibleBounds(guardState:Dynamic, camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float, out:flight._js.Rectangle):Void;
	@:native("flight_zoom_camera_2d_at_screen_point")
	public static function zoomCamera2dAtScreenPoint(camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float, screenX:Float, screenY:Float, zoom:Float):Void;
	@:native("flight_free_camera3_d")
	public static function freeCamera3D(ptr:flight._js.Camera3D):Void;
	@:native("flight_free_camera2_d")
	public static function freeCamera2D(ptr:flight._js.Camera2D):Void;
	@:native("flight_free_camera3_dview_explanation")
	public static function freeCamera3DviewExplanation(ptr:flight._js.Camera3DViewExplanation):Void;
}
