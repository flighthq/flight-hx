package flight._hl;

private extern class ExternalAudioResourceReference_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_external_audio_resource_reference_uri")
	static function get_uri(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_external_audio_resource_reference_uri")
	static function set_uri(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ExternalAudioResourceReference(hl.Bytes) {
	public var uri(get, set):String;
	inline function get_uri():String { var raw = ExternalAudioResourceReference_Ffi.get_uri(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ExternalAudioResourceReference_Ffi.freeString(raw); return value; }
	inline function set_uri(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ExternalAudioResourceReference_Ffi.set_uri(this, raw); return value; }
}
