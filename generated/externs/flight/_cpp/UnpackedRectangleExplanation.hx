package flight._cpp;

private extern class UnpackedRectangleExplanation_Ffi {
	@:native("flight_get_unpacked_rectangle_explanation_usable_width") static function get_usableWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unpacked_rectangle_explanation_usable_width") static function set_usableWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_unpacked_rectangle_explanation_usable_height") static function get_usableHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_unpacked_rectangle_explanation_usable_height") static function set_usableHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract UnpackedRectangleExplanation(cpp.Star<cpp.Void>) {
	public var usableWidth(get, set):Single;

	inline function get_usableWidth():Single return UnpackedRectangleExplanation_Ffi.get_usableWidth(this);

	inline function set_usableWidth(value:Single):Single return UnpackedRectangleExplanation_Ffi.set_usableWidth(this, value);
	public var usableHeight(get, set):Single;

	inline function get_usableHeight():Single return UnpackedRectangleExplanation_Ffi.get_usableHeight(this);

	inline function set_usableHeight(value:Single):Single return UnpackedRectangleExplanation_Ffi.set_usableHeight(this, value);
}
