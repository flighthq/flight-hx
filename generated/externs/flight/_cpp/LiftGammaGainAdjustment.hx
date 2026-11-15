package flight._cpp;

private extern class LiftGammaGainAdjustment_Ffi {
	@:native("flight_get_lift_gamma_gain_adjustment_lift") static function get_lift(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_lift_gamma_gain_adjustment_lift") static function set_lift(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_lift_gamma_gain_adjustment_gamma") static function get_gamma(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_lift_gamma_gain_adjustment_gamma") static function set_gamma(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_lift_gamma_gain_adjustment_gain") static function get_gain(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_lift_gamma_gain_adjustment_gain") static function set_gain(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract LiftGammaGainAdjustment(cpp.Star<cpp.Void>) {
	public var lift(get, set):Int;

	inline function get_lift():Int return LiftGammaGainAdjustment_Ffi.get_lift(this);

	inline function set_lift(value:Int):Int return LiftGammaGainAdjustment_Ffi.set_lift(this, value);
	public var gamma(get, set):Int;

	inline function get_gamma():Int return LiftGammaGainAdjustment_Ffi.get_gamma(this);

	inline function set_gamma(value:Int):Int return LiftGammaGainAdjustment_Ffi.set_gamma(this, value);
	public var gain(get, set):Int;

	inline function get_gain():Int return LiftGammaGainAdjustment_Ffi.get_gain(this);

	inline function set_gain(value:Int):Int return LiftGammaGainAdjustment_Ffi.set_gain(this, value);
}
