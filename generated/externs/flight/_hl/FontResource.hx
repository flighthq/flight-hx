package flight._hl;

private extern class FontResource_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_font_resource_family")
	static function get_family(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_font_resource_family")
	static function set_family(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract FontResource(hl.Bytes) {
	public var family(get, set):String;
	inline function get_family():String { var raw = FontResource_Ffi.get_family(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); FontResource_Ffi.freeString(raw); return value; }
	inline function set_family(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } FontResource_Ffi.set_family(this, raw); return value; }
}
