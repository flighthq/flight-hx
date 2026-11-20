package flight._cpp;

private extern class LottieGradientOpacityStop_Ffi {
	@:native("flight_get_lottie_gradient_opacity_stop_alpha") static function get_alpha(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_lottie_gradient_opacity_stop_alpha") static function set_alpha(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_lottie_gradient_opacity_stop_offset") static function get_offset(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_lottie_gradient_opacity_stop_offset") static function set_offset(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract LottieGradientOpacityStop(cpp.Star<cpp.Void>) {
	public var alpha(get, set):Float;

	inline function get_alpha():Float return LottieGradientOpacityStop_Ffi.get_alpha(this);

	inline function set_alpha(value:Float):Float { LottieGradientOpacityStop_Ffi.set_alpha(this, value); return value; }
	public var offset(get, set):Float;

	inline function get_offset():Float return LottieGradientOpacityStop_Ffi.get_offset(this);

	inline function set_offset(value:Float):Float { LottieGradientOpacityStop_Ffi.set_offset(this, value); return value; }
}
