package flight._hl;

private extern class TrayTooltipReading_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_tray_tooltip_reading_tooltip")
	static function get_tooltip(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_tray_tooltip_reading_tooltip")
	static function set_tooltip(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TrayTooltipReading(hl.Bytes) {
	public var tooltip(get, set):String;
	inline function get_tooltip():String { var raw = TrayTooltipReading_Ffi.get_tooltip(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TrayTooltipReading_Ffi.freeString(raw); return value; }
	inline function set_tooltip(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TrayTooltipReading_Ffi.set_tooltip(this, raw); return value; }
}
