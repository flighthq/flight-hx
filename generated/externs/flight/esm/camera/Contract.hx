package flight.esm.camera;

#if (js && flight_esm)
@:jsRequire("@flighthq/camera/contract")
extern class Contract {
  public static function applyObliqueNearClipPlane(projection:flight.esm.types.geometry.Types.Matrix4Like, viewSpacePlane:flight.esm.types.geometry.Types.PlaneLike):Void;
  public static function areCameraGuardsEnabled():Bool;
  public static function configureDirectionalShadowCamera3D(camera:flight.esm.types.camera.Types.Camera3D, lightDirection:flight.esm.types.geometry.Types.Vector3Like, sceneBounds:flight.esm.types.geometry.Types.AabbLike):Void;
  public static function configureDirectionalShadowCamera3DTightFit(camera:flight.esm.types.camera.Types.Camera3D, lightDirection:flight.esm.types.geometry.Types.Vector3Like, worldBounds:flight.esm.types.geometry.Types.AabbLike, ?padding:Float):Void;
  public static function createCamera2D(?options:Null<flight.esm.types.camera.Types.Camera2DOptions>):flight.esm.types.camera.Types.Camera2D;
  public static function createCamera3D(opts:flight.esm.types.camera.Types.Camera3DOptions):flight.esm.types.camera.Types.Camera3D;
  public static function createOrthographicProjection(opts:flight.esm.types.camera.Types.OrthographicProjectionOptions):flight.esm.types.camera.Types.OrthographicProjection;
  public static function createPerspectiveProjection(opts:flight.esm.types.camera.Types.PerspectiveProjectionOptions):flight.esm.types.camera.Types.PerspectiveProjection;
  public static function createRawProjection(opts:flight.esm.types.camera.Types.RawProjectionOptions):flight.esm.types.camera.Types.RawProjection;
  public static function disableCameraGuards():Void;
  public static function enableCameraGuards(logState:flight.esm.types.log.Types.LogState, clock:(() -> Float)):Void;
  public static function explainCamera3DView(camera:flight.esm.types.camera.Types.Camera3D):flight.esm.types.camera.Types.Camera3DViewExplanation;
  public static function getCamera2DParallaxPoint(camera:flight.esm.types.camera.Types.Camera2D, viewportWidth:Float, viewportHeight:Float, factor:Float, out:flight.esm.types.geometry.Types.Vector2Like):Void;
  public static function getCamera2DViewMatrix(camera:flight.esm.types.camera.Types.Camera2D, viewportWidth:Float, viewportHeight:Float, out:flight.esm.types.geometry.Types.MatrixLike):Void;
  public static function getCamera2DVisibleBounds(camera:flight.esm.types.camera.Types.Camera2D, viewportWidth:Float, viewportHeight:Float, out:flight.esm.types.geometry.Types.RectangleLike):Void;
  public static function getCamera3DForward(out:flight.esm.types.geometry.Types.Vector3Like, camera:flight.esm.types.camera.Types.Camera3D):Void;
  public static function getCamera3DFrustum(out:flight.esm.types.geometry.Types.FrustumLike, camera:flight.esm.types.camera.Types.Camera3D, aspect:Float):Void;
  public static function getCamera3DFrustumCorners(out:Array<flight.esm.types.geometry.Types.Vector3Like>, camera:flight.esm.types.camera.Types.Camera3D, aspect:Float):Bool;
  public static function getCamera3DInverseViewProjectionMatrix4(out:flight.esm.types.geometry.Types.Matrix4Like, camera:flight.esm.types.camera.Types.Camera3D, aspect:Float):Bool;
  public static function getCamera3DLinearDepth(camera:flight.esm.types.camera.Types.Camera3D, ndcZ:Float):Float;
  public static function getCamera3DPosition(out:flight.esm.types.geometry.Types.Vector3Like, camera:flight.esm.types.camera.Types.Camera3D):Void;
  public static function getCamera3DRayThroughBoundingSphere(out:flight.esm.types.geometry.Types.Ray3DLike, camera:flight.esm.types.camera.Types.Camera3D, sphere:flight.esm.types.geometry.Types.BoundingSphereLike, aspect:Float):Bool;
  public static function getCamera3DRight(out:flight.esm.types.geometry.Types.Vector3Like, camera:flight.esm.types.camera.Types.Camera3D):Void;
  public static function getCamera3DScreenToWorldRay(out:flight.esm.types.geometry.Types.Ray3DLike, camera:flight.esm.types.camera.Types.Camera3D, ndcX:Float, ndcY:Float, aspect:Float):Bool;
  public static function getCamera3DUp(out:flight.esm.types.geometry.Types.Vector3Like, camera:flight.esm.types.camera.Types.Camera3D):Void;
  public static function getCamera3DViewProjectionMatrix4(out:flight.esm.types.geometry.Types.Matrix4Like, camera:flight.esm.types.camera.Types.Camera3D, aspect:Float):Void;
  public static function getCamera3DViewSpaceZ(camera:flight.esm.types.camera.Types.Camera3D, ndcZ:Float):Float;
  public static function getCamera3DWorldToScreen(out:flight.esm.types.geometry.Types.Vector3Like, camera:flight.esm.types.camera.Types.Camera3D, worldPoint:flight.esm.types.geometry.Types.Vector3Like, aspect:Float):Bool;
  public static function getCubeCaptureFaceCamera3D(out:flight.esm.types.camera.Types.Camera3D, position:flight.esm.types.geometry.Types.Vector3Like, face:Float):Void;
  public static function getOrthographicProjectionTexelSize(projection:flight.esm.types.camera.Types.OrthographicProjection, pixelWidth:Float, pixelHeight:Float):Float;
  public static function initializeCamera2D(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.camera.Types.Camera2D>, ?options:Null<flight.esm.types.camera.Types.Camera2DOptions>):Void;
  public static function initializeCamera3D(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.camera.Types.Camera3D>, opts:flight.esm.types.camera.Types.Camera3DOptions):Void;
  public static function initializeOrthographicProjection(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.camera.Types.OrthographicProjection>, opts:flight.esm.types.camera.Types.OrthographicProjectionOptions):Void;
  public static function initializePerspectiveProjection(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.camera.Types.PerspectiveProjection>, opts:flight.esm.types.camera.Types.PerspectiveProjectionOptions):Void;
  public static function initializeRawProjection(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.camera.Types.RawProjection>, opts:flight.esm.types.camera.Types.RawProjectionOptions):Void;
  public static function intersectCamera3DRayWithPlane(out:flight.esm.types.geometry.Types.Vector3Like, ray:flight.esm.types.geometry.Types.Ray3DLike, plane:flight.esm.types.geometry.Types.PlaneLike):Bool;
  public static function isBoxInCamera3DFrustum(camera:flight.esm.types.camera.Types.Camera3D, aabb:flight.esm.types.geometry.Types.AabbLike, aspect:Float):Bool;
  public static function isOrthographicProjection(projection:flight.esm.types.camera.Types.Projection):Bool;
  public static function isPerspectiveProjection(projection:flight.esm.types.camera.Types.Projection):Bool;
  public static function isPointInCamera3DFrustum(camera:flight.esm.types.camera.Types.Camera3D, point:flight.esm.types.geometry.Types.Vector3Like, aspect:Float):Bool;
  public static function isRawProjection(projection:flight.esm.types.camera.Types.Projection):Bool;
  public static function isSphereInCamera3DFrustum(camera:flight.esm.types.camera.Types.Camera3D, sphere:flight.esm.types.geometry.Types.BoundingSphereLike, aspect:Float):Bool;
  public static function projectCamera2DPoint(camera:flight.esm.types.camera.Types.Camera2D, viewportWidth:Float, viewportHeight:Float, worldX:Float, worldY:Float, out:flight.esm.types.geometry.Types.Vector2Like):Void;
  public static function reflectCamera3DByPlane(out:flight.esm.types.camera.Types.Camera3D, camera:flight.esm.types.camera.Types.Camera3D, plane:flight.esm.types.geometry.Types.PlaneLike):Void;
  public static function setCamera2DLookAt(camera:flight.esm.types.camera.Types.Camera2D, x:Float, y:Float):Void;
  public static function setCamera2DVisibleBoundsGuard(guard:Null<((camera:flight.esm.types.camera.Types.Camera2D) -> Void)>):Void;
  public static function setCamera3DAspect(camera:flight.esm.types.camera.Types.Camera3D, aspect:Float):Void;
  public static function setCamera3DJitter(camera:flight.esm.types.camera.Types.Camera3D, x:Float, y:Float):Void;
  public static function setCamera3DViewGuard(guard:Null<((camera:flight.esm.types.camera.Types.Camera3D) -> Void)>):Void;
  public static function setCamera3DViewMatrix4FromLookAt(camera:flight.esm.types.camera.Types.Camera3D, eye:flight.esm.types.geometry.Types.Vector3Like, target:flight.esm.types.geometry.Types.Vector3Like, up:flight.esm.types.geometry.Types.Vector3Like):Void;
  public static function setCamera3DViewMatrix4FromMatrix4(camera:flight.esm.types.camera.Types.Camera3D, view:flight.esm.types.geometry.Types.Matrix4Like):Void;
  public static function setProjectionMatrix4(out:flight.esm.types.geometry.Types.Matrix4Like, projection:flight.esm.types.camera.Types.Projection, aspect:Float, near:Float, far:Float):Void;
  public static function unprojectCamera2DPoint(camera:flight.esm.types.camera.Types.Camera2D, viewportWidth:Float, viewportHeight:Float, screenX:Float, screenY:Float, out:flight.esm.types.geometry.Types.Vector2Like):Void;
  public static function updateCamera3DInverseViewProjection(camera:flight.esm.types.camera.Types.Camera3D, aspect:Float):Bool;
  public static function zoomCamera2DAtScreenPoint(camera:flight.esm.types.camera.Types.Camera2D, viewportWidth:Float, viewportHeight:Float, screenX:Float, screenY:Float, zoom:Float):Void;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
