package flight._hl;

private extern class ConvolutionEffect_Ffi {
	@:hlNative("flight", "flight_get_convolution_effect_matrix_x")
	static function get_matrixX(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_convolution_effect_matrix_x")
	static function set_matrixX(ptr:hl.Bytes, value:Float):Float;
	@:hlNative("flight", "flight_get_convolution_effect_matrix_y")
	static function get_matrixY(ptr:hl.Bytes):Float;
	@:hlNative("flight", "flight_set_convolution_effect_matrix_y")
	static function set_matrixY(ptr:hl.Bytes, value:Float):Float;
}

abstract ConvolutionEffect(hl.Bytes) {
	public var matrixX(get, set):Float;

	inline function get_matrixX():Float return ConvolutionEffect_Ffi.get_matrixX(this);

	inline function set_matrixX(value:Float):Float { ConvolutionEffect_Ffi.set_matrixX(this, value); return value; }
	public var matrixY(get, set):Float;

	inline function get_matrixY():Float return ConvolutionEffect_Ffi.get_matrixY(this);

	inline function set_matrixY(value:Float):Float { ConvolutionEffect_Ffi.set_matrixY(this, value); return value; }
}
