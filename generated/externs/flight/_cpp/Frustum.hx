package flight._cpp;

abstract Frustum(cpp.Star<cpp.Void>) {
	inline public function getCamera3d(camera:flight._cpp.Camera3D, aspect:Single):Void {
		flight._cpp._fn.Camera.getCamera3dFrustum(cast this, camera, aspect);
	}
	static inline public function create():flight._cpp.Frustum {
		return flight._cpp._fn.Geometry.createFrustum();
	}
	inline public function isContainingPoint(point:flight._cpp.Vector3):Bool {
		return flight._cpp._fn.Geometry.isFrustumContainingPoint(cast this, point);
	}
	inline public function isIntersectingAabb(aabb:flight._cpp.Aabb):Bool {
		return flight._cpp._fn.Geometry.isFrustumIntersectingAabb(cast this, aabb);
	}
	inline public function isIntersectingObb(obb:flight._cpp.Obb):Bool {
		return flight._cpp._fn.Geometry.isFrustumIntersectingObb(cast this, obb);
	}
	inline public function isIntersectingSphere(sphere:flight._cpp.BoundingSphere):Bool {
		return flight._cpp._fn.Geometry.isFrustumIntersectingSphere(cast this, sphere);
	}
	inline public function setFromMatrix4(viewProjection:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.setFrustumFromMatrix4(cast this, viewProjection);
	}
	inline public function free():Void {
		flight._cpp._fn.Geometry.freeFrustum(cast this);
	}
}
