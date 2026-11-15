package flight._js;

@:jsRequire("flight")
private extern class FogModifier_Ffi {
	@:native("flight_get_fog_modifier_color") static function get_color(ptr:Dynamic):Int;
	@:native("flight_set_fog_modifier_color") static function set_color(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_fog_modifier_near") static function get_near(ptr:Dynamic):Float;
	@:native("flight_set_fog_modifier_near") static function set_near(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_fog_modifier_far") static function get_far(ptr:Dynamic):Float;
	@:native("flight_set_fog_modifier_far") static function set_far(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_fog_modifier_density") static function get_density(ptr:Dynamic):Float;
	@:native("flight_set_fog_modifier_density") static function set_density(ptr:Dynamic, value:Float):Float;
}

abstract FogModifier(Dynamic) {
	public var color(get, set):Int;

	inline function get_color():Int return FogModifier_Ffi.get_color(this);

	inline function set_color(value:Int):Int return FogModifier_Ffi.set_color(this, value);
	public var near(get, set):Float;

	inline function get_near():Float return FogModifier_Ffi.get_near(this);

	inline function set_near(value:Float):Float return FogModifier_Ffi.set_near(this, value);
	public var far(get, set):Float;

	inline function get_far():Float return FogModifier_Ffi.get_far(this);

	inline function set_far(value:Float):Float return FogModifier_Ffi.set_far(this, value);
	public var density(get, set):Float;

	inline function get_density():Float return FogModifier_Ffi.get_density(this);

	inline function set_density(value:Float):Float return FogModifier_Ffi.set_density(this, value);
}
