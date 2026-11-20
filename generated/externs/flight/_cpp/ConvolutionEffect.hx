package flight._cpp;

private extern class ConvolutionEffect_Ffi {
	@:native("flight_get_convolution_effect_matrix_x") static function get_matrixX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_convolution_effect_matrix_x") static function set_matrixX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_convolution_effect_matrix_y") static function get_matrixY(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_convolution_effect_matrix_y") static function set_matrixY(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract ConvolutionEffect(cpp.Star<cpp.Void>) {
	public var matrixX(get, set):Float;

	inline function get_matrixX():Float return ConvolutionEffect_Ffi.get_matrixX(this);

	inline function set_matrixX(value:Float):Float { ConvolutionEffect_Ffi.set_matrixX(this, value); return value; }
	public var matrixY(get, set):Float;

	inline function get_matrixY():Float return ConvolutionEffect_Ffi.get_matrixY(this);

	inline function set_matrixY(value:Float):Float { ConvolutionEffect_Ffi.set_matrixY(this, value); return value; }
}
