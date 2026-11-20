package flight._hl;

abstract Plane(hl.Bytes) {
	public var a(get, set):Float;

	inline function get_a():Float return this.getF64(16);

	inline function set_a(value:Float):Float { this.setF64(16, value); return value; }
	public var b(get, set):Float;

	inline function get_b():Float return this.getF64(24);

	inline function set_b(value:Float):Float { this.setF64(24, value); return value; }
	public var c(get, set):Float;

	inline function get_c():Float return this.getF64(32);

	inline function set_c(value:Float):Float { this.setF64(32, value); return value; }
	public var d(get, set):Float;

	inline function get_d():Float return this.getF64(40);

	inline function set_d(value:Float):Float { this.setF64(40, value); return value; }

	inline public function intersectCamera3dRayWith(out:flight._hl.Vector3, ray:flight._hl.Ray3D):Bool {
		return flight._hl._fn.Camera.intersectCamera3dRayWithPlane(out, ray, cast this);
	}
	inline public function applyObliqueNearClip(projection:flight._hl.Matrix4):Void {
		flight._hl._fn.Camera.applyObliqueNearClipPlane(projection, cast this);
	}
	inline public function reflectCamera3dBy(out:flight._hl.Camera3D, camera:flight._hl.Camera3D):Void {
		flight._hl._fn.Camera.reflectCamera3dByPlane(out, camera, cast this);
	}
	static inline public function create(a:Float, b:Float, c:Float, d:Float):flight._hl.Plane {
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
	inline public function getSignedDistanceToPoint(point:flight._hl.Vector3):Float {
		return flight._hl._fn.Geometry.getPlaneSignedDistanceToPoint(cast this, point);
	}
	inline public function normalize(source:flight._hl.Plane):Void {
		flight._hl._fn.Geometry.normalizePlane(cast this, source);
	}
	inline public function set(a:Float, b:Float, c:Float, d:Float):Void {
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
