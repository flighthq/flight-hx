package flight._cpp;

private extern class ColorGradeAdjustment_Ffi {
	@:native("flight_get_color_grade_adjustment_exposure") static function get_exposure(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_grade_adjustment_exposure") static function set_exposure(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_grade_adjustment_brightness") static function get_brightness(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_grade_adjustment_brightness") static function set_brightness(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_grade_adjustment_contrast") static function get_contrast(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_grade_adjustment_contrast") static function set_contrast(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_grade_adjustment_saturation") static function get_saturation(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_grade_adjustment_saturation") static function set_saturation(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_grade_adjustment_temperature") static function get_temperature(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_grade_adjustment_temperature") static function set_temperature(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_grade_adjustment_tint") static function get_tint(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_color_grade_adjustment_tint") static function set_tint(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_color_grade_adjustment_lift") static function get_lift(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_color_grade_adjustment_lift") static function set_lift(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_color_grade_adjustment_gamma") static function get_gamma(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_color_grade_adjustment_gamma") static function set_gamma(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_color_grade_adjustment_gain") static function get_gain(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_color_grade_adjustment_gain") static function set_gain(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract ColorGradeAdjustment(cpp.Star<cpp.Void>) {
	public var exposure(get, set):Single;

	inline function get_exposure():Single return ColorGradeAdjustment_Ffi.get_exposure(this);

	inline function set_exposure(value:Single):Single return ColorGradeAdjustment_Ffi.set_exposure(this, value);
	public var brightness(get, set):Single;

	inline function get_brightness():Single return ColorGradeAdjustment_Ffi.get_brightness(this);

	inline function set_brightness(value:Single):Single return ColorGradeAdjustment_Ffi.set_brightness(this, value);
	public var contrast(get, set):Single;

	inline function get_contrast():Single return ColorGradeAdjustment_Ffi.get_contrast(this);

	inline function set_contrast(value:Single):Single return ColorGradeAdjustment_Ffi.set_contrast(this, value);
	public var saturation(get, set):Single;

	inline function get_saturation():Single return ColorGradeAdjustment_Ffi.get_saturation(this);

	inline function set_saturation(value:Single):Single return ColorGradeAdjustment_Ffi.set_saturation(this, value);
	public var temperature(get, set):Single;

	inline function get_temperature():Single return ColorGradeAdjustment_Ffi.get_temperature(this);

	inline function set_temperature(value:Single):Single return ColorGradeAdjustment_Ffi.set_temperature(this, value);
	public var tint(get, set):Single;

	inline function get_tint():Single return ColorGradeAdjustment_Ffi.get_tint(this);

	inline function set_tint(value:Single):Single return ColorGradeAdjustment_Ffi.set_tint(this, value);
	public var lift(get, set):Int;

	inline function get_lift():Int return ColorGradeAdjustment_Ffi.get_lift(this);

	inline function set_lift(value:Int):Int return ColorGradeAdjustment_Ffi.set_lift(this, value);
	public var gamma(get, set):Int;

	inline function get_gamma():Int return ColorGradeAdjustment_Ffi.get_gamma(this);

	inline function set_gamma(value:Int):Int return ColorGradeAdjustment_Ffi.set_gamma(this, value);
	public var gain(get, set):Int;

	inline function get_gain():Int return ColorGradeAdjustment_Ffi.get_gain(this);

	inline function set_gain(value:Int):Int return ColorGradeAdjustment_Ffi.set_gain(this, value);
}
