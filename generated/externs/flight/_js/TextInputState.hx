package flight._js;

@:jsRequire("flight")
private extern class TextInputState_Ffi {
	@:native("flight_get_text_input_state_always_show_selection") static function get_alwaysShowSelection(ptr:Dynamic):Bool;
	@:native("flight_set_text_input_state_always_show_selection") static function set_alwaysShowSelection(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_text_input_state_caret_color") static function get_caretColor(ptr:Dynamic):Int;
	@:native("flight_set_text_input_state_caret_color") static function set_caretColor(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_text_input_state_caret_index") static function get_caretIndex(ptr:Dynamic):Int;
	@:native("flight_set_text_input_state_caret_index") static function set_caretIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_text_input_state_caret_width") static function get_caretWidth(ptr:Dynamic):Float;
	@:native("flight_set_text_input_state_caret_width") static function set_caretWidth(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_text_input_state_desired_caret_x") static function get_desiredCaretX(ptr:Dynamic):Float;
	@:native("flight_set_text_input_state_desired_caret_x") static function set_desiredCaretX(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_text_input_state_display_as_password") static function get_displayAsPassword(ptr:Dynamic):Bool;
	@:native("flight_set_text_input_state_display_as_password") static function set_displayAsPassword(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_text_input_state_focused") static function get_focused(ptr:Dynamic):Bool;
	@:native("flight_set_text_input_state_focused") static function set_focused(ptr:Dynamic, value:Bool):Bool;
	@:native("flight_get_text_input_state_history_index") static function get_historyIndex(ptr:Dynamic):Int;
	@:native("flight_set_text_input_state_history_index") static function set_historyIndex(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_text_input_state_history_limit") static function get_historyLimit(ptr:Dynamic):Int;
	@:native("flight_set_text_input_state_history_limit") static function set_historyLimit(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_text_input_state_selection_alpha") static function get_selectionAlpha(ptr:Dynamic):Float;
	@:native("flight_set_text_input_state_selection_alpha") static function set_selectionAlpha(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_text_input_state_selection_color") static function get_selectionColor(ptr:Dynamic):Int;
	@:native("flight_set_text_input_state_selection_color") static function set_selectionColor(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_text_input_state_selection_index") static function get_selectionIndex(ptr:Dynamic):Int;
	@:native("flight_set_text_input_state_selection_index") static function set_selectionIndex(ptr:Dynamic, value:Int):Int;
}

abstract TextInputState(Dynamic) {
	public var alwaysShowSelection(get, set):Bool;

	inline function get_alwaysShowSelection():Bool return TextInputState_Ffi.get_alwaysShowSelection(this);

	inline function set_alwaysShowSelection(value:Bool):Bool return TextInputState_Ffi.set_alwaysShowSelection(this, value);
	public var caretColor(get, set):Int;

	inline function get_caretColor():Int return TextInputState_Ffi.get_caretColor(this);

	inline function set_caretColor(value:Int):Int return TextInputState_Ffi.set_caretColor(this, value);
	public var caretIndex(get, set):Int;

	inline function get_caretIndex():Int return TextInputState_Ffi.get_caretIndex(this);

	inline function set_caretIndex(value:Int):Int return TextInputState_Ffi.set_caretIndex(this, value);
	public var caretWidth(get, set):Float;

	inline function get_caretWidth():Float return TextInputState_Ffi.get_caretWidth(this);

	inline function set_caretWidth(value:Float):Float return TextInputState_Ffi.set_caretWidth(this, value);
	public var desiredCaretX(get, set):Float;

	inline function get_desiredCaretX():Float return TextInputState_Ffi.get_desiredCaretX(this);

	inline function set_desiredCaretX(value:Float):Float return TextInputState_Ffi.set_desiredCaretX(this, value);
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
	public var selectionAlpha(get, set):Float;

	inline function get_selectionAlpha():Float return TextInputState_Ffi.get_selectionAlpha(this);

	inline function set_selectionAlpha(value:Float):Float return TextInputState_Ffi.set_selectionAlpha(this, value);
	public var selectionColor(get, set):Int;

	inline function get_selectionColor():Int return TextInputState_Ffi.get_selectionColor(this);

	inline function set_selectionColor(value:Int):Int return TextInputState_Ffi.set_selectionColor(this, value);
	public var selectionIndex(get, set):Int;

	inline function get_selectionIndex():Int return TextInputState_Ffi.get_selectionIndex(this);

	inline function set_selectionIndex(value:Int):Int return TextInputState_Ffi.set_selectionIndex(this, value);
}
