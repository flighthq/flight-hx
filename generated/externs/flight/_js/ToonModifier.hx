package flight._js;

@:jsRequire("flight")
private extern class ToonModifier_Ffi {
	@:native("flight_get_toon_modifier_steps") static function get_steps(ptr:Dynamic):Float;
	@:native("flight_set_toon_modifier_steps") static function set_steps(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_toon_modifier_smoothness") static function get_smoothness(ptr:Dynamic):Float;
	@:native("flight_set_toon_modifier_smoothness") static function set_smoothness(ptr:Dynamic, value:Float):Float;
}

abstract ToonModifier(Dynamic) {
	public var steps(get, set):Float;

	inline function get_steps():Float return ToonModifier_Ffi.get_steps(this);

	inline function set_steps(value:Float):Float return ToonModifier_Ffi.set_steps(this, value);
	public var smoothness(get, set):Float;

	inline function get_smoothness():Float return ToonModifier_Ffi.get_smoothness(this);

	inline function set_smoothness(value:Float):Float return ToonModifier_Ffi.set_smoothness(this, value);
}
