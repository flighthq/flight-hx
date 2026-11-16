package flight;

extern inline function getCamera3dForward(out:Vector3, camera:Camera3D):Void {
#if hl
	flight._hl._fn.Camera.getCamera3dForward(out, camera);
#elseif cpp
	flight._cpp._fn.Camera.getCamera3dForward(out, camera);
#elseif (js && flight_esm)
	flight._js._fn.Camera.getCamera3dForward(out, camera);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera3dPosition(out:Vector3, camera:Camera3D):Void {
#if hl
	flight._hl._fn.Camera.getCamera3dPosition(out, camera);
#elseif cpp
	flight._cpp._fn.Camera.getCamera3dPosition(out, camera);
#elseif (js && flight_esm)
	flight._js._fn.Camera.getCamera3dPosition(out, camera);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera3dRight(out:Vector3, camera:Camera3D):Void {
#if hl
	flight._hl._fn.Camera.getCamera3dRight(out, camera);
#elseif cpp
	flight._cpp._fn.Camera.getCamera3dRight(out, camera);
#elseif (js && flight_esm)
	flight._js._fn.Camera.getCamera3dRight(out, camera);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera3dUp(out:Vector3, camera:Camera3D):Void {
#if hl
	flight._hl._fn.Camera.getCamera3dUp(out, camera);
#elseif cpp
	flight._cpp._fn.Camera.getCamera3dUp(out, camera);
#elseif (js && flight_esm)
	flight._js._fn.Camera.getCamera3dUp(out, camera);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function createCamera3d():Camera3D {
#if hl
	return flight._hl._fn.Camera.createCamera3d();
#elseif cpp
	return flight._cpp._fn.Camera.createCamera3d();
#elseif (js && flight_esm)
	return flight._js._fn.Camera.createCamera3d();
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera3dInverseViewProjectionMatrix4(out:Matrix4, camera:Camera3D, aspect:Float):Bool {
#if hl
	return flight._hl._fn.Camera.getCamera3dInverseViewProjectionMatrix4(out, camera, aspect);
#elseif cpp
	return flight._cpp._fn.Camera.getCamera3dInverseViewProjectionMatrix4(out, camera, aspect);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.getCamera3dInverseViewProjectionMatrix4(out, camera, aspect);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera3dViewProjectionMatrix4(out:Matrix4, camera:Camera3D, aspect:Float):Void {
#if hl
	flight._hl._fn.Camera.getCamera3dViewProjectionMatrix4(out, camera, aspect);
#elseif cpp
	flight._cpp._fn.Camera.getCamera3dViewProjectionMatrix4(out, camera, aspect);
#elseif (js && flight_esm)
	flight._js._fn.Camera.getCamera3dViewProjectionMatrix4(out, camera, aspect);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function setCamera3dAspect(camera:Camera3D, aspect:Float):Void {
#if hl
	flight._hl._fn.Camera.setCamera3dAspect(camera, aspect);
#elseif cpp
	flight._cpp._fn.Camera.setCamera3dAspect(camera, aspect);
#elseif (js && flight_esm)
	flight._js._fn.Camera.setCamera3dAspect(camera, aspect);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function setCamera3dJitter(camera:Camera3D, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Camera.setCamera3dJitter(camera, x, y);
#elseif cpp
	flight._cpp._fn.Camera.setCamera3dJitter(camera, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Camera.setCamera3dJitter(camera, x, y);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function setCamera3dViewMatrix4FromLookAt(camera:Camera3D, eye:Vector3, target:Vector3, up:Vector3):Void {
#if hl
	flight._hl._fn.Camera.setCamera3dViewMatrix4FromLookAt(camera, eye, target, up);
#elseif cpp
	flight._cpp._fn.Camera.setCamera3dViewMatrix4FromLookAt(camera, eye, target, up);
#elseif (js && flight_esm)
	flight._js._fn.Camera.setCamera3dViewMatrix4FromLookAt(camera, eye, target, up);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function setCamera3dViewMatrix4FromMatrix4(guardState:Dynamic, camera:Camera3D, view:Matrix4):Void {
#if hl
	flight._hl._fn.Camera.setCamera3dViewMatrix4FromMatrix4(guardState, camera, view);
#elseif cpp
	flight._cpp._fn.Camera.setCamera3dViewMatrix4FromMatrix4(guardState, camera, view);
#elseif (js && flight_esm)
	flight._js._fn.Camera.setCamera3dViewMatrix4FromMatrix4(guardState, camera, view);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function updateCamera3dInverseViewProjection(camera:Camera3D, aspect:Float):Bool {
#if hl
	return flight._hl._fn.Camera.updateCamera3dInverseViewProjection(camera, aspect);
#elseif cpp
	return flight._cpp._fn.Camera.updateCamera3dInverseViewProjection(camera, aspect);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.updateCamera3dInverseViewProjection(camera, aspect);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function createCamera2d():Camera2D {
#if hl
	return flight._hl._fn.Camera.createCamera2d();
#elseif cpp
	return flight._cpp._fn.Camera.createCamera2d();
#elseif (js && flight_esm)
	return flight._js._fn.Camera.createCamera2d();
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function setCamera2dLookAt(camera:Camera2D, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Camera.setCamera2dLookAt(camera, x, y);
#elseif cpp
	flight._cpp._fn.Camera.setCamera2dLookAt(camera, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Camera.setCamera2dLookAt(camera, x, y);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCubeCaptureFaceCamera3d(out:Camera3D, position:Vector3, face:Int):Void {
#if hl
	flight._hl._fn.Camera.getCubeCaptureFaceCamera3d(out, position, face);
#elseif cpp
	flight._cpp._fn.Camera.getCubeCaptureFaceCamera3d(out, position, face);
#elseif (js && flight_esm)
	flight._js._fn.Camera.getCubeCaptureFaceCamera3d(out, position, face);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera3dFrustum(out:Frustum, camera:Camera3D, aspect:Float):Void {
#if hl
	flight._hl._fn.Camera.getCamera3dFrustum(out, camera, aspect);
#elseif cpp
	flight._cpp._fn.Camera.getCamera3dFrustum(out, camera, aspect);
#elseif (js && flight_esm)
	flight._js._fn.Camera.getCamera3dFrustum(out, camera, aspect);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function isBoxInCamera3dFrustum(camera:Camera3D, aabb:Aabb, aspect:Float):Bool {
#if hl
	return flight._hl._fn.Camera.isBoxInCamera3dFrustum(camera, aabb, aspect);
#elseif cpp
	return flight._cpp._fn.Camera.isBoxInCamera3dFrustum(camera, aabb, aspect);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.isBoxInCamera3dFrustum(camera, aabb, aspect);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function isPointInCamera3dFrustum(camera:Camera3D, point:Vector3, aspect:Float):Bool {
#if hl
	return flight._hl._fn.Camera.isPointInCamera3dFrustum(camera, point, aspect);
#elseif cpp
	return flight._cpp._fn.Camera.isPointInCamera3dFrustum(camera, point, aspect);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.isPointInCamera3dFrustum(camera, point, aspect);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function isSphereInCamera3dFrustum(camera:Camera3D, sphere:BoundingSphere, aspect:Float):Bool {
#if hl
	return flight._hl._fn.Camera.isSphereInCamera3dFrustum(camera, sphere, aspect);
#elseif cpp
	return flight._cpp._fn.Camera.isSphereInCamera3dFrustum(camera, sphere, aspect);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.isSphereInCamera3dFrustum(camera, sphere, aspect);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera3dLinearDepth(camera:Camera3D, ndcZ:Float):Float {
#if hl
	return flight._hl._fn.Camera.getCamera3dLinearDepth(camera, ndcZ);
#elseif cpp
	return flight._cpp._fn.Camera.getCamera3dLinearDepth(camera, ndcZ);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.getCamera3dLinearDepth(camera, ndcZ);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera3dViewSpaceZ(camera:Camera3D, ndcZ:Float):Float {
#if hl
	return flight._hl._fn.Camera.getCamera3dViewSpaceZ(camera, ndcZ);
#elseif cpp
	return flight._cpp._fn.Camera.getCamera3dViewSpaceZ(camera, ndcZ);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.getCamera3dViewSpaceZ(camera, ndcZ);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function areCameraGuardsEnabled(guardState:Dynamic):Bool {
#if hl
	return flight._hl._fn.Camera.areCameraGuardsEnabled(guardState);
#elseif cpp
	return flight._cpp._fn.Camera.areCameraGuardsEnabled(guardState);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.areCameraGuardsEnabled(guardState);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function disableCameraGuards(guardState:Dynamic):Void {
#if hl
	flight._hl._fn.Camera.disableCameraGuards(guardState);
#elseif cpp
	flight._cpp._fn.Camera.disableCameraGuards(guardState);
#elseif (js && flight_esm)
	flight._js._fn.Camera.disableCameraGuards(guardState);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function enableCameraGuards(guardState:Dynamic, logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Camera.enableCameraGuards(guardState, logState, clockFn, clockCtx);
#elseif cpp
	flight._cpp._fn.Camera.enableCameraGuards(guardState, logState, clockFn, clockCtx);
#elseif (js && flight_esm)
	flight._js._fn.Camera.enableCameraGuards(guardState, logState, clockFn, clockCtx);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function explainCamera3dView(camera:Camera3D):Camera3DViewExplanation {
#if hl
	return flight._hl._fn.Camera.explainCamera3dView(camera);
#elseif cpp
	return flight._cpp._fn.Camera.explainCamera3dView(camera);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.explainCamera3dView(camera);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera3dFrustumCorners(out:Dynamic, camera:Camera3D, aspect:Float):Bool {
#if hl
	return flight._hl._fn.Camera.getCamera3dFrustumCorners(out, camera, aspect);
#elseif cpp
	return flight._cpp._fn.Camera.getCamera3dFrustumCorners(out, camera, aspect);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.getCamera3dFrustumCorners(out, camera, aspect);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera3dRayThroughBoundingSphere(out:Ray3D, camera:Camera3D, sphere:BoundingSphere, aspect:Float):Bool {
#if hl
	return flight._hl._fn.Camera.getCamera3dRayThroughBoundingSphere(out, camera, sphere, aspect);
#elseif cpp
	return flight._cpp._fn.Camera.getCamera3dRayThroughBoundingSphere(out, camera, sphere, aspect);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.getCamera3dRayThroughBoundingSphere(out, camera, sphere, aspect);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function intersectCamera3dRayWithPlane(out:Vector3, ray:Ray3D, plane:Plane):Bool {
#if hl
	return flight._hl._fn.Camera.intersectCamera3dRayWithPlane(out, ray, plane);
#elseif cpp
	return flight._cpp._fn.Camera.intersectCamera3dRayWithPlane(out, ray, plane);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.intersectCamera3dRayWithPlane(out, ray, plane);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera2dParallaxPoint(camera:Camera2D, viewportWidth:Float, viewportHeight:Float, factor:Float, out:Vector2):Void {
#if hl
	flight._hl._fn.Camera.getCamera2dParallaxPoint(camera, viewportWidth, viewportHeight, factor, out);
#elseif cpp
	flight._cpp._fn.Camera.getCamera2dParallaxPoint(camera, viewportWidth, viewportHeight, factor, out);
#elseif (js && flight_esm)
	flight._js._fn.Camera.getCamera2dParallaxPoint(camera, viewportWidth, viewportHeight, factor, out);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera3dScreenToWorldRay(out:Ray3D, camera:Camera3D, ndcX:Float, ndcY:Float, aspect:Float):Bool {
#if hl
	return flight._hl._fn.Camera.getCamera3dScreenToWorldRay(out, camera, ndcX, ndcY, aspect);
#elseif cpp
	return flight._cpp._fn.Camera.getCamera3dScreenToWorldRay(out, camera, ndcX, ndcY, aspect);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.getCamera3dScreenToWorldRay(out, camera, ndcX, ndcY, aspect);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera3dWorldToScreen(out:Vector3, camera:Camera3D, worldPoint:Vector3, aspect:Float):Bool {
#if hl
	return flight._hl._fn.Camera.getCamera3dWorldToScreen(out, camera, worldPoint, aspect);
#elseif cpp
	return flight._cpp._fn.Camera.getCamera3dWorldToScreen(out, camera, worldPoint, aspect);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.getCamera3dWorldToScreen(out, camera, worldPoint, aspect);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function createOrthographicProjection():Dynamic {
#if hl
	return flight._hl._fn.Camera.createOrthographicProjection();
#elseif cpp
	return flight._cpp._fn.Camera.createOrthographicProjection();
#elseif (js && flight_esm)
	return flight._js._fn.Camera.createOrthographicProjection();
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function createPerspectiveProjection():Dynamic {
#if hl
	return flight._hl._fn.Camera.createPerspectiveProjection();
#elseif cpp
	return flight._cpp._fn.Camera.createPerspectiveProjection();
#elseif (js && flight_esm)
	return flight._js._fn.Camera.createPerspectiveProjection();
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function createRawProjection():Dynamic {
#if hl
	return flight._hl._fn.Camera.createRawProjection();
#elseif cpp
	return flight._cpp._fn.Camera.createRawProjection();
#elseif (js && flight_esm)
	return flight._js._fn.Camera.createRawProjection();
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getOrthographicProjectionTexelSize(projection:OrthographicProjection, pixelWidth:Float, pixelHeight:Float):Float {
#if hl
	return flight._hl._fn.Camera.getOrthographicProjectionTexelSize(projection, pixelWidth, pixelHeight);
#elseif cpp
	return flight._cpp._fn.Camera.getOrthographicProjectionTexelSize(projection, pixelWidth, pixelHeight);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.getOrthographicProjectionTexelSize(projection, pixelWidth, pixelHeight);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function isOrthographicProjection(projection:Projection):Bool {
#if hl
	return flight._hl._fn.Camera.isOrthographicProjection(projection);
#elseif cpp
	return flight._cpp._fn.Camera.isOrthographicProjection(projection);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.isOrthographicProjection(projection);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function isPerspectiveProjection(projection:Projection):Bool {
#if hl
	return flight._hl._fn.Camera.isPerspectiveProjection(projection);
#elseif cpp
	return flight._cpp._fn.Camera.isPerspectiveProjection(projection);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.isPerspectiveProjection(projection);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function isRawProjection(projection:Projection):Bool {
#if hl
	return flight._hl._fn.Camera.isRawProjection(projection);
#elseif cpp
	return flight._cpp._fn.Camera.isRawProjection(projection);
#elseif (js && flight_esm)
	return flight._js._fn.Camera.isRawProjection(projection);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function setProjectionMatrix4(out:Matrix4, projection:Projection, aspect:Float, near:Float, far:Float):Void {
#if hl
	flight._hl._fn.Camera.setProjectionMatrix4(out, projection, aspect, near, far);
#elseif cpp
	flight._cpp._fn.Camera.setProjectionMatrix4(out, projection, aspect, near, far);
#elseif (js && flight_esm)
	flight._js._fn.Camera.setProjectionMatrix4(out, projection, aspect, near, far);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function projectCamera2dPoint(camera:Camera2D, viewportWidth:Float, viewportHeight:Float, worldX:Float, worldY:Float, out:Vector2):Void {
#if hl
	flight._hl._fn.Camera.projectCamera2dPoint(camera, viewportWidth, viewportHeight, worldX, worldY, out);
#elseif cpp
	flight._cpp._fn.Camera.projectCamera2dPoint(camera, viewportWidth, viewportHeight, worldX, worldY, out);
#elseif (js && flight_esm)
	flight._js._fn.Camera.projectCamera2dPoint(camera, viewportWidth, viewportHeight, worldX, worldY, out);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function unprojectCamera2dPoint(camera:Camera2D, viewportWidth:Float, viewportHeight:Float, screenX:Float, screenY:Float, out:Vector2):Void {
#if hl
	flight._hl._fn.Camera.unprojectCamera2dPoint(camera, viewportWidth, viewportHeight, screenX, screenY, out);
#elseif cpp
	flight._cpp._fn.Camera.unprojectCamera2dPoint(camera, viewportWidth, viewportHeight, screenX, screenY, out);
#elseif (js && flight_esm)
	flight._js._fn.Camera.unprojectCamera2dPoint(camera, viewportWidth, viewportHeight, screenX, screenY, out);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function applyObliqueNearClipPlane(projection:Matrix4, viewSpacePlane:Plane):Void {
#if hl
	flight._hl._fn.Camera.applyObliqueNearClipPlane(projection, viewSpacePlane);
#elseif cpp
	flight._cpp._fn.Camera.applyObliqueNearClipPlane(projection, viewSpacePlane);
#elseif (js && flight_esm)
	flight._js._fn.Camera.applyObliqueNearClipPlane(projection, viewSpacePlane);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function reflectCamera3dByPlane(out:Camera3D, camera:Camera3D, plane:Plane):Void {
#if hl
	flight._hl._fn.Camera.reflectCamera3dByPlane(out, camera, plane);
#elseif cpp
	flight._cpp._fn.Camera.reflectCamera3dByPlane(out, camera, plane);
#elseif (js && flight_esm)
	flight._js._fn.Camera.reflectCamera3dByPlane(out, camera, plane);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function configureDirectionalShadowCamera3d(camera:Camera3D, lightDirection:Vector3, sceneBounds:Aabb):Void {
#if hl
	flight._hl._fn.Camera.configureDirectionalShadowCamera3d(camera, lightDirection, sceneBounds);
#elseif cpp
	flight._cpp._fn.Camera.configureDirectionalShadowCamera3d(camera, lightDirection, sceneBounds);
#elseif (js && flight_esm)
	flight._js._fn.Camera.configureDirectionalShadowCamera3d(camera, lightDirection, sceneBounds);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function configureDirectionalShadowCamera3dTightFit(camera:Camera3D, lightDirection:Vector3, worldBounds:Aabb, padding:Float):Void {
#if hl
	flight._hl._fn.Camera.configureDirectionalShadowCamera3dTightFit(camera, lightDirection, worldBounds, padding);
#elseif cpp
	flight._cpp._fn.Camera.configureDirectionalShadowCamera3dTightFit(camera, lightDirection, worldBounds, padding);
#elseif (js && flight_esm)
	flight._js._fn.Camera.configureDirectionalShadowCamera3dTightFit(camera, lightDirection, worldBounds, padding);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera2dViewMatrix(camera:Camera2D, viewportWidth:Float, viewportHeight:Float, out:Matrix):Void {
#if hl
	flight._hl._fn.Camera.getCamera2dViewMatrix(camera, viewportWidth, viewportHeight, out);
#elseif cpp
	flight._cpp._fn.Camera.getCamera2dViewMatrix(camera, viewportWidth, viewportHeight, out);
#elseif (js && flight_esm)
	flight._js._fn.Camera.getCamera2dViewMatrix(camera, viewportWidth, viewportHeight, out);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function getCamera2dVisibleBounds(guardState:Dynamic, camera:Camera2D, viewportWidth:Float, viewportHeight:Float, out:Rectangle):Void {
#if hl
	flight._hl._fn.Camera.getCamera2dVisibleBounds(guardState, camera, viewportWidth, viewportHeight, out);
#elseif cpp
	flight._cpp._fn.Camera.getCamera2dVisibleBounds(guardState, camera, viewportWidth, viewportHeight, out);
#elseif (js && flight_esm)
	flight._js._fn.Camera.getCamera2dVisibleBounds(guardState, camera, viewportWidth, viewportHeight, out);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function zoomCamera2dAtScreenPoint(camera:Camera2D, viewportWidth:Float, viewportHeight:Float, screenX:Float, screenY:Float, zoom:Float):Void {
#if hl
	flight._hl._fn.Camera.zoomCamera2dAtScreenPoint(camera, viewportWidth, viewportHeight, screenX, screenY, zoom);
#elseif cpp
	flight._cpp._fn.Camera.zoomCamera2dAtScreenPoint(camera, viewportWidth, viewportHeight, screenX, screenY, zoom);
#elseif (js && flight_esm)
	flight._js._fn.Camera.zoomCamera2dAtScreenPoint(camera, viewportWidth, viewportHeight, screenX, screenY, zoom);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function freeCamera3D(ptr:Camera3D):Void {
#if hl
	flight._hl._fn.Camera.freeCamera3D(ptr);
#elseif cpp
	flight._cpp._fn.Camera.freeCamera3D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Camera.freeCamera3D(ptr);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function freeCamera2D(ptr:Camera2D):Void {
#if hl
	flight._hl._fn.Camera.freeCamera2D(ptr);
#elseif cpp
	flight._cpp._fn.Camera.freeCamera2D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Camera.freeCamera2D(ptr);
#else
	#error "flight.Camera: no backend for this target."
#end
}
extern inline function freeCamera3DviewExplanation(ptr:Camera3DViewExplanation):Void {
#if hl
	flight._hl._fn.Camera.freeCamera3DviewExplanation(ptr);
#elseif cpp
	flight._cpp._fn.Camera.freeCamera3DviewExplanation(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Camera.freeCamera3DviewExplanation(ptr);
#else
	#error "flight.Camera: no backend for this target."
#end
}
