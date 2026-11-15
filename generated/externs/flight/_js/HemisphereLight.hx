package flight._js;

@:jsRequire("flight")
private extern class HemisphereLight_Ffi {
	@:native("flight_get_hemisphere_light_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_hemisphere_light_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_hemisphere_light_ground_color") static function get_groundColor(ptr:Dynamic):Int;
	@:native("flight_set_hemisphere_light_ground_color") static function set_groundColor(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_hemisphere_light_intensity") static function get_intensity(ptr:Dynamic):Float;
	@:native("flight_set_hemisphere_light_intensity") static function set_intensity(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_hemisphere_light_sky_color") static function get_skyColor(ptr:Dynamic):Int;
	@:native("flight_set_hemisphere_light_sky_color") static function set_skyColor(ptr:Dynamic, value:Int):Int;
}

abstract HemisphereLight(Dynamic) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return HemisphereLight_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return HemisphereLight_Ffi.set_enabled(this, value);
	public var groundColor(get, set):Int;

	inline function get_groundColor():Int return HemisphereLight_Ffi.get_groundColor(this);

	inline function set_groundColor(value:Int):Int return HemisphereLight_Ffi.set_groundColor(this, value);
	public var intensity(get, set):Float;

	inline function get_intensity():Float return HemisphereLight_Ffi.get_intensity(this);

	inline function set_intensity(value:Float):Float return HemisphereLight_Ffi.set_intensity(this, value);
	public var skyColor(get, set):Int;

	inline function get_skyColor():Int return HemisphereLight_Ffi.get_skyColor(this);

	inline function set_skyColor(value:Int):Int return HemisphereLight_Ffi.set_skyColor(this, value);
}
