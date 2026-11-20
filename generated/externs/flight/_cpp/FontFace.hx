package flight._cpp;

private extern class FontFace_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_font_face_family") static function get_family(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_font_face_family") static function set_family(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract FontFace(cpp.Star<cpp.Void>) {
	public var family(get, set):String;
	inline function get_family():String { var raw = FontFace_Ffi.get_family(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); FontFace_Ffi.freeString(raw); return value; }
	inline function set_family(value:String):String { var raw:cpp.ConstCharStar = cast value; FontFace_Ffi.set_family(this, raw); return value; }
}
