package flight._hl;

abstract Frustum(hl.Bytes) {
	inline public function getCamera3d(camera:flight._hl.Camera3D, aspect:Float):Void {
		flight._hl._fn.Camera.getCamera3dFrustum(cast this, camera, aspect);
	}
	static inline public function create():flight._hl.Frustum {
		return flight._hl._fn.Geometry.createFrustum();
	}
	inline public function isContainingPoint(point:flight._hl.Vector3):Bool {
		return flight._hl._fn.Geometry.isFrustumContainingPoint(cast this, point);
	}
	inline public function isIntersectingAabb(aabb:flight._hl.Aabb):Bool {
		return flight._hl._fn.Geometry.isFrustumIntersectingAabb(cast this, aabb);
	}
	inline public function isIntersectingObb(obb:flight._hl.Obb):Bool {
		return flight._hl._fn.Geometry.isFrustumIntersectingObb(cast this, obb);
	}
	inline public function isIntersectingSphere(sphere:flight._hl.BoundingSphere):Bool {
		return flight._hl._fn.Geometry.isFrustumIntersectingSphere(cast this, sphere);
	}
	inline public function setFromMatrix4(viewProjection:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.setFrustumFromMatrix4(cast this, viewProjection);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freeFrustum(cast this);
	}
}
