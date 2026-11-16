package flight._js._fn;

@:jsRequire("@flighthq/camera")
extern class Camera {
	@:native("getCamera3DForward")
	public static function getCamera3dForward(out:flight._js.Vector3, camera:flight._js.Camera3D):Void;
	@:native("getCamera3DPosition")
	public static function getCamera3dPosition(out:flight._js.Vector3, camera:flight._js.Camera3D):Void;
	@:native("getCamera3DRight")
	public static function getCamera3dRight(out:flight._js.Vector3, camera:flight._js.Camera3D):Void;
	@:native("getCamera3DUp")
	public static function getCamera3dUp(out:flight._js.Vector3, camera:flight._js.Camera3D):Void;
	@:native("createCamera3D")
	public static function createCamera3d():flight._js.Camera3D;
	@:native("getCamera3DInverseViewProjectionMatrix4")
	public static function getCamera3dInverseViewProjectionMatrix4(out:flight._js.Matrix4, camera:flight._js.Camera3D, aspect:Float):Bool;
	@:native("getCamera3DViewProjectionMatrix4")
	public static function getCamera3dViewProjectionMatrix4(out:flight._js.Matrix4, camera:flight._js.Camera3D, aspect:Float):Void;
	@:native("setCamera3DAspect")
	public static function setCamera3dAspect(camera:flight._js.Camera3D, aspect:Float):Void;
	@:native("setCamera3DJitter")
	public static function setCamera3dJitter(camera:flight._js.Camera3D, x:Float, y:Float):Void;
	@:native("setCamera3DViewMatrix4FromLookAt")
	public static function setCamera3dViewMatrix4FromLookAt(camera:flight._js.Camera3D, eye:flight._js.Vector3, target:flight._js.Vector3, up:flight._js.Vector3):Void;
	@:native("setCamera3DViewMatrix4FromMatrix4")
	public static function setCamera3dViewMatrix4FromMatrix4(guardState:Dynamic, camera:flight._js.Camera3D, view:flight._js.Matrix4):Void;
	@:native("updateCamera3DInverseViewProjection")
	public static function updateCamera3dInverseViewProjection(camera:flight._js.Camera3D, aspect:Float):Bool;
	@:native("createCamera2D")
	public static function createCamera2d():flight._js.Camera2D;
	@:native("setCamera2DLookAt")
	public static function setCamera2dLookAt(camera:flight._js.Camera2D, x:Float, y:Float):Void;
	@:native("getCubeCaptureFaceCamera3D")
	public static function getCubeCaptureFaceCamera3d(out:flight._js.Camera3D, position:flight._js.Vector3, face:Int):Void;
	@:native("getCamera3DFrustum")
	public static function getCamera3dFrustum(out:flight._js.Frustum, camera:flight._js.Camera3D, aspect:Float):Void;
	@:native("isBoxInCamera3DFrustum")
	public static function isBoxInCamera3dFrustum(camera:flight._js.Camera3D, aabb:flight._js.Aabb, aspect:Float):Bool;
	@:native("isPointInCamera3DFrustum")
	public static function isPointInCamera3dFrustum(camera:flight._js.Camera3D, point:flight._js.Vector3, aspect:Float):Bool;
	@:native("isSphereInCamera3DFrustum")
	public static function isSphereInCamera3dFrustum(camera:flight._js.Camera3D, sphere:flight._js.BoundingSphere, aspect:Float):Bool;
	@:native("getCamera3DLinearDepth")
	public static function getCamera3dLinearDepth(camera:flight._js.Camera3D, ndcZ:Float):Float;
	@:native("getCamera3DViewSpaceZ")
	public static function getCamera3dViewSpaceZ(camera:flight._js.Camera3D, ndcZ:Float):Float;
	@:native("areCameraGuardsEnabled")
	public static function areCameraGuardsEnabled(guardState:Dynamic):Bool;
	@:native("disableCameraGuards")
	public static function disableCameraGuards(guardState:Dynamic):Void;
	@:native("enableCameraGuards")
	public static function enableCameraGuards(guardState:Dynamic, logState:Dynamic, clock:Dynamic):Void;
	@:native("explainCamera3DView")
	public static function explainCamera3dView(camera:flight._js.Camera3D):flight._js.Camera3DViewExplanation;
	@:native("getCamera3DFrustumCorners")
	public static function getCamera3dFrustumCorners(out:Dynamic, camera:flight._js.Camera3D, aspect:Float):Bool;
	@:native("getCamera3DRayThroughBoundingSphere")
	public static function getCamera3dRayThroughBoundingSphere(out:flight._js.Ray3D, camera:flight._js.Camera3D, sphere:flight._js.BoundingSphere, aspect:Float):Bool;
	@:native("intersectCamera3DRayWithPlane")
	public static function intersectCamera3dRayWithPlane(out:flight._js.Vector3, ray:flight._js.Ray3D, plane:flight._js.Plane):Bool;
	@:native("getCamera2DParallaxPoint")
	public static function getCamera2dParallaxPoint(camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float, factor:Float, out:flight._js.Vector2):Void;
	@:native("getCamera3DScreenToWorldRay")
	public static function getCamera3dScreenToWorldRay(out:flight._js.Ray3D, camera:flight._js.Camera3D, ndcX:Float, ndcY:Float, aspect:Float):Bool;
	@:native("getCamera3DWorldToScreen")
	public static function getCamera3dWorldToScreen(out:flight._js.Vector3, camera:flight._js.Camera3D, worldPoint:flight._js.Vector3, aspect:Float):Bool;
	@:native("createOrthographicProjection")
	public static function createOrthographicProjection():Dynamic;
	@:native("createPerspectiveProjection")
	public static function createPerspectiveProjection():Dynamic;
	@:native("createRawProjection")
	public static function createRawProjection():Dynamic;
	@:native("getOrthographicProjectionTexelSize")
	public static function getOrthographicProjectionTexelSize(projection:flight._js.OrthographicProjection, pixelWidth:Float, pixelHeight:Float):Float;
	@:native("isOrthographicProjection")
	public static function isOrthographicProjection(projection:flight._js.Projection):Bool;
	@:native("isPerspectiveProjection")
	public static function isPerspectiveProjection(projection:flight._js.Projection):Bool;
	@:native("isRawProjection")
	public static function isRawProjection(projection:flight._js.Projection):Bool;
	@:native("setProjectionMatrix4")
	public static function setProjectionMatrix4(out:flight._js.Matrix4, projection:flight._js.Projection, aspect:Float, near:Float, far:Float):Void;
	@:native("projectCamera2DPoint")
	public static function projectCamera2dPoint(camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float, worldX:Float, worldY:Float, out:flight._js.Vector2):Void;
	@:native("unprojectCamera2DPoint")
	public static function unprojectCamera2dPoint(camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float, screenX:Float, screenY:Float, out:flight._js.Vector2):Void;
	@:native("applyObliqueNearClipPlane")
	public static function applyObliqueNearClipPlane(projection:flight._js.Matrix4, viewSpacePlane:flight._js.Plane):Void;
	@:native("reflectCamera3DByPlane")
	public static function reflectCamera3dByPlane(out:flight._js.Camera3D, camera:flight._js.Camera3D, plane:flight._js.Plane):Void;
	@:native("configureDirectionalShadowCamera3D")
	public static function configureDirectionalShadowCamera3d(camera:flight._js.Camera3D, lightDirection:flight._js.Vector3, sceneBounds:flight._js.Aabb):Void;
	@:native("configureDirectionalShadowCamera3DTightFit")
	public static function configureDirectionalShadowCamera3dTightFit(camera:flight._js.Camera3D, lightDirection:flight._js.Vector3, worldBounds:flight._js.Aabb, padding:Null<Float>):Void;
	@:native("getCamera2DViewMatrix")
	public static function getCamera2dViewMatrix(camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float, out:flight._js.Matrix):Void;
	@:native("getCamera2DVisibleBounds")
	public static function getCamera2dVisibleBounds(guardState:Dynamic, camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float, out:flight._js.Rectangle):Void;
	@:native("zoomCamera2DAtScreenPoint")
	public static function zoomCamera2dAtScreenPoint(camera:flight._js.Camera2D, viewportWidth:Float, viewportHeight:Float, screenX:Float, screenY:Float, zoom:Float):Void;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCamera3D(ptr:flight._js.Camera3D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCamera2D(ptr:flight._js.Camera2D):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeCamera3DviewExplanation(ptr:flight._js.Camera3DViewExplanation):Void {}
}
