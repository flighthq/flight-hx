package flight._hl;

private extern class ConvolutionEffect_Ffi {
	@:hlNative("flight", "flight_get_convolution_effect_matrix_x")
	static function get_matrixX(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_convolution_effect_matrix_x")
	static function set_matrixX(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_convolution_effect_matrix_y")
	static function get_matrixY(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_convolution_effect_matrix_y")
	static function set_matrixY(ptr:hl.Bytes, value:Single):Single;
}

abstract ConvolutionEffect(hl.Bytes) {
	public var matrixX(get, set):Single;

	inline function get_matrixX():Single return ConvolutionEffect_Ffi.get_matrixX(this);
	inline function set_matrixX(value:Single):Single { ConvolutionEffect_Ffi.set_matrixX(this, value); return value; }
	public var matrixY(get, set):Single;

	inline function get_matrixY():Single return ConvolutionEffect_Ffi.get_matrixY(this);
	inline function set_matrixY(value:Single):Single { ConvolutionEffect_Ffi.set_matrixY(this, value); return value; }
}
