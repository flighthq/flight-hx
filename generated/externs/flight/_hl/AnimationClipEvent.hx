package flight._hl;

private extern class AnimationClipEvent_Ffi {
	@:hlNative("flight", "flight_field_get_animation_clip_event_name")
	static function get_name(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_animation_clip_event_name")
	static function set_name(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract AnimationClipEvent(hl.Bytes) {
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
		AnimationClipEvent_Ffi.set_name(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var time(get, set):Single;

	inline function get_time():Single return this.getF32(32);

	inline function set_time(value:Single):Single { this.setF32(32, value); return value; }
}
