package flight._hl;

private extern class TextFieldChangeEvent_Ffi {
	@:hlNative("flight", "flight_field_get_text_field_change_event_previous_text")
	static function get_previousText(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_text_field_change_event_previous_text")
	static function set_previousText(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_text_field_change_event_text")
	static function get_text(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_text_field_change_event_text")
	static function set_text(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract TextFieldChangeEvent(hl.Bytes) {
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
		TextFieldChangeEvent_Ffi.set_previousText(this, bytes.getData().bytes, bytes.length);
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
		TextFieldChangeEvent_Ffi.set_text(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
