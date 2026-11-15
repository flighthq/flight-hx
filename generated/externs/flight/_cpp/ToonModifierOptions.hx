package flight._cpp;

private extern class ToonModifierOptions_Ffi {
	@:native("flight_get_toon_modifier_options_steps") static function get_steps(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_toon_modifier_options_steps") static function set_steps(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ToonModifierOptions(cpp.Star<cpp.Void>) {
	public var steps(get, set):Single;

	inline function get_steps():Single return ToonModifierOptions_Ffi.get_steps(this);

	inline function set_steps(value:Single):Single return ToonModifierOptions_Ffi.set_steps(this, value);
}
