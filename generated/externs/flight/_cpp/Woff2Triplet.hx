package flight._cpp;

private extern class Woff2Triplet_Ffi {
	@:native("flight_get_woff2_triplet_dx") static function get_dx(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_woff2_triplet_dx") static function set_dx(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_woff2_triplet_dy") static function get_dy(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_woff2_triplet_dy") static function set_dy(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_woff2_triplet_used") static function get_used(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_woff2_triplet_used") static function set_used(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Woff2Triplet(cpp.Star<cpp.Void>) {
	public var dx(get, set):Single;

	inline function get_dx():Single return Woff2Triplet_Ffi.get_dx(this);

	inline function set_dx(value:Single):Single { Woff2Triplet_Ffi.set_dx(this, value); return value; }
	public var dy(get, set):Single;

	inline function get_dy():Single return Woff2Triplet_Ffi.get_dy(this);

	inline function set_dy(value:Single):Single { Woff2Triplet_Ffi.set_dy(this, value); return value; }
	public var used(get, set):Int;

	inline function get_used():Int return Woff2Triplet_Ffi.get_used(this);

	inline function set_used(value:Int):Int { Woff2Triplet_Ffi.set_used(this, value); return value; }
}
