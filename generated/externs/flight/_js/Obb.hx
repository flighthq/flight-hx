package flight._js;

abstract Obb(Dynamic) {
	public var centerX(get, set):Float;
	inline function get_centerX():Float return untyped this["centerX"];
	inline function set_centerX(value:Float):Float return untyped this["centerX"] = value;
	public var centerY(get, set):Float;
	inline function get_centerY():Float return untyped this["centerY"];
	inline function set_centerY(value:Float):Float return untyped this["centerY"] = value;
	public var centerZ(get, set):Float;
	inline function get_centerZ():Float return untyped this["centerZ"];
	inline function set_centerZ(value:Float):Float return untyped this["centerZ"] = value;
	public var halfExtentX(get, set):Float;
	inline function get_halfExtentX():Float return untyped this["halfExtentX"];
	inline function set_halfExtentX(value:Float):Float return untyped this["halfExtentX"] = value;
	public var halfExtentY(get, set):Float;
	inline function get_halfExtentY():Float return untyped this["halfExtentY"];
	inline function set_halfExtentY(value:Float):Float return untyped this["halfExtentY"] = value;
	public var halfExtentZ(get, set):Float;
	inline function get_halfExtentZ():Float return untyped this["halfExtentZ"];
	inline function set_halfExtentZ(value:Float):Float return untyped this["halfExtentZ"] = value;
	public var orientationX(get, set):Float;
	inline function get_orientationX():Float return untyped this["orientationX"];
	inline function set_orientationX(value:Float):Float return untyped this["orientationX"] = value;
	public var orientationY(get, set):Float;
	inline function get_orientationY():Float return untyped this["orientationY"];
	inline function set_orientationY(value:Float):Float return untyped this["orientationY"] = value;
	public var orientationZ(get, set):Float;
	inline function get_orientationZ():Float return untyped this["orientationZ"];
	inline function set_orientationZ(value:Float):Float return untyped this["orientationZ"] = value;
	public var orientationW(get, set):Float;
	inline function get_orientationW():Float return untyped this["orientationW"];
	inline function set_orientationW(value:Float):Float return untyped this["orientationW"] = value;
	static inline public function create(centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float):flight._js.Obb {
		return flight._js._fn.Geometry.createObb(centerX, centerY, centerZ, halfExtentX, halfExtentY, halfExtentZ, orientationX, orientationY, orientationZ, orientationW);
	}
	inline public function getClosestPointOn(out:flight._js.Vector3, point:flight._js.Vector3):Void {
		flight._js._fn.Geometry.getClosestPointOnObb(out, cast this, point);
	}
	inline public function isIntersectingAabb(aabb:flight._js.Aabb):Bool {
		return flight._js._fn.Geometry.isObbIntersectingAabb(cast this, aabb);
	}
	inline public function isObbIntersecting(b:flight._js.Obb):Bool {
		return flight._js._fn.Geometry.isObbIntersectingObb(cast this, b);
	}
	inline public function isIntersectingSphere(sphere:flight._js.BoundingSphere):Bool {
		return flight._js._fn.Geometry.isObbIntersectingSphere(cast this, sphere);
	}
	inline public function set(centerX:Float, centerY:Float, centerZ:Float, halfExtentX:Float, halfExtentY:Float, halfExtentZ:Float, orientationX:Float, orientationY:Float, orientationZ:Float, orientationW:Float):Void {
		flight._js._fn.Geometry.setObb(cast this, centerX, centerY, centerZ, halfExtentX, halfExtentY, halfExtentZ, orientationX, orientationY, orientationZ, orientationW);
	}
	inline public function transformByMatrix4(obb:flight._js.Obb, m:flight._js.Matrix4):Void {
		flight._js._fn.Geometry.transformObbByMatrix4(cast this, obb, m);
	}
	inline public function free():Void {
		flight._js._fn.Geometry.freeObb(cast this);
	}
}
