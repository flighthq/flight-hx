package flight._hl;

abstract Obb(hl.Bytes) {
	public var centerX(get, set):Single;

	inline function get_centerX():Single return this.getF32(16);

	inline function set_centerX(value:Single):Single { this.setF32(16, value); return value; }
	public var centerY(get, set):Single;

	inline function get_centerY():Single return this.getF32(20);

	inline function set_centerY(value:Single):Single { this.setF32(20, value); return value; }
	public var centerZ(get, set):Single;

	inline function get_centerZ():Single return this.getF32(24);

	inline function set_centerZ(value:Single):Single { this.setF32(24, value); return value; }
	public var halfExtentX(get, set):Single;

	inline function get_halfExtentX():Single return this.getF32(28);

	inline function set_halfExtentX(value:Single):Single { this.setF32(28, value); return value; }
	public var halfExtentY(get, set):Single;

	inline function get_halfExtentY():Single return this.getF32(32);

	inline function set_halfExtentY(value:Single):Single { this.setF32(32, value); return value; }
	public var halfExtentZ(get, set):Single;

	inline function get_halfExtentZ():Single return this.getF32(36);

	inline function set_halfExtentZ(value:Single):Single { this.setF32(36, value); return value; }
	public var orientationX(get, set):Single;

	inline function get_orientationX():Single return this.getF32(40);

	inline function set_orientationX(value:Single):Single { this.setF32(40, value); return value; }
	public var orientationY(get, set):Single;

	inline function get_orientationY():Single return this.getF32(44);

	inline function set_orientationY(value:Single):Single { this.setF32(44, value); return value; }
	public var orientationZ(get, set):Single;

	inline function get_orientationZ():Single return this.getF32(48);

	inline function set_orientationZ(value:Single):Single { this.setF32(48, value); return value; }
	public var orientationW(get, set):Single;

	inline function get_orientationW():Single return this.getF32(52);

	inline function set_orientationW(value:Single):Single { this.setF32(52, value); return value; }

	static inline public function create(centerX:Single, centerY:Single, centerZ:Single, halfExtentX:Single, halfExtentY:Single, halfExtentZ:Single, orientationX:Single, orientationY:Single, orientationZ:Single, orientationW:Single):flight._hl.Obb {
		return flight._hl._fn.Geometry.createObb(centerX, centerY, centerZ, halfExtentX, halfExtentY, halfExtentZ, orientationX, orientationY, orientationZ, orientationW);
	}
	inline public function getClosestPointOn(out:flight._hl.Vector3, point:flight._hl.Vector3):Void {
		flight._hl._fn.Geometry.getClosestPointOnObb(out, cast this, point);
	}
	inline public function isIntersectingAabb(aabb:flight._hl.Aabb):Bool {
		return flight._hl._fn.Geometry.isObbIntersectingAabb(cast this, aabb);
	}
	inline public function isObbIntersecting(b:flight._hl.Obb):Bool {
		return flight._hl._fn.Geometry.isObbIntersectingObb(cast this, b);
	}
	inline public function isIntersectingSphere(sphere:flight._hl.BoundingSphere):Bool {
		return flight._hl._fn.Geometry.isObbIntersectingSphere(cast this, sphere);
	}
	inline public function set(centerX:Single, centerY:Single, centerZ:Single, halfExtentX:Single, halfExtentY:Single, halfExtentZ:Single, orientationX:Single, orientationY:Single, orientationZ:Single, orientationW:Single):Void {
		flight._hl._fn.Geometry.setObb(cast this, centerX, centerY, centerZ, halfExtentX, halfExtentY, halfExtentZ, orientationX, orientationY, orientationZ, orientationW);
	}
	inline public function transformByMatrix4(obb:flight._hl.Obb, m:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.transformObbByMatrix4(cast this, obb, m);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freeObb(cast this);
	}
}
