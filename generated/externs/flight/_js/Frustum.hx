package flight._js;

abstract Frustum(Dynamic) {
	inline public function getCamera3d(camera:flight._js.Camera3D, aspect:Float):Void {
		flight._js._fn.Camera.getCamera3dFrustum(cast this, camera, aspect);
	}
	static inline public function create():flight._js.Frustum {
		return flight._js._fn.Geometry.createFrustum();
	}
	inline public function isContainingPoint(point:flight._js.Vector3):Bool {
		return flight._js._fn.Geometry.isFrustumContainingPoint(cast this, point);
	}
	inline public function isIntersectingAabb(aabb:flight._js.Aabb):Bool {
		return flight._js._fn.Geometry.isFrustumIntersectingAabb(cast this, aabb);
	}
	inline public function isIntersectingObb(obb:flight._js.Obb):Bool {
		return flight._js._fn.Geometry.isFrustumIntersectingObb(cast this, obb);
	}
	inline public function isIntersectingSphere(sphere:flight._js.BoundingSphere):Bool {
		return flight._js._fn.Geometry.isFrustumIntersectingSphere(cast this, sphere);
	}
	inline public function setFromMatrix4(viewProjection:flight._js.Matrix4):Void {
		flight._js._fn.Geometry.setFrustumFromMatrix4(cast this, viewProjection);
	}
	inline public function free():Void {
		flight._js._fn.Geometry.freeFrustum(cast this);
	}
}
