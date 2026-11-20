package flight._hl;

private extern class ClipboardBookmark_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_clipboard_bookmark_title")
	static function get_title(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_clipboard_bookmark_title")
	static function set_title(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_clipboard_bookmark_url")
	static function get_url(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_clipboard_bookmark_url")
	static function set_url(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ClipboardBookmark(hl.Bytes) {
	public var title(get, set):String;
	inline function get_title():String { var raw = ClipboardBookmark_Ffi.get_title(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ClipboardBookmark_Ffi.freeString(raw); return value; }
	inline function set_title(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ClipboardBookmark_Ffi.set_title(this, raw); return value; }
	public var url(get, set):String;
	inline function get_url():String { var raw = ClipboardBookmark_Ffi.get_url(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ClipboardBookmark_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ClipboardBookmark_Ffi.set_url(this, raw); return value; }
}
