package flight._js;

abstract ColorGradeAdjustment(Dynamic) {
	public var exposure(get, set):Float;
	inline function get_exposure():Float return untyped this.exposure;
	inline function set_exposure(value:Float):Float return untyped this.exposure = value;
	public var brightness(get, set):Float;
	inline function get_brightness():Float return untyped this.brightness;
	inline function set_brightness(value:Float):Float return untyped this.brightness = value;
	public var contrast(get, set):Float;
	inline function get_contrast():Float return untyped this.contrast;
	inline function set_contrast(value:Float):Float return untyped this.contrast = value;
	public var saturation(get, set):Float;
	inline function get_saturation():Float return untyped this.saturation;
	inline function set_saturation(value:Float):Float return untyped this.saturation = value;
	public var temperature(get, set):Float;
	inline function get_temperature():Float return untyped this.temperature;
	inline function set_temperature(value:Float):Float return untyped this.temperature = value;
	public var tint(get, set):Float;
	inline function get_tint():Float return untyped this.tint;
	inline function set_tint(value:Float):Float return untyped this.tint = value;
	public var lift(get, set):Int;
	inline function get_lift():Int return untyped this.lift;
	inline function set_lift(value:Int):Int return untyped this.lift = value;
	public var gamma(get, set):Int;
	inline function get_gamma():Int return untyped this.gamma;
	inline function set_gamma(value:Int):Int return untyped this.gamma = value;
	public var gain(get, set):Int;
	inline function get_gain():Int return untyped this.gain;
	inline function set_gain(value:Int):Int return untyped this.gain = value;
}
