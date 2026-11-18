package flight._cpp;

private extern class RichTextContent_Ffi {
	@:native("flight_field_get_rich_text_content_text")
	static function get_text(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_rich_text_content_text")
	static function set_text(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract RichTextContent(cpp.Star<cpp.Void>) {
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
		RichTextContent_Ffi.set_text(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
