package flight._cpp;

private extern class ColorScaleBias_Ffi {
	@:native("flight_get_color_scale_bias_red_scale") static function get_redScale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_scale_bias_red_scale") static function set_redScale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_scale_bias_green_scale") static function get_greenScale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_scale_bias_green_scale") static function set_greenScale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_scale_bias_blue_scale") static function get_blueScale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_scale_bias_blue_scale") static function set_blueScale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_scale_bias_alpha_scale") static function get_alphaScale(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_scale_bias_alpha_scale") static function set_alphaScale(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_scale_bias_red_bias") static function get_redBias(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_scale_bias_red_bias") static function set_redBias(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_scale_bias_green_bias") static function get_greenBias(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_scale_bias_green_bias") static function set_greenBias(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_scale_bias_blue_bias") static function get_blueBias(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_scale_bias_blue_bias") static function set_blueBias(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_scale_bias_alpha_bias") static function get_alphaBias(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_scale_bias_alpha_bias") static function set_alphaBias(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ColorScaleBias(cpp.Star<cpp.Void>) {
	public var redScale(get, set):Single;

	inline function get_redScale():Single return ColorScaleBias_Ffi.get_redScale(this);

	inline function set_redScale(value:Single):Single { ColorScaleBias_Ffi.set_redScale(this, value); return value; }
	public var greenScale(get, set):Single;

	inline function get_greenScale():Single return ColorScaleBias_Ffi.get_greenScale(this);

	inline function set_greenScale(value:Single):Single { ColorScaleBias_Ffi.set_greenScale(this, value); return value; }
	public var blueScale(get, set):Single;

	inline function get_blueScale():Single return ColorScaleBias_Ffi.get_blueScale(this);

	inline function set_blueScale(value:Single):Single { ColorScaleBias_Ffi.set_blueScale(this, value); return value; }
	public var alphaScale(get, set):Single;

	inline function get_alphaScale():Single return ColorScaleBias_Ffi.get_alphaScale(this);

	inline function set_alphaScale(value:Single):Single { ColorScaleBias_Ffi.set_alphaScale(this, value); return value; }
	public var redBias(get, set):Single;

	inline function get_redBias():Single return ColorScaleBias_Ffi.get_redBias(this);

	inline function set_redBias(value:Single):Single { ColorScaleBias_Ffi.set_redBias(this, value); return value; }
	public var greenBias(get, set):Single;

	inline function get_greenBias():Single return ColorScaleBias_Ffi.get_greenBias(this);

	inline function set_greenBias(value:Single):Single { ColorScaleBias_Ffi.set_greenBias(this, value); return value; }
	public var blueBias(get, set):Single;

	inline function get_blueBias():Single return ColorScaleBias_Ffi.get_blueBias(this);

	inline function set_blueBias(value:Single):Single { ColorScaleBias_Ffi.set_blueBias(this, value); return value; }
	public var alphaBias(get, set):Single;

	inline function get_alphaBias():Single return ColorScaleBias_Ffi.get_alphaBias(this);

	inline function set_alphaBias(value:Single):Single { ColorScaleBias_Ffi.set_alphaBias(this, value); return value; }
}
