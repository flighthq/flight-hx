package flight._js;

@:jsRequire("flight")
private extern class Obb_Ffi {
	@:native("flight_get_obb_center_x") static function get_centerX(ptr:Dynamic):Float;
	@:native("flight_set_obb_center_x") static function set_centerX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_obb_center_y") static function get_centerY(ptr:Dynamic):Float;
	@:native("flight_set_obb_center_y") static function set_centerY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_obb_center_z") static function get_centerZ(ptr:Dynamic):Float;
	@:native("flight_set_obb_center_z") static function set_centerZ(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_obb_half_extent_x") static function get_halfExtentX(ptr:Dynamic):Float;
	@:native("flight_set_obb_half_extent_x") static function set_halfExtentX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_obb_half_extent_y") static function get_halfExtentY(ptr:Dynamic):Float;
	@:native("flight_set_obb_half_extent_y") static function set_halfExtentY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_obb_half_extent_z") static function get_halfExtentZ(ptr:Dynamic):Float;
	@:native("flight_set_obb_half_extent_z") static function set_halfExtentZ(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_obb_orientation_x") static function get_orientationX(ptr:Dynamic):Float;
	@:native("flight_set_obb_orientation_x") static function set_orientationX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_obb_orientation_y") static function get_orientationY(ptr:Dynamic):Float;
	@:native("flight_set_obb_orientation_y") static function set_orientationY(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_obb_orientation_z") static function get_orientationZ(ptr:Dynamic):Float;
	@:native("flight_set_obb_orientation_z") static function set_orientationZ(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_obb_orientation_w") static function get_orientationW(ptr:Dynamic):Float;
	@:native("flight_set_obb_orientation_w") static function set_orientationW(ptr:Dynamic, value:Float):Float;
}

abstract Obb(Dynamic) {
	public var centerX(get, set):Float;

	inline function get_centerX():Float return Obb_Ffi.get_centerX(this);

	inline function set_centerX(value:Float):Float return Obb_Ffi.set_centerX(this, value);
	public var centerY(get, set):Float;

	inline function get_centerY():Float return Obb_Ffi.get_centerY(this);

	inline function set_centerY(value:Float):Float return Obb_Ffi.set_centerY(this, value);
	public var centerZ(get, set):Float;

	inline function get_centerZ():Float return Obb_Ffi.get_centerZ(this);

	inline function set_centerZ(value:Float):Float return Obb_Ffi.set_centerZ(this, value);
	public var halfExtentX(get, set):Float;

	inline function get_halfExtentX():Float return Obb_Ffi.get_halfExtentX(this);

	inline function set_halfExtentX(value:Float):Float return Obb_Ffi.set_halfExtentX(this, value);
	public var halfExtentY(get, set):Float;

	inline function get_halfExtentY():Float return Obb_Ffi.get_halfExtentY(this);

	inline function set_halfExtentY(value:Float):Float return Obb_Ffi.set_halfExtentY(this, value);
	public var halfExtentZ(get, set):Float;

	inline function get_halfExtentZ():Float return Obb_Ffi.get_halfExtentZ(this);

	inline function set_halfExtentZ(value:Float):Float return Obb_Ffi.set_halfExtentZ(this, value);
	public var orientationX(get, set):Float;

	inline function get_orientationX():Float return Obb_Ffi.get_orientationX(this);

	inline function set_orientationX(value:Float):Float return Obb_Ffi.set_orientationX(this, value);
	public var orientationY(get, set):Float;

	inline function get_orientationY():Float return Obb_Ffi.get_orientationY(this);

	inline function set_orientationY(value:Float):Float return Obb_Ffi.set_orientationY(this, value);
	public var orientationZ(get, set):Float;

	inline function get_orientationZ():Float return Obb_Ffi.get_orientationZ(this);

	inline function set_orientationZ(value:Float):Float return Obb_Ffi.set_orientationZ(this, value);
	public var orientationW(get, set):Float;

	inline function get_orientationW():Float return Obb_Ffi.get_orientationW(this);

	inline function set_orientationW(value:Float):Float return Obb_Ffi.set_orientationW(this, value);

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
