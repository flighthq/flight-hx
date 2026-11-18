package flight._hl;

private extern class RichTextContent_Ffi {
	@:hlNative("flight", "flight_field_get_rich_text_content_text")
	static function get_text(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_rich_text_content_text")
	static function set_text(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract RichTextContent(hl.Bytes) {
	public var text(get, set):String;
	inline function get_text():String {
		final bytes = RichTextContent_Ffi.get_text(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_text(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		RichTextContent_Ffi.set_text(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
