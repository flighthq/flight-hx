package flight._js;

@:jsRequire("flight")
private extern class AnimatedNormalModifier_Ffi {
	@:native("flight_get_animated_normal_modifier_strength") static function get_strength(ptr:Dynamic):Float;
	@:native("flight_set_animated_normal_modifier_strength") static function set_strength(ptr:Dynamic, value:Float):Float;
}

abstract AnimatedNormalModifier(Dynamic) {
	public var strength(get, set):Float;

	inline function get_strength():Float return AnimatedNormalModifier_Ffi.get_strength(this);

	inline function set_strength(value:Float):Float return AnimatedNormalModifier_Ffi.set_strength(this, value);
}
