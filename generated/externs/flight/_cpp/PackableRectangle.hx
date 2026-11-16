package flight._cpp;

private extern class PackableRectangle_Ffi {
	@:native("flight_get_packable_rectangle_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_packable_rectangle_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_packable_rectangle_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_packable_rectangle_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract PackableRectangle(cpp.Star<cpp.Void>) {
	public var width(get, set):Single;

	inline function get_width():Single return PackableRectangle_Ffi.get_width(this);

	inline function set_width(value:Single):Single { PackableRectangle_Ffi.set_width(this, value); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return PackableRectangle_Ffi.get_height(this);

	inline function set_height(value:Single):Single { PackableRectangle_Ffi.set_height(this, value); return value; }
}
