package flight._js;

@:jsRequire("flight")
private extern class DissolveModifierOptions_Ffi {
	@:native("flight_get_dissolve_modifier_options_threshold") static function get_threshold(ptr:Dynamic):Float;
	@:native("flight_set_dissolve_modifier_options_threshold") static function set_threshold(ptr:Dynamic, value:Float):Float;
}

abstract DissolveModifierOptions(Dynamic) {
	public var threshold(get, set):Float;

	inline function get_threshold():Float return DissolveModifierOptions_Ffi.get_threshold(this);

	inline function set_threshold(value:Float):Float return DissolveModifierOptions_Ffi.set_threshold(this, value);
}
