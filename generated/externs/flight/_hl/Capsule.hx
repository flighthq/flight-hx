package flight._hl;

abstract Capsule(hl.Bytes) {
	public var startX(get, set):Float;

	inline function get_startX():Float return this.getF64(16);

	inline function set_startX(value:Float):Float { this.setF64(16, value); return value; }
	public var startY(get, set):Float;

	inline function get_startY():Float return this.getF64(24);

	inline function set_startY(value:Float):Float { this.setF64(24, value); return value; }
	public var startZ(get, set):Float;

	inline function get_startZ():Float return this.getF64(32);

	inline function set_startZ(value:Float):Float { this.setF64(32, value); return value; }
	public var endX(get, set):Float;

	inline function get_endX():Float return this.getF64(40);

	inline function set_endX(value:Float):Float { this.setF64(40, value); return value; }
	public var endY(get, set):Float;

	inline function get_endY():Float return this.getF64(48);

	inline function set_endY(value:Float):Float { this.setF64(48, value); return value; }
	public var endZ(get, set):Float;

	inline function get_endZ():Float return this.getF64(56);

	inline function set_endZ(value:Float):Float { this.setF64(56, value); return value; }
	public var radius(get, set):Float;

	inline function get_radius():Float return this.getF64(64);

	inline function set_radius(value:Float):Float { this.setF64(64, value); return value; }

	static inline public function create(startX:Float, startY:Float, startZ:Float, endX:Float, endY:Float, endZ:Float, radius:Float):flight._hl.Capsule {
		return flight._hl._fn.Geometry.createCapsule(startX, startY, startZ, endX, endY, endZ, radius);
	}
	inline public function getClosestPointOn(out:flight._hl.Vector3, point:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.getClosestPointOnCapsule(out, cast this, point);
	}
	inline public function isIntersectingAabb(aabb:flight._hl.Aabb):Bool {
		return flight._hl._fn.Geometry.isCapsuleIntersectingAabb(cast this, aabb);
	}
	inline public function isCapsuleIntersecting(b:flight._hl.Capsule):Bool {
		return flight._hl._fn.Geometry.isCapsuleIntersectingCapsule(cast this, b);
	}
	inline public function isIntersectingSphere(sphere:flight._hl.BoundingSphere):Bool {
		return flight._hl._fn.Geometry.isCapsuleIntersectingSphere(cast this, sphere);
	}
	inline public function set(startX:Float, startY:Float, startZ:Float, endX:Float, endY:Float, endZ:Float, radius:Float):Void {
		flight._hl._fn.Geometry.setCapsule(cast this, startX, startY, startZ, endX, endY, endZ, radius);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freeCapsule(cast this);
	}
}
