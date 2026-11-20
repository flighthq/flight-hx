package flight._cpp;

private extern class TextFieldChangeEvent_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_text_field_change_event_previous_text") static function get_previousText(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_text_field_change_event_previous_text") static function set_previousText(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_text_field_change_event_text") static function get_text(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_text_field_change_event_text") static function set_text(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract TextFieldChangeEvent(cpp.Star<cpp.Void>) {
	public var previousText(get, set):String;
	inline function get_previousText():String { var raw = TextFieldChangeEvent_Ffi.get_previousText(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TextFieldChangeEvent_Ffi.freeString(raw); return value; }
	inline function set_previousText(value:String):String { var raw:cpp.ConstCharStar = cast value; TextFieldChangeEvent_Ffi.set_previousText(this, raw); return value; }
	public var text(get, set):String;
	inline function get_text():String { var raw = TextFieldChangeEvent_Ffi.get_text(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TextFieldChangeEvent_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:cpp.ConstCharStar = cast value; TextFieldChangeEvent_Ffi.set_text(this, raw); return value; }
}
