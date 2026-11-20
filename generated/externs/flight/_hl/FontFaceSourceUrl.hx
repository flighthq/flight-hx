package flight._hl;

private extern class FontFaceSourceUrl_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_font_face_source_url_value")
	static function get_value(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_font_face_source_url_value")
	static function set_value(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract FontFaceSourceUrl(hl.Bytes) {
	public var value(get, set):String;
	inline function get_value():String { var raw = FontFaceSourceUrl_Ffi.get_value(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); FontFaceSourceUrl_Ffi.freeString(raw); return value; }
	inline function set_value(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } FontFaceSourceUrl_Ffi.set_value(this, raw); return value; }
}
