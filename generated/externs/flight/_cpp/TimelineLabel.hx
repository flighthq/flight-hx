package flight._cpp;

private extern class TimelineLabel_Ffi {
	@:native("flight_get_timeline_label_frame") static function get_frame(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_timeline_label_frame") static function set_frame(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_timeline_label_name")
	static function get_name(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_timeline_label_name")
	static function set_name(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract TimelineLabel(cpp.Star<cpp.Void>) {
	public var frame(get, set):Int;

	inline function get_frame():Int return TimelineLabel_Ffi.get_frame(this);

	inline function set_frame(value:Int):Int { TimelineLabel_Ffi.set_frame(this, value); return value; }
	public var name(get, set):String;
	inline function get_name():String {
		final bytes = TimelineLabel_Ffi.get_name(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_name(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TimelineLabel_Ffi.set_name(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
