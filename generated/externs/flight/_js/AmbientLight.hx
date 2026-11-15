package flight._js;

@:jsRequire("flight")
private extern class AmbientLight_Ffi {
	@:native("flight_get_ambient_light_color") static function get_color(ptr:Dynamic):Int;
	@:native("flight_set_ambient_light_color") static function set_color(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_ambient_light_enabled") static function get_enabled(ptr:Dynamic):Bool;
	@:native("flight_set_ambient_light_enabled") static function set_enabled(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_ambient_light_intensity") static function get_intensity(ptr:Dynamic):Float;
	@:native("flight_set_ambient_light_intensity") static function set_intensity(ptr:Dynamic, value:Float):Float;
}

abstract AmbientLight(Dynamic) {
	public var color(get, set):Int;

	inline function get_color():Int return AmbientLight_Ffi.get_color(this);

	inline function set_color(value:Int):Int return AmbientLight_Ffi.set_color(this, value);
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return AmbientLight_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool return AmbientLight_Ffi.set_enabled(this, value);
	public var intensity(get, set):Float;

	inline function get_intensity():Float return AmbientLight_Ffi.get_intensity(this);

	inline function set_intensity(value:Float):Float return AmbientLight_Ffi.set_intensity(this, value);
}
