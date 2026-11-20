package flight._hl;

private extern class NotificationRequest_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_notification_request_title")
	static function get_title(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_notification_request_title")
	static function set_title(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract NotificationRequest(hl.Bytes) {
	public var title(get, set):String;
	inline function get_title():String { var raw = NotificationRequest_Ffi.get_title(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); NotificationRequest_Ffi.freeString(raw); return value; }
	inline function set_title(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } NotificationRequest_Ffi.set_title(this, raw); return value; }
}
