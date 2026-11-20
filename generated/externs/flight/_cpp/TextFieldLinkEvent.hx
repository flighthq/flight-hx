package flight._cpp;

private extern class TextFieldLinkEvent_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_text_field_link_event_url") static function get_url(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_text_field_link_event_url") static function set_url(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_text_field_link_event_x") static function get_x(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_text_field_link_event_x") static function set_x(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_text_field_link_event_y") static function get_y(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_text_field_link_event_y") static function set_y(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract TextFieldLinkEvent(cpp.Star<cpp.Void>) {
	public var url(get, set):String;
	inline function get_url():String { var raw = TextFieldLinkEvent_Ffi.get_url(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TextFieldLinkEvent_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:cpp.ConstCharStar = cast value; TextFieldLinkEvent_Ffi.set_url(this, raw); return value; }
	public var x(get, set):Float;

	inline function get_x():Float return TextFieldLinkEvent_Ffi.get_x(this);

	inline function set_x(value:Float):Float { TextFieldLinkEvent_Ffi.set_x(this, value); return value; }
	public var y(get, set):Float;

	inline function get_y():Float return TextFieldLinkEvent_Ffi.get_y(this);

	inline function set_y(value:Float):Float { TextFieldLinkEvent_Ffi.set_y(this, value); return value; }
}
