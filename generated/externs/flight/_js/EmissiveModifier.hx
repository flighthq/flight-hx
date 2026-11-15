package flight._js;

@:jsRequire("flight")
private extern class EmissiveModifier_Ffi {
	@:native("flight_get_emissive_modifier_color") static function get_color(ptr:Dynamic):Int;
	@:native("flight_set_emissive_modifier_color") static function set_color(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_emissive_modifier_strength") static function get_strength(ptr:Dynamic):Float;
	@:native("flight_set_emissive_modifier_strength") static function set_strength(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_emissive_modifier_facing_softness") static function get_facingSoftness(ptr:Dynamic):Float;
	@:native("flight_set_emissive_modifier_facing_softness") static function set_facingSoftness(ptr:Dynamic, value:Float):Float;
}

abstract EmissiveModifier(Dynamic) {
	public var color(get, set):Int;

	inline function get_color():Int return EmissiveModifier_Ffi.get_color(this);

	inline function set_color(value:Int):Int return EmissiveModifier_Ffi.set_color(this, value);
	public var strength(get, set):Float;

	inline function get_strength():Float return EmissiveModifier_Ffi.get_strength(this);

	inline function set_strength(value:Float):Float return EmissiveModifier_Ffi.set_strength(this, value);
	public var facingSoftness(get, set):Float;

	inline function get_facingSoftness():Float return EmissiveModifier_Ffi.get_facingSoftness(this);

	inline function set_facingSoftness(value:Float):Float return EmissiveModifier_Ffi.set_facingSoftness(this, value);
}
