package flight._hl;

private extern class FileWatchEvent_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_file_watch_event_path")
	static function get_path(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_file_watch_event_path")
	static function set_path(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract FileWatchEvent(hl.Bytes) {
	public var path(get, set):String;
	inline function get_path():String { var raw = FileWatchEvent_Ffi.get_path(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); FileWatchEvent_Ffi.freeString(raw); return value; }
	inline function set_path(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } FileWatchEvent_Ffi.set_path(this, raw); return value; }
}
