package flight._hl;

private extern class BitmapFontPageRecord_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_bitmap_font_page_record_file")
	static function get_file(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_bitmap_font_page_record_file")
	static function set_file(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract BitmapFontPageRecord(hl.Bytes) {
	public var file(get, set):String;
	inline function get_file():String { var raw = BitmapFontPageRecord_Ffi.get_file(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); BitmapFontPageRecord_Ffi.freeString(raw); return value; }
	inline function set_file(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } BitmapFontPageRecord_Ffi.set_file(this, raw); return value; }
	public var id(get, set):Int;

	inline function get_id():Int return this.getI32(24);

	inline function set_id(value:Int):Int { this.setI32(24, value); return value; }
}
