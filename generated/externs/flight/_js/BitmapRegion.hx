package flight._js;

@:jsRequire("flight")
private extern class BitmapRegion_Ffi {
	@:native("flight_get_bitmap_region_x") static function get_x(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_region_x") static function set_x(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_bitmap_region_y") static function get_y(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_region_y") static function set_y(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_bitmap_region_width") static function get_width(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_region_width") static function set_width(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_bitmap_region_height") static function get_height(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_region_height") static function set_height(ptr:Dynamic, value:Int):Int;
}

abstract BitmapRegion(Dynamic) {
	public var x(get, set):Int;

	inline function get_x():Int return BitmapRegion_Ffi.get_x(this);

	inline function set_x(value:Int):Int return BitmapRegion_Ffi.set_x(this, value);
	public var y(get, set):Int;

	inline function get_y():Int return BitmapRegion_Ffi.get_y(this);

	inline function set_y(value:Int):Int return BitmapRegion_Ffi.set_y(this, value);
	public var width(get, set):Int;

	inline function get_width():Int return BitmapRegion_Ffi.get_width(this);

	inline function set_width(value:Int):Int return BitmapRegion_Ffi.set_width(this, value);
	public var height(get, set):Int;

	inline function get_height():Int return BitmapRegion_Ffi.get_height(this);

	inline function set_height(value:Int):Int return BitmapRegion_Ffi.set_height(this, value);
}
