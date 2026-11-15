package flight._cpp;

private extern class LottieGradientOpacityStop_Ffi {
	@:native("flight_get_lottie_gradient_opacity_stop_alpha") static function get_alpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_lottie_gradient_opacity_stop_alpha") static function set_alpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_lottie_gradient_opacity_stop_offset") static function get_offset(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_lottie_gradient_opacity_stop_offset") static function set_offset(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract LottieGradientOpacityStop(cpp.Star<cpp.Void>) {
	public var alpha(get, set):Single;

	inline function get_alpha():Single return LottieGradientOpacityStop_Ffi.get_alpha(this);

	inline function set_alpha(value:Single):Single return LottieGradientOpacityStop_Ffi.set_alpha(this, value);
	public var offset(get, set):Single;

	inline function get_offset():Single return LottieGradientOpacityStop_Ffi.get_offset(this);

	inline function set_offset(value:Single):Single return LottieGradientOpacityStop_Ffi.set_offset(this, value);
}
