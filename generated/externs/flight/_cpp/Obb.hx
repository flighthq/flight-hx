package flight._cpp;

private extern class Obb_Ffi {
	@:native("flight_get_obb_center_x") static function get_centerX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_obb_center_x") static function set_centerX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_obb_center_y") static function get_centerY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_obb_center_y") static function set_centerY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_obb_center_z") static function get_centerZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_obb_center_z") static function set_centerZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_obb_half_extent_x") static function get_halfExtentX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_obb_half_extent_x") static function set_halfExtentX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_obb_half_extent_y") static function get_halfExtentY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_obb_half_extent_y") static function set_halfExtentY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_obb_half_extent_z") static function get_halfExtentZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_obb_half_extent_z") static function set_halfExtentZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_obb_orientation_x") static function get_orientationX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_obb_orientation_x") static function set_orientationX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_obb_orientation_y") static function get_orientationY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_obb_orientation_y") static function set_orientationY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_obb_orientation_z") static function get_orientationZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_obb_orientation_z") static function set_orientationZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_obb_orientation_w") static function get_orientationW(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_obb_orientation_w") static function set_orientationW(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Obb(cpp.Star<cpp.Void>) {
	public var centerX(get, set):Float;

	inline function get_centerX():Float return Obb_Ffi.get_centerX(this);

	inline function set_centerX(value:Float):Float { Obb_Ffi.set_centerX(this, value); return value; }
	public var centerY(get, set):Float;

	inline function get_centerY():Float return Obb_Ffi.get_centerY(this);

	inline function set_centerY(value:Float):Float { Obb_Ffi.set_centerY(this, value); return value; }
	public var centerZ(get, set):Float;

	inline function get_centerZ():Float return Obb_Ffi.get_centerZ(this);

	inline function set_centerZ(value:Float):Float { Obb_Ffi.set_centerZ(this, value); return value; }
	public var halfExtentX(get, set):Float;

	inline function get_halfExtentX():Float return Obb_Ffi.get_halfExtentX(this);

	inline function set_halfExtentX(value:Float):Float { Obb_Ffi.set_halfExtentX(this, value); return value; }
	public var halfExtentY(get, set):Float;

	inline function get_halfExtentY():Float return Obb_Ffi.get_halfExtentY(this);

	inline function set_halfExtentY(value:Float):Float { Obb_Ffi.set_halfExtentY(this, value); return value; }
	public var halfExtentZ(get, set):Float;

	inline function get_halfExtentZ():Float return Obb_Ffi.get_halfExtentZ(this);

	inline function set_halfExtentZ(value:Float):Float { Obb_Ffi.set_halfExtentZ(this, value); return value; }
	public var orientationX(get, set):Float;

	inline function get_orientationX():Float return Obb_Ffi.get_orientationX(this);

	inline function set_orientationX(value:Float):Float { Obb_Ffi.set_orientationX(this, value); return value; }
	public var orientationY(get, set):Float;

	inline function get_orientationY():Float return Obb_Ffi.get_orientationY(this);

	inline function set_orientationY(value:Float):Float { Obb_Ffi.set_orientationY(this, value); return value; }
	public var orientationZ(get, set):Float;

	inline function get_orientationZ():Float return Obb_Ffi.get_orientationZ(this);

	inline function set_orientationZ(value:Float):Float { Obb_Ffi.set_orientationZ(this, value); return value; }
	public var orientationW(get, set):Float;

	inline function get_orientationW():Float return Obb_Ffi.get_orientationW(this);

	inline function set_orientationW(value:Float):Float { Obb_Ffi.set_orientationW(this, value); return value; }

	static extern inline public function create(centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float):flight._cpp.Obb {
		return flight._cpp._fn.Geometry.createObb(centerX, centerY, centerZ, halfExtentX, halfExtentY, halfExtentZ, orientationX, orientationY, orientationZ, orientationW);
	}
	extern inline public function getClosestPointOn(out:flight._cpp.Vector3, point:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.getClosestPointOnObb(out, cast this, point);
	}
	extern inline public function isIntersectingAabb(aabb:flight._cpp.Aabb):Bool {
		return flight._cpp._fn.Geometry.isObbIntersectingAabb(cast this, aabb);
	}
	extern inline public function isObbIntersecting(b:flight._cpp.Obb):Bool {
		return flight._cpp._fn.Geometry.isObbIntersectingObb(cast this, b);
	}
	extern inline public function isIntersectingSphere(sphere:flight._cpp.BoundingSphere):Bool {
		return flight._cpp._fn.Geometry.isObbIntersectingSphere(cast this, sphere);
	}
	extern inline public function set(centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float):Void {
		flight._cpp._fn.Geometry.setObb(cast this, centerX, centerY, centerZ, halfExtentX, halfExtentY, halfExtentZ, orientationX, orientationY, orientationZ, orientationW);
	}
	extern inline public function transformByMatrix4(obb:flight._cpp.Obb, m:flight._cpp.Matrix4):Void {
		flight._cpp._fn.Geometry.transformObbByMatrix4(cast this, obb, m);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Geometry.freeObb(cast this);
	}
}
