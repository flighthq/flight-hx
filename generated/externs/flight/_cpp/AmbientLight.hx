package flight._cpp;

private extern class AmbientLight_Ffi {
	@:native("flight_get_ambient_light_color") static function get_color(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_ambient_light_color") static function set_color(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_ambient_light_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_ambient_light_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_ambient_light_intensity") static function get_intensity(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_ambient_light_intensity") static function set_intensity(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract AmbientLight(cpp.Star<cpp.Void>) {
	public var color(get, set):Int;

	inline function get_color():Int return AmbientLight_Ffi.get_color(this);

	inline function set_color(value:Int):Int { AmbientLight_Ffi.set_color(this, value); return value; }
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return AmbientLight_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { AmbientLight_Ffi.set_enabled(this, value); return value; }
	public var intensity(get, set):Float;

	inline function get_intensity():Float return AmbientLight_Ffi.get_intensity(this);

	inline function set_intensity(value:Float):Float { AmbientLight_Ffi.set_intensity(this, value); return value; }
}
