package flight._js;

@:jsRequire("flight")
private extern class BitmapConvolutionOptions_Ffi {
	@:native("flight_get_bitmap_convolution_options_matrix_x") static function get_matrixX(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_convolution_options_matrix_x") static function set_matrixX(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_bitmap_convolution_options_matrix_y") static function get_matrixY(ptr:Dynamic):Int;
	@:native("flight_set_bitmap_convolution_options_matrix_y") static function set_matrixY(ptr:Dynamic, value:Int):Int;
}

abstract BitmapConvolutionOptions(Dynamic) {
	public var matrixX(get, set):Int;

	inline function get_matrixX():Int return BitmapConvolutionOptions_Ffi.get_matrixX(this);

	inline function set_matrixX(value:Int):Int return BitmapConvolutionOptions_Ffi.set_matrixX(this, value);
	public var matrixY(get, set):Int;

	inline function get_matrixY():Int return BitmapConvolutionOptions_Ffi.get_matrixY(this);

	inline function set_matrixY(value:Int):Int return BitmapConvolutionOptions_Ffi.set_matrixY(this, value);
}
