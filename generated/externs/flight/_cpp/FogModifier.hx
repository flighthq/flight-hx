package flight._cpp;

private extern class FogModifier_Ffi {
	@:native("flight_get_fog_modifier_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_fog_modifier_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_fog_modifier_near") static function get_near(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_fog_modifier_near") static function set_near(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_fog_modifier_far") static function get_far(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_fog_modifier_far") static function set_far(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_fog_modifier_density") static function get_density(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_fog_modifier_density") static function set_density(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract FogModifier(cpp.Star<cpp.Void>) {
	public var color(get, set):Int;

	inline function get_color():Int return FogModifier_Ffi.get_color(this);

	inline function set_color(value:Int):Int return FogModifier_Ffi.set_color(this, value);
	public var near(get, set):Single;

	inline function get_near():Single return FogModifier_Ffi.get_near(this);

	inline function set_near(value:Single):Single return FogModifier_Ffi.set_near(this, value);
	public var far(get, set):Single;

	inline function get_far():Single return FogModifier_Ffi.get_far(this);

	inline function set_far(value:Single):Single return FogModifier_Ffi.set_far(this, value);
	public var density(get, set):Single;

	inline function get_density():Single return FogModifier_Ffi.get_density(this);

	inline function set_density(value:Single):Single return FogModifier_Ffi.set_density(this, value);
}
