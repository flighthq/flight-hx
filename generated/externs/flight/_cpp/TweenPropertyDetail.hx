package flight._cpp;

private extern class TweenPropertyDetail_Ffi {
	@:native("flight_get_tween_property_detail_change") static function get_change(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_tween_property_detail_change") static function set_change(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_tween_property_detail_key")
	static function get_key(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_tween_property_detail_key")
	static function set_key(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_tween_property_detail_start") static function get_start(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_tween_property_detail_start") static function set_start(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract TweenPropertyDetail(cpp.Star<cpp.Void>) {
	public var change(get, set):Single;

	inline function get_change():Single return TweenPropertyDetail_Ffi.get_change(this);

	inline function set_change(value:Single):Single { TweenPropertyDetail_Ffi.set_change(this, value); return value; }
	public var key(get, set):String;
	inline function get_key():String {
		final bytes = TweenPropertyDetail_Ffi.get_key(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_key(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TweenPropertyDetail_Ffi.set_key(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var start(get, set):Single;

	inline function get_start():Single return TweenPropertyDetail_Ffi.get_start(this);

	inline function set_start(value:Single):Single { TweenPropertyDetail_Ffi.set_start(this, value); return value; }
}
