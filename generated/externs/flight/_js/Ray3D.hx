package flight._js;

abstract Ray3D(Dynamic) {
	inline public function intersectCapsule(capsule:flight._js.Capsule):Float {
		return flight._js._fn.Geometry.intersectRay3dCapsule(cast this, capsule);
	}
	inline public function intersectObb(obb:flight._js.Obb):Float {
		return flight._js._fn.Geometry.intersectRay3dObb(cast this, obb);
	}
	static inline public function create(originX:Float, originY:Float, originZ:Float, directionX:Float, directionY:Float, directionZ:Float):flight._js.Ray3D {
		return flight._js._fn.Geometry.createRay3d(originX, originY, originZ, directionX, directionY, directionZ);
	}
	inline public function getClosestPointOn(out:flight._js.Vector3, point:flight._js.Vector3):Void {
		flight._js._fn.Geometry.getClosestPointOnRay3d(out, cast this, point);
	}
	inline public function getPointAt(out:flight._js.Vector3, t:Float):Void {
		flight._js._fn.Geometry.getRay3dPointAt(out, cast this, t);
	}
	inline public function intersectAabb(aabb:flight._js.Aabb):Float {
		return flight._js._fn.Geometry.intersectRay3dAabb(cast this, aabb);
	}
	inline public function intersectPlane(plane:flight._js.Plane):Float {
		return flight._js._fn.Geometry.intersectRay3dPlane(cast this, plane);
	}
	inline public function intersectSphere(sphere:flight._js.BoundingSphere):Float {
		return flight._js._fn.Geometry.intersectRay3dSphere(cast this, sphere);
	}
	inline public function intersectTriangle(a:flight._js.Vector3, b:flight._js.Vector3, c:flight._js.Vector3):Float {
		return flight._js._fn.Geometry.intersectRay3dTriangle(cast this, a, b, c);
	}
	inline public function set(origin:flight._js.Vector3, direction:flight._js.Vector3):Void {
		flight._js._fn.Geometry.setRay3d(cast this, origin, direction);
	}
	inline public function transformByMatrix4(ray:flight._js.Ray3D, m:flight._js.Matrix4):Void {
		flight._js._fn.Geometry.transformRay3dByMatrix4(cast this, ray, m);
	}
	inline public function pickScene3dAllWith(outArray:Dynamic, scene:Dynamic, options:Null<flight._js.Scene3DPickOptions>):Void {
		flight._js._fn.Picking.pickScene3dAllWithRay3d(outArray, scene, cast this, options);
	}
	inline public function pickScene3dWith(out:flight._js.Scene3DHit, scene:Dynamic, options:Null<flight._js.Scene3DPickOptions>):Bool {
		return flight._js._fn.Picking.pickScene3dWithRay3d(out, scene, cast this, options);
	}
}
