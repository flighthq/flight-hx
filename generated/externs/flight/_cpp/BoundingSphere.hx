package flight._cpp;

private extern class BoundingSphere_Ffi {
	@:native("flight_get_bounding_sphere_radius") static function get_radius(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_bounding_sphere_radius") static function set_radius(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract BoundingSphere(cpp.Star<cpp.Void>) {
	public var radius(get, set):Float;

	inline function get_radius():Float return BoundingSphere_Ffi.get_radius(this);

	inline function set_radius(value:Float):Float { BoundingSphere_Ffi.set_radius(this, value); return value; }
}
