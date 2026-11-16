package flight._hl;

private extern class SpineTintKeyframe_Ffi {
	@:hlNative("flight", "flight_field_get_spine_tint_keyframe_color")
	static function get_color(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_spine_tint_keyframe_color")
	static function set_color(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract SpineTintKeyframe(hl.Bytes) {
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
		SpineTintKeyframe_Ffi.set_color(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var time(get, set):Single;

	inline function get_time():Single return this.getF32(24);

	inline function set_time(value:Single):Single { this.setF32(24, value); return value; }
}
