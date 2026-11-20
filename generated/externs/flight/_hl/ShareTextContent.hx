package flight._hl;

private extern class ShareTextContent_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_share_text_content_text")
	static function get_text(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_share_text_content_text")
	static function set_text(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ShareTextContent(hl.Bytes) {
	public var text(get, set):String;
	inline function get_text():String { var raw = ShareTextContent_Ffi.get_text(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ShareTextContent_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ShareTextContent_Ffi.set_text(this, raw); return value; }
}
