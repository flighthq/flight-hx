package flight._cpp;

private extern class BitmapTextPage_Ffi {
	@:native("flight_get_bitmap_text_page_instance_count") static function get_instanceCount(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_text_page_instance_count") static function set_instanceCount(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BitmapTextPage(cpp.Star<cpp.Void>) {
	public var instanceCount(get, set):Int;

	inline function get_instanceCount():Int return BitmapTextPage_Ffi.get_instanceCount(this);

	inline function set_instanceCount(value:Int):Int { BitmapTextPage_Ffi.set_instanceCount(this, value); return value; }
}
