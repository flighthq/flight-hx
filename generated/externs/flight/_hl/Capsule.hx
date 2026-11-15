package flight._hl;

abstract Capsule(hl.Bytes) {
	public var startX(get, set):Single;

	inline function get_startX():Single return this.getF32(16);

	inline function set_startX(value:Single):Single { this.setF32(16, value); return value; }
	public var startY(get, set):Single;

	inline function get_startY():Single return this.getF32(20);

	inline function set_startY(value:Single):Single { this.setF32(20, value); return value; }
	public var startZ(get, set):Single;

	inline function get_startZ():Single return this.getF32(24);

	inline function set_startZ(value:Single):Single { this.setF32(24, value); return value; }
	public var endX(get, set):Single;

	inline function get_endX():Single return this.getF32(28);

	inline function set_endX(value:Single):Single { this.setF32(28, value); return value; }
	public var endY(get, set):Single;

	inline function get_endY():Single return this.getF32(32);

	inline function set_endY(value:Single):Single { this.setF32(32, value); return value; }
	public var endZ(get, set):Single;

	inline function get_endZ():Single return this.getF32(36);

	inline function set_endZ(value:Single):Single { this.setF32(36, value); return value; }
	public var radius(get, set):Single;

	inline function get_radius():Single return this.getF32(40);

	inline function set_radius(value:Single):Single { this.setF32(40, value); return value; }

	static inline public function create(startX:Single, startY:Single, startZ:Single, endX:Single, endY:Single, endZ:Single, radius:Single):flight._hl.Capsule {
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
	inline public function set(startX:Single, startY:Single, startZ:Single, endX:Single, endY:Single, endZ:Single, radius:Single):Void {
		flight._hl._fn.Geometry.setCapsule(cast this, startX, startY, startZ, endX, endY, endZ, radius);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freeCapsule(cast this);
	}
}
