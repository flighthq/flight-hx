package flight._cpp;

private extern class Md2SectionHandler_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_md2_section_handler_feature") static function get_feature(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_md2_section_handler_feature") static function set_feature(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract Md2SectionHandler(cpp.Star<cpp.Void>) {
	public var feature(get, set):String;
	inline function get_feature():String { var raw = Md2SectionHandler_Ffi.get_feature(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); Md2SectionHandler_Ffi.freeString(raw); return value; }
	inline function set_feature(value:String):String { var raw:cpp.ConstCharStar = cast value; Md2SectionHandler_Ffi.set_feature(this, raw); return value; }
}
