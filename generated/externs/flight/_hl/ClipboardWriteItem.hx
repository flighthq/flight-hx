package flight._hl;

private extern class ClipboardWriteItem_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_clipboard_write_item_format")
	static function get_format(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_clipboard_write_item_format")
	static function set_format(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_clipboard_write_item_data")
	static function get_data(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_clipboard_write_item_data")
	static function set_data(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ClipboardWriteItem(hl.Bytes) {
	public var format(get, set):String;
	inline function get_format():String { var raw = ClipboardWriteItem_Ffi.get_format(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ClipboardWriteItem_Ffi.freeString(raw); return value; }
	inline function set_format(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ClipboardWriteItem_Ffi.set_format(this, raw); return value; }
	public var data(get, set):String;
	inline function get_data():String { var raw = ClipboardWriteItem_Ffi.get_data(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ClipboardWriteItem_Ffi.freeString(raw); return value; }
	inline function set_data(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ClipboardWriteItem_Ffi.set_data(this, raw); return value; }
}
