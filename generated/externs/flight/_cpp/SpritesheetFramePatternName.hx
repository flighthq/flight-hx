package flight._cpp;

private extern class SpritesheetFramePatternName_Ffi {
	@:native("flight_field_get_spritesheet_frame_pattern_name_value")
	static function get_value(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_spritesheet_frame_pattern_name_value")
	static function set_value(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract SpritesheetFramePatternName(cpp.Star<cpp.Void>) {
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
		SpritesheetFramePatternName_Ffi.set_value(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
