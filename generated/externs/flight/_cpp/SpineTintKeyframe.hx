package flight._cpp;

private extern class SpineTintKeyframe_Ffi {
	@:native("flight_field_get_spine_tint_keyframe_color")
	static function get_color(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_spine_tint_keyframe_color")
	static function set_color(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_spine_tint_keyframe_time") static function get_time(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_spine_tint_keyframe_time") static function set_time(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract SpineTintKeyframe(cpp.Star<cpp.Void>) {
	public var color(get, set):String;
	inline function get_color():String {
		final bytes = SpineTintKeyframe_Ffi.get_color(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_color(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SpineTintKeyframe_Ffi.set_color(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var time(get, set):Single;

	inline function get_time():Single return SpineTintKeyframe_Ffi.get_time(this);

	inline function set_time(value:Single):Single { SpineTintKeyframe_Ffi.set_time(this, value); return value; }
}
