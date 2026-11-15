package flight._js;

@:jsRequire("flight")
private extern class Capsule_Ffi {
	@:native("flight_get_capsule_start_x") static function get_startX(ptr:Dynamic):Float;
	@:native("flight_set_capsule_start_x") static function set_startX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_capsule_start_y") static function get_startY(ptr:Dynamic):Float;
	@:native("flight_set_capsule_start_y") static function set_startY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_capsule_start_z") static function get_startZ(ptr:Dynamic):Float;
	@:native("flight_set_capsule_start_z") static function set_startZ(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_capsule_end_x") static function get_endX(ptr:Dynamic):Float;
	@:native("flight_set_capsule_end_x") static function set_endX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_capsule_end_y") static function get_endY(ptr:Dynamic):Float;
	@:native("flight_set_capsule_end_y") static function set_endY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_capsule_end_z") static function get_endZ(ptr:Dynamic):Float;
	@:native("flight_set_capsule_end_z") static function set_endZ(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_capsule_radius") static function get_radius(ptr:Dynamic):Float;
	@:native("flight_set_capsule_radius") static function set_radius(ptr:Dynamic, value:Float):Float;
}

abstract Capsule(Dynamic) {
	public var startX(get, set):Float;

	inline function get_startX():Float return Capsule_Ffi.get_startX(this);

	inline function set_startX(value:Float):Float return Capsule_Ffi.set_startX(this, value);
	public var startY(get, set):Float;

	inline function get_startY():Float return Capsule_Ffi.get_startY(this);

	inline function set_startY(value:Float):Float return Capsule_Ffi.set_startY(this, value);
	public var startZ(get, set):Float;

	inline function get_startZ():Float return Capsule_Ffi.get_startZ(this);

	inline function set_startZ(value:Float):Float return Capsule_Ffi.set_startZ(this, value);
	public var endX(get, set):Float;

	inline function get_endX():Float return Capsule_Ffi.get_endX(this);

	inline function set_endX(value:Float):Float return Capsule_Ffi.set_endX(this, value);
	public var endY(get, set):Float;

	inline function get_endY():Float return Capsule_Ffi.get_endY(this);

	inline function set_endY(value:Float):Float return Capsule_Ffi.set_endY(this, value);
	public var endZ(get, set):Float;

	inline function get_endZ():Float return Capsule_Ffi.get_endZ(this);

	inline function set_endZ(value:Float):Float return Capsule_Ffi.set_endZ(this, value);
	public var radius(get, set):Float;

	inline function get_radius():Float return Capsule_Ffi.get_radius(this);

	inline function set_radius(value:Float):Float return Capsule_Ffi.set_radius(this, value);

	static inline public function create(startX:Float, startY:Float, startZ:Float, endX:Float, endY:Float, endZ:Float, radius:Float):flight._js.Capsule {
		return flight._js._fn.Geometry.createCapsule(startX, startY, startZ, endX, endY, endZ, radius);
	}
	inline public function getClosestPointOn(out:flight._js.Vector3, point:flight._js.Vector3):Void {
		flight._js._fn.Geometry.getClosestPointOnCapsule(out, cast this, point);
	}
	inline public function isIntersectingAabb(aabb:flight._js.Aabb):Bool {
		return flight._js._fn.Geometry.isCapsuleIntersectingAabb(cast this, aabb);
	}
	inline public function isCapsuleIntersecting(b:flight._js.Capsule):Bool {
		return flight._js._fn.Geometry.isCapsuleIntersectingCapsule(cast this, b);
	}
	inline public function isIntersectingSphere(sphere:flight._js.BoundingSphere):Bool {
		return flight._js._fn.Geometry.isCapsuleIntersectingSphere(cast this, sphere);
	}
	inline public function set(startX:Float, startY:Float, startZ:Float, endX:Float, endY:Float, endZ:Float, radius:Float):Void {
		flight._js._fn.Geometry.setCapsule(cast this, startX, startY, startZ, endX, endY, endZ, radius);
	}
	inline public function free():Void {
		flight._js._fn.Geometry.freeCapsule(cast this);
	}
}
