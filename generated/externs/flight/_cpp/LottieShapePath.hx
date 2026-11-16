package flight._cpp;

private extern class LottieShapePath_Ffi {
	@:native("flight_get_lottie_shape_path_c") static function get_c(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_lottie_shape_path_c") static function set_c(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract LottieShapePath(cpp.Star<cpp.Void>) {
	public var c(get, set):Bool;

	inline function get_c():Bool return LottieShapePath_Ffi.get_c(this);

	inline function set_c(value:Bool):Bool { LottieShapePath_Ffi.set_c(this, value); return value; }
}
