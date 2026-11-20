package flight._cpp;

private extern class Capsule_Ffi {
	@:native("flight_get_capsule_start_x") static function get_startX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_capsule_start_x") static function set_startX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_capsule_start_y") static function get_startY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_capsule_start_y") static function set_startY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_capsule_start_z") static function get_startZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_capsule_start_z") static function set_startZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_capsule_end_x") static function get_endX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_capsule_end_x") static function set_endX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_capsule_end_y") static function get_endY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_capsule_end_y") static function set_endY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_capsule_end_z") static function get_endZ(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_capsule_end_z") static function set_endZ(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_capsule_radius") static function get_radius(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_capsule_radius") static function set_radius(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract Capsule(cpp.Star<cpp.Void>) {
	public var startX(get, set):Float;

	inline function get_startX():Float return Capsule_Ffi.get_startX(this);

	inline function set_startX(value:Float):Float { Capsule_Ffi.set_startX(this, value); return value; }
	public var startY(get, set):Float;

	inline function get_startY():Float return Capsule_Ffi.get_startY(this);

	inline function set_startY(value:Float):Float { Capsule_Ffi.set_startY(this, value); return value; }
	public var startZ(get, set):Float;

	inline function get_startZ():Float return Capsule_Ffi.get_startZ(this);

	inline function set_startZ(value:Float):Float { Capsule_Ffi.set_startZ(this, value); return value; }
	public var endX(get, set):Float;

	inline function get_endX():Float return Capsule_Ffi.get_endX(this);

	inline function set_endX(value:Float):Float { Capsule_Ffi.set_endX(this, value); return value; }
	public var endY(get, set):Float;

	inline function get_endY():Float return Capsule_Ffi.get_endY(this);

	inline function set_endY(value:Float):Float { Capsule_Ffi.set_endY(this, value); return value; }
	public var endZ(get, set):Float;

	inline function get_endZ():Float return Capsule_Ffi.get_endZ(this);

	inline function set_endZ(value:Float):Float { Capsule_Ffi.set_endZ(this, value); return value; }
	public var radius(get, set):Float;

	inline function get_radius():Float return Capsule_Ffi.get_radius(this);

	inline function set_radius(value:Float):Float { Capsule_Ffi.set_radius(this, value); return value; }

	static extern inline public function create(startX:Float, startY:Float, startZ:Float, endX:Float, endY:Float, endZ:Float, radius:Float):flight._cpp.Capsule {
		return flight._cpp._fn.Geometry.createCapsule(startX, startY, startZ, endX, endY, endZ, radius);
	}
	extern inline public function getClosestPointOn(out:flight._cpp.Vector3, point:flight._cpp.Vector3):Void {
		flight._cpp._fn.Geometry.getClosestPointOnCapsule(out, cast this, point);
	}
	extern inline public function isIntersectingAabb(aabb:flight._cpp.Aabb):Bool {
		return flight._cpp._fn.Geometry.isCapsuleIntersectingAabb(cast this, aabb);
	}
	extern inline public function isCapsuleIntersecting(b:flight._cpp.Capsule):Bool {
		return flight._cpp._fn.Geometry.isCapsuleIntersectingCapsule(cast this, b);
	}
	extern inline public function isIntersectingSphere(sphere:flight._cpp.BoundingSphere):Bool {
		return flight._cpp._fn.Geometry.isCapsuleIntersectingSphere(cast this, sphere);
	}
	extern inline public function set(startX:Float, startY:Float, startZ:Float, endX:Float, endY:Float, endZ:Float, radius:Float):Void {
		flight._cpp._fn.Geometry.setCapsule(cast this, startX, startY, startZ, endX, endY, endZ, radius);
	}
	extern inline public function free():Void {
		flight._cpp._fn.Geometry.freeCapsule(cast this);
	}
}
