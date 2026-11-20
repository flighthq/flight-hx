package flight._hl;

private extern class ColladaFeatureElements_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_collada_feature_elements_feature")
	static function get_feature(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_collada_feature_elements_feature")
	static function set_feature(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ColladaFeatureElements(hl.Bytes) {
	public var feature(get, set):String;
	inline function get_feature():String { var raw = ColladaFeatureElements_Ffi.get_feature(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ColladaFeatureElements_Ffi.freeString(raw); return value; }
	inline function set_feature(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ColladaFeatureElements_Ffi.set_feature(this, raw); return value; }
}
