package flight._cpp;

private extern class BitmapReadbackExplanation_Ffi {
	@:native("flight_get_bitmap_readback_explanation_readable") static function get_readable(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_bitmap_readback_explanation_readable") static function set_readable(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract BitmapReadbackExplanation(cpp.Star<cpp.Void>) {
	public var readable(get, set):Bool;

	inline function get_readable():Bool return BitmapReadbackExplanation_Ffi.get_readable(this);

	inline function set_readable(value:Bool):Bool return BitmapReadbackExplanation_Ffi.set_readable(this, value);
}
