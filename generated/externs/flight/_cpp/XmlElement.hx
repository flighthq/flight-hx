package flight._cpp;

private extern class XmlElement_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_xml_element_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_xml_element_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_xml_element_text") static function get_text(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_xml_element_text") static function set_text(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract XmlElement(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = XmlElement_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); XmlElement_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; XmlElement_Ffi.set_name(this, raw); return value; }
	public var text(get, set):String;
	inline function get_text():String { var raw = XmlElement_Ffi.get_text(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); XmlElement_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:cpp.ConstCharStar = cast value; XmlElement_Ffi.set_text(this, raw); return value; }
}
