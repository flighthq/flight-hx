package flight._cpp;

private extern class FogModifierOptions_Ffi {
	@:native("flight_get_fog_modifier_options_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_fog_modifier_options_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract FogModifierOptions(cpp.Star<cpp.Void>) {
	public var color(get, set):Int;

	inline function get_color():Int return FogModifierOptions_Ffi.get_color(this);

	inline function set_color(value:Int):Int { FogModifierOptions_Ffi.set_color(this, value); return value; }
}
