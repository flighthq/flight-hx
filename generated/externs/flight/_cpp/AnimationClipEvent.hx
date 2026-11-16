package flight._cpp;

private extern class AnimationClipEvent_Ffi {
	@:native("flight_field_get_animation_clip_event_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_animation_clip_event_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_animation_clip_event_time") static function get_time(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_animation_clip_event_time") static function set_time(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract AnimationClipEvent(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = AnimationClipEvent_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		AnimationClipEvent_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var time(get, set):Single;

	inline function get_time():Single return AnimationClipEvent_Ffi.get_time(this);

	inline function set_time(value:Single):Single { AnimationClipEvent_Ffi.set_time(this, value); return value; }
}
