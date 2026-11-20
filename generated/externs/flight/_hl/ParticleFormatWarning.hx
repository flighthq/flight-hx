package flight._hl;

private extern class ParticleFormatWarning_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_particle_format_warning_code")
	static function get_code(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_particle_format_warning_code")
	static function set_code(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_particle_format_warning_message")
	static function get_message(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_particle_format_warning_message")
	static function set_message(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ParticleFormatWarning(hl.Bytes) {
	public var code(get, set):String;
	inline function get_code():String { var raw = ParticleFormatWarning_Ffi.get_code(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ParticleFormatWarning_Ffi.freeString(raw); return value; }
	inline function set_code(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ParticleFormatWarning_Ffi.set_code(this, raw); return value; }
	public var message(get, set):String;
	inline function get_message():String { var raw = ParticleFormatWarning_Ffi.get_message(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ParticleFormatWarning_Ffi.freeString(raw); return value; }
	inline function set_message(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ParticleFormatWarning_Ffi.set_message(this, raw); return value; }
}
