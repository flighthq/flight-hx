package flight._js;

@:jsRequire("flight")
private extern class TextFieldScrollEvent_Ffi {
	@:native("flight_get_text_field_scroll_event_previous_scroll_h") static function get_previousScrollH(ptr:Dynamic):Float;
	@:native("flight_set_text_field_scroll_event_previous_scroll_h") static function set_previousScrollH(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_text_field_scroll_event_previous_scroll_v") static function get_previousScrollV(ptr:Dynamic):Float;
	@:native("flight_set_text_field_scroll_event_previous_scroll_v") static function set_previousScrollV(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_text_field_scroll_event_scroll_h") static function get_scrollH(ptr:Dynamic):Float;
	@:native("flight_set_text_field_scroll_event_scroll_h") static function set_scrollH(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_text_field_scroll_event_scroll_v") static function get_scrollV(ptr:Dynamic):Float;
	@:native("flight_set_text_field_scroll_event_scroll_v") static function set_scrollV(ptr:Dynamic, value:Float):Float;
}

abstract TextFieldScrollEvent(Dynamic) {
	public var previousScrollH(get, set):Float;

	inline function get_previousScrollH():Float return TextFieldScrollEvent_Ffi.get_previousScrollH(this);

	inline function set_previousScrollH(value:Float):Float return TextFieldScrollEvent_Ffi.set_previousScrollH(this, value);
	public var previousScrollV(get, set):Float;

	inline function get_previousScrollV():Float return TextFieldScrollEvent_Ffi.get_previousScrollV(this);

	inline function set_previousScrollV(value:Float):Float return TextFieldScrollEvent_Ffi.set_previousScrollV(this, value);
	public var scrollH(get, set):Float;

	inline function get_scrollH():Float return TextFieldScrollEvent_Ffi.get_scrollH(this);

	inline function set_scrollH(value:Float):Float return TextFieldScrollEvent_Ffi.set_scrollH(this, value);
	public var scrollV(get, set):Float;

	inline function get_scrollV():Float return TextFieldScrollEvent_Ffi.get_scrollV(this);

	inline function set_scrollV(value:Float):Float return TextFieldScrollEvent_Ffi.set_scrollV(this, value);
}
