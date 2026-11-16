package flight._cpp;

private extern class RiveAnimationClip_Ffi {
	@:native("flight_field_get_rive_animation_clip_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_rive_animation_clip_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_get_rive_animation_clip_speed") static function get_speed(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_rive_animation_clip_speed") static function set_speed(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract RiveAnimationClip(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = RiveAnimationClip_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		RiveAnimationClip_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var speed(get, set):Single;

	inline function get_speed():Single return RiveAnimationClip_Ffi.get_speed(this);

	inline function set_speed(value:Single):Single { RiveAnimationClip_Ffi.set_speed(this, value); return value; }
}
