package flight._hl;

abstract Obb(hl.Bytes) {
	public var centerX(get, set):Float;

	inline function get_centerX():Float return this.getF64(16);

	inline function set_centerX(value:Float):Float { this.setF64(16, value); return value; }
	public var centerY(get, set):Float;

	inline function get_centerY():Float return this.getF64(24);

	inline function set_centerY(value:Float):Float { this.setF64(24, value); return value; }
	public var centerZ(get, set):Float;

	inline function get_centerZ():Float return this.getF64(32);

	inline function set_centerZ(value:Float):Float { this.setF64(32, value); return value; }
	public var halfExtentX(get, set):Float;

	inline function get_halfExtentX():Float return this.getF64(40);

	inline function set_halfExtentX(value:Float):Float { this.setF64(40, value); return value; }
	public var halfExtentY(get, set):Float;

	inline function get_halfExtentY():Float return this.getF64(48);

	inline function set_halfExtentY(value:Float):Float { this.setF64(48, value); return value; }
	public var halfExtentZ(get, set):Float;

	inline function get_halfExtentZ():Float return this.getF64(56);

	inline function set_halfExtentZ(value:Float):Float { this.setF64(56, value); return value; }
	public var orientationX(get, set):Float;

	inline function get_orientationX():Float return this.getF64(64);

	inline function set_orientationX(value:Float):Float { this.setF64(64, value); return value; }
	public var orientationY(get, set):Float;

	inline function get_orientationY():Float return this.getF64(72);

	inline function set_orientationY(value:Float):Float { this.setF64(72, value); return value; }
	public var orientationZ(get, set):Float;

	inline function get_orientationZ():Float return this.getF64(80);

	inline function set_orientationZ(value:Float):Float { this.setF64(80, value); return value; }
	public var orientationW(get, set):Float;

	inline function get_orientationW():Float return this.getF64(88);

	inline function set_orientationW(value:Float):Float { this.setF64(88, value); return value; }

	static inline public function create(centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float):flight._hl.Obb {
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
	inline public function set(centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float):Void {
		flight._hl._fn.Geometry.setObb(cast this, centerX, centerY, centerZ, halfExtentX, halfExtentY, halfExtentZ, orientationX, orientationY, orientationZ, orientationW);
	}
	inline public function transformByMatrix4(obb:flight._hl.Obb, m:flight._hl.Matrix4):Void {
		flight._hl._fn.Geometry.transformObbByMatrix4(cast this, obb, m);
	}
	inline public function free():Void {
		flight._hl._fn.Geometry.freeObb(cast this);
	}
}
