package flight._hl;

private extern class RiveAdvancedBlend_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_rive_advanced_blend_mode")
	static function get_mode(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_rive_advanced_blend_mode")
	static function set_mode(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract RiveAdvancedBlend(hl.Bytes) {
	public var mode(get, set):String;
	inline function get_mode():String { var raw = RiveAdvancedBlend_Ffi.get_mode(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RiveAdvancedBlend_Ffi.freeString(raw); return value; }
	inline function set_mode(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RiveAdvancedBlend_Ffi.set_mode(this, raw); return value; }
}
