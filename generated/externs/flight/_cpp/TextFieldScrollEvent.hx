package flight._cpp;

private extern class TextFieldScrollEvent_Ffi {
	@:native("flight_get_text_field_scroll_event_previous_scroll_h") static function get_previousScrollH(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_text_field_scroll_event_previous_scroll_h") static function set_previousScrollH(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_text_field_scroll_event_previous_scroll_v") static function get_previousScrollV(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_text_field_scroll_event_previous_scroll_v") static function set_previousScrollV(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_text_field_scroll_event_scroll_h") static function get_scrollH(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_text_field_scroll_event_scroll_h") static function set_scrollH(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_text_field_scroll_event_scroll_v") static function get_scrollV(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_text_field_scroll_event_scroll_v") static function set_scrollV(ptr:cpp.Star<cpp.Void>, value:Float):Float;
}

abstract TextFieldScrollEvent(cpp.Star<cpp.Void>) {
	public var previousScrollH(get, set):Float;

	inline function get_previousScrollH():Float return TextFieldScrollEvent_Ffi.get_previousScrollH(this);

	inline function set_previousScrollH(value:Float):Float { TextFieldScrollEvent_Ffi.set_previousScrollH(this, value); return value; }
	public var previousScrollV(get, set):Float;

	inline function get_previousScrollV():Float return TextFieldScrollEvent_Ffi.get_previousScrollV(this);

	inline function set_previousScrollV(value:Float):Float { TextFieldScrollEvent_Ffi.set_previousScrollV(this, value); return value; }
	public var scrollH(get, set):Float;

	inline function get_scrollH():Float return TextFieldScrollEvent_Ffi.get_scrollH(this);

	inline function set_scrollH(value:Float):Float { TextFieldScrollEvent_Ffi.set_scrollH(this, value); return value; }
	public var scrollV(get, set):Float;

	inline function get_scrollV():Float return TextFieldScrollEvent_Ffi.get_scrollV(this);

	inline function set_scrollV(value:Float):Float { TextFieldScrollEvent_Ffi.set_scrollV(this, value); return value; }
}
