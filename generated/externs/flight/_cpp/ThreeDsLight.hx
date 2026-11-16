package flight._cpp;

private extern class ThreeDsLight_Ffi {
	@:native("flight_get_three_ds_light_enabled") static function get_enabled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_three_ds_light_enabled") static function set_enabled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_three_ds_light_falloff") static function get_falloff(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_three_ds_light_falloff") static function set_falloff(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_three_ds_light_hotspot") static function get_hotspot(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_three_ds_light_hotspot") static function set_hotspot(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_three_ds_light_multiplier") static function get_multiplier(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_three_ds_light_multiplier") static function set_multiplier(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_three_ds_light_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_three_ds_light_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract ThreeDsLight(cpp.Star<cpp.Void>) {
	public var enabled(get, set):Bool;

	inline function get_enabled():Bool return ThreeDsLight_Ffi.get_enabled(this);

	inline function set_enabled(value:Bool):Bool { ThreeDsLight_Ffi.set_enabled(this, value); return value; }
	public var falloff(get, set):Single;

	inline function get_falloff():Single return ThreeDsLight_Ffi.get_falloff(this);

	inline function set_falloff(value:Single):Single { ThreeDsLight_Ffi.set_falloff(this, value); return value; }
	public var hotspot(get, set):Single;

	inline function get_hotspot():Single return ThreeDsLight_Ffi.get_hotspot(this);

	inline function set_hotspot(value:Single):Single { ThreeDsLight_Ffi.set_hotspot(this, value); return value; }
	public var multiplier(get, set):Single;

	inline function get_multiplier():Single return ThreeDsLight_Ffi.get_multiplier(this);

	inline function set_multiplier(value:Single):Single { ThreeDsLight_Ffi.set_multiplier(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = ThreeDsLight_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ThreeDsLight_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
