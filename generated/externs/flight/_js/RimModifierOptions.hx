package flight._js;

@:jsRequire("flight")
private extern class RimModifierOptions_Ffi {
	@:native("flight_get_rim_modifier_options_color") static function get_color(ptr:Dynamic):Int;
	@:native("flight_set_rim_modifier_options_color") static function set_color(ptr:Dynamic, value:Int):Int;
}

abstract RimModifierOptions(Dynamic) {
	public var color(get, set):Int;

	inline function get_color():Int return RimModifierOptions_Ffi.get_color(this);

	inline function set_color(value:Int):Int return RimModifierOptions_Ffi.set_color(this, value);
}
