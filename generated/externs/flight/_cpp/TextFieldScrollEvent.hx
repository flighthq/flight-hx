package flight._cpp;

private extern class TextFieldScrollEvent_Ffi {
	@:native("flight_get_text_field_scroll_event_previous_scroll_h") static function get_previousScrollH(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_field_scroll_event_previous_scroll_h") static function set_previousScrollH(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_field_scroll_event_previous_scroll_v") static function get_previousScrollV(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_field_scroll_event_previous_scroll_v") static function set_previousScrollV(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_field_scroll_event_scroll_h") static function get_scrollH(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_field_scroll_event_scroll_h") static function set_scrollH(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_field_scroll_event_scroll_v") static function get_scrollV(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_field_scroll_event_scroll_v") static function set_scrollV(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract TextFieldScrollEvent(cpp.Star<cpp.Void>) {
	public var previousScrollH(get, set):Single;

	inline function get_previousScrollH():Single return TextFieldScrollEvent_Ffi.get_previousScrollH(this);

	inline function set_previousScrollH(value:Single):Single { TextFieldScrollEvent_Ffi.set_previousScrollH(this, value); return value; }
	public var previousScrollV(get, set):Single;

	inline function get_previousScrollV():Single return TextFieldScrollEvent_Ffi.get_previousScrollV(this);

	inline function set_previousScrollV(value:Single):Single { TextFieldScrollEvent_Ffi.set_previousScrollV(this, value); return value; }
	public var scrollH(get, set):Single;

	inline function get_scrollH():Single return TextFieldScrollEvent_Ffi.get_scrollH(this);

	inline function set_scrollH(value:Single):Single { TextFieldScrollEvent_Ffi.set_scrollH(this, value); return value; }
	public var scrollV(get, set):Single;

	inline function get_scrollV():Single return TextFieldScrollEvent_Ffi.get_scrollV(this);

	inline function set_scrollV(value:Single):Single { TextFieldScrollEvent_Ffi.set_scrollV(this, value); return value; }
}
