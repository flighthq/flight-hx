package flight._cpp;

private extern class ToonModifier_Ffi {
	@:native("flight_get_toon_modifier_steps") static function get_steps(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_toon_modifier_steps") static function set_steps(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_toon_modifier_smoothness") static function get_smoothness(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_toon_modifier_smoothness") static function set_smoothness(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract ToonModifier(cpp.Star<cpp.Void>) {
	public var steps(get, set):Single;

	inline function get_steps():Single return ToonModifier_Ffi.get_steps(this);

	inline function set_steps(value:Single):Single return ToonModifier_Ffi.set_steps(this, value);
	public var smoothness(get, set):Single;

	inline function get_smoothness():Single return ToonModifier_Ffi.get_smoothness(this);

	inline function set_smoothness(value:Single):Single return ToonModifier_Ffi.set_smoothness(this, value);
}
