package flight._cpp;

abstract Frustum(cpp.Star<cpp.Void>) {
	extern inline public function getCamera3d(camera:flight._cpp.Camera3D, aspect:Single):Void {
		flight._cpp._fn.Camera.getCamera3dFrustum(cast this, camera, aspect);
	}
	static extern inline public function create():flight._cpp.Frustum {
		return flight._cpp._fn.Geometry.createFrustum();
	}
	extern inline public function isContainingPoint(point:flight._cpp.Vector3):Bool {
		return flight._cpp._fn.Geometry.isFrustumContainingPoint(cast this, point);
	}
	extern inline public function isIntersectingAabb(aabb:flight._cpp.Aabb):Bool {
		return flight._cpp._fn.Geometry.isFrustumIntersectingAabb(cast this, aabb);
	}
	extern inline public function isIntersectingObb(obb:flight._cpp.Obb):Bool {
		return flight._cpp._fn.Geometry.isFrustumIntersectingObb(cast this, obb);
	}
	extern inline public function isIntersectingSphere(sphere:flight._cpp.BoundingSphere):Bool {
		return flight._cpp._fn.Geometry.isFrustumIntersectingSphere(cast this, sphere);
	}
	extern inline public function setFromMatrix4(viewProjection:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.setFrustumFromMatrix4(cast this, viewProjection);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Geometry.freeFrustum(cast this);
	}
}
