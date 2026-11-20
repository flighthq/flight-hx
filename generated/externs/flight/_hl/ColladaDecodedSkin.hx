package flight._hl;

private extern class ColladaDecodedSkin_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_collada_decoded_skin_controller_id")
	static function get_controllerId(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_collada_decoded_skin_controller_id")
	static function set_controllerId(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_collada_decoded_skin_geometry_ref")
	static function get_geometryRef(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_collada_decoded_skin_geometry_ref")
	static function set_geometryRef(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ColladaDecodedSkin(hl.Bytes) {
	public var controllerId(get, set):String;
	inline function get_controllerId():String { var raw = ColladaDecodedSkin_Ffi.get_controllerId(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ColladaDecodedSkin_Ffi.freeString(raw); return value; }
	inline function set_controllerId(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ColladaDecodedSkin_Ffi.set_controllerId(this, raw); return value; }
	public var geometryRef(get, set):String;
	inline function get_geometryRef():String { var raw = ColladaDecodedSkin_Ffi.get_geometryRef(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ColladaDecodedSkin_Ffi.freeString(raw); return value; }
	inline function set_geometryRef(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ColladaDecodedSkin_Ffi.set_geometryRef(this, raw); return value; }
}
