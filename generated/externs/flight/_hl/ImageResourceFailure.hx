package flight._hl;

private extern class ImageResourceFailure_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_image_resource_failure_message")
	static function get_message(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_image_resource_failure_message")
	static function set_message(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ImageResourceFailure(hl.Bytes) {
	public var message(get, set):String;
	inline function get_message():String { var raw = ImageResourceFailure_Ffi.get_message(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ImageResourceFailure_Ffi.freeString(raw); return value; }
	inline function set_message(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ImageResourceFailure_Ffi.set_message(this, raw); return value; }
}
