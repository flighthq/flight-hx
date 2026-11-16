package flight._cpp;

private extern class Awd2LightEntry_Ffi {
	@:native("flight_get_awd2_light_entry_key") static function get_key(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_light_entry_key") static function set_key(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Awd2LightEntry(cpp.Star<cpp.Void>) {
	public var key(get, set):Int;

	inline function get_key():Int return Awd2LightEntry_Ffi.get_key(this);

	inline function set_key(value:Int):Int { Awd2LightEntry_Ffi.set_key(this, value); return value; }
}
