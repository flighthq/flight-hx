package flight._js;

abstract Capsule(Dynamic) {
	public var startX(get, set):Float;
	inline function get_startX():Float return untyped this["startX"];
	inline function set_startX(value:Float):Float return untyped this["startX"] = value;
	public var startY(get, set):Float;
	inline function get_startY():Float return untyped this["startY"];
	inline function set_startY(value:Float):Float return untyped this["startY"] = value;
	public var startZ(get, set):Float;
	inline function get_startZ():Float return untyped this["startZ"];
	inline function set_startZ(value:Float):Float return untyped this["startZ"] = value;
	public var endX(get, set):Float;
	inline function get_endX():Float return untyped this["endX"];
	inline function set_endX(value:Float):Float return untyped this["endX"] = value;
	public var endY(get, set):Float;
	inline function get_endY():Float return untyped this["endY"];
	inline function set_endY(value:Float):Float return untyped this["endY"] = value;
	public var endZ(get, set):Float;
	inline function get_endZ():Float return untyped this["endZ"];
	inline function set_endZ(value:Float):Float return untyped this["endZ"] = value;
	public var radius(get, set):Float;
	inline function get_radius():Float return untyped this["radius"];
	inline function set_radius(value:Float):Float return untyped this["radius"] = value;
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
