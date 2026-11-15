package flight._cpp;

private extern class DissolveModifierOptions_Ffi {
	@:native("flight_get_dissolve_modifier_options_threshold") static function get_threshold(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_dissolve_modifier_options_threshold") static function set_threshold(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract DissolveModifierOptions(cpp.Star<cpp.Void>) {
	public var threshold(get, set):Single;

	inline function get_threshold():Single return DissolveModifierOptions_Ffi.get_threshold(this);

	inline function set_threshold(value:Single):Single return DissolveModifierOptions_Ffi.set_threshold(this, value);
}
