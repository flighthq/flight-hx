package flight._hl;

abstract Plane(hl.Bytes) {
	public var a(get, set):Single;

	inline function get_a():Single return this.getF32(16);

	inline function set_a(value:Single):Single { this.setF32(16, value); return value; }
	public var b(get, set):Single;

	inline function get_b():Single return this.getF32(20);

	inline function set_b(value:Single):Single { this.setF32(20, value); return value; }
	public var c(get, set):Single;

	inline function get_c():Single return this.getF32(24);

	inline function set_c(value:Single):Single { this.setF32(24, value); return value; }
	public var d(get, set):Single;

	inline function get_d():Single return this.getF32(28);

	inline function set_d(value:Single):Single { this.setF32(28, value); return value; }

	inline public function intersectCamera3dRayWith(out:flight._hl.Vector3, ray:flight._hl.Ray3D):Bool {
		return flight._hl._fn.Camera.intersectCamera3dRayWithPlane(out, ray, cast this);
	}
	inline public function applyObliqueNearClip(projection:flight._hl.Matrix4):Void {
		flight._hl._fn.Camera.applyObliqueNearClipPlane(projection, cast this);
	}
	inline public function reflectCamera3dBy(out:flight._hl.Camera3D, camera:flight._hl.Camera3D):Void {
		flight._hl._fn.Camera.reflectCamera3dByPlane(out, camera, cast this);
	}
	static inline public function create(a:Single, b:Single, c:Single, d:Single):flight._hl.Plane {
		return flight._hl._fn.Geometry.createPlane(a, b, c, d);
	}
	inline public function clone():flight._hl.Plane {
		return flight._hl._fn.Geometry.clonePlane(cast this);
	}
	inline public function copy(source:flight._hl.Plane):Void {
		flight._hl._fn.Geometry.copyPlane(cast this, source);
	}
	inline public function getClosestPointOn(out:flight._hl.Vector3, point:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.getClosestPointOnPlane(out, cast this, point);
	}
	inline public function getCoplanarPoint(out:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.getPlaneCoplanarPoint(out, cast this);
	}
	inline public function getSignedDistanceToPoint(point:flight._hl.Vector3):Single {
		return flight._hl._fn.Geometry.getPlaneSignedDistanceToPoint(cast this, point);
	}
	inline public function normalize(source:flight._hl.Plane):Void {
		flight._hl._fn.Geometry.normalizePlane(cast this, source);
	}
	inline public function set(a:Single, b:Single, c:Single, d:Single):Void {
		flight._hl._fn.Geometry.setPlane(cast this, a, b, c, d);
	}
	inline public function setFromNormalAndPoint(normal:flight._hl.Vector3, point:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.setPlaneFromNormalAndPoint(cast this, normal, point);
	}
	inline public function setFromPoints(a:flight._hl.Vector3, b:flight._hl.Vector3, c:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.setPlaneFromPoints(cast this, a, b, c);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freePlane(cast this);
	}
}
