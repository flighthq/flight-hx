package flight._cpp;

private extern class TextInputState_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_text_input_state_always_show_selection") static function get_alwaysShowSelection(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_text_input_state_always_show_selection") static function set_alwaysShowSelection(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_text_input_state_caret_color") static function get_caretColor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_input_state_caret_color") static function set_caretColor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_input_state_caret_index") static function get_caretIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_input_state_caret_index") static function set_caretIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_input_state_caret_width") static function get_caretWidth(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_text_input_state_caret_width") static function set_caretWidth(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_text_input_state_desired_caret_x") static function get_desiredCaretX(ptr:cpp.Star<cpp.Void>):Float;
	@:native("flight_set_text_input_state_desired_caret_x") static function set_desiredCaretX(ptr:cpp.Star<cpp.Void>, value:Float):Float;
	@:native("flight_get_text_input_state_display_as_password") static function get_displayAsPassword(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_text_input_state_display_as_password") static function set_displayAsPassword(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_text_input_state_focused") static function get_focused(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_text_input_state_focused") static function set_focused(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_text_input_state_history_index") static function get_historyIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_input_state_history_index") static function set_historyIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_input_state_history_limit") static function get_historyLimit(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_input_state_history_limit") static function set_historyLimit(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_text_input_state_password_character") static function get_passwordCharacter(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_text_input_state_password_character") static function set_passwordCharacter(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_text_input_state_restrict") static function get_restrict(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_text_input_state_restrict") static function set_restrict(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
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

	inline function set_alwaysShowSelection(value:Bool):Bool { TextInputState_Ffi.set_alwaysShowSelection(this, value); return value; }
	public var caretColor(get, set):Int;

	inline function get_caretColor():Int return TextInputState_Ffi.get_caretColor(this);

	inline function set_caretColor(value:Int):Int { TextInputState_Ffi.set_caretColor(this, value); return value; }
	public var caretIndex(get, set):Int;

	inline function get_caretIndex():Int return TextInputState_Ffi.get_caretIndex(this);

	inline function set_caretIndex(value:Int):Int { TextInputState_Ffi.set_caretIndex(this, value); return value; }
	public var caretWidth(get, set):Float;

	inline function get_caretWidth():Float return TextInputState_Ffi.get_caretWidth(this);

	inline function set_caretWidth(value:Float):Float { TextInputState_Ffi.set_caretWidth(this, value); return value; }
	public var desiredCaretX(get, set):Float;

	inline function get_desiredCaretX():Float return TextInputState_Ffi.get_desiredCaretX(this);

	inline function set_desiredCaretX(value:Float):Float { TextInputState_Ffi.set_desiredCaretX(this, value); return value; }
	public var displayAsPassword(get, set):Bool;

	inline function get_displayAsPassword():Bool return TextInputState_Ffi.get_displayAsPassword(this);

	inline function set_displayAsPassword(value:Bool):Bool { TextInputState_Ffi.set_displayAsPassword(this, value); return value; }
	public var focused(get, set):Bool;

	inline function get_focused():Bool return TextInputState_Ffi.get_focused(this);

	inline function set_focused(value:Bool):Bool { TextInputState_Ffi.set_focused(this, value); return value; }
	public var historyIndex(get, set):Int;

	inline function get_historyIndex():Int return TextInputState_Ffi.get_historyIndex(this);

	inline function set_historyIndex(value:Int):Int { TextInputState_Ffi.set_historyIndex(this, value); return value; }
	public var historyLimit(get, set):Int;

	inline function get_historyLimit():Int return TextInputState_Ffi.get_historyLimit(this);

	inline function set_historyLimit(value:Int):Int { TextInputState_Ffi.set_historyLimit(this, value); return value; }
	public var passwordCharacter(get, set):String;
	inline function get_passwordCharacter():String { var raw = TextInputState_Ffi.get_passwordCharacter(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TextInputState_Ffi.freeString(raw); return value; }
	inline function set_passwordCharacter(value:String):String { var raw:cpp.ConstCharStar = cast value; TextInputState_Ffi.set_passwordCharacter(this, raw); return value; }
	public var restrict(get, set):String;
	inline function get_restrict():String { var raw = TextInputState_Ffi.get_restrict(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TextInputState_Ffi.freeString(raw); return value; }
	inline function set_restrict(value:String):String { var raw:cpp.ConstCharStar = cast value; TextInputState_Ffi.set_restrict(this, raw); return value; }
	public var selectionAlpha(get, set):Single;

	inline function get_selectionAlpha():Single return TextInputState_Ffi.get_selectionAlpha(this);

	inline function set_selectionAlpha(value:Single):Single { TextInputState_Ffi.set_selectionAlpha(this, value); return value; }
	public var selectionColor(get, set):Int;

	inline function get_selectionColor():Int return TextInputState_Ffi.get_selectionColor(this);

	inline function set_selectionColor(value:Int):Int { TextInputState_Ffi.set_selectionColor(this, value); return value; }
	public var selectionIndex(get, set):Int;

	inline function get_selectionIndex():Int return TextInputState_Ffi.get_selectionIndex(this);

	inline function set_selectionIndex(value:Int):Int { TextInputState_Ffi.set_selectionIndex(this, value); return value; }
}
