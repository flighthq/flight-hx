package flight._cpp;

private extern class BitmapConvolutionOptions_Ffi {
	@:native("flight_get_bitmap_convolution_options_matrix_x") static function get_matrixX(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_convolution_options_matrix_x") static function set_matrixX(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_bitmap_convolution_options_matrix_y") static function get_matrixY(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_bitmap_convolution_options_matrix_y") static function set_matrixY(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract BitmapConvolutionOptions(cpp.Star<cpp.Void>) {
	public var matrixX(get, set):Int;

	inline function get_matrixX():Int return BitmapConvolutionOptions_Ffi.get_matrixX(this);

	inline function set_matrixX(value:Int):Int { BitmapConvolutionOptions_Ffi.set_matrixX(this, value); return value; }
	public var matrixY(get, set):Int;

	inline function get_matrixY():Int return BitmapConvolutionOptions_Ffi.get_matrixY(this);

	inline function set_matrixY(value:Int):Int { BitmapConvolutionOptions_Ffi.set_matrixY(this, value); return value; }
}
