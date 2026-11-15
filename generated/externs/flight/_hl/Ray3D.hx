package flight._hl;

abstract Ray3D(hl.Bytes) {
	inline public function intersectCapsule(capsule:flight._hl.Capsule):Single {
		return flight._hl._fn.Geometry.intersectRay3dCapsule(cast this, capsule);
	}
	inline public function intersectObb(obb:flight._hl.Obb):Single {
		return flight._hl._fn.Geometry.intersectRay3dObb(cast this, obb);
	}
	static inline public function create(originX:Single, originY:Single, originZ:Single, directionX:Single, directionY:Single, directionZ:Single):flight._hl.Ray3D {
		return flight._hl._fn.Geometry.createRay3d(originX, originY, originZ, directionX, directionY, directionZ);
	}
	inline public function getClosestPointOn(out:flight._hl.Vector3, point:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.getClosestPointOnRay3d(out, cast this, point);
	}
	inline public function getPointAt(out:flight._hl.Vector3, t:Single):Void {
		flight._hl._fn.Geometry.getRay3dPointAt(out, cast this, t);
	}
	inline public function intersectAabb(aabb:flight._hl.Aabb):Single {
		return flight._hl._fn.Geometry.intersectRay3dAabb(cast this, aabb);
	}
	inline public function intersectPlane(plane:flight._hl.Plane):Single {
		return flight._hl._fn.Geometry.intersectRay3dPlane(cast this, plane);
	}
	inline public function intersectSphere(sphere:flight._hl.BoundingSphere):Single {
		return flight._hl._fn.Geometry.intersectRay3dSphere(cast this, sphere);
	}
	inline public function intersectTriangle(a:flight._hl.Vector3, b:flight._hl.Vector3, c:flight._hl.Vector3):Single {
		return flight._hl._fn.Geometry.intersectRay3dTriangle(cast this, a, b, c);
	}
	inline public function set(origin:flight._hl.Vector3, direction:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.setRay3d(cast this, origin, direction);
	}
	inline public function transformByMatrix4(ray:flight._hl.Ray3D, m:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.transformRay3dByMatrix4(cast this, ray, m);
	}
	inline public function pickScene3dAllWith(outArray:Dynamic, scene:Dynamic, options:flight._hl.Scene3DPickOptions):Void {
		flight._hl._fn.Picking.pickScene3dAllWithRay3d(outArray, scene, cast this, options);
	}
	inline public function pickScene3dWith(out:flight._hl.Scene3DHit, scene:Dynamic, options:flight._hl.Scene3DPickOptions):Bool {
		return flight._hl._fn.Picking.pickScene3dWithRay3d(out, scene, cast this, options);
	}
}
