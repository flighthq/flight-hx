package flight._js;

@:jsRequire("flight")
private extern class FogModifierOptions_Ffi {
	@:native("flight_get_fog_modifier_options_color") static function get_color(ptr:Dynamic):Int;
	@:native("flight_set_fog_modifier_options_color") static function set_color(ptr:Dynamic, value:Int):Int;
}

abstract FogModifierOptions(Dynamic) {
	public var color(get, set):Int;

	inline function get_color():Int return FogModifierOptions_Ffi.get_color(this);

	inline function set_color(value:Int):Int return FogModifierOptions_Ffi.set_color(this, value);
}
