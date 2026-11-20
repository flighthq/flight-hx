package flight._cpp;

private extern class ThreeDsLight_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_three_ds_light_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_three_ds_light_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_three_ds_light_falloff") static function get_falloff(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_three_ds_light_falloff") static function set_falloff(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_three_ds_light_hotspot") static function get_hotspot(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_three_ds_light_hotspot") static function set_hotspot(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_three_ds_light_multiplier") static function get_multiplier(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_three_ds_light_multiplier") static function set_multiplier(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_field_get_three_ds_light_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_three_ds_light_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ThreeDsLight(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return ThreeDsLight_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { ThreeDsLight_Ffi.set_enabled(this, value); return value; }
	public var falloff(get, set):Float;

	inline function get_falloff():Float return ThreeDsLight_Ffi.get_falloff(this);

	inline function set_falloff(value:Float):Float { ThreeDsLight_Ffi.set_falloff(this, value); return value; }
	public var hotspot(get, set):Float;

	inline function get_hotspot():Float return ThreeDsLight_Ffi.get_hotspot(this);

	inline function set_hotspot(value:Float):Float { ThreeDsLight_Ffi.set_hotspot(this, value); return value; }
	public var multiplier(get, set):Float;

	inline function get_multiplier():Float return ThreeDsLight_Ffi.get_multiplier(this);

	inline function set_multiplier(value:Float):Float { ThreeDsLight_Ffi.set_multiplier(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = ThreeDsLight_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ThreeDsLight_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; ThreeDsLight_Ffi.set_name(this, raw); return value; }
}
