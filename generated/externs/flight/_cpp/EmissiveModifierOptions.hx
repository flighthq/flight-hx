package flight._cpp;

private extern class EmissiveModifierOptions_Ffi {
	@:native("flight_get_emissive_modifier_options_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_emissive_modifier_options_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract EmissiveModifierOptions(cpp.Star<cpp.Void>) {
	public var color(get, set):Int;

	inline function get_color():Int return EmissiveModifierOptions_Ffi.get_color(this);

	inline function set_color(value:Int):Int { EmissiveModifierOptions_Ffi.set_color(this, value); return value; }
}
