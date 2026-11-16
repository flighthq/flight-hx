package flight._cpp;

private extern class RimModifierOptions_Ffi {
	@:native("flight_get_rim_modifier_options_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_rim_modifier_options_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract RimModifierOptions(cpp.Star<cpp.Void>) {
	public var color(get, set):Int;

	inline function get_color():Int return RimModifierOptions_Ffi.get_color(this);

	inline function set_color(value:Int):Int { RimModifierOptions_Ffi.set_color(this, value); return value; }
}
