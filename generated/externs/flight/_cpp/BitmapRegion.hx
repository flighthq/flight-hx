package flight._cpp;

private extern class BitmapRegion_Ffi {
	@:native("flight_get_bitmap_region_x") static function get_x(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_region_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_region_y") static function get_y(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_region_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_region_width") static function get_width(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_region_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_region_height") static function get_height(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_region_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BitmapRegion(cpp.Star<cpp.Void>) {
	public var x(get, set):Int;

	inline function get_x():Int return BitmapRegion_Ffi.get_x(this);

	inline function set_x(value:Int):Int { BitmapRegion_Ffi.set_x(this, value); return value; }
	public var y(get, set):Int;

	inline function get_y():Int return BitmapRegion_Ffi.get_y(this);

	inline function set_y(value:Int):Int { BitmapRegion_Ffi.set_y(this, value); return value; }
	public var width(get, set):Int;

	inline function get_width():Int return BitmapRegion_Ffi.get_width(this);

	inline function set_width(value:Int):Int { BitmapRegion_Ffi.set_width(this, value); return value; }
	public var height(get, set):Int;

	inline function get_height():Int return BitmapRegion_Ffi.get_height(this);

	inline function set_height(value:Int):Int { BitmapRegion_Ffi.set_height(this, value); return value; }
}
