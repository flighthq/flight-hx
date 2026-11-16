package flight._cpp;

private extern class RimModifier_Ffi {
	@:native("flight_get_rim_modifier_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_rim_modifier_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_rim_modifier_power") static function get_power(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rim_modifier_power") static function set_power(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rim_modifier_intensity") static function get_intensity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rim_modifier_intensity") static function set_intensity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_rim_modifier_bias") static function get_bias(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rim_modifier_bias") static function set_bias(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract RimModifier(cpp.Star<cpp.Void>) {
	public var color(get, set):Int;

	inline function get_color():Int return RimModifier_Ffi.get_color(this);

	inline function set_color(value:Int):Int { RimModifier_Ffi.set_color(this, value); return value; }
	public var power(get, set):Single;

	inline function get_power():Single return RimModifier_Ffi.get_power(this);

	inline function set_power(value:Single):Single { RimModifier_Ffi.set_power(this, value); return value; }
	public var intensity(get, set):Single;

	inline function get_intensity():Single return RimModifier_Ffi.get_intensity(this);

	inline function set_intensity(value:Single):Single { RimModifier_Ffi.set_intensity(this, value); return value; }
	public var bias(get, set):Single;

	inline function get_bias():Single return RimModifier_Ffi.get_bias(this);

	inline function set_bias(value:Single):Single { RimModifier_Ffi.set_bias(this, value); return value; }
}
