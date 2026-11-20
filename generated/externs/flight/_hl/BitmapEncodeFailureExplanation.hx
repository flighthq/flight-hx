package flight._hl;

private extern class BitmapEncodeFailureExplanation_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_bitmap_encode_failure_explanation_reason")
	static function get_reason(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_bitmap_encode_failure_explanation_reason")
	static function set_reason(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract BitmapEncodeFailureExplanation(hl.Bytes) {
	public var reason(get, set):String;
	inline function get_reason():String { var raw = BitmapEncodeFailureExplanation_Ffi.get_reason(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); BitmapEncodeFailureExplanation_Ffi.freeString(raw); return value; }
	inline function set_reason(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } BitmapEncodeFailureExplanation_Ffi.set_reason(this, raw); return value; }
}
