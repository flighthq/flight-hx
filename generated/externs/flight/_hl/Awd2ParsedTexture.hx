package flight._hl;

private extern class Awd2ParsedTexture_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_awd2_parsed_texture_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_awd2_parsed_texture_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Awd2ParsedTexture(hl.Bytes) {
	public var name(get, set):String;
	inline function get_name():String { var raw = Awd2ParsedTexture_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Awd2ParsedTexture_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Awd2ParsedTexture_Ffi.set_name(this, raw); return value; }
}
