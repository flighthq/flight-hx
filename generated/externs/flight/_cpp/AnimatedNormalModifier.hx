package flight._cpp;

private extern class AnimatedNormalModifier_Ffi {
	@:native("flight_get_animated_normal_modifier_strength") static function get_strength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_animated_normal_modifier_strength") static function set_strength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract AnimatedNormalModifier(cpp.Star<cpp.Void>) {
	public var strength(get, set):Single;

	inline function get_strength():Single return AnimatedNormalModifier_Ffi.get_strength(this);

	inline function set_strength(value:Single):Single return AnimatedNormalModifier_Ffi.set_strength(this, value);
}
