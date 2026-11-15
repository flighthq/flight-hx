package flight._cpp;

private extern class TextInputState_Ffi {
	@:native("flight_get_text_input_state_always_show_selection") static function get_alwaysShowSelection(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_text_input_state_always_show_selection") static function set_alwaysShowSelection(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_text_input_state_caret_color") static function get_caretColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_input_state_caret_color") static function set_caretColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_input_state_caret_index") static function get_caretIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_input_state_caret_index") static function set_caretIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_input_state_caret_width") static function get_caretWidth(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_input_state_caret_width") static function set_caretWidth(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_input_state_desired_caret_x") static function get_desiredCaretX(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_input_state_desired_caret_x") static function set_desiredCaretX(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_input_state_display_as_password") static function get_displayAsPassword(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_text_input_state_display_as_password") static function set_displayAsPassword(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_text_input_state_focused") static function get_focused(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_text_input_state_focused") static function set_focused(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_text_input_state_history_index") static function get_historyIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_input_state_history_index") static function set_historyIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_input_state_history_limit") static function get_historyLimit(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_input_state_history_limit") static function set_historyLimit(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_input_state_selection_alpha") static function get_selectionAlpha(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_text_input_state_selection_alpha") static function set_selectionAlpha(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_text_input_state_selection_color") static function get_selectionColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_input_state_selection_color") static function set_selectionColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_input_state_selection_index") static function get_selectionIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_input_state_selection_index") static function set_selectionIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract TextInputState(cpp.Star<cpp.Void>) {
	public var alwaysShowSelection(get, set):Bool;

	inline function get_alwaysShowSelection():Bool return TextInputState_Ffi.get_alwaysShowSelection(this);

	inline function set_alwaysShowSelection(value:Bool):Bool return TextInputState_Ffi.set_alwaysShowSelection(this, value);
	public var caretColor(get, set):Int;

	inline function get_caretColor():Int return TextInputState_Ffi.get_caretColor(this);

	inline function set_caretColor(value:Int):Int return TextInputState_Ffi.set_caretColor(this, value);
	public var caretIndex(get, set):Int;

	inline function get_caretIndex():Int return TextInputState_Ffi.get_caretIndex(this);

	inline function set_caretIndex(value:Int):Int return TextInputState_Ffi.set_caretIndex(this, value);
	public var caretWidth(get, set):Single;

	inline function get_caretWidth():Single return TextInputState_Ffi.get_caretWidth(this);

	inline function set_caretWidth(value:Single):Single return TextInputState_Ffi.set_caretWidth(this, value);
	public var desiredCaretX(get, set):Single;

	inline function get_desiredCaretX():Single return TextInputState_Ffi.get_desiredCaretX(this);

	inline function set_desiredCaretX(value:Single):Single return TextInputState_Ffi.set_desiredCaretX(this, value);
	public var displayAsPassword(get, set):Bool;

	inline function get_displayAsPassword():Bool return TextInputState_Ffi.get_displayAsPassword(this);

	inline function set_displayAsPassword(value:Bool):Bool return TextInputState_Ffi.set_displayAsPassword(this, value);
	public var focused(get, set):Bool;

	inline function get_focused():Bool return TextInputState_Ffi.get_focused(this);

	inline function set_focused(value:Bool):Bool return TextInputState_Ffi.set_focused(this, value);
	public var historyIndex(get, set):Int;

	inline function get_historyIndex():Int return TextInputState_Ffi.get_historyIndex(this);

	inline function set_historyIndex(value:Int):Int return TextInputState_Ffi.set_historyIndex(this, value);
	public var historyLimit(get, set):Int;

	inline function get_historyLimit():Int return TextInputState_Ffi.get_historyLimit(this);

	inline function set_historyLimit(value:Int):Int return TextInputState_Ffi.set_historyLimit(this, value);
	public var selectionAlpha(get, set):Single;

	inline function get_selectionAlpha():Single return TextInputState_Ffi.get_selectionAlpha(this);

	inline function set_selectionAlpha(value:Single):Single return TextInputState_Ffi.set_selectionAlpha(this, value);
	public var selectionColor(get, set):Int;

	inline function get_selectionColor():Int return TextInputState_Ffi.get_selectionColor(this);

	inline function set_selectionColor(value:Int):Int return TextInputState_Ffi.set_selectionColor(this, value);
	public var selectionIndex(get, set):Int;

	inline function get_selectionIndex():Int return TextInputState_Ffi.get_selectionIndex(this);

	inline function set_selectionIndex(value:Int):Int return TextInputState_Ffi.set_selectionIndex(this, value);
}
