package flight._cpp;

private extern class ColladaDecodedSkin_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_collada_decoded_skin_controller_id") static function get_controllerId(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_collada_decoded_skin_controller_id") static function set_controllerId(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_collada_decoded_skin_geometry_ref") static function get_geometryRef(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_collada_decoded_skin_geometry_ref") static function set_geometryRef(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ColladaDecodedSkin(cpp.Star<cpp.Void>) {
	public var controllerId(get, set):String;
	inline function get_controllerId():String { var raw = ColladaDecodedSkin_Ffi.get_controllerId(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ColladaDecodedSkin_Ffi.freeString(raw); return value; }
	inline function set_controllerId(value:String):String { var raw:cpp.ConstCharStar = cast value; ColladaDecodedSkin_Ffi.set_controllerId(this, raw); return value; }
	public var geometryRef(get, set):String;
	inline function get_geometryRef():String { var raw = ColladaDecodedSkin_Ffi.get_geometryRef(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ColladaDecodedSkin_Ffi.freeString(raw); return value; }
	inline function set_geometryRef(value:String):String { var raw:cpp.ConstCharStar = cast value; ColladaDecodedSkin_Ffi.set_geometryRef(this, raw); return value; }
}
