package flight._hl;

private extern class TrayMenuSelectionEvent_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_tray_menu_selection_event_id")
	static function get_id(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_tray_menu_selection_event_id")
	static function set_id(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract TrayMenuSelectionEvent(hl.Bytes) {
	public var id(get, set):String;
	inline function get_id():String { var raw = TrayMenuSelectionEvent_Ffi.get_id(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); TrayMenuSelectionEvent_Ffi.freeString(raw); return value; }
	inline function set_id(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } TrayMenuSelectionEvent_Ffi.set_id(this, raw); return value; }
}
