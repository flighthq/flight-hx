package flight._hl;

private extern class SpritesheetFramePatternName_Ffi {
	@:hlNative("flight", "flight_field_get_spritesheet_frame_pattern_name_value")
	static function get_value(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_spritesheet_frame_pattern_name_value")
	static function set_value(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract SpritesheetFramePatternName(hl.Bytes) {
	public var value(get, set):String;
	inline function get_value():String {
		final bytes = SpritesheetFramePatternName_Ffi.get_value(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_value(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		SpritesheetFramePatternName_Ffi.set_value(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
