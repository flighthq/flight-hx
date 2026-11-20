package flight._hl;

private extern class TrayDropText_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_tray_drop_text_text")
	static function get_text(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_tray_drop_text_text")
	static function set_text(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TrayDropText(hl.Bytes) {
	public var text(get, set):String;
	inline function get_text():String { var raw = TrayDropText_Ffi.get_text(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TrayDropText_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TrayDropText_Ffi.set_text(this, raw); return value; }
}
