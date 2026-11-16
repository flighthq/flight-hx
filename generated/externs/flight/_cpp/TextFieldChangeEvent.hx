package flight._cpp;

private extern class TextFieldChangeEvent_Ffi {
	@:native("flight_field_get_text_field_change_event_previous_text")
	static function get_previousText(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_text_field_change_event_previous_text")
	static function set_previousText(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_text_field_change_event_text")
	static function get_text(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_text_field_change_event_text")
	static function set_text(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract TextFieldChangeEvent(cpp.Star<cpp.Void>) {
	public var previousText(get, set):String;
	inline function get_previousText():String {
		final bytes = TextFieldChangeEvent_Ffi.get_previousText(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_previousText(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TextFieldChangeEvent_Ffi.set_previousText(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var text(get, set):String;
	inline function get_text():String {
		final bytes = TextFieldChangeEvent_Ffi.get_text(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_text(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		TextFieldChangeEvent_Ffi.set_text(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
