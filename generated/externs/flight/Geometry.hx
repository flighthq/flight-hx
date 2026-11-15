package flight;

inline function createAabb(minX:Float, minY:Float, minZ:Float, maxX:Float, maxY:Float, maxZ:Float):Aabb {
#if hl
	return flight._hl._fn.Geometry.createAabb(minX, minY, minZ, maxX, maxY, maxZ);
#elseif cpp
	return flight._cpp._fn.Geometry.createAabb(minX, minY, minZ, maxX, maxY, maxZ);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createAabb(minX, minY, minZ, maxX, maxY, maxZ);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function cloneAabb(source:Aabb):Aabb {
#if hl
	return flight._hl._fn.Geometry.cloneAabb(source);
#elseif cpp
	return flight._cpp._fn.Geometry.cloneAabb(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.cloneAabb(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function containsAabbPoint(aabb:Aabb, point:Vector3):Bool {
#if hl
	return flight._hl._fn.Geometry.containsAabbPoint(aabb, point);
#elseif cpp
	return flight._cpp._fn.Geometry.containsAabbPoint(aabb, point);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.containsAabbPoint(aabb, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyAabb(out:Aabb, source:Aabb):Void {
#if hl
	flight._hl._fn.Geometry.copyAabb(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyAabb(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyAabb(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function expandAabbByPoint(out:Aabb, aabb:Aabb, point:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.expandAabbByPoint(out, aabb, point);
#elseif cpp
	flight._cpp._fn.Geometry.expandAabbByPoint(out, aabb, point);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.expandAabbByPoint(out, aabb, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function expandAabbBySphere(out:Aabb, aabb:Aabb, sphere:BoundingSphere):Void {
#if hl
	flight._hl._fn.Geometry.expandAabbBySphere(out, aabb, sphere);
#elseif cpp
	flight._cpp._fn.Geometry.expandAabbBySphere(out, aabb, sphere);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.expandAabbBySphere(out, aabb, sphere);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getAabbCenter(out:Vector3, aabb:Aabb):Void {
#if hl
	flight._hl._fn.Geometry.getAabbCenter(out, aabb);
#elseif cpp
	flight._cpp._fn.Geometry.getAabbCenter(out, aabb);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getAabbCenter(out, aabb);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getAabbExtents(out:Vector3, aabb:Aabb):Void {
#if hl
	flight._hl._fn.Geometry.getAabbExtents(out, aabb);
#elseif cpp
	flight._cpp._fn.Geometry.getAabbExtents(out, aabb);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getAabbExtents(out, aabb);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getAabbSize(out:Vector3, aabb:Aabb):Void {
#if hl
	flight._hl._fn.Geometry.getAabbSize(out, aabb);
#elseif cpp
	flight._cpp._fn.Geometry.getAabbSize(out, aabb);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getAabbSize(out, aabb);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getClosestPointOnAabb(out:Vector3, aabb:Aabb, point:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.getClosestPointOnAabb(out, aabb, point);
#elseif cpp
	flight._cpp._fn.Geometry.getClosestPointOnAabb(out, aabb, point);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getClosestPointOnAabb(out, aabb, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function intersectAabb(out:Aabb, a:Aabb, b:Aabb):Void {
#if hl
	flight._hl._fn.Geometry.intersectAabb(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.intersectAabb(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.intersectAabb(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isAabbIntersectingAabb(a:Aabb, b:Aabb):Bool {
#if hl
	return flight._hl._fn.Geometry.isAabbIntersectingAabb(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.isAabbIntersectingAabb(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isAabbIntersectingAabb(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isAabbIntersectingSphere(aabb:Aabb, sphere:BoundingSphere):Bool {
#if hl
	return flight._hl._fn.Geometry.isAabbIntersectingSphere(aabb, sphere);
#elseif cpp
	return flight._cpp._fn.Geometry.isAabbIntersectingSphere(aabb, sphere);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isAabbIntersectingSphere(aabb, sphere);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setAabb(out:Aabb, minX:Float, minY:Float, minZ:Float, maxX:Float, maxY:Float, maxZ:Float):Void {
#if hl
	flight._hl._fn.Geometry.setAabb(out, minX, minY, minZ, maxX, maxY, maxZ);
#elseif cpp
	flight._cpp._fn.Geometry.setAabb(out, minX, minY, minZ, maxX, maxY, maxZ);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setAabb(out, minX, minY, minZ, maxX, maxY, maxZ);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setAabbFromPoints(out:Aabb, points:Dynamic, pointsLen:Int):Void {
#if hl
	flight._hl._fn.Geometry.setAabbFromPoints(out, points, pointsLen);
#elseif cpp
	flight._cpp._fn.Geometry.setAabbFromPoints(out, points, pointsLen);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setAabbFromPoints(out, points, pointsLen);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function transformAabbByMatrix4(out:Aabb, aabb:Aabb, m:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.transformAabbByMatrix4(out, aabb, m);
#elseif cpp
	flight._cpp._fn.Geometry.transformAabbByMatrix4(out, aabb, m);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.transformAabbByMatrix4(out, aabb, m);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function unionAabb(out:Aabb, a:Aabb, b:Aabb):Void {
#if hl
	flight._hl._fn.Geometry.unionAabb(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.unionAabb(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.unionAabb(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createBoundingSphere(centerX:Float, centerY:Float, centerZ:Float, radius:Float):BoundingSphere {
#if hl
	return flight._hl._fn.Geometry.createBoundingSphere(centerX, centerY, centerZ, radius);
#elseif cpp
	return flight._cpp._fn.Geometry.createBoundingSphere(centerX, centerY, centerZ, radius);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createBoundingSphere(centerX, centerY, centerZ, radius);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function cloneBoundingSphere(source:BoundingSphere):BoundingSphere {
#if hl
	return flight._hl._fn.Geometry.cloneBoundingSphere(source);
#elseif cpp
	return flight._cpp._fn.Geometry.cloneBoundingSphere(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.cloneBoundingSphere(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function containsBoundingSpherePoint(sphere:BoundingSphere, point:Vector3):Bool {
#if hl
	return flight._hl._fn.Geometry.containsBoundingSpherePoint(sphere, point);
#elseif cpp
	return flight._cpp._fn.Geometry.containsBoundingSpherePoint(sphere, point);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.containsBoundingSpherePoint(sphere, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyBoundingSphere(out:BoundingSphere, source:BoundingSphere):Void {
#if hl
	flight._hl._fn.Geometry.copyBoundingSphere(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyBoundingSphere(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyBoundingSphere(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getClosestPointOnBoundingSphere(out:Vector3, sphere:BoundingSphere, point:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.getClosestPointOnBoundingSphere(out, sphere, point);
#elseif cpp
	flight._cpp._fn.Geometry.getClosestPointOnBoundingSphere(out, sphere, point);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getClosestPointOnBoundingSphere(out, sphere, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isBoundingSphereIntersectingBoundingSphere(a:BoundingSphere, b:BoundingSphere):Bool {
#if hl
	return flight._hl._fn.Geometry.isBoundingSphereIntersectingBoundingSphere(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.isBoundingSphereIntersectingBoundingSphere(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isBoundingSphereIntersectingBoundingSphere(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function mergeBoundingSphere(out:BoundingSphere, a:BoundingSphere, b:BoundingSphere):Void {
#if hl
	flight._hl._fn.Geometry.mergeBoundingSphere(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.mergeBoundingSphere(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.mergeBoundingSphere(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setBoundingSphere(out:BoundingSphere, centerX:Float, centerY:Float, centerZ:Float, radius:Float):Void {
#if hl
	flight._hl._fn.Geometry.setBoundingSphere(out, centerX, centerY, centerZ, radius);
#elseif cpp
	flight._cpp._fn.Geometry.setBoundingSphere(out, centerX, centerY, centerZ, radius);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setBoundingSphere(out, centerX, centerY, centerZ, radius);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setBoundingSphereFromAabb(out:BoundingSphere, aabb:Aabb):Void {
#if hl
	flight._hl._fn.Geometry.setBoundingSphereFromAabb(out, aabb);
#elseif cpp
	flight._cpp._fn.Geometry.setBoundingSphereFromAabb(out, aabb);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setBoundingSphereFromAabb(out, aabb);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function transformBoundingSphereByMatrix4(out:BoundingSphere, sphere:BoundingSphere, m:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.transformBoundingSphereByMatrix4(out, sphere, m);
#elseif cpp
	flight._cpp._fn.Geometry.transformBoundingSphereByMatrix4(out, sphere, m);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.transformBoundingSphereByMatrix4(out, sphere, m);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createCapsule(startX:Float, startY:Float, startZ:Float, endX:Float, endY:Float, endZ:Float, radius:Float):Capsule {
#if hl
	return flight._hl._fn.Geometry.createCapsule(startX, startY, startZ, endX, endY, endZ, radius);
#elseif cpp
	return flight._cpp._fn.Geometry.createCapsule(startX, startY, startZ, endX, endY, endZ, radius);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createCapsule(startX, startY, startZ, endX, endY, endZ, radius);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getClosestPointOnCapsule(out:Vector3, capsule:Capsule, point:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.getClosestPointOnCapsule(out, capsule, point);
#elseif cpp
	flight._cpp._fn.Geometry.getClosestPointOnCapsule(out, capsule, point);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getClosestPointOnCapsule(out, capsule, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function intersectRay3dCapsule(ray:Ray3D, capsule:Capsule):Float {
#if hl
	return flight._hl._fn.Geometry.intersectRay3dCapsule(ray, capsule);
#elseif cpp
	return flight._cpp._fn.Geometry.intersectRay3dCapsule(ray, capsule);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.intersectRay3dCapsule(ray, capsule);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isCapsuleIntersectingAabb(capsule:Capsule, aabb:Aabb):Bool {
#if hl
	return flight._hl._fn.Geometry.isCapsuleIntersectingAabb(capsule, aabb);
#elseif cpp
	return flight._cpp._fn.Geometry.isCapsuleIntersectingAabb(capsule, aabb);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isCapsuleIntersectingAabb(capsule, aabb);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isCapsuleIntersectingCapsule(a:Capsule, b:Capsule):Bool {
#if hl
	return flight._hl._fn.Geometry.isCapsuleIntersectingCapsule(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.isCapsuleIntersectingCapsule(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isCapsuleIntersectingCapsule(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isCapsuleIntersectingSphere(capsule:Capsule, sphere:BoundingSphere):Bool {
#if hl
	return flight._hl._fn.Geometry.isCapsuleIntersectingSphere(capsule, sphere);
#elseif cpp
	return flight._cpp._fn.Geometry.isCapsuleIntersectingSphere(capsule, sphere);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isCapsuleIntersectingSphere(capsule, sphere);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setCapsule(out:Capsule, startX:Float, startY:Float, startZ:Float, endX:Float, endY:Float, endZ:Float, radius:Float):Void {
#if hl
	flight._hl._fn.Geometry.setCapsule(out, startX, startY, startZ, endX, endY, endZ, radius);
#elseif cpp
	flight._cpp._fn.Geometry.setCapsule(out, startX, startY, startZ, endX, endY, endZ, radius);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setCapsule(out, startX, startY, startZ, endX, endY, endZ, radius);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function areGeometryPoolGuardsEnabled():Bool {
#if hl
	return flight._hl._fn.Geometry.areGeometryPoolGuardsEnabled();
#elseif cpp
	return flight._cpp._fn.Geometry.areGeometryPoolGuardsEnabled();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.areGeometryPoolGuardsEnabled();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function disableGeometryPoolGuards():Void {
#if hl
	flight._hl._fn.Geometry.disableGeometryPoolGuards();
#elseif cpp
	flight._cpp._fn.Geometry.disableGeometryPoolGuards();
#elseif (js && flight_esm)
	flight._js._fn.Geometry.disableGeometryPoolGuards();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function enableGeometryPoolGuards(logState:Dynamic, clockFn:Dynamic, clockCtx:Dynamic):Void {
#if hl
	flight._hl._fn.Geometry.enableGeometryPoolGuards(logState, clockFn, clockCtx);
#elseif cpp
	flight._cpp._fn.Geometry.enableGeometryPoolGuards(logState, clockFn, clockCtx);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.enableGeometryPoolGuards(logState, clockFn, clockCtx);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createFrustum():Frustum {
#if hl
	return flight._hl._fn.Geometry.createFrustum();
#elseif cpp
	return flight._cpp._fn.Geometry.createFrustum();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createFrustum();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getFrustumCorners(out:Dynamic, outLen:Int, inverseViewProjection:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.getFrustumCorners(out, outLen, inverseViewProjection);
#elseif cpp
	flight._cpp._fn.Geometry.getFrustumCorners(out, outLen, inverseViewProjection);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getFrustumCorners(out, outLen, inverseViewProjection);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isFrustumContainingPoint(frustum:Frustum, point:Vector3):Bool {
#if hl
	return flight._hl._fn.Geometry.isFrustumContainingPoint(frustum, point);
#elseif cpp
	return flight._cpp._fn.Geometry.isFrustumContainingPoint(frustum, point);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isFrustumContainingPoint(frustum, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isFrustumIntersectingAabb(frustum:Frustum, aabb:Aabb):Bool {
#if hl
	return flight._hl._fn.Geometry.isFrustumIntersectingAabb(frustum, aabb);
#elseif cpp
	return flight._cpp._fn.Geometry.isFrustumIntersectingAabb(frustum, aabb);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isFrustumIntersectingAabb(frustum, aabb);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isFrustumIntersectingObb(frustum:Frustum, obb:Obb):Bool {
#if hl
	return flight._hl._fn.Geometry.isFrustumIntersectingObb(frustum, obb);
#elseif cpp
	return flight._cpp._fn.Geometry.isFrustumIntersectingObb(frustum, obb);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isFrustumIntersectingObb(frustum, obb);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isFrustumIntersectingSphere(frustum:Frustum, sphere:BoundingSphere):Bool {
#if hl
	return flight._hl._fn.Geometry.isFrustumIntersectingSphere(frustum, sphere);
#elseif cpp
	return flight._cpp._fn.Geometry.isFrustumIntersectingSphere(frustum, sphere);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isFrustumIntersectingSphere(frustum, sphere);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setFrustumFromMatrix4(out:Frustum, viewProjection:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.setFrustumFromMatrix4(out, viewProjection);
#elseif cpp
	flight._cpp._fn.Geometry.setFrustumFromMatrix4(out, viewProjection);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setFrustumFromMatrix4(out, viewProjection);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createGradientTransformMatrix(width:Float, height:Float, rotation:Float, tx:Float, ty:Float):Matrix {
#if hl
	return flight._hl._fn.Geometry.createGradientTransformMatrix(width, height, rotation, tx, ty);
#elseif cpp
	return flight._cpp._fn.Geometry.createGradientTransformMatrix(width, height, rotation, tx, ty);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createGradientTransformMatrix(width, height, rotation, tx, ty);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createMatrix(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Matrix {
#if hl
	return flight._hl._fn.Geometry.createMatrix(a, b, c, d, tx, ty);
#elseif cpp
	return flight._cpp._fn.Geometry.createMatrix(a, b, c, d, tx, ty);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createMatrix(a, b, c, d, tx, ty);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createTransformMatrix(scaleX:Float, scaleY:Float, rotation:Float, tx:Float, ty:Float):Matrix {
#if hl
	return flight._hl._fn.Geometry.createTransformMatrix(scaleX, scaleY, rotation, tx, ty);
#elseif cpp
	return flight._cpp._fn.Geometry.createTransformMatrix(scaleX, scaleY, rotation, tx, ty);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createTransformMatrix(scaleX, scaleY, rotation, tx, ty);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function cloneMatrix(source:Matrix):Matrix {
#if hl
	return flight._hl._fn.Geometry.cloneMatrix(source);
#elseif cpp
	return flight._cpp._fn.Geometry.cloneMatrix(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.cloneMatrix(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrix(out:Matrix, source:Matrix):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrix(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrix(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrix(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrixColumnFromVector3(out:Matrix, column:Int, source:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrixColumnFromVector3(out, column, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrixColumnFromVector3(out, column, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrixColumnFromVector3(out, column, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrixColumnToVector3(out:Vector3, column:Int, source:Matrix):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrixColumnToVector3(out, column, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrixColumnToVector3(out, column, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrixColumnToVector3(out, column, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrixRowFromVector3(out:Matrix, row:Int, source:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrixRowFromVector3(out, row, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrixRowFromVector3(out, row, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrixRowFromVector3(out, row, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrixRowToVector3(out:Vector3, row:Int, source:Matrix):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrixRowToVector3(out, row, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrixRowToVector3(out, row, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrixRowToVector3(out, row, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function equalsMatrix(a:Matrix, b:Matrix, compareTranslation:Bool):Bool {
#if hl
	return flight._hl._fn.Geometry.equalsMatrix(a, b, compareTranslation);
#elseif cpp
	return flight._cpp._fn.Geometry.equalsMatrix(a, b, compareTranslation);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.equalsMatrix(a, b, compareTranslation);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function inverseMatrix(out:Matrix, source:Matrix):Bool {
#if hl
	return flight._hl._fn.Geometry.inverseMatrix(out, source);
#elseif cpp
	return flight._cpp._fn.Geometry.inverseMatrix(out, source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.inverseMatrix(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function inverseMatrixTransformPoint(out:Vector2, matrix:Matrix, point:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.inverseMatrixTransformPoint(out, matrix, point);
#elseif cpp
	flight._cpp._fn.Geometry.inverseMatrixTransformPoint(out, matrix, point);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.inverseMatrixTransformPoint(out, matrix, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function inverseMatrixTransformPointXy(out:Vector2, source:Matrix, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Geometry.inverseMatrixTransformPointXy(out, source, x, y);
#elseif cpp
	flight._cpp._fn.Geometry.inverseMatrixTransformPointXy(out, source, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.inverseMatrixTransformPointXy(out, source, x, y);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function inverseMatrixTransformVector(out:Vector2, matrix:Matrix, vector:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.inverseMatrixTransformVector(out, matrix, vector);
#elseif cpp
	flight._cpp._fn.Geometry.inverseMatrixTransformVector(out, matrix, vector);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.inverseMatrixTransformVector(out, matrix, vector);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function inverseMatrixTransformVectorXy(out:Vector2, source:Matrix, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Geometry.inverseMatrixTransformVectorXy(out, source, x, y);
#elseif cpp
	flight._cpp._fn.Geometry.inverseMatrixTransformVectorXy(out, source, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.inverseMatrixTransformVectorXy(out, source, x, y);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function matrixTransformBounds(out:Rectangle, source:Matrix, ax:Float, ay:Float, bx:Float, by:Float):Void {
#if hl
	flight._hl._fn.Geometry.matrixTransformBounds(out, source, ax, ay, bx, by);
#elseif cpp
	flight._cpp._fn.Geometry.matrixTransformBounds(out, source, ax, ay, bx, by);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.matrixTransformBounds(out, source, ax, ay, bx, by);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function matrixTransformBoundsVector2(out:Rectangle, matrix:Matrix, a:Vector2, b:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.matrixTransformBoundsVector2(out, matrix, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.matrixTransformBoundsVector2(out, matrix, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.matrixTransformBoundsVector2(out, matrix, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function matrixTransformPoint(out:Vector2, matrix:Matrix, point:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.matrixTransformPoint(out, matrix, point);
#elseif cpp
	flight._cpp._fn.Geometry.matrixTransformPoint(out, matrix, point);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.matrixTransformPoint(out, matrix, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function matrixTransformPointXy(out:Vector2, source:Matrix, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Geometry.matrixTransformPointXy(out, source, x, y);
#elseif cpp
	flight._cpp._fn.Geometry.matrixTransformPointXy(out, source, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.matrixTransformPointXy(out, source, x, y);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function matrixTransformRectangle(out:Rectangle, matrix:Matrix, source:Rectangle):Void {
#if hl
	flight._hl._fn.Geometry.matrixTransformRectangle(out, matrix, source);
#elseif cpp
	flight._cpp._fn.Geometry.matrixTransformRectangle(out, matrix, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.matrixTransformRectangle(out, matrix, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function matrixTransformVector(out:Vector2, matrix:Matrix, vector:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.matrixTransformVector(out, matrix, vector);
#elseif cpp
	flight._cpp._fn.Geometry.matrixTransformVector(out, matrix, vector);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.matrixTransformVector(out, matrix, vector);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function matrixTransformVectorXy(out:Vector2, source:Matrix, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Geometry.matrixTransformVectorXy(out, source, x, y);
#elseif cpp
	flight._cpp._fn.Geometry.matrixTransformVectorXy(out, source, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.matrixTransformVectorXy(out, source, x, y);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function multiplyMatrix(out:Matrix, a:Matrix, b:Matrix):Void {
#if hl
	flight._hl._fn.Geometry.multiplyMatrix(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.multiplyMatrix(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.multiplyMatrix(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function rotateMatrix(out:Matrix, source:Matrix, theta:Float):Void {
#if hl
	flight._hl._fn.Geometry.rotateMatrix(out, source, theta);
#elseif cpp
	flight._cpp._fn.Geometry.rotateMatrix(out, source, theta);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.rotateMatrix(out, source, theta);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function scaleMatrix(out:Matrix, source:Matrix, sx:Float, sy:Float):Void {
#if hl
	flight._hl._fn.Geometry.scaleMatrix(out, source, sx, sy);
#elseif cpp
	flight._cpp._fn.Geometry.scaleMatrix(out, source, sx, sy);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.scaleMatrix(out, source, sx, sy);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setGradientTransformMatrix(out:Matrix, width:Float, height:Float, rotation:Float, tx:Float, ty:Float):Void {
#if hl
	flight._hl._fn.Geometry.setGradientTransformMatrix(out, width, height, rotation, tx, ty);
#elseif cpp
	flight._cpp._fn.Geometry.setGradientTransformMatrix(out, width, height, rotation, tx, ty);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setGradientTransformMatrix(out, width, height, rotation, tx, ty);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix(out:Matrix, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix(out, a, b, c, d, tx, ty);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix(out, a, b, c, d, tx, ty);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix(out, a, b, c, d, tx, ty);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrixFromFloat32Array(out:Matrix, offset:Int, source:Dynamic, sourceLen:Int):Void {
#if hl
	flight._hl._fn.Geometry.setMatrixFromFloat32Array(out, offset, source, sourceLen);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrixFromFloat32Array(out, offset, source, sourceLen);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrixFromFloat32Array(out, offset, source, sourceLen);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrixFromMatrix3(out:Matrix, source:Matrix3):Void {
#if hl
	flight._hl._fn.Geometry.setMatrixFromMatrix3(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrixFromMatrix3(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrixFromMatrix3(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrixFromMatrix4(out:Matrix, source:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.setMatrixFromMatrix4(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrixFromMatrix4(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrixFromMatrix4(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrixIdentity(out:Matrix):Void {
#if hl
	flight._hl._fn.Geometry.setMatrixIdentity(out);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrixIdentity(out);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrixIdentity(out);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setTransformMatrix(out:Matrix, scaleX:Float, scaleY:Float, rotation:Float, tx:Float, ty:Float):Void {
#if hl
	flight._hl._fn.Geometry.setTransformMatrix(out, scaleX, scaleY, rotation, tx, ty);
#elseif cpp
	flight._cpp._fn.Geometry.setTransformMatrix(out, scaleX, scaleY, rotation, tx, ty);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setTransformMatrix(out, scaleX, scaleY, rotation, tx, ty);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function translateMatrix(out:Matrix, source:Matrix, dx:Float, dy:Float):Void {
#if hl
	flight._hl._fn.Geometry.translateMatrix(out, source, dx, dy);
#elseif cpp
	flight._cpp._fn.Geometry.translateMatrix(out, source, dx, dy);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.translateMatrix(out, source, dx, dy);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function translateMatrixByVector(out:Matrix, matrix:Matrix, vector:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.translateMatrixByVector(out, matrix, vector);
#elseif cpp
	flight._cpp._fn.Geometry.translateMatrixByVector(out, matrix, vector);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.translateMatrixByVector(out, matrix, vector);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function translateMatrixByVectorXy(out:Matrix, source:Matrix, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Geometry.translateMatrixByVectorXy(out, source, x, y);
#elseif cpp
	flight._cpp._fn.Geometry.translateMatrixByVectorXy(out, source, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.translateMatrixByVectorXy(out, source, x, y);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function writeMatrixToFloat32Array(out:Dynamic, outLen:Int, offset:Int, source:Matrix):Void {
#if hl
	flight._hl._fn.Geometry.writeMatrixToFloat32Array(out, outLen, offset, source);
#elseif cpp
	flight._cpp._fn.Geometry.writeMatrixToFloat32Array(out, outLen, offset, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.writeMatrixToFloat32Array(out, outLen, offset, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createMatrix3():Matrix3 {
#if hl
	return flight._hl._fn.Geometry.createMatrix3();
#elseif cpp
	return flight._cpp._fn.Geometry.createMatrix3();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createMatrix3();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createMatrix3FromValues(m00:Float, m01:Float, m02:Float, m10:Float, m11:Float, m12:Float, m20:Float, m21:Float, m22:Float):Matrix3 {
#if hl
	return flight._hl._fn.Geometry.createMatrix3FromValues(m00, m01, m02, m10, m11, m12, m20, m21, m22);
#elseif cpp
	return flight._cpp._fn.Geometry.createMatrix3FromValues(m00, m01, m02, m10, m11, m12, m20, m21, m22);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createMatrix3FromValues(m00, m01, m02, m10, m11, m12, m20, m21, m22);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function cloneMatrix3(source:Matrix3):Matrix3 {
#if hl
	return flight._hl._fn.Geometry.cloneMatrix3(source);
#elseif cpp
	return flight._cpp._fn.Geometry.cloneMatrix3(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.cloneMatrix3(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrix3(out:Matrix3, source:Matrix3):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrix3(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrix3(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrix3(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrix3ColumnFromVector3(out:Matrix3, column:Int, source:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrix3ColumnFromVector3(out, column, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrix3ColumnFromVector3(out, column, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrix3ColumnFromVector3(out, column, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrix3ColumnToVector3(out:Vector3, column:Int, source:Matrix3):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrix3ColumnToVector3(out, column, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrix3ColumnToVector3(out, column, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrix3ColumnToVector3(out, column, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrix3RowFromVector3(out:Matrix3, row:Int, source:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrix3RowFromVector3(out, row, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrix3RowFromVector3(out, row, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrix3RowFromVector3(out, row, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrix3RowToVector3(out:Vector3, row:Int, source:Matrix3):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrix3RowToVector3(out, row, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrix3RowToVector3(out, row, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrix3RowToVector3(out, row, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function equalsMatrix3(a:Matrix3, b:Matrix3):Bool {
#if hl
	return flight._hl._fn.Geometry.equalsMatrix3(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.equalsMatrix3(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.equalsMatrix3(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getMatrix3Determinant(source:Matrix3):Float {
#if hl
	return flight._hl._fn.Geometry.getMatrix3Determinant(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getMatrix3Determinant(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getMatrix3Determinant(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getMatrix3Element(source:Matrix3, row:Int, column:Int):Float {
#if hl
	return flight._hl._fn.Geometry.getMatrix3Element(source, row, column);
#elseif cpp
	return flight._cpp._fn.Geometry.getMatrix3Element(source, row, column);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getMatrix3Element(source, row, column);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function inverseMatrix3(out:Matrix3, source:Matrix3):Bool {
#if hl
	return flight._hl._fn.Geometry.inverseMatrix3(out, source);
#elseif cpp
	return flight._cpp._fn.Geometry.inverseMatrix3(out, source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.inverseMatrix3(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isAffineMatrix3(source:Matrix3):Bool {
#if hl
	return flight._hl._fn.Geometry.isAffineMatrix3(source);
#elseif cpp
	return flight._cpp._fn.Geometry.isAffineMatrix3(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isAffineMatrix3(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function multiplyMatrix3(out:Matrix3, a:Matrix3, b:Matrix3):Void {
#if hl
	flight._hl._fn.Geometry.multiplyMatrix3(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.multiplyMatrix3(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.multiplyMatrix3(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function rotateMatrix3(out:Matrix3, source:Matrix3, theta:Float):Void {
#if hl
	flight._hl._fn.Geometry.rotateMatrix3(out, source, theta);
#elseif cpp
	flight._cpp._fn.Geometry.rotateMatrix3(out, source, theta);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.rotateMatrix3(out, source, theta);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function scaleMatrix3(out:Matrix3, source:Matrix3, sx:Float, sy:Float):Void {
#if hl
	flight._hl._fn.Geometry.scaleMatrix3(out, source, sx, sy);
#elseif cpp
	flight._cpp._fn.Geometry.scaleMatrix3(out, source, sx, sy);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.scaleMatrix3(out, source, sx, sy);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix3(out:Matrix3, m00:Float, m01:Float, m02:Float, m10:Float, m11:Float, m12:Float, m20:Float, m21:Float, m22:Float):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix3(out, m00, m01, m02, m10, m11, m12, m20, m21, m22);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix3(out, m00, m01, m02, m10, m11, m12, m20, m21, m22);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix3(out, m00, m01, m02, m10, m11, m12, m20, m21, m22);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix3Element(out:Matrix3, row:Int, column:Int, value:Float):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix3Element(out, row, column, value);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix3Element(out, row, column, value);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix3Element(out, row, column, value);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix3FromFloat32Array(out:Matrix3, offset:Int, source:Dynamic, sourceLen:Int):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix3FromFloat32Array(out, offset, source, sourceLen);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix3FromFloat32Array(out, offset, source, sourceLen);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix3FromFloat32Array(out, offset, source, sourceLen);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix3FromMatrix(out:Matrix3, source:Matrix):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix3FromMatrix(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix3FromMatrix(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix3FromMatrix(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix3FromMatrix4(out:Matrix3, source:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix3FromMatrix4(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix3FromMatrix4(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix3FromMatrix4(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix3Identity(out:Matrix3):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix3Identity(out);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix3Identity(out);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix3Identity(out);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix3NormalFromMatrix4(out:Matrix3, source:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix3NormalFromMatrix4(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix3NormalFromMatrix4(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix3NormalFromMatrix4(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function translateMatrix3(out:Matrix3, source:Matrix3, tx:Float, ty:Float):Void {
#if hl
	flight._hl._fn.Geometry.translateMatrix3(out, source, tx, ty);
#elseif cpp
	flight._cpp._fn.Geometry.translateMatrix3(out, source, tx, ty);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.translateMatrix3(out, source, tx, ty);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function transposeMatrix3(out:Matrix3, source:Matrix3):Void {
#if hl
	flight._hl._fn.Geometry.transposeMatrix3(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.transposeMatrix3(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.transposeMatrix3(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function writeMatrix3ToFloat32Array(out:Dynamic, outLen:Int, offset:Int, source:Matrix3):Void {
#if hl
	flight._hl._fn.Geometry.writeMatrix3ToFloat32Array(out, outLen, offset, source);
#elseif cpp
	flight._cpp._fn.Geometry.writeMatrix3ToFloat32Array(out, outLen, offset, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.writeMatrix3ToFloat32Array(out, outLen, offset, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireIdentityMatrix3():Matrix3 {
#if hl
	return flight._hl._fn.Geometry.acquireIdentityMatrix3();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireIdentityMatrix3();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireIdentityMatrix3();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireMatrix3():Matrix3 {
#if hl
	return flight._hl._fn.Geometry.acquireMatrix3();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireMatrix3();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireMatrix3();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function clearMatrix3Pool():Void {
#if hl
	flight._hl._fn.Geometry.clearMatrix3Pool();
#elseif cpp
	flight._cpp._fn.Geometry.clearMatrix3Pool();
#elseif (js && flight_esm)
	flight._js._fn.Geometry.clearMatrix3Pool();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function releaseMatrix3(m:Matrix3):Void {
#if hl
	flight._hl._fn.Geometry.releaseMatrix3(m);
#elseif cpp
	flight._cpp._fn.Geometry.releaseMatrix3(m);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.releaseMatrix3(m);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createMatrix4():Matrix4 {
#if hl
	return flight._hl._fn.Geometry.createMatrix4();
#elseif cpp
	return flight._cpp._fn.Geometry.createMatrix4();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createMatrix4();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createMatrix4From2d(a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Matrix4 {
#if hl
	return flight._hl._fn.Geometry.createMatrix4From2d(a, b, c, d, tx, ty);
#elseif cpp
	return flight._cpp._fn.Geometry.createMatrix4From2d(a, b, c, d, tx, ty);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createMatrix4From2d(a, b, c, d, tx, ty);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createMatrix4FromValues(m00:Float, m01:Float, m02:Float, m03:Float, m10:Float, m11:Float, m12:Float, m13:Float, m20:Float, m21:Float, m22:Float, m23:Float, m30:Float, m31:Float, m32:Float, m33:Float):Matrix4 {
#if hl
	return flight._hl._fn.Geometry.createMatrix4FromValues(m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33);
#elseif cpp
	return flight._cpp._fn.Geometry.createMatrix4FromValues(m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createMatrix4FromValues(m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createOrthographicMatrix4(left:Float, right:Float, bottom:Float, top:Float, zNear:Float, zFar:Float):Matrix4 {
#if hl
	return flight._hl._fn.Geometry.createOrthographicMatrix4(left, right, bottom, top, zNear, zFar);
#elseif cpp
	return flight._cpp._fn.Geometry.createOrthographicMatrix4(left, right, bottom, top, zNear, zFar);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createOrthographicMatrix4(left, right, bottom, top, zNear, zFar);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createPerspectiveMatrix4(tanHalfFovY:Float, aspect:Float, zNear:Float, zFar:Float):Matrix4 {
#if hl
	return flight._hl._fn.Geometry.createPerspectiveMatrix4(tanHalfFovY, aspect, zNear, zFar);
#elseif cpp
	return flight._cpp._fn.Geometry.createPerspectiveMatrix4(tanHalfFovY, aspect, zNear, zFar);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createPerspectiveMatrix4(tanHalfFovY, aspect, zNear, zFar);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function appendMatrix4(out:Matrix4, source:Matrix4, other:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.appendMatrix4(out, source, other);
#elseif cpp
	flight._cpp._fn.Geometry.appendMatrix4(out, source, other);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.appendMatrix4(out, source, other);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function appendRotationMatrix4(out:Matrix4, source:Matrix4, radians:Float, axis:Vector4, pivotPoint:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.appendRotationMatrix4(out, source, radians, axis, pivotPoint);
#elseif cpp
	flight._cpp._fn.Geometry.appendRotationMatrix4(out, source, radians, axis, pivotPoint);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.appendRotationMatrix4(out, source, radians, axis, pivotPoint);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function appendScaleMatrix4(out:Matrix4, source:Matrix4, xScale:Float, yScale:Float, zScale:Float):Void {
#if hl
	flight._hl._fn.Geometry.appendScaleMatrix4(out, source, xScale, yScale, zScale);
#elseif cpp
	flight._cpp._fn.Geometry.appendScaleMatrix4(out, source, xScale, yScale, zScale);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.appendScaleMatrix4(out, source, xScale, yScale, zScale);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function appendTranslationMatrix4(out:Matrix4, source:Matrix4, x:Float, y:Float, z:Float):Void {
#if hl
	flight._hl._fn.Geometry.appendTranslationMatrix4(out, source, x, y, z);
#elseif cpp
	flight._cpp._fn.Geometry.appendTranslationMatrix4(out, source, x, y, z);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.appendTranslationMatrix4(out, source, x, y, z);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function cloneMatrix4(source:Matrix4):Matrix4 {
#if hl
	return flight._hl._fn.Geometry.cloneMatrix4(source);
#elseif cpp
	return flight._cpp._fn.Geometry.cloneMatrix4(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.cloneMatrix4(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function composeMatrix4(out:Matrix4, position:Vector3, rotation:Quaternion, scale:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.composeMatrix4(out, position, rotation, scale);
#elseif cpp
	flight._cpp._fn.Geometry.composeMatrix4(out, position, rotation, scale);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.composeMatrix4(out, position, rotation, scale);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrix4(out:Matrix4, source:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrix4(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrix4(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrix4(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrix4ColumnFromVector4(out:Matrix4, column:Int, source:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrix4ColumnFromVector4(out, column, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrix4ColumnFromVector4(out, column, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrix4ColumnFromVector4(out, column, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrix4ColumnToVector4(out:Vector4, column:Int, source:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrix4ColumnToVector4(out, column, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrix4ColumnToVector4(out, column, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrix4ColumnToVector4(out, column, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrix4RowFromVector4(out:Matrix4, row:Int, source:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrix4RowFromVector4(out, row, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrix4RowFromVector4(out, row, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrix4RowFromVector4(out, row, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyMatrix4RowToVector4(out:Vector4, row:Int, source:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.copyMatrix4RowToVector4(out, row, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyMatrix4RowToVector4(out, row, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyMatrix4RowToVector4(out, row, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function decomposeMatrix4(outPosition:Vector3, outRotation:Quaternion, outScale:Vector3, m:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.decomposeMatrix4(outPosition, outRotation, outScale, m);
#elseif cpp
	flight._cpp._fn.Geometry.decomposeMatrix4(outPosition, outRotation, outScale, m);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.decomposeMatrix4(outPosition, outRotation, outScale, m);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function equalsMatrix4(a:Matrix4, b:Matrix4):Bool {
#if hl
	return flight._hl._fn.Geometry.equalsMatrix4(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.equalsMatrix4(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.equalsMatrix4(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getMatrix4Determinant(source:Matrix4):Float {
#if hl
	return flight._hl._fn.Geometry.getMatrix4Determinant(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getMatrix4Determinant(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getMatrix4Determinant(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getMatrix4Element(source:Matrix4, row:Int, column:Int):Float {
#if hl
	return flight._hl._fn.Geometry.getMatrix4Element(source, row, column);
#elseif cpp
	return flight._cpp._fn.Geometry.getMatrix4Element(source, row, column);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getMatrix4Element(source, row, column);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getMatrix4Position(out:Vector3, source:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.getMatrix4Position(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.getMatrix4Position(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getMatrix4Position(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function interpolateMatrix4(out:Matrix4, a:Matrix4, b:Matrix4, t:Float):Void {
#if hl
	flight._hl._fn.Geometry.interpolateMatrix4(out, a, b, t);
#elseif cpp
	flight._cpp._fn.Geometry.interpolateMatrix4(out, a, b, t);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.interpolateMatrix4(out, a, b, t);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function inverseMatrix4(out:Matrix4, source:Matrix4):Bool {
#if hl
	return flight._hl._fn.Geometry.inverseMatrix4(out, source);
#elseif cpp
	return flight._cpp._fn.Geometry.inverseMatrix4(out, source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.inverseMatrix4(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isAffineMatrix4(source:Matrix4):Bool {
#if hl
	return flight._hl._fn.Geometry.isAffineMatrix4(source);
#elseif cpp
	return flight._cpp._fn.Geometry.isAffineMatrix4(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isAffineMatrix4(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function matrix4TransformPoint(out:Vector3, source:Matrix4, point:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.matrix4TransformPoint(out, source, point);
#elseif cpp
	flight._cpp._fn.Geometry.matrix4TransformPoint(out, source, point);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.matrix4TransformPoint(out, source, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function matrix4TransformVector(out:Vector4, source:Matrix4, vector:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.matrix4TransformVector(out, source, vector);
#elseif cpp
	flight._cpp._fn.Geometry.matrix4TransformVector(out, source, vector);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.matrix4TransformVector(out, source, vector);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function matrix4TransformVectors(out:Dynamic, outLen:Int, source:Matrix4, vectors:Dynamic, vectorsLen:Int):Void {
#if hl
	flight._hl._fn.Geometry.matrix4TransformVectors(out, outLen, source, vectors, vectorsLen);
#elseif cpp
	flight._cpp._fn.Geometry.matrix4TransformVectors(out, outLen, source, vectors, vectorsLen);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.matrix4TransformVectors(out, outLen, source, vectors, vectorsLen);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function multiplyMatrix4(out:Matrix4, a:Matrix4, b:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.multiplyMatrix4(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.multiplyMatrix4(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.multiplyMatrix4(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function prependMatrix4(out:Matrix4, source:Matrix4, other:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.prependMatrix4(out, source, other);
#elseif cpp
	flight._cpp._fn.Geometry.prependMatrix4(out, source, other);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.prependMatrix4(out, source, other);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function prependRotationMatrix4(out:Matrix4, source:Matrix4, radians:Float, axis:Vector4, pivotPoint:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.prependRotationMatrix4(out, source, radians, axis, pivotPoint);
#elseif cpp
	flight._cpp._fn.Geometry.prependRotationMatrix4(out, source, radians, axis, pivotPoint);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.prependRotationMatrix4(out, source, radians, axis, pivotPoint);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function prependScaleMatrix4(out:Matrix4, source:Matrix4, xScale:Float, yScale:Float, zScale:Float):Void {
#if hl
	flight._hl._fn.Geometry.prependScaleMatrix4(out, source, xScale, yScale, zScale);
#elseif cpp
	flight._cpp._fn.Geometry.prependScaleMatrix4(out, source, xScale, yScale, zScale);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.prependScaleMatrix4(out, source, xScale, yScale, zScale);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function prependTranslationMatrix4(out:Matrix4, source:Matrix4, x:Float, y:Float, z:Float):Void {
#if hl
	flight._hl._fn.Geometry.prependTranslationMatrix4(out, source, x, y, z);
#elseif cpp
	flight._cpp._fn.Geometry.prependTranslationMatrix4(out, source, x, y, z);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.prependTranslationMatrix4(out, source, x, y, z);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function rotateMatrix4(out:Matrix4, source:Matrix4, axis:Vector3, radians:Float):Void {
#if hl
	flight._hl._fn.Geometry.rotateMatrix4(out, source, axis, radians);
#elseif cpp
	flight._cpp._fn.Geometry.rotateMatrix4(out, source, axis, radians);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.rotateMatrix4(out, source, axis, radians);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function scaleMatrix4(out:Matrix4, source:Matrix4, sx:Float, sy:Float, sz:Float):Void {
#if hl
	flight._hl._fn.Geometry.scaleMatrix4(out, source, sx, sy, sz);
#elseif cpp
	flight._cpp._fn.Geometry.scaleMatrix4(out, source, sx, sy, sz);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.scaleMatrix4(out, source, sx, sy, sz);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix4(out:Matrix4, m00:Float, m01:Float, m02:Float, m03:Float, m10:Float, m11:Float, m12:Float, m13:Float, m20:Float, m21:Float, m22:Float, m23:Float, m30:Float, m31:Float, m32:Float, m33:Float):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix4(out, m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix4(out, m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix4(out, m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23, m30, m31, m32, m33);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix4Element(out:Matrix4, row:Int, column:Int, value:Float):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix4Element(out, row, column, value);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix4Element(out, row, column, value);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix4Element(out, row, column, value);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix4From2d(out:Matrix4, a:Float, b:Float, c:Float, d:Float, tx:Float, ty:Float):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix4From2d(out, a, b, c, d, tx, ty);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix4From2d(out, a, b, c, d, tx, ty);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix4From2d(out, a, b, c, d, tx, ty);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix4FromFloat32Array(out:Matrix4, offset:Int, source:Dynamic, sourceLen:Int):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix4FromFloat32Array(out, offset, source, sourceLen);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix4FromFloat32Array(out, offset, source, sourceLen);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix4FromFloat32Array(out, offset, source, sourceLen);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix4FromMatrix(out:Matrix4, source:Matrix):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix4FromMatrix(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix4FromMatrix(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix4FromMatrix(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix4FromMatrix3(out:Matrix4, source:Matrix3):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix4FromMatrix3(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix4FromMatrix3(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix4FromMatrix3(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix4FromQuaternion(out:Matrix4, source:Quaternion):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix4FromQuaternion(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix4FromQuaternion(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix4FromQuaternion(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix4Identity(out:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix4Identity(out);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix4Identity(out);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix4Identity(out);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix4LookAt(out:Matrix4, eye:Vector3, target:Vector3, up:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix4LookAt(out, eye, target, up);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix4LookAt(out, eye, target, up);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix4LookAt(out, eye, target, up);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setMatrix4Position(out:Matrix4, source:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.setMatrix4Position(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.setMatrix4Position(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setMatrix4Position(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setOrthographicMatrix4(out:Matrix4, left:Float, right:Float, bottom:Float, top:Float, zNear:Float, zFar:Float):Void {
#if hl
	flight._hl._fn.Geometry.setOrthographicMatrix4(out, left, right, bottom, top, zNear, zFar);
#elseif cpp
	flight._cpp._fn.Geometry.setOrthographicMatrix4(out, left, right, bottom, top, zNear, zFar);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setOrthographicMatrix4(out, left, right, bottom, top, zNear, zFar);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setPerspectiveMatrix4(out:Matrix4, tanHalfFovY:Float, aspect:Float, zNear:Float, zFar:Float):Void {
#if hl
	flight._hl._fn.Geometry.setPerspectiveMatrix4(out, tanHalfFovY, aspect, zNear, zFar);
#elseif cpp
	flight._cpp._fn.Geometry.setPerspectiveMatrix4(out, tanHalfFovY, aspect, zNear, zFar);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setPerspectiveMatrix4(out, tanHalfFovY, aspect, zNear, zFar);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function translateMatrix4(out:Matrix4, source:Matrix4, tx:Float, ty:Float, tz:Float):Void {
#if hl
	flight._hl._fn.Geometry.translateMatrix4(out, source, tx, ty, tz);
#elseif cpp
	flight._cpp._fn.Geometry.translateMatrix4(out, source, tx, ty, tz);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.translateMatrix4(out, source, tx, ty, tz);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function transposeMatrix4(out:Matrix4, source:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.transposeMatrix4(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.transposeMatrix4(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.transposeMatrix4(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function writeMatrix4ToFloat32Array(out:Dynamic, outLen:Int, offset:Int, source:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.writeMatrix4ToFloat32Array(out, outLen, offset, source);
#elseif cpp
	flight._cpp._fn.Geometry.writeMatrix4ToFloat32Array(out, outLen, offset, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.writeMatrix4ToFloat32Array(out, outLen, offset, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireIdentityMatrix4():Matrix4 {
#if hl
	return flight._hl._fn.Geometry.acquireIdentityMatrix4();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireIdentityMatrix4();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireIdentityMatrix4();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireMatrix4():Matrix4 {
#if hl
	return flight._hl._fn.Geometry.acquireMatrix4();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireMatrix4();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireMatrix4();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function clearMatrix4Pool():Void {
#if hl
	flight._hl._fn.Geometry.clearMatrix4Pool();
#elseif cpp
	flight._cpp._fn.Geometry.clearMatrix4Pool();
#elseif (js && flight_esm)
	flight._js._fn.Geometry.clearMatrix4Pool();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function releaseMatrix4(m:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.releaseMatrix4(m);
#elseif cpp
	flight._cpp._fn.Geometry.releaseMatrix4(m);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.releaseMatrix4(m);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireIdentityMatrix():Matrix {
#if hl
	return flight._hl._fn.Geometry.acquireIdentityMatrix();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireIdentityMatrix();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireIdentityMatrix();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireMatrix():Matrix {
#if hl
	return flight._hl._fn.Geometry.acquireMatrix();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireMatrix();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireMatrix();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function clearMatrixPool():Void {
#if hl
	flight._hl._fn.Geometry.clearMatrixPool();
#elseif cpp
	flight._cpp._fn.Geometry.clearMatrixPool();
#elseif (js && flight_esm)
	flight._js._fn.Geometry.clearMatrixPool();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function releaseMatrix(m:Matrix):Void {
#if hl
	flight._hl._fn.Geometry.releaseMatrix(m);
#elseif cpp
	flight._cpp._fn.Geometry.releaseMatrix(m);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.releaseMatrix(m);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createObb(centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float):Obb {
#if hl
	return flight._hl._fn.Geometry.createObb(centerX, centerY, centerZ, halfExtentX, halfExtentY, halfExtentZ, orientationX, orientationY, orientationZ, orientationW);
#elseif cpp
	return flight._cpp._fn.Geometry.createObb(centerX, centerY, centerZ, halfExtentX, halfExtentY, halfExtentZ, orientationX, orientationY, orientationZ, orientationW);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createObb(centerX, centerY, centerZ, halfExtentX, halfExtentY, halfExtentZ, orientationX, orientationY, orientationZ, orientationW);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getClosestPointOnObb(out:Vector3, obb:Obb, point:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.getClosestPointOnObb(out, obb, point);
#elseif cpp
	flight._cpp._fn.Geometry.getClosestPointOnObb(out, obb, point);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getClosestPointOnObb(out, obb, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function intersectRay3dObb(ray:Ray3D, obb:Obb):Float {
#if hl
	return flight._hl._fn.Geometry.intersectRay3dObb(ray, obb);
#elseif cpp
	return flight._cpp._fn.Geometry.intersectRay3dObb(ray, obb);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.intersectRay3dObb(ray, obb);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isObbIntersectingAabb(obb:Obb, aabb:Aabb):Bool {
#if hl
	return flight._hl._fn.Geometry.isObbIntersectingAabb(obb, aabb);
#elseif cpp
	return flight._cpp._fn.Geometry.isObbIntersectingAabb(obb, aabb);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isObbIntersectingAabb(obb, aabb);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isObbIntersectingObb(a:Obb, b:Obb):Bool {
#if hl
	return flight._hl._fn.Geometry.isObbIntersectingObb(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.isObbIntersectingObb(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isObbIntersectingObb(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isObbIntersectingSphere(obb:Obb, sphere:BoundingSphere):Bool {
#if hl
	return flight._hl._fn.Geometry.isObbIntersectingSphere(obb, sphere);
#elseif cpp
	return flight._cpp._fn.Geometry.isObbIntersectingSphere(obb, sphere);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isObbIntersectingSphere(obb, sphere);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setObb(out:Obb, centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float):Void {
#if hl
	flight._hl._fn.Geometry.setObb(out, centerX, centerY, centerZ, halfExtentX, halfExtentY, halfExtentZ, orientationX, orientationY, orientationZ, orientationW);
#elseif cpp
	flight._cpp._fn.Geometry.setObb(out, centerX, centerY, centerZ, halfExtentX, halfExtentY, halfExtentZ, orientationX, orientationY, orientationZ, orientationW);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setObb(out, centerX, centerY, centerZ, halfExtentX, halfExtentY, halfExtentZ, orientationX, orientationY, orientationZ, orientationW);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function transformObbByMatrix4(out:Obb, obb:Obb, m:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.transformObbByMatrix4(out, obb, m);
#elseif cpp
	flight._cpp._fn.Geometry.transformObbByMatrix4(out, obb, m);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.transformObbByMatrix4(out, obb, m);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createPlane(a:Float, b:Float, c:Float, d:Float):Plane {
#if hl
	return flight._hl._fn.Geometry.createPlane(a, b, c, d);
#elseif cpp
	return flight._cpp._fn.Geometry.createPlane(a, b, c, d);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createPlane(a, b, c, d);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function clonePlane(source:Plane):Plane {
#if hl
	return flight._hl._fn.Geometry.clonePlane(source);
#elseif cpp
	return flight._cpp._fn.Geometry.clonePlane(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.clonePlane(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyPlane(out:Plane, source:Plane):Void {
#if hl
	flight._hl._fn.Geometry.copyPlane(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyPlane(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyPlane(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getClosestPointOnPlane(out:Vector3, plane:Plane, point:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.getClosestPointOnPlane(out, plane, point);
#elseif cpp
	flight._cpp._fn.Geometry.getClosestPointOnPlane(out, plane, point);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getClosestPointOnPlane(out, plane, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getPlaneCoplanarPoint(out:Vector3, plane:Plane):Void {
#if hl
	flight._hl._fn.Geometry.getPlaneCoplanarPoint(out, plane);
#elseif cpp
	flight._cpp._fn.Geometry.getPlaneCoplanarPoint(out, plane);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getPlaneCoplanarPoint(out, plane);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getPlaneSignedDistanceToPoint(plane:Plane, point:Vector3):Float {
#if hl
	return flight._hl._fn.Geometry.getPlaneSignedDistanceToPoint(plane, point);
#elseif cpp
	return flight._cpp._fn.Geometry.getPlaneSignedDistanceToPoint(plane, point);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getPlaneSignedDistanceToPoint(plane, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function normalizePlane(out:Plane, source:Plane):Void {
#if hl
	flight._hl._fn.Geometry.normalizePlane(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.normalizePlane(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.normalizePlane(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function projectVector3OntoPlane(out:Vector3, point:Vector3, plane:Plane):Void {
#if hl
	flight._hl._fn.Geometry.projectVector3OntoPlane(out, point, plane);
#elseif cpp
	flight._cpp._fn.Geometry.projectVector3OntoPlane(out, point, plane);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.projectVector3OntoPlane(out, point, plane);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setPlane(out:Plane, a:Float, b:Float, c:Float, d:Float):Void {
#if hl
	flight._hl._fn.Geometry.setPlane(out, a, b, c, d);
#elseif cpp
	flight._cpp._fn.Geometry.setPlane(out, a, b, c, d);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setPlane(out, a, b, c, d);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setPlaneFromNormalAndPoint(out:Plane, normal:Vector3, point:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.setPlaneFromNormalAndPoint(out, normal, point);
#elseif cpp
	flight._cpp._fn.Geometry.setPlaneFromNormalAndPoint(out, normal, point);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setPlaneFromNormalAndPoint(out, normal, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setPlaneFromPoints(out:Plane, a:Vector3, b:Vector3, c:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.setPlaneFromPoints(out, a, b, c);
#elseif cpp
	flight._cpp._fn.Geometry.setPlaneFromPoints(out, a, b, c);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setPlaneFromPoints(out, a, b, c);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createQuaternion(x:Float, y:Float, z:Float, w:Float):Quaternion {
#if hl
	return flight._hl._fn.Geometry.createQuaternion(x, y, z, w);
#elseif cpp
	return flight._cpp._fn.Geometry.createQuaternion(x, y, z, w);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createQuaternion(x, y, z, w);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function cloneQuaternion(source:Quaternion):Quaternion {
#if hl
	return flight._hl._fn.Geometry.cloneQuaternion(source);
#elseif cpp
	return flight._cpp._fn.Geometry.cloneQuaternion(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.cloneQuaternion(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function conjugateQuaternion(out:Quaternion, source:Quaternion):Void {
#if hl
	flight._hl._fn.Geometry.conjugateQuaternion(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.conjugateQuaternion(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.conjugateQuaternion(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyQuaternion(out:Quaternion, source:Quaternion):Void {
#if hl
	flight._hl._fn.Geometry.copyQuaternion(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyQuaternion(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyQuaternion(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function equalsQuaternion(a:Quaternion, b:Quaternion):Bool {
#if hl
	return flight._hl._fn.Geometry.equalsQuaternion(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.equalsQuaternion(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.equalsQuaternion(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getQuaternionAngleBetween(a:Quaternion, b:Quaternion):Float {
#if hl
	return flight._hl._fn.Geometry.getQuaternionAngleBetween(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.getQuaternionAngleBetween(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getQuaternionAngleBetween(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getQuaternionAxisAngle(outAxis:Vector3, source:Quaternion):Float {
#if hl
	return flight._hl._fn.Geometry.getQuaternionAxisAngle(outAxis, source);
#elseif cpp
	return flight._cpp._fn.Geometry.getQuaternionAxisAngle(outAxis, source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getQuaternionAxisAngle(outAxis, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getQuaternionDot(a:Quaternion, b:Quaternion):Float {
#if hl
	return flight._hl._fn.Geometry.getQuaternionDot(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.getQuaternionDot(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getQuaternionDot(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getQuaternionEuler(out:Vector3, source:Quaternion, order:flight.EulerOrder):Void {
#if hl
	flight._hl._fn.Geometry.getQuaternionEuler(out, source, order);
#elseif cpp
	flight._cpp._fn.Geometry.getQuaternionEuler(out, source, order);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getQuaternionEuler(out, source, order);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function inverseQuaternion(out:Quaternion, source:Quaternion):Void {
#if hl
	flight._hl._fn.Geometry.inverseQuaternion(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.inverseQuaternion(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.inverseQuaternion(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function multiplyQuaternion(out:Quaternion, a:Quaternion, b:Quaternion):Void {
#if hl
	flight._hl._fn.Geometry.multiplyQuaternion(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.multiplyQuaternion(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.multiplyQuaternion(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function normalizeQuaternion(out:Quaternion, source:Quaternion):Float {
#if hl
	return flight._hl._fn.Geometry.normalizeQuaternion(out, source);
#elseif cpp
	return flight._cpp._fn.Geometry.normalizeQuaternion(out, source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.normalizeQuaternion(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function rotateVector3ByQuaternion(out:Vector3, vector:Vector3, q:Quaternion):Void {
#if hl
	flight._hl._fn.Geometry.rotateVector3ByQuaternion(out, vector, q);
#elseif cpp
	flight._cpp._fn.Geometry.rotateVector3ByQuaternion(out, vector, q);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.rotateVector3ByQuaternion(out, vector, q);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setQuaternion(out:Quaternion, x:Float, y:Float, z:Float, w:Float):Void {
#if hl
	flight._hl._fn.Geometry.setQuaternion(out, x, y, z, w);
#elseif cpp
	flight._cpp._fn.Geometry.setQuaternion(out, x, y, z, w);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setQuaternion(out, x, y, z, w);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setQuaternionFromAxisAngle(out:Quaternion, axis:Vector3, angle:Float):Void {
#if hl
	flight._hl._fn.Geometry.setQuaternionFromAxisAngle(out, axis, angle);
#elseif cpp
	flight._cpp._fn.Geometry.setQuaternionFromAxisAngle(out, axis, angle);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setQuaternionFromAxisAngle(out, axis, angle);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setQuaternionFromEuler(out:Quaternion, x:Float, y:Float, z:Float, order:flight.EulerOrder):Void {
#if hl
	flight._hl._fn.Geometry.setQuaternionFromEuler(out, x, y, z, order);
#elseif cpp
	flight._cpp._fn.Geometry.setQuaternionFromEuler(out, x, y, z, order);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setQuaternionFromEuler(out, x, y, z, order);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setQuaternionFromMatrix4(out:Quaternion, source:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.setQuaternionFromMatrix4(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.setQuaternionFromMatrix4(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setQuaternionFromMatrix4(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setQuaternionFromUnitVectors(out:Quaternion, from:Vector3, to:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.setQuaternionFromUnitVectors(out, from, to);
#elseif cpp
	flight._cpp._fn.Geometry.setQuaternionFromUnitVectors(out, from, to);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setQuaternionFromUnitVectors(out, from, to);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setQuaternionIdentity(out:Quaternion):Void {
#if hl
	flight._hl._fn.Geometry.setQuaternionIdentity(out);
#elseif cpp
	flight._cpp._fn.Geometry.setQuaternionIdentity(out);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setQuaternionIdentity(out);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setQuaternionLookRotation(out:Quaternion, forward:Vector3, up:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.setQuaternionLookRotation(out, forward, up);
#elseif cpp
	flight._cpp._fn.Geometry.setQuaternionLookRotation(out, forward, up);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setQuaternionLookRotation(out, forward, up);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function slerpQuaternion(out:Quaternion, a:Quaternion, b:Quaternion, t:Float):Void {
#if hl
	flight._hl._fn.Geometry.slerpQuaternion(out, a, b, t);
#elseif cpp
	flight._cpp._fn.Geometry.slerpQuaternion(out, a, b, t);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.slerpQuaternion(out, a, b, t);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireIdentityQuaternion():Quaternion {
#if hl
	return flight._hl._fn.Geometry.acquireIdentityQuaternion();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireIdentityQuaternion();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireIdentityQuaternion();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireQuaternion():Quaternion {
#if hl
	return flight._hl._fn.Geometry.acquireQuaternion();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireQuaternion();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireQuaternion();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function clearQuaternionPool():Void {
#if hl
	flight._hl._fn.Geometry.clearQuaternionPool();
#elseif cpp
	flight._cpp._fn.Geometry.clearQuaternionPool();
#elseif (js && flight_esm)
	flight._js._fn.Geometry.clearQuaternionPool();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function releaseQuaternion(q:Quaternion):Void {
#if hl
	flight._hl._fn.Geometry.releaseQuaternion(q);
#elseif cpp
	flight._cpp._fn.Geometry.releaseQuaternion(q);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.releaseQuaternion(q);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createRay3d(originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float):Ray3D {
#if hl
	return flight._hl._fn.Geometry.createRay3d(originX, originY, originZ, directionX, directionY, directionZ);
#elseif cpp
	return flight._cpp._fn.Geometry.createRay3d(originX, originY, originZ, directionX, directionY, directionZ);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createRay3d(originX, originY, originZ, directionX, directionY, directionZ);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getClosestPointBetweenRay3ds(outA:Vector3, outB:Vector3, a:Ray3D, b:Ray3D):Void {
#if hl
	flight._hl._fn.Geometry.getClosestPointBetweenRay3ds(outA, outB, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.getClosestPointBetweenRay3ds(outA, outB, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getClosestPointBetweenRay3ds(outA, outB, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getClosestPointOnRay3d(out:Vector3, ray:Ray3D, point:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.getClosestPointOnRay3d(out, ray, point);
#elseif cpp
	flight._cpp._fn.Geometry.getClosestPointOnRay3d(out, ray, point);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getClosestPointOnRay3d(out, ray, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getRay3dPointAt(out:Vector3, ray:Ray3D, t:Float):Void {
#if hl
	flight._hl._fn.Geometry.getRay3dPointAt(out, ray, t);
#elseif cpp
	flight._cpp._fn.Geometry.getRay3dPointAt(out, ray, t);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getRay3dPointAt(out, ray, t);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function intersectRay3dAabb(ray:Ray3D, aabb:Aabb):Float {
#if hl
	return flight._hl._fn.Geometry.intersectRay3dAabb(ray, aabb);
#elseif cpp
	return flight._cpp._fn.Geometry.intersectRay3dAabb(ray, aabb);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.intersectRay3dAabb(ray, aabb);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function intersectRay3dPlane(ray:Ray3D, plane:Plane):Float {
#if hl
	return flight._hl._fn.Geometry.intersectRay3dPlane(ray, plane);
#elseif cpp
	return flight._cpp._fn.Geometry.intersectRay3dPlane(ray, plane);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.intersectRay3dPlane(ray, plane);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function intersectRay3dSphere(ray:Ray3D, sphere:BoundingSphere):Float {
#if hl
	return flight._hl._fn.Geometry.intersectRay3dSphere(ray, sphere);
#elseif cpp
	return flight._cpp._fn.Geometry.intersectRay3dSphere(ray, sphere);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.intersectRay3dSphere(ray, sphere);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function intersectRay3dTriangle(ray:Ray3D, a:Vector3, b:Vector3, c:Vector3):Float {
#if hl
	return flight._hl._fn.Geometry.intersectRay3dTriangle(ray, a, b, c);
#elseif cpp
	return flight._cpp._fn.Geometry.intersectRay3dTriangle(ray, a, b, c);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.intersectRay3dTriangle(ray, a, b, c);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setRay3d(out:Ray3D, origin:Vector3, direction:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.setRay3d(out, origin, direction);
#elseif cpp
	flight._cpp._fn.Geometry.setRay3d(out, origin, direction);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setRay3d(out, origin, direction);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function transformRay3dByMatrix4(out:Ray3D, ray:Ray3D, m:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.transformRay3dByMatrix4(out, ray, m);
#elseif cpp
	flight._cpp._fn.Geometry.transformRay3dByMatrix4(out, ray, m);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.transformRay3dByMatrix4(out, ray, m);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createRectangle(x:Float, y:Float, width:Float, height:Float):Rectangle {
#if hl
	return flight._hl._fn.Geometry.createRectangle(x, y, width, height);
#elseif cpp
	return flight._cpp._fn.Geometry.createRectangle(x, y, width, height);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createRectangle(x, y, width, height);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function cloneRectangle(source:Rectangle):Rectangle {
#if hl
	return flight._hl._fn.Geometry.cloneRectangle(source);
#elseif cpp
	return flight._cpp._fn.Geometry.cloneRectangle(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.cloneRectangle(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function computeRectangleIntersection(out:Rectangle, a:Rectangle, b:Rectangle):Void {
#if hl
	flight._hl._fn.Geometry.computeRectangleIntersection(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.computeRectangleIntersection(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.computeRectangleIntersection(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function containsRectanglePoint(source:Rectangle, vector:Vector2):Bool {
#if hl
	return flight._hl._fn.Geometry.containsRectanglePoint(source, vector);
#elseif cpp
	return flight._cpp._fn.Geometry.containsRectanglePoint(source, vector);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.containsRectanglePoint(source, vector);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function containsRectanglePointXy(source:Rectangle, x:Float, y:Float):Bool {
#if hl
	return flight._hl._fn.Geometry.containsRectanglePointXy(source, x, y);
#elseif cpp
	return flight._cpp._fn.Geometry.containsRectanglePointXy(source, x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.containsRectanglePointXy(source, x, y);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyRectangle(out:Rectangle, source:Rectangle):Void {
#if hl
	flight._hl._fn.Geometry.copyRectangle(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyRectangle(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function enclosesRectangle(source:Rectangle, other:Rectangle):Bool {
#if hl
	return flight._hl._fn.Geometry.enclosesRectangle(source, other);
#elseif cpp
	return flight._cpp._fn.Geometry.enclosesRectangle(source, other);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.enclosesRectangle(source, other);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function equalsRectangle(a:Rectangle, b:Rectangle):Bool {
#if hl
	return flight._hl._fn.Geometry.equalsRectangle(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.equalsRectangle(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.equalsRectangle(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function expandRectangleToPoint(out:Rectangle, sourceRect:Rectangle, sourceVec2:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.expandRectangleToPoint(out, sourceRect, sourceVec2);
#elseif cpp
	flight._cpp._fn.Geometry.expandRectangleToPoint(out, sourceRect, sourceVec2);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.expandRectangleToPoint(out, sourceRect, sourceVec2);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getRectangleBottom(source:Rectangle):Float {
#if hl
	return flight._hl._fn.Geometry.getRectangleBottom(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getRectangleBottom(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getRectangleBottom(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getRectangleBottomRight(out:Vector2, source:Rectangle):Void {
#if hl
	flight._hl._fn.Geometry.getRectangleBottomRight(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.getRectangleBottomRight(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getRectangleBottomRight(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getRectangleLeft(source:Rectangle):Float {
#if hl
	return flight._hl._fn.Geometry.getRectangleLeft(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getRectangleLeft(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getRectangleLeft(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getRectangleMaxX(source:Rectangle):Float {
#if hl
	return flight._hl._fn.Geometry.getRectangleMaxX(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getRectangleMaxX(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getRectangleMaxX(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getRectangleMaxY(source:Rectangle):Float {
#if hl
	return flight._hl._fn.Geometry.getRectangleMaxY(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getRectangleMaxY(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getRectangleMaxY(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getRectangleMinX(source:Rectangle):Float {
#if hl
	return flight._hl._fn.Geometry.getRectangleMinX(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getRectangleMinX(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getRectangleMinX(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getRectangleMinY(source:Rectangle):Float {
#if hl
	return flight._hl._fn.Geometry.getRectangleMinY(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getRectangleMinY(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getRectangleMinY(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getRectangleNormalizedBottomRight(out:Vector2, source:Rectangle):Void {
#if hl
	flight._hl._fn.Geometry.getRectangleNormalizedBottomRight(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.getRectangleNormalizedBottomRight(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getRectangleNormalizedBottomRight(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getRectangleNormalizedTopLeft(out:Vector2, source:Rectangle):Void {
#if hl
	flight._hl._fn.Geometry.getRectangleNormalizedTopLeft(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.getRectangleNormalizedTopLeft(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getRectangleNormalizedTopLeft(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getRectangleRight(source:Rectangle):Float {
#if hl
	return flight._hl._fn.Geometry.getRectangleRight(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getRectangleRight(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getRectangleRight(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getRectangleSize(out:Vector2, source:Rectangle):Void {
#if hl
	flight._hl._fn.Geometry.getRectangleSize(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.getRectangleSize(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getRectangleSize(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getRectangleTop(source:Rectangle):Float {
#if hl
	return flight._hl._fn.Geometry.getRectangleTop(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getRectangleTop(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getRectangleTop(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getRectangleTopLeft(out:Vector2, source:Rectangle):Void {
#if hl
	flight._hl._fn.Geometry.getRectangleTopLeft(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.getRectangleTopLeft(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getRectangleTopLeft(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function inflateRectangle(out:Rectangle, source:Rectangle, dx:Float, dy:Float):Void {
#if hl
	flight._hl._fn.Geometry.inflateRectangle(out, source, dx, dy);
#elseif cpp
	flight._cpp._fn.Geometry.inflateRectangle(out, source, dx, dy);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.inflateRectangle(out, source, dx, dy);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function intersectsRectangle(a:Rectangle, b:Rectangle):Bool {
#if hl
	return flight._hl._fn.Geometry.intersectsRectangle(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.intersectsRectangle(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.intersectsRectangle(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isEmptyRectangle(source:Rectangle):Bool {
#if hl
	return flight._hl._fn.Geometry.isEmptyRectangle(source);
#elseif cpp
	return flight._cpp._fn.Geometry.isEmptyRectangle(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isEmptyRectangle(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isFlippedXRectangle(source:Rectangle):Bool {
#if hl
	return flight._hl._fn.Geometry.isFlippedXRectangle(source);
#elseif cpp
	return flight._cpp._fn.Geometry.isFlippedXRectangle(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isFlippedXRectangle(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function isFlippedYRectangle(source:Rectangle):Bool {
#if hl
	return flight._hl._fn.Geometry.isFlippedYRectangle(source);
#elseif cpp
	return flight._cpp._fn.Geometry.isFlippedYRectangle(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.isFlippedYRectangle(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function mergeRectangle(out:Rectangle, source:Rectangle, other:Rectangle):Void {
#if hl
	flight._hl._fn.Geometry.mergeRectangle(out, source, other);
#elseif cpp
	flight._cpp._fn.Geometry.mergeRectangle(out, source, other);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.mergeRectangle(out, source, other);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function normalizeRectangle(out:Rectangle, source:Rectangle):Void {
#if hl
	flight._hl._fn.Geometry.normalizeRectangle(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.normalizeRectangle(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.normalizeRectangle(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function offsetRectangle(out:Rectangle, source:Rectangle, dx:Float, dy:Float):Void {
#if hl
	flight._hl._fn.Geometry.offsetRectangle(out, source, dx, dy);
#elseif cpp
	flight._cpp._fn.Geometry.offsetRectangle(out, source, dx, dy);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.offsetRectangle(out, source, dx, dy);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function offsetRectangleByPoint(out:Rectangle, source:Rectangle, point:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.offsetRectangleByPoint(out, source, point);
#elseif cpp
	flight._cpp._fn.Geometry.offsetRectangleByPoint(out, source, point);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.offsetRectangleByPoint(out, source, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setEmptyRectangle(out:Rectangle):Void {
#if hl
	flight._hl._fn.Geometry.setEmptyRectangle(out);
#elseif cpp
	flight._cpp._fn.Geometry.setEmptyRectangle(out);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setEmptyRectangle(out);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setRectangle(out:Rectangle, x:Float, y:Float, width:Float, height:Float):Void {
#if hl
	flight._hl._fn.Geometry.setRectangle(out, x, y, width, height);
#elseif cpp
	flight._cpp._fn.Geometry.setRectangle(out, x, y, width, height);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setRectangle(out, x, y, width, height);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setRectangleBottom(target:Rectangle, value:Float):Void {
#if hl
	flight._hl._fn.Geometry.setRectangleBottom(target, value);
#elseif cpp
	flight._cpp._fn.Geometry.setRectangleBottom(target, value);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setRectangleBottom(target, value);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setRectangleBottomRight(target:Rectangle, point:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.setRectangleBottomRight(target, point);
#elseif cpp
	flight._cpp._fn.Geometry.setRectangleBottomRight(target, point);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setRectangleBottomRight(target, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setRectangleLeft(target:Rectangle, value:Float):Void {
#if hl
	flight._hl._fn.Geometry.setRectangleLeft(target, value);
#elseif cpp
	flight._cpp._fn.Geometry.setRectangleLeft(target, value);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setRectangleLeft(target, value);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setRectangleRight(target:Rectangle, value:Float):Void {
#if hl
	flight._hl._fn.Geometry.setRectangleRight(target, value);
#elseif cpp
	flight._cpp._fn.Geometry.setRectangleRight(target, value);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setRectangleRight(target, value);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setRectangleSize(out:Rectangle, size:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.setRectangleSize(out, size);
#elseif cpp
	flight._cpp._fn.Geometry.setRectangleSize(out, size);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setRectangleSize(out, size);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setRectangleTop(target:Rectangle, value:Float):Void {
#if hl
	flight._hl._fn.Geometry.setRectangleTop(target, value);
#elseif cpp
	flight._cpp._fn.Geometry.setRectangleTop(target, value);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setRectangleTop(target, value);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setRectangleTopLeft(out:Rectangle, point:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.setRectangleTopLeft(out, point);
#elseif cpp
	flight._cpp._fn.Geometry.setRectangleTopLeft(out, point);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setRectangleTopLeft(out, point);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireEmptyRectangle():Rectangle {
#if hl
	return flight._hl._fn.Geometry.acquireEmptyRectangle();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireEmptyRectangle();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireEmptyRectangle();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireRectangle():Rectangle {
#if hl
	return flight._hl._fn.Geometry.acquireRectangle();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireRectangle();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireRectangle();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function clearRectanglePool():Void {
#if hl
	flight._hl._fn.Geometry.clearRectanglePool();
#elseif cpp
	flight._cpp._fn.Geometry.clearRectanglePool();
#elseif (js && flight_esm)
	flight._js._fn.Geometry.clearRectanglePool();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function releaseRectangle(r:Rectangle):Void {
#if hl
	flight._hl._fn.Geometry.releaseRectangle(r);
#elseif cpp
	flight._cpp._fn.Geometry.releaseRectangle(r);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.releaseRectangle(r);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createTransform2d(x:Float, y:Float, rotation:Float, scaleX:Float, scaleY:Float, skewX:Float, skewY:Float, pivotX:Float, pivotY:Float):Transform2D {
#if hl
	return flight._hl._fn.Geometry.createTransform2d(x, y, rotation, scaleX, scaleY, skewX, skewY, pivotX, pivotY);
#elseif cpp
	return flight._cpp._fn.Geometry.createTransform2d(x, y, rotation, scaleX, scaleY, skewX, skewY, pivotX, pivotY);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createTransform2d(x, y, rotation, scaleX, scaleY, skewX, skewY, pivotX, pivotY);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function decomposeMatrixToTransform2d(out:Transform2D, source:Matrix):Void {
#if hl
	flight._hl._fn.Geometry.decomposeMatrixToTransform2d(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.decomposeMatrixToTransform2d(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.decomposeMatrixToTransform2d(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createTransform3d():Transform3D {
#if hl
	return flight._hl._fn.Geometry.createTransform3d();
#elseif cpp
	return flight._cpp._fn.Geometry.createTransform3d();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createTransform3d();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function composeMatrix4FromTransform3d(out:Matrix4, source:Transform3D):Void {
#if hl
	flight._hl._fn.Geometry.composeMatrix4FromTransform3d(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.composeMatrix4FromTransform3d(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.composeMatrix4FromTransform3d(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function decomposeMatrix4ToTransform3d(out:Transform3D, m:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.decomposeMatrix4ToTransform3d(out, m);
#elseif cpp
	flight._cpp._fn.Geometry.decomposeMatrix4ToTransform3d(out, m);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.decomposeMatrix4ToTransform3d(out, m);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function reserveFloat32Array(array:Dynamic, arrayLen:Int, capacity:Int):Dynamic {
#if hl
	return flight._hl._fn.Geometry.reserveFloat32Array(array, arrayLen, capacity);
#elseif cpp
	return flight._cpp._fn.Geometry.reserveFloat32Array(array, arrayLen, capacity);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.reserveFloat32Array(array, arrayLen, capacity);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function reserveInt16Array(array:Dynamic, arrayLen:Int, capacity:Int):Dynamic {
#if hl
	return flight._hl._fn.Geometry.reserveInt16Array(array, arrayLen, capacity);
#elseif cpp
	return flight._cpp._fn.Geometry.reserveInt16Array(array, arrayLen, capacity);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.reserveInt16Array(array, arrayLen, capacity);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function reserveUint16Array(array:Dynamic, arrayLen:Int, capacity:Int):Dynamic {
#if hl
	return flight._hl._fn.Geometry.reserveUint16Array(array, arrayLen, capacity);
#elseif cpp
	return flight._cpp._fn.Geometry.reserveUint16Array(array, arrayLen, capacity);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.reserveUint16Array(array, arrayLen, capacity);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createVector2(x:Float, y:Float):Vector2 {
#if hl
	return flight._hl._fn.Geometry.createVector2(x, y);
#elseif cpp
	return flight._cpp._fn.Geometry.createVector2(x, y);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createVector2(x, y);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createVector2FromPolar(length:Float, angle:Float):Vector2 {
#if hl
	return flight._hl._fn.Geometry.createVector2FromPolar(length, angle);
#elseif cpp
	return flight._cpp._fn.Geometry.createVector2FromPolar(length, angle);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createVector2FromPolar(length, angle);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function addVector2(out:Vector2, a:Vector2, b:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.addVector2(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.addVector2(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.addVector2(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function clampVector2(out:Vector2, value:Vector2, min:Vector2, max:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.clampVector2(out, value, min, max);
#elseif cpp
	flight._cpp._fn.Geometry.clampVector2(out, value, min, max);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.clampVector2(out, value, min, max);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function cloneVector2(source:Vector2):Vector2 {
#if hl
	return flight._hl._fn.Geometry.cloneVector2(source);
#elseif cpp
	return flight._cpp._fn.Geometry.cloneVector2(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.cloneVector2(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyVector2(out:Vector2, source:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.copyVector2(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyVector2(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyVector2(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function crossVector2(a:Vector2, b:Vector2):Float {
#if hl
	return flight._hl._fn.Geometry.crossVector2(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.crossVector2(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.crossVector2(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function divideVector2(out:Vector2, source:Vector2, divisor:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.divideVector2(out, source, divisor);
#elseif cpp
	flight._cpp._fn.Geometry.divideVector2(out, source, divisor);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.divideVector2(out, source, divisor);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function equalsVector2(a:Vector2, b:Vector2):Bool {
#if hl
	return flight._hl._fn.Geometry.equalsVector2(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.equalsVector2(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.equalsVector2(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector2Angle(source:Vector2):Float {
#if hl
	return flight._hl._fn.Geometry.getVector2Angle(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector2Angle(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector2Angle(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector2AngleBetween(a:Vector2, b:Vector2):Float {
#if hl
	return flight._hl._fn.Geometry.getVector2AngleBetween(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector2AngleBetween(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector2AngleBetween(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector2Distance(a:Vector2, b:Vector2):Float {
#if hl
	return flight._hl._fn.Geometry.getVector2Distance(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector2Distance(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector2Distance(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector2DistanceSquared(a:Vector2, b:Vector2):Float {
#if hl
	return flight._hl._fn.Geometry.getVector2DistanceSquared(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector2DistanceSquared(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector2DistanceSquared(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector2Dot(a:Vector2, b:Vector2):Float {
#if hl
	return flight._hl._fn.Geometry.getVector2Dot(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector2Dot(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector2Dot(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector2Length(source:Vector2):Float {
#if hl
	return flight._hl._fn.Geometry.getVector2Length(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector2Length(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector2Length(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector2LengthSquared(source:Vector2):Float {
#if hl
	return flight._hl._fn.Geometry.getVector2LengthSquared(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector2LengthSquared(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector2LengthSquared(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function interpolateVector2(out:Vector2, a:Vector2, b:Vector2, t:Float):Void {
#if hl
	flight._hl._fn.Geometry.interpolateVector2(out, a, b, t);
#elseif cpp
	flight._cpp._fn.Geometry.interpolateVector2(out, a, b, t);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.interpolateVector2(out, a, b, t);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function maxVector2(out:Vector2, a:Vector2, b:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.maxVector2(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.maxVector2(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.maxVector2(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function minVector2(out:Vector2, a:Vector2, b:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.minVector2(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.minVector2(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.minVector2(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function multiplyVector2(out:Vector2, a:Vector2, b:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.multiplyVector2(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.multiplyVector2(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.multiplyVector2(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function nearEqualsVector2(a:Vector2, b:Vector2, tolerance:Float):Bool {
#if hl
	return flight._hl._fn.Geometry.nearEqualsVector2(a, b, tolerance);
#elseif cpp
	return flight._cpp._fn.Geometry.nearEqualsVector2(a, b, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.nearEqualsVector2(a, b, tolerance);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function negateVector2(out:Vector2, source:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.negateVector2(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.negateVector2(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.negateVector2(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function normalizeVector2(out:Vector2, source:Vector2):Float {
#if hl
	return flight._hl._fn.Geometry.normalizeVector2(out, source);
#elseif cpp
	return flight._cpp._fn.Geometry.normalizeVector2(out, source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.normalizeVector2(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function offsetVector2(out:Vector2, source:Vector2, dx:Float, dy:Float):Void {
#if hl
	flight._hl._fn.Geometry.offsetVector2(out, source, dx, dy);
#elseif cpp
	flight._cpp._fn.Geometry.offsetVector2(out, source, dx, dy);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.offsetVector2(out, source, dx, dy);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function reflectVector2(out:Vector2, incident:Vector2, normal:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.reflectVector2(out, incident, normal);
#elseif cpp
	flight._cpp._fn.Geometry.reflectVector2(out, incident, normal);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.reflectVector2(out, incident, normal);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function rotateVector2(out:Vector2, source:Vector2, angle:Float):Void {
#if hl
	flight._hl._fn.Geometry.rotateVector2(out, source, angle);
#elseif cpp
	flight._cpp._fn.Geometry.rotateVector2(out, source, angle);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.rotateVector2(out, source, angle);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function scaleVector2(out:Vector2, source:Vector2, scalar:Float):Void {
#if hl
	flight._hl._fn.Geometry.scaleVector2(out, source, scalar);
#elseif cpp
	flight._cpp._fn.Geometry.scaleVector2(out, source, scalar);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.scaleVector2(out, source, scalar);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function scaleVector2ToLength(out:Vector2, source:Vector2, length:Float):Void {
#if hl
	flight._hl._fn.Geometry.scaleVector2ToLength(out, source, length);
#elseif cpp
	flight._cpp._fn.Geometry.scaleVector2ToLength(out, source, length);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.scaleVector2ToLength(out, source, length);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setVector2(out:Vector2, x:Float, y:Float):Void {
#if hl
	flight._hl._fn.Geometry.setVector2(out, x, y);
#elseif cpp
	flight._cpp._fn.Geometry.setVector2(out, x, y);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setVector2(out, x, y);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setVector2FromFloat32Array(out:Vector2, offset:Int, source:Dynamic, sourceLen:Int):Void {
#if hl
	flight._hl._fn.Geometry.setVector2FromFloat32Array(out, offset, source, sourceLen);
#elseif cpp
	flight._cpp._fn.Geometry.setVector2FromFloat32Array(out, offset, source, sourceLen);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setVector2FromFloat32Array(out, offset, source, sourceLen);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setVector2FromPolar(out:Vector2, length:Float, angle:Float):Void {
#if hl
	flight._hl._fn.Geometry.setVector2FromPolar(out, length, angle);
#elseif cpp
	flight._cpp._fn.Geometry.setVector2FromPolar(out, length, angle);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setVector2FromPolar(out, length, angle);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setVector2FromVector3(out:Vector2, source:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.setVector2FromVector3(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.setVector2FromVector3(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setVector2FromVector3(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function subtractVector2(out:Vector2, source:Vector2, other:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.subtractVector2(out, source, other);
#elseif cpp
	flight._cpp._fn.Geometry.subtractVector2(out, source, other);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.subtractVector2(out, source, other);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function writeVector2ToFloat32Array(out:Dynamic, outLen:Int, offset:Int, source:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.writeVector2ToFloat32Array(out, outLen, offset, source);
#elseif cpp
	flight._cpp._fn.Geometry.writeVector2ToFloat32Array(out, outLen, offset, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.writeVector2ToFloat32Array(out, outLen, offset, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireEmptyVector2():Vector2 {
#if hl
	return flight._hl._fn.Geometry.acquireEmptyVector2();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireEmptyVector2();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireEmptyVector2();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireVector2():Vector2 {
#if hl
	return flight._hl._fn.Geometry.acquireVector2();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireVector2();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireVector2();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function clearVector2Pool():Void {
#if hl
	flight._hl._fn.Geometry.clearVector2Pool();
#elseif cpp
	flight._cpp._fn.Geometry.clearVector2Pool();
#elseif (js && flight_esm)
	flight._js._fn.Geometry.clearVector2Pool();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function releaseVector2(v:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.releaseVector2(v);
#elseif cpp
	flight._cpp._fn.Geometry.releaseVector2(v);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.releaseVector2(v);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createVector3(x:Float, y:Float, z:Float):Vector3 {
#if hl
	return flight._hl._fn.Geometry.createVector3(x, y, z);
#elseif cpp
	return flight._cpp._fn.Geometry.createVector3(x, y, z);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createVector3(x, y, z);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createVector3FromSpherical(radius:Float, theta:Float, phi:Float):Vector3 {
#if hl
	return flight._hl._fn.Geometry.createVector3FromSpherical(radius, theta, phi);
#elseif cpp
	return flight._cpp._fn.Geometry.createVector3FromSpherical(radius, theta, phi);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createVector3FromSpherical(radius, theta, phi);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function addVector3(out:Vector3, a:Vector3, b:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.addVector3(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.addVector3(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.addVector3(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function clampVector3(out:Vector3, value:Vector3, min:Vector3, max:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.clampVector3(out, value, min, max);
#elseif cpp
	flight._cpp._fn.Geometry.clampVector3(out, value, min, max);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.clampVector3(out, value, min, max);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function cloneVector3(source:Vector3):Vector3 {
#if hl
	return flight._hl._fn.Geometry.cloneVector3(source);
#elseif cpp
	return flight._cpp._fn.Geometry.cloneVector3(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.cloneVector3(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyVector3(out:Vector3, source:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.copyVector3(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyVector3(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyVector3(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function crossVector3(out:Vector3, source:Vector3, other:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.crossVector3(out, source, other);
#elseif cpp
	flight._cpp._fn.Geometry.crossVector3(out, source, other);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.crossVector3(out, source, other);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function divideVector3(out:Vector3, source:Vector3, divisor:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.divideVector3(out, source, divisor);
#elseif cpp
	flight._cpp._fn.Geometry.divideVector3(out, source, divisor);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.divideVector3(out, source, divisor);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function equalsVector3(a:Vector3, b:Vector3):Bool {
#if hl
	return flight._hl._fn.Geometry.equalsVector3(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.equalsVector3(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.equalsVector3(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector3AngleBetween(a:Vector3, b:Vector3):Float {
#if hl
	return flight._hl._fn.Geometry.getVector3AngleBetween(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector3AngleBetween(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector3AngleBetween(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector3Distance(a:Vector3, b:Vector3):Float {
#if hl
	return flight._hl._fn.Geometry.getVector3Distance(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector3Distance(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector3Distance(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector3DistanceSquared(a:Vector3, b:Vector3):Float {
#if hl
	return flight._hl._fn.Geometry.getVector3DistanceSquared(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector3DistanceSquared(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector3DistanceSquared(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector3Dot(a:Vector3, b:Vector3):Float {
#if hl
	return flight._hl._fn.Geometry.getVector3Dot(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector3Dot(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector3Dot(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector3Length(source:Vector3):Float {
#if hl
	return flight._hl._fn.Geometry.getVector3Length(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector3Length(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector3Length(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector3LengthSquared(source:Vector3):Float {
#if hl
	return flight._hl._fn.Geometry.getVector3LengthSquared(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector3LengthSquared(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector3LengthSquared(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector3Spherical(out:Vector3, source:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.getVector3Spherical(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.getVector3Spherical(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.getVector3Spherical(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function interpolateVector3(out:Vector3, a:Vector3, b:Vector3, t:Float):Void {
#if hl
	flight._hl._fn.Geometry.interpolateVector3(out, a, b, t);
#elseif cpp
	flight._cpp._fn.Geometry.interpolateVector3(out, a, b, t);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.interpolateVector3(out, a, b, t);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function maxVector3(out:Vector3, a:Vector3, b:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.maxVector3(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.maxVector3(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.maxVector3(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function minVector3(out:Vector3, a:Vector3, b:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.minVector3(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.minVector3(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.minVector3(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function multiplyVector3(out:Vector3, a:Vector3, b:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.multiplyVector3(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.multiplyVector3(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.multiplyVector3(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function nearEqualsVector3(a:Vector3, b:Vector3, tolerance:Float):Bool {
#if hl
	return flight._hl._fn.Geometry.nearEqualsVector3(a, b, tolerance);
#elseif cpp
	return flight._cpp._fn.Geometry.nearEqualsVector3(a, b, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.nearEqualsVector3(a, b, tolerance);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function negateVector3(out:Vector3, source:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.negateVector3(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.negateVector3(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.negateVector3(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function normalizeVector3(out:Vector3, source:Vector3):Float {
#if hl
	return flight._hl._fn.Geometry.normalizeVector3(out, source);
#elseif cpp
	return flight._cpp._fn.Geometry.normalizeVector3(out, source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.normalizeVector3(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function offsetVector3(out:Vector3, source:Vector3, dx:Float, dy:Float, dz:Float):Void {
#if hl
	flight._hl._fn.Geometry.offsetVector3(out, source, dx, dy, dz);
#elseif cpp
	flight._cpp._fn.Geometry.offsetVector3(out, source, dx, dy, dz);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.offsetVector3(out, source, dx, dy, dz);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function projectVector3(out:Vector2, source:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.projectVector3(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.projectVector3(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.projectVector3(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function reflectVector3(out:Vector3, incident:Vector3, normal:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.reflectVector3(out, incident, normal);
#elseif cpp
	flight._cpp._fn.Geometry.reflectVector3(out, incident, normal);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.reflectVector3(out, incident, normal);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function scaleVector3(out:Vector3, source:Vector3, scalar:Float):Void {
#if hl
	flight._hl._fn.Geometry.scaleVector3(out, source, scalar);
#elseif cpp
	flight._cpp._fn.Geometry.scaleVector3(out, source, scalar);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.scaleVector3(out, source, scalar);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setVector3(out:Vector3, x:Float, y:Float, z:Float):Void {
#if hl
	flight._hl._fn.Geometry.setVector3(out, x, y, z);
#elseif cpp
	flight._cpp._fn.Geometry.setVector3(out, x, y, z);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setVector3(out, x, y, z);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setVector3FromFloat32Array(out:Vector3, offset:Int, source:Dynamic, sourceLen:Int):Void {
#if hl
	flight._hl._fn.Geometry.setVector3FromFloat32Array(out, offset, source, sourceLen);
#elseif cpp
	flight._cpp._fn.Geometry.setVector3FromFloat32Array(out, offset, source, sourceLen);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setVector3FromFloat32Array(out, offset, source, sourceLen);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setVector3FromSpherical(out:Vector3, radius:Float, theta:Float, phi:Float):Void {
#if hl
	flight._hl._fn.Geometry.setVector3FromSpherical(out, radius, theta, phi);
#elseif cpp
	flight._cpp._fn.Geometry.setVector3FromSpherical(out, radius, theta, phi);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setVector3FromSpherical(out, radius, theta, phi);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setVector3FromVector4(out:Vector3, source:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.setVector3FromVector4(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.setVector3FromVector4(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setVector3FromVector4(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function subtractVector3(out:Vector3, source:Vector3, other:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.subtractVector3(out, source, other);
#elseif cpp
	flight._cpp._fn.Geometry.subtractVector3(out, source, other);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.subtractVector3(out, source, other);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function transformVector3ByMatrix3(out:Vector3, source:Vector3, matrix:Matrix3):Void {
#if hl
	flight._hl._fn.Geometry.transformVector3ByMatrix3(out, source, matrix);
#elseif cpp
	flight._cpp._fn.Geometry.transformVector3ByMatrix3(out, source, matrix);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.transformVector3ByMatrix3(out, source, matrix);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function writeVector3ToFloat32Array(out:Dynamic, outLen:Int, offset:Int, source:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.writeVector3ToFloat32Array(out, outLen, offset, source);
#elseif cpp
	flight._cpp._fn.Geometry.writeVector3ToFloat32Array(out, outLen, offset, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.writeVector3ToFloat32Array(out, outLen, offset, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireEmptyVector3():Vector3 {
#if hl
	return flight._hl._fn.Geometry.acquireEmptyVector3();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireEmptyVector3();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireEmptyVector3();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireVector3():Vector3 {
#if hl
	return flight._hl._fn.Geometry.acquireVector3();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireVector3();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireVector3();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function clearVector3Pool():Void {
#if hl
	flight._hl._fn.Geometry.clearVector3Pool();
#elseif cpp
	flight._cpp._fn.Geometry.clearVector3Pool();
#elseif (js && flight_esm)
	flight._js._fn.Geometry.clearVector3Pool();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function releaseVector3(v:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.releaseVector3(v);
#elseif cpp
	flight._cpp._fn.Geometry.releaseVector3(v);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.releaseVector3(v);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function createVector4(x:Float, y:Float, z:Float, w:Float):Vector4 {
#if hl
	return flight._hl._fn.Geometry.createVector4(x, y, z, w);
#elseif cpp
	return flight._cpp._fn.Geometry.createVector4(x, y, z, w);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.createVector4(x, y, z, w);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function addVector4(out:Vector4, a:Vector4, b:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.addVector4(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.addVector4(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.addVector4(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function clampVector4(out:Vector4, value:Vector4, min:Vector4, max:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.clampVector4(out, value, min, max);
#elseif cpp
	flight._cpp._fn.Geometry.clampVector4(out, value, min, max);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.clampVector4(out, value, min, max);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function cloneVector4(source:Vector4):Vector4 {
#if hl
	return flight._hl._fn.Geometry.cloneVector4(source);
#elseif cpp
	return flight._cpp._fn.Geometry.cloneVector4(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.cloneVector4(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function copyVector4(out:Vector4, source:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.copyVector4(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.copyVector4(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.copyVector4(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function divideVector4(out:Vector4, source:Vector4, divisor:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.divideVector4(out, source, divisor);
#elseif cpp
	flight._cpp._fn.Geometry.divideVector4(out, source, divisor);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.divideVector4(out, source, divisor);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function equalsVector4(a:Vector4, b:Vector4):Bool {
#if hl
	return flight._hl._fn.Geometry.equalsVector4(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.equalsVector4(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.equalsVector4(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector4AngleBetween(a:Vector4, b:Vector4):Float {
#if hl
	return flight._hl._fn.Geometry.getVector4AngleBetween(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector4AngleBetween(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector4AngleBetween(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector4Distance(a:Vector4, b:Vector4):Float {
#if hl
	return flight._hl._fn.Geometry.getVector4Distance(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector4Distance(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector4Distance(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector4DistanceSquared(a:Vector4, b:Vector4):Float {
#if hl
	return flight._hl._fn.Geometry.getVector4DistanceSquared(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector4DistanceSquared(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector4DistanceSquared(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector4Dot(a:Vector4, b:Vector4):Float {
#if hl
	return flight._hl._fn.Geometry.getVector4Dot(a, b);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector4Dot(a, b);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector4Dot(a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector4Length(source:Vector4):Float {
#if hl
	return flight._hl._fn.Geometry.getVector4Length(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector4Length(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector4Length(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function getVector4LengthSquared(source:Vector4):Float {
#if hl
	return flight._hl._fn.Geometry.getVector4LengthSquared(source);
#elseif cpp
	return flight._cpp._fn.Geometry.getVector4LengthSquared(source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.getVector4LengthSquared(source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function interpolateVector4(out:Vector4, a:Vector4, b:Vector4, t:Float):Void {
#if hl
	flight._hl._fn.Geometry.interpolateVector4(out, a, b, t);
#elseif cpp
	flight._cpp._fn.Geometry.interpolateVector4(out, a, b, t);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.interpolateVector4(out, a, b, t);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function maxVector4(out:Vector4, a:Vector4, b:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.maxVector4(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.maxVector4(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.maxVector4(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function minVector4(out:Vector4, a:Vector4, b:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.minVector4(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.minVector4(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.minVector4(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function multiplyVector4(out:Vector4, a:Vector4, b:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.multiplyVector4(out, a, b);
#elseif cpp
	flight._cpp._fn.Geometry.multiplyVector4(out, a, b);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.multiplyVector4(out, a, b);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function nearEqualsVector4(a:Vector4, b:Vector4, tolerance:Float):Bool {
#if hl
	return flight._hl._fn.Geometry.nearEqualsVector4(a, b, tolerance);
#elseif cpp
	return flight._cpp._fn.Geometry.nearEqualsVector4(a, b, tolerance);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.nearEqualsVector4(a, b, tolerance);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function negateVector4(out:Vector4, source:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.negateVector4(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.negateVector4(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.negateVector4(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function normalizeVector4(out:Vector4, source:Vector4):Float {
#if hl
	return flight._hl._fn.Geometry.normalizeVector4(out, source);
#elseif cpp
	return flight._cpp._fn.Geometry.normalizeVector4(out, source);
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.normalizeVector4(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function offsetVector4(out:Vector4, source:Vector4, dx:Float, dy:Float, dz:Float, dw:Float):Void {
#if hl
	flight._hl._fn.Geometry.offsetVector4(out, source, dx, dy, dz, dw);
#elseif cpp
	flight._cpp._fn.Geometry.offsetVector4(out, source, dx, dy, dz, dw);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.offsetVector4(out, source, dx, dy, dz, dw);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function projectVector4(out:Vector3, source:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.projectVector4(out, source);
#elseif cpp
	flight._cpp._fn.Geometry.projectVector4(out, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.projectVector4(out, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function reflectVector4(out:Vector4, incident:Vector4, normal:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.reflectVector4(out, incident, normal);
#elseif cpp
	flight._cpp._fn.Geometry.reflectVector4(out, incident, normal);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.reflectVector4(out, incident, normal);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function scaleVector4(out:Vector4, source:Vector4, scalar:Float):Void {
#if hl
	flight._hl._fn.Geometry.scaleVector4(out, source, scalar);
#elseif cpp
	flight._cpp._fn.Geometry.scaleVector4(out, source, scalar);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.scaleVector4(out, source, scalar);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setVector4(out:Vector4, x:Float, y:Float, z:Float, w:Float):Void {
#if hl
	flight._hl._fn.Geometry.setVector4(out, x, y, z, w);
#elseif cpp
	flight._cpp._fn.Geometry.setVector4(out, x, y, z, w);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setVector4(out, x, y, z, w);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setVector4FromFloat32Array(out:Vector4, offset:Int, source:Dynamic, sourceLen:Int):Void {
#if hl
	flight._hl._fn.Geometry.setVector4FromFloat32Array(out, offset, source, sourceLen);
#elseif cpp
	flight._cpp._fn.Geometry.setVector4FromFloat32Array(out, offset, source, sourceLen);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setVector4FromFloat32Array(out, offset, source, sourceLen);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function setVector4FromVector3(out:Vector4, source:Vector3, w:Float):Void {
#if hl
	flight._hl._fn.Geometry.setVector4FromVector3(out, source, w);
#elseif cpp
	flight._cpp._fn.Geometry.setVector4FromVector3(out, source, w);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.setVector4FromVector3(out, source, w);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function subtractVector4(out:Vector4, source:Vector4, other:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.subtractVector4(out, source, other);
#elseif cpp
	flight._cpp._fn.Geometry.subtractVector4(out, source, other);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.subtractVector4(out, source, other);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function writeVector4ToFloat32Array(out:Dynamic, outLen:Int, offset:Int, source:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.writeVector4ToFloat32Array(out, outLen, offset, source);
#elseif cpp
	flight._cpp._fn.Geometry.writeVector4ToFloat32Array(out, outLen, offset, source);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.writeVector4ToFloat32Array(out, outLen, offset, source);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireEmptyVector4():Vector4 {
#if hl
	return flight._hl._fn.Geometry.acquireEmptyVector4();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireEmptyVector4();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireEmptyVector4();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function acquireVector4():Vector4 {
#if hl
	return flight._hl._fn.Geometry.acquireVector4();
#elseif cpp
	return flight._cpp._fn.Geometry.acquireVector4();
#elseif (js && flight_esm)
	return flight._js._fn.Geometry.acquireVector4();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function clearVector4Pool():Void {
#if hl
	flight._hl._fn.Geometry.clearVector4Pool();
#elseif cpp
	flight._cpp._fn.Geometry.clearVector4Pool();
#elseif (js && flight_esm)
	flight._js._fn.Geometry.clearVector4Pool();
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function releaseVector4(v:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.releaseVector4(v);
#elseif cpp
	flight._cpp._fn.Geometry.releaseVector4(v);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.releaseVector4(v);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeAabb(ptr:Aabb):Void {
#if hl
	flight._hl._fn.Geometry.freeAabb(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeAabb(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeAabb(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeBoundingSphere(ptr:BoundingSphere):Void {
#if hl
	flight._hl._fn.Geometry.freeBoundingSphere(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeBoundingSphere(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeBoundingSphere(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeCapsule(ptr:Capsule):Void {
#if hl
	flight._hl._fn.Geometry.freeCapsule(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeCapsule(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeCapsule(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeFrustum(ptr:Frustum):Void {
#if hl
	flight._hl._fn.Geometry.freeFrustum(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeFrustum(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeFrustum(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeMatrix(ptr:Matrix):Void {
#if hl
	flight._hl._fn.Geometry.freeMatrix(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeMatrix(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeMatrix(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeMatrix3(ptr:Matrix3):Void {
#if hl
	flight._hl._fn.Geometry.freeMatrix3(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeMatrix3(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeMatrix3(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeMatrix4(ptr:Matrix4):Void {
#if hl
	flight._hl._fn.Geometry.freeMatrix4(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeMatrix4(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeMatrix4(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeObb(ptr:Obb):Void {
#if hl
	flight._hl._fn.Geometry.freeObb(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeObb(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeObb(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freePlane(ptr:Plane):Void {
#if hl
	flight._hl._fn.Geometry.freePlane(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freePlane(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freePlane(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeQuaternion(ptr:Quaternion):Void {
#if hl
	flight._hl._fn.Geometry.freeQuaternion(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeQuaternion(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeQuaternion(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeRay3D(ptr:Ray3D):Void {
#if hl
	flight._hl._fn.Geometry.freeRay3D(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeRay3D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeRay3D(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeRectangle(ptr:Rectangle):Void {
#if hl
	flight._hl._fn.Geometry.freeRectangle(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeRectangle(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeRectangle(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeTransform2D(ptr:Transform2D):Void {
#if hl
	flight._hl._fn.Geometry.freeTransform2D(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeTransform2D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeTransform2D(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeTransform3D(ptr:Transform3D):Void {
#if hl
	flight._hl._fn.Geometry.freeTransform3D(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeTransform3D(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeTransform3D(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeVector2(ptr:Vector2):Void {
#if hl
	flight._hl._fn.Geometry.freeVector2(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeVector2(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeVector2(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeVector3(ptr:Vector3):Void {
#if hl
	flight._hl._fn.Geometry.freeVector3(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeVector3(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeVector3(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
inline function freeVector4(ptr:Vector4):Void {
#if hl
	flight._hl._fn.Geometry.freeVector4(ptr);
#elseif cpp
	flight._cpp._fn.Geometry.freeVector4(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Geometry.freeVector4(ptr);
#else
	#error "flight.Geometry: no backend for this target."
#end
}
