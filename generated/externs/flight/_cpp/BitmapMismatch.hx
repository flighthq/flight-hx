package flight._cpp;

private extern class BitmapMismatch_Ffi {
	@:native("flight_get_bitmap_mismatch_mismatched_pixels") static function get_mismatchedPixels(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_mismatch_mismatched_pixels") static function set_mismatchedPixels(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_mismatch_total_pixels") static function get_totalPixels(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_mismatch_total_pixels") static function set_totalPixels(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_mismatch_fraction") static function get_fraction(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_bitmap_mismatch_fraction") static function set_fraction(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_bitmap_mismatch_max_channel_delta") static function get_maxChannelDelta(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_mismatch_max_channel_delta") static function set_maxChannelDelta(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BitmapMismatch(cpp.Star<cpp.Void>) {
	public var mismatchedPixels(get, set):Int;

	inline function get_mismatchedPixels():Int return BitmapMismatch_Ffi.get_mismatchedPixels(this);

	inline function set_mismatchedPixels(value:Int):Int { BitmapMismatch_Ffi.set_mismatchedPixels(this, value); return value; }
	public var totalPixels(get, set):Int;

	inline function get_totalPixels():Int return BitmapMismatch_Ffi.get_totalPixels(this);

	inline function set_totalPixels(value:Int):Int { BitmapMismatch_Ffi.set_totalPixels(this, value); return value; }
	public var fraction(get, set):Float;

	inline function get_fraction():Float return BitmapMismatch_Ffi.get_fraction(this);

	inline function set_fraction(value:Float):Float { BitmapMismatch_Ffi.set_fraction(this, value); return value; }
	public var maxChannelDelta(get, set):Int;

	inline function get_maxChannelDelta():Int return BitmapMismatch_Ffi.get_maxChannelDelta(this);

	inline function set_maxChannelDelta(value:Int):Int { BitmapMismatch_Ffi.set_maxChannelDelta(this, value); return value; }
}
