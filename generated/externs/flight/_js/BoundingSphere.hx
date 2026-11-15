package flight._js;

@:jsRequire("flight")
private extern class BoundingSphere_Ffi {
	@:native("flight_get_bounding_sphere_radius") static function get_radius(ptr:Dynamic):Float;
	@:native("flight_set_bounding_sphere_radius") static function set_radius(ptr:Dynamic, value:Float):Float;
}

abstract BoundingSphere(Dynamic) {
	public var radius(get, set):Float;

	inline function get_radius():Float return BoundingSphere_Ffi.get_radius(this);

	inline function set_radius(value:Float):Float return BoundingSphere_Ffi.set_radius(this, value);
}
