package flight._cpp;

private extern class EmissiveModifier_Ffi {
	@:native("flight_get_emissive_modifier_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_emissive_modifier_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_emissive_modifier_strength") static function get_strength(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_emissive_modifier_strength") static function set_strength(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_emissive_modifier_facing_softness") static function get_facingSoftness(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_emissive_modifier_facing_softness") static function set_facingSoftness(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract EmissiveModifier(cpp.Star<cpp.Void>) {
	public var color(get, set):Int;

	inline function get_color():Int return EmissiveModifier_Ffi.get_color(this);

	inline function set_color(value:Int):Int return EmissiveModifier_Ffi.set_color(this, value);
	public var strength(get, set):Single;

	inline function get_strength():Single return EmissiveModifier_Ffi.get_strength(this);

	inline function set_strength(value:Single):Single return EmissiveModifier_Ffi.set_strength(this, value);
	public var facingSoftness(get, set):Single;

	inline function get_facingSoftness():Single return EmissiveModifier_Ffi.get_facingSoftness(this);

	inline function set_facingSoftness(value:Single):Single return EmissiveModifier_Ffi.set_facingSoftness(this, value);
}
