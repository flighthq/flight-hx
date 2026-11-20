package flight._hl;

private extern class ColladaDecodedMorph_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_collada_decoded_morph_controller_id")
	static function get_controllerId(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_collada_decoded_morph_controller_id")
	static function set_controllerId(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_collada_decoded_morph_base_geometry")
	static function get_baseGeometry(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_collada_decoded_morph_base_geometry")
	static function set_baseGeometry(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ColladaDecodedMorph(hl.Bytes) {
	public var controllerId(get, set):String;
	inline function get_controllerId():String { var raw = ColladaDecodedMorph_Ffi.get_controllerId(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ColladaDecodedMorph_Ffi.freeString(raw); return value; }
	inline function set_controllerId(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ColladaDecodedMorph_Ffi.set_controllerId(this, raw); return value; }
	public var baseGeometry(get, set):String;
	inline function get_baseGeometry():String { var raw = ColladaDecodedMorph_Ffi.get_baseGeometry(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ColladaDecodedMorph_Ffi.freeString(raw); return value; }
	inline function set_baseGeometry(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ColladaDecodedMorph_Ffi.set_baseGeometry(this, raw); return value; }
}
