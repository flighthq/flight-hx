package flight._cpp;

private extern class Plane_Ffi {
	@:native("flight_get_plane_a") static function get_a(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_plane_a") static function set_a(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_plane_b") static function get_b(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_plane_b") static function set_b(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_plane_c") static function get_c(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_plane_c") static function set_c(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_plane_d") static function get_d(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_plane_d") static function set_d(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Plane(cpp.Star<cpp.Void>) {
	public var a(get, set):Single;

	inline function get_a():Single return Plane_Ffi.get_a(this);

	inline function set_a(value:Single):Single { Plane_Ffi.set_a(this, value); return value; }
	public var b(get, set):Single;

	inline function get_b():Single return Plane_Ffi.get_b(this);

	inline function set_b(value:Single):Single { Plane_Ffi.set_b(this, value); return value; }
	public var c(get, set):Single;

	inline function get_c():Single return Plane_Ffi.get_c(this);

	inline function set_c(value:Single):Single { Plane_Ffi.set_c(this, value); return value; }
	public var d(get, set):Single;

	inline function get_d():Single return Plane_Ffi.get_d(this);

	inline function set_d(value:Single):Single { Plane_Ffi.set_d(this, value); return value; }

	extern inline public function intersectCamera3dRayWith(out:flight._cpp.Vector3, ray:flight._cpp.Ray3D):Bool {
		return flight._cpp._fn.Camera.intersectCamera3dRayWithPlane(out, ray, cast this);
	}
	extern inline public function applyObliqueNearClip(projection:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Camera.applyObliqueNearClipPlane(projection, cast this);
	}
	extern inline public function reflectCamera3dBy(out:flight._cpp.Camera3D, camera:flight._cpp.Camera3D):Void {
		flight._cpp._fn.Camera.reflectCamera3dByPlane(out, camera, cast this);
	}
	static extern inline public function create(a:Single, b:Single, c:Single, d:Single):flight._cpp.Plane {
		return flight._cpp._fn.Geometry.createPlane(a, b, c, d);
	}
	extern inline public function clone():flight._cpp.Plane {
		return flight._cpp._fn.Geometry.clonePlane(cast this);
	}
	extern inline public function copy(source:flight._cpp.Plane):Void {
		flight._cpp._fn.Geometry.copyPlane(cast this, source);
	}
	extern inline public function getClosestPointOn(out:flight._cpp.Vector3, point:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.getClosestPointOnPlane(out, cast this, point);
	}
	extern inline public function getCoplanarPoint(out:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.getPlaneCoplanarPoint(out, cast this);
	}
	extern inline public function getSignedDistanceToPoint(point:flight._cpp.Vector3):Single {
		return flight._cpp._fn.Geometry.getPlaneSignedDistanceToPoint(cast this, point);
	}
	extern inline public function normalize(source:flight._cpp.Plane):Void {
		flight._cpp._fn.Geometry.normalizePlane(cast this, source);
	}
	extern inline public function set(a:Single, b:Single, c:Single, d:Single):Void {
		flight._cpp._fn.Geometry.setPlane(cast this, a, b, c, d);
	}
	extern inline public function setFromNormalAndPoint(normal:flight._cpp.Vector3, point:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.setPlaneFromNormalAndPoint(cast this, normal, point);
	}
	extern inline public function setFromPoints(a:flight._cpp.Vector3, b:flight._cpp.Vector3, c:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.setPlaneFromPoints(cast this, a, b, c);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Geometry.freePlane(cast this);
	}
}
