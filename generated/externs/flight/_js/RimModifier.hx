package flight._js;

@:jsRequire("flight")
private extern class RimModifier_Ffi {
	@:native("flight_get_rim_modifier_color") static function get_color(ptr:Dynamic):Int;
	@:native("flight_set_rim_modifier_color") static function set_color(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_rim_modifier_power") static function get_power(ptr:Dynamic):Float;
	@:native("flight_set_rim_modifier_power") static function set_power(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rim_modifier_intensity") static function get_intensity(ptr:Dynamic):Float;
	@:native("flight_set_rim_modifier_intensity") static function set_intensity(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_rim_modifier_bias") static function get_bias(ptr:Dynamic):Float;
	@:native("flight_set_rim_modifier_bias") static function set_bias(ptr:Dynamic, value:Float):Float;
}

abstract RimModifier(Dynamic) {
	public var color(get, set):Int;

	inline function get_color():Int return RimModifier_Ffi.get_color(this);

	inline function set_color(value:Int):Int return RimModifier_Ffi.set_color(this, value);
	public var power(get, set):Float;

	inline function get_power():Float return RimModifier_Ffi.get_power(this);

	inline function set_power(value:Float):Float return RimModifier_Ffi.set_power(this, value);
	public var intensity(get, set):Float;

	inline function get_intensity():Float return RimModifier_Ffi.get_intensity(this);

	inline function set_intensity(value:Float):Float return RimModifier_Ffi.set_intensity(this, value);
	public var bias(get, set):Float;

	inline function get_bias():Float return RimModifier_Ffi.get_bias(this);

	inline function set_bias(value:Float):Float return RimModifier_Ffi.set_bias(this, value);
}
