package flight._hl;

private extern class TextInputEditRecord_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_text_input_edit_record_text_after")
	static function get_textAfter(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_text_input_edit_record_text_after")
	static function set_textAfter(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_text_input_edit_record_text_before")
	static function get_textBefore(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_text_input_edit_record_text_before")
	static function set_textBefore(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TextInputEditRecord(hl.Bytes) {
	public var caretIndexAfter(get, set):Int;

	inline function get_caretIndexAfter():Int return this.getI32(72);

	inline function set_caretIndexAfter(value:Int):Int { this.setI32(72, value); return value; }
	public var caretIndexBefore(get, set):Int;

	inline function get_caretIndexBefore():Int return this.getI32(80);

	inline function set_caretIndexBefore(value:Int):Int { this.setI32(80, value); return value; }
	public var selectionIndexAfter(get, set):Int;

	inline function get_selectionIndexAfter():Int return this.getI32(88);

	inline function set_selectionIndexAfter(value:Int):Int { this.setI32(88, value); return value; }
	public var selectionIndexBefore(get, set):Int;

	inline function get_selectionIndexBefore():Int return this.getI32(96);

	inline function set_selectionIndexBefore(value:Int):Int { this.setI32(96, value); return value; }
	public var textAfter(get, set):String;
	inline function get_textAfter():String { var raw = TextInputEditRecord_Ffi.get_textAfter(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TextInputEditRecord_Ffi.freeString(raw); return value; }
	inline function set_textAfter(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TextInputEditRecord_Ffi.set_textAfter(this, raw); return value; }
	public var textBefore(get, set):String;
	inline function get_textBefore():String { var raw = TextInputEditRecord_Ffi.get_textBefore(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TextInputEditRecord_Ffi.freeString(raw); return value; }
	inline function set_textBefore(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TextInputEditRecord_Ffi.set_textBefore(this, raw); return value; }
}
