package flight._js;

@:jsRequire("flight")
private extern class TextInputHistoryEntry_Ffi {
	@:native("flight_get_text_input_history_entry_caret_index_after") static function get_caretIndexAfter(ptr:Dynamic):Int;
	@:native("flight_set_text_input_history_entry_caret_index_after") static function set_caretIndexAfter(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_text_input_history_entry_caret_index_before") static function get_caretIndexBefore(ptr:Dynamic):Int;
	@:native("flight_set_text_input_history_entry_caret_index_before") static function set_caretIndexBefore(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_text_input_history_entry_selection_index_after") static function get_selectionIndexAfter(ptr:Dynamic):Int;
	@:native("flight_set_text_input_history_entry_selection_index_after") static function set_selectionIndexAfter(ptr:Dynamic, value:Int):Int;
	@:native("flight_get_text_input_history_entry_selection_index_before") static function get_selectionIndexBefore(ptr:Dynamic):Int;
	@:native("flight_set_text_input_history_entry_selection_index_before") static function set_selectionIndexBefore(ptr:Dynamic, value:Int):Int;
}

abstract TextInputHistoryEntry(Dynamic) {
	public var caretIndexAfter(get, set):Int;

	inline function get_caretIndexAfter():Int return TextInputHistoryEntry_Ffi.get_caretIndexAfter(this);

	inline function set_caretIndexAfter(value:Int):Int return TextInputHistoryEntry_Ffi.set_caretIndexAfter(this, value);
	public var caretIndexBefore(get, set):Int;

	inline function get_caretIndexBefore():Int return TextInputHistoryEntry_Ffi.get_caretIndexBefore(this);

	inline function set_caretIndexBefore(value:Int):Int return TextInputHistoryEntry_Ffi.set_caretIndexBefore(this, value);
	public var selectionIndexAfter(get, set):Int;

	inline function get_selectionIndexAfter():Int return TextInputHistoryEntry_Ffi.get_selectionIndexAfter(this);

	inline function set_selectionIndexAfter(value:Int):Int return TextInputHistoryEntry_Ffi.set_selectionIndexAfter(this, value);
	public var selectionIndexBefore(get, set):Int;

	inline function get_selectionIndexBefore():Int return TextInputHistoryEntry_Ffi.get_selectionIndexBefore(this);

	inline function set_selectionIndexBefore(value:Int):Int return TextInputHistoryEntry_Ffi.set_selectionIndexBefore(this, value);
}
