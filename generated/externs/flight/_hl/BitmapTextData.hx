package flight._hl;

private extern class BitmapTextData_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_bitmap_text_data_ellipsis")
	static function get_ellipsis(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_bitmap_text_data_ellipsis")
	static function set_ellipsis(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_bitmap_text_data_text")
	static function get_text(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_bitmap_text_data_text")
	static function set_text(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract BitmapTextData(hl.Bytes) {
	public var ellipsis(get, set):String;
	inline function get_ellipsis():String { var raw = BitmapTextData_Ffi.get_ellipsis(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); BitmapTextData_Ffi.freeString(raw); return value; }
	inline function set_ellipsis(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } BitmapTextData_Ffi.set_ellipsis(this, raw); return value; }
	public var letterSpacing(get, set):Single;

	inline function get_letterSpacing():Single return this.getF32(100);

	inline function set_letterSpacing(value:Single):Single { this.setF32(100, value); return value; }
	public var lineHeight(get, set):Single;

	inline function get_lineHeight():Single return this.getF32(104);

	inline function set_lineHeight(value:Single):Single { this.setF32(104, value); return value; }
	public var text(get, set):String;
	inline function get_text():String { var raw = BitmapTextData_Ffi.get_text(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); BitmapTextData_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } BitmapTextData_Ffi.set_text(this, raw); return value; }
}
