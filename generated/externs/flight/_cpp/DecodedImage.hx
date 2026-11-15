package flight._cpp;

private extern class DecodedImage_Ffi {
	@:native("flight_get_decoded_image_height") static function get_height(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_decoded_image_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_decoded_image_width") static function get_width(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_decoded_image_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract DecodedImage(cpp.Star<cpp.Void>) {
	public var height(get, set):Int;

	inline function get_height():Int return DecodedImage_Ffi.get_height(this);

	inline function set_height(value:Int):Int return DecodedImage_Ffi.set_height(this, value);
	public var width(get, set):Int;

	inline function get_width():Int return DecodedImage_Ffi.get_width(this);

	inline function set_width(value:Int):Int return DecodedImage_Ffi.set_width(this, value);
}
