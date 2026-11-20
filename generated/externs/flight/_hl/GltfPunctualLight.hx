package flight._hl;

private extern class GltfPunctualLight_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_gltf_punctual_light_type")
	static function get_type(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_gltf_punctual_light_type")
	static function set_type(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract GltfPunctualLight(hl.Bytes) {
	public var type(get, set):String;
	inline function get_type():String { var raw = GltfPunctualLight_Ffi.get_type(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); GltfPunctualLight_Ffi.freeString(raw); return value; }
	inline function set_type(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } GltfPunctualLight_Ffi.set_type(this, raw); return value; }
}
