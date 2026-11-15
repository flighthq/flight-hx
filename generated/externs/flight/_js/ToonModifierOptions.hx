package flight._js;

@:jsRequire("flight")
private extern class ToonModifierOptions_Ffi {
	@:native("flight_get_toon_modifier_options_steps") static function get_steps(ptr:Dynamic):Float;
	@:native("flight_set_toon_modifier_options_steps") static function set_steps(ptr:Dynamic, value:Float):Float;
}

abstract ToonModifierOptions(Dynamic) {
	public var steps(get, set):Float;

	inline function get_steps():Float return ToonModifierOptions_Ffi.get_steps(this);

	inline function set_steps(value:Float):Float return ToonModifierOptions_Ffi.set_steps(this, value);
}
