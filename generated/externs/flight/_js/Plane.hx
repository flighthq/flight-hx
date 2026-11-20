package flight._js;

abstract Plane(Dynamic) {
	public var a(get, set):Float;
	inline function get_a():Float return untyped this.a;
	inline function set_a(value:Float):Float return untyped this.a = value;
	public var b(get, set):Float;
	inline function get_b():Float return untyped this.b;
	inline function set_b(value:Float):Float return untyped this.b = value;
	public var c(get, set):Float;
	inline function get_c():Float return untyped this.c;
	inline function set_c(value:Float):Float return untyped this.c = value;
	public var d(get, set):Float;
	inline function get_d():Float return untyped this.d;
	inline function set_d(value:Float):Float return untyped this.d = value;
	inline public function intersectCamera3dRayWith(out:flight._js.Vector3, ray:flight._js.Ray3D):Bool {
		return flight._js._fn.Camera.intersectCamera3dRayWithPlane(out, ray, cast this);
	}
	inline public function applyObliqueNearClip(projection:flight._js.Matrix4):Void {
		flight._js._fn.Camera.applyObliqueNearClipPlane(projection, cast this);
	}
	inline public function reflectCamera3dBy(out:flight._js.Camera3D, camera:flight._js.Camera3D):Void {
		flight._js._fn.Camera.reflectCamera3dByPlane(out, camera, cast this);
	}
	static inline public function create(a:Float, b:Float, c:Float, d:Float):flight._js.Plane {
		return flight._js._fn.Geometry.createPlane(a, b, c, d);
	}
	inline public function clone():flight._js.Plane {
		return flight._js._fn.Geometry.clonePlane(cast this);
	}
	inline public function copy(source:flight._js.Plane):Void {
		flight._js._fn.Geometry.copyPlane(cast this, source);
	}
	inline public function getClosestPointOn(out:flight._js.Vector3, point:flight._js.Vector3):Void {
		flight._js._fn.Geometry.getClosestPointOnPlane(out, cast this, point);
	}
	inline public function getCoplanarPoint(out:flight._js.Vector3):Void {
		flight._js._fn.Geometry.getPlaneCoplanarPoint(out, cast this);
	}
	inline public function getSignedDistanceToPoint(point:flight._js.Vector3):Float {
		return flight._js._fn.Geometry.getPlaneSignedDistanceToPoint(cast this, point);
	}
	inline public function normalize(source:flight._js.Plane):Void {
		flight._js._fn.Geometry.normalizePlane(cast this, source);
	}
	inline public function set(a:Float, b:Float, c:Float, d:Float):Void {
		flight._js._fn.Geometry.setPlane(cast this, a, b, c, d);
	}
	inline public function setFromNormalAndPoint(normal:flight._js.Vector3, point:flight._js.Vector3):Void {
		flight._js._fn.Geometry.setPlaneFromNormalAndPoint(cast this, normal, point);
	}
	inline public function setFromPoints(a:flight._js.Vector3, b:flight._js.Vector3, c:flight._js.Vector3):Void {
		flight._js._fn.Geometry.setPlaneFromPoints(cast this, a, b, c);
	}
	inline public function free():Void {
		flight._js._fn.Geometry.freePlane(cast this);
	}
}
