package flight._js;

@:jsRequire("flight")
private extern class EmissiveModifierOptions_Ffi {
	@:native("flight_get_emissive_modifier_options_color") static function get_color(ptr:Dynamic):Int;
	@:native("flight_set_emissive_modifier_options_color") static function set_color(ptr:Dynamic, value:Int):Int;
}

abstract EmissiveModifierOptions(Dynamic) {
	public var color(get, set):Int;

	inline function get_color():Int return EmissiveModifierOptions_Ffi.get_color(this);

	inline function set_color(value:Int):Int return EmissiveModifierOptions_Ffi.set_color(this, value);
}
