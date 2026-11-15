package flight._js;

@:jsRequire("flight")
private extern class ColorGradeAdjustment_Ffi {
	@:native("flight_get_color_grade_adjustment_exposure") static function get_exposure(ptr:Dynamic):Float;
	@:native("flight_set_color_grade_adjustment_exposure") static function set_exposure(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_color_grade_adjustment_brightness") static function get_brightness(ptr:Dynamic):Float;
	@:native("flight_set_color_grade_adjustment_brightness") static function set_brightness(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_color_grade_adjustment_contrast") static function get_contrast(ptr:Dynamic):Float;
	@:native("flight_set_color_grade_adjustment_contrast") static function set_contrast(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_color_grade_adjustment_saturation") static function get_saturation(ptr:Dynamic):Float;
	@:native("flight_set_color_grade_adjustment_saturation") static function set_saturation(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_color_grade_adjustment_temperature") static function get_temperature(ptr:Dynamic):Float;
	@:native("flight_set_color_grade_adjustment_temperature") static function set_temperature(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_color_grade_adjustment_tint") static function get_tint(ptr:Dynamic):Float;
	@:native("flight_set_color_grade_adjustment_tint") static function set_tint(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_color_grade_adjustment_lift") static function get_lift(ptr:Dynamic):Int;
	@:native("flight_set_color_grade_adjustment_lift") static function set_lift(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_color_grade_adjustment_gamma") static function get_gamma(ptr:Dynamic):Int;
	@:native("flight_set_color_grade_adjustment_gamma") static function set_gamma(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_color_grade_adjustment_gain") static function get_gain(ptr:Dynamic):Int;
	@:native("flight_set_color_grade_adjustment_gain") static function set_gain(ptr:Dynamic, value:Int):Int;
}

abstract ColorGradeAdjustment(Dynamic) {
	public var exposure(get, set):Float;

	inline function get_exposure():Float return ColorGradeAdjustment_Ffi.get_exposure(this);

	inline function set_exposure(value:Float):Float return ColorGradeAdjustment_Ffi.set_exposure(this, value);
	public var brightness(get, set):Float;

	inline function get_brightness():Float return ColorGradeAdjustment_Ffi.get_brightness(this);

	inline function set_brightness(value:Float):Float return ColorGradeAdjustment_Ffi.set_brightness(this, value);
	public var contrast(get, set):Float;

	inline function get_contrast():Float return ColorGradeAdjustment_Ffi.get_contrast(this);

	inline function set_contrast(value:Float):Float return ColorGradeAdjustment_Ffi.set_contrast(this, value);
	public var saturation(get, set):Float;

	inline function get_saturation():Float return ColorGradeAdjustment_Ffi.get_saturation(this);

	inline function set_saturation(value:Float):Float return ColorGradeAdjustment_Ffi.set_saturation(this, value);
	public var temperature(get, set):Float;

	inline function get_temperature():Float return ColorGradeAdjustment_Ffi.get_temperature(this);

	inline function set_temperature(value:Float):Float return ColorGradeAdjustment_Ffi.set_temperature(this, value);
	public var tint(get, set):Float;

	inline function get_tint():Float return ColorGradeAdjustment_Ffi.get_tint(this);

	inline function set_tint(value:Float):Float return ColorGradeAdjustment_Ffi.set_tint(this, value);
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
