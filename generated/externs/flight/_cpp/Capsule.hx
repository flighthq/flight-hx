package flight._cpp;

private extern class Capsule_Ffi {
	@:native("flight_get_capsule_start_x") static function get_startX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_capsule_start_x") static function set_startX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_capsule_start_y") static function get_startY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_capsule_start_y") static function set_startY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_capsule_start_z") static function get_startZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_capsule_start_z") static function set_startZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_capsule_end_x") static function get_endX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_capsule_end_x") static function set_endX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_capsule_end_y") static function get_endY(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_capsule_end_y") static function set_endY(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_capsule_end_z") static function get_endZ(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_capsule_end_z") static function set_endZ(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_capsule_radius") static function get_radius(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_capsule_radius") static function set_radius(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract Capsule(cpp.Star<cpp.Void>) {
	public var startX(get, set):Single;

	inline function get_startX():Single return Capsule_Ffi.get_startX(this);

	inline function set_startX(value:Single):Single return Capsule_Ffi.set_startX(this, value);
	public var startY(get, set):Single;

	inline function get_startY():Single return Capsule_Ffi.get_startY(this);

	inline function set_startY(value:Single):Single return Capsule_Ffi.set_startY(this, value);
	public var startZ(get, set):Single;

	inline function get_startZ():Single return Capsule_Ffi.get_startZ(this);

	inline function set_startZ(value:Single):Single return Capsule_Ffi.set_startZ(this, value);
	public var endX(get, set):Single;

	inline function get_endX():Single return Capsule_Ffi.get_endX(this);

	inline function set_endX(value:Single):Single return Capsule_Ffi.set_endX(this, value);
	public var endY(get, set):Single;

	inline function get_endY():Single return Capsule_Ffi.get_endY(this);

	inline function set_endY(value:Single):Single return Capsule_Ffi.set_endY(this, value);
	public var endZ(get, set):Single;

	inline function get_endZ():Single return Capsule_Ffi.get_endZ(this);

	inline function set_endZ(value:Single):Single return Capsule_Ffi.set_endZ(this, value);
	public var radius(get, set):Single;

	inline function get_radius():Single return Capsule_Ffi.get_radius(this);

	inline function set_radius(value:Single):Single return Capsule_Ffi.set_radius(this, value);

	static inline public function create(startX:Single, startY:Single, startZ:Single, endX:Single, endY:Single, endZ:Single, radius:Single):flight._cpp.Capsule {
		return flight._cpp._fn.Geometry.createCapsule(startX, startY, startZ, endX, endY, endZ, radius);
	}
	inline public function getClosestPointOn(out:flight._cpp.Vector3, point:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.getClosestPointOnCapsule(out, cast this, point);
	}
	inline public function isIntersectingAabb(aabb:flight._cpp.Aabb):Bool {
		return flight._cpp._fn.Geometry.isCapsuleIntersectingAabb(cast this, aabb);
	}
	inline public function isCapsuleIntersecting(b:flight._cpp.Capsule):Bool {
		return flight._cpp._fn.Geometry.isCapsuleIntersectingCapsule(cast this, b);
	}
	inline public function isIntersectingSphere(sphere:flight._cpp.BoundingSphere):Bool {
		return flight._cpp._fn.Geometry.isCapsuleIntersectingSphere(cast this, sphere);
	}
	inline public function set(startX:Single, startY:Single, startZ:Single, endX:Single, endY:Single, endZ:Single, radius:Single):Void {
		flight._cpp._fn.Geometry.setCapsule(cast this, startX, startY, startZ, endX, endY, endZ, radius);
	}
	inline public function free():Void {
		flight._cpp._fn.Geometry.freeCapsule(cast this);
	}
}
