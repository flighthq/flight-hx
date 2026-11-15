package flight._cpp;

abstract Ray3D(cpp.Star<cpp.Void>) {
	inline public function intersectCapsule(capsule:flight._cpp.Capsule):Single {
		return flight._cpp._fn.Geometry.intersectRay3dCapsule(cast this, capsule);
	}
	inline public function intersectObb(obb:flight._cpp.Obb):Single {
		return flight._cpp._fn.Geometry.intersectRay3dObb(cast this, obb);
	}
	static inline public function create(originX:Single, originY:Single, originZ:Single, directionX:Single, directionY:Single, directionZ:Single):flight._cpp.Ray3D {
		return flight._cpp._fn.Geometry.createRay3d(originX, originY, originZ, directionX, directionY, directionZ);
	}
	inline public function getClosestPointOn(out:flight._cpp.Vector3, point:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.getClosestPointOnRay3d(out, cast this, point);
	}
	inline public function getPointAt(out:flight._cpp.Vector3, t:Single):Void {
		flight._cpp._fn.Geometry.getRay3dPointAt(out, cast this, t);
	}
	inline public function intersectAabb(aabb:flight._cpp.Aabb):Single {
		return flight._cpp._fn.Geometry.intersectRay3dAabb(cast this, aabb);
	}
	inline public function intersectPlane(plane:flight._cpp.Plane):Single {
		return flight._cpp._fn.Geometry.intersectRay3dPlane(cast this, plane);
	}
	inline public function intersectSphere(sphere:flight._cpp.BoundingSphere):Single {
		return flight._cpp._fn.Geometry.intersectRay3dSphere(cast this, sphere);
	}
	inline public function intersectTriangle(a:flight._cpp.Vector3, b:flight._cpp.Vector3, c:flight._cpp.Vector3):Single {
		return flight._cpp._fn.Geometry.intersectRay3dTriangle(cast this, a, b, c);
	}
	inline public function set(origin:flight._cpp.Vector3, direction:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.setRay3d(cast this, origin, direction);
	}
	inline public function transformByMatrix4(ray:flight._cpp.Ray3D, m:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.transformRay3dByMatrix4(cast this, ray, m);
	}
	inline public function pickScene3dAllWith(outArray:cpp.Star<cpp.Void>, scene:cpp.Star<cpp.Void>, options:flight._cpp.Scene3DPickOptions):Void {
		flight._cpp._fn.Picking.pickScene3dAllWithRay3d(outArray, scene, cast this, options);
	}
	inline public function pickScene3dWith(out:flight._cpp.Scene3DHit, scene:cpp.Star<cpp.Void>, options:flight._cpp.Scene3DPickOptions):Bool {
		return flight._cpp._fn.Picking.pickScene3dWithRay3d(out, scene, cast this, options);
	}
}
