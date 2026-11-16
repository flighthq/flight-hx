package flight._cpp;

private extern class BoundingSphere_Ffi {
	@:native("flight_get_bounding_sphere_radius") static function get_radius(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_bounding_sphere_radius") static function set_radius(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract BoundingSphere(cpp.Star<cpp.Void>) {
	public var radius(get, set):Single;

	inline function get_radius():Single return BoundingSphere_Ffi.get_radius(this);

	inline function set_radius(value:Single):Single { BoundingSphere_Ffi.set_radius(this, value); return value; }
}
