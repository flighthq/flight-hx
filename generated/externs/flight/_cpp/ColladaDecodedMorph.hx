package flight._cpp;

private extern class ColladaDecodedMorph_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_collada_decoded_morph_controller_id") static function get_controllerId(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_collada_decoded_morph_controller_id") static function set_controllerId(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_collada_decoded_morph_base_geometry") static function get_baseGeometry(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_collada_decoded_morph_base_geometry") static function set_baseGeometry(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ColladaDecodedMorph(cpp.Star<cpp.Void>) {
	public var controllerId(get, set):String;
	inline function get_controllerId():String { var raw = ColladaDecodedMorph_Ffi.get_controllerId(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ColladaDecodedMorph_Ffi.freeString(raw); return value; }
	inline function set_controllerId(value:String):String { var raw:cpp.ConstCharStar = cast value; ColladaDecodedMorph_Ffi.set_controllerId(this, raw); return value; }
	public var baseGeometry(get, set):String;
	inline function get_baseGeometry():String { var raw = ColladaDecodedMorph_Ffi.get_baseGeometry(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ColladaDecodedMorph_Ffi.freeString(raw); return value; }
	inline function set_baseGeometry(value:String):String { var raw:cpp.ConstCharStar = cast value; ColladaDecodedMorph_Ffi.set_baseGeometry(this, raw); return value; }
}
