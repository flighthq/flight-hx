package flight._cpp;

private extern class HemisphereLight_Ffi {
	@:native("flight_get_hemisphere_light_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_hemisphere_light_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_hemisphere_light_ground_color") static function get_groundColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_hemisphere_light_ground_color") static function set_groundColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_hemisphere_light_intensity") static function get_intensity(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_hemisphere_light_intensity") static function set_intensity(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_hemisphere_light_sky_color") static function get_skyColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_hemisphere_light_sky_color") static function set_skyColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract HemisphereLight(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return HemisphereLight_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { HemisphereLight_Ffi.set_enabled(this, value); return value; }
	public var groundColor(get, set):Int;

	inline function get_groundColor():Int return HemisphereLight_Ffi.get_groundColor(this);

	inline function set_groundColor(value:Int):Int { HemisphereLight_Ffi.set_groundColor(this, value); return value; }
	public var intensity(get, set):Single;

	inline function get_intensity():Single return HemisphereLight_Ffi.get_intensity(this);

	inline function set_intensity(value:Single):Single { HemisphereLight_Ffi.set_intensity(this, value); return value; }
	public var skyColor(get, set):Int;

	inline function get_skyColor():Int return HemisphereLight_Ffi.get_skyColor(this);

	inline function set_skyColor(value:Int):Int { HemisphereLight_Ffi.set_skyColor(this, value); return value; }
}
