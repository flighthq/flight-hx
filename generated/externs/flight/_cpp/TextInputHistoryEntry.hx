package flight._cpp;

private extern class TextInputHistoryEntry_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_text_input_history_entry_caret_index_after") static function get_caretIndexAfter(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_input_history_entry_caret_index_after") static function set_caretIndexAfter(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_input_history_entry_caret_index_before") static function get_caretIndexBefore(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_input_history_entry_caret_index_before") static function set_caretIndexBefore(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_input_history_entry_selection_index_after") static function get_selectionIndexAfter(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_input_history_entry_selection_index_after") static function set_selectionIndexAfter(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_text_input_history_entry_selection_index_before") static function get_selectionIndexBefore(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_text_input_history_entry_selection_index_before") static function set_selectionIndexBefore(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_text_input_history_entry_text_after") static function get_textAfter(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_text_input_history_entry_text_after") static function set_textAfter(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_text_input_history_entry_text_before") static function get_textBefore(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_text_input_history_entry_text_before") static function set_textBefore(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract TextInputHistoryEntry(cpp.Star<cpp.Void>) {
	public var caretIndexAfter(get, set):Int;

	inline function get_caretIndexAfter():Int return TextInputHistoryEntry_Ffi.get_caretIndexAfter(this);

	inline function set_caretIndexAfter(value:Int):Int { TextInputHistoryEntry_Ffi.set_caretIndexAfter(this, value); return value; }
	public var caretIndexBefore(get, set):Int;

	inline function get_caretIndexBefore():Int return TextInputHistoryEntry_Ffi.get_caretIndexBefore(this);

	inline function set_caretIndexBefore(value:Int):Int { TextInputHistoryEntry_Ffi.set_caretIndexBefore(this, value); return value; }
	public var selectionIndexAfter(get, set):Int;

	inline function get_selectionIndexAfter():Int return TextInputHistoryEntry_Ffi.get_selectionIndexAfter(this);

	inline function set_selectionIndexAfter(value:Int):Int { TextInputHistoryEntry_Ffi.set_selectionIndexAfter(this, value); return value; }
	public var selectionIndexBefore(get, set):Int;

	inline function get_selectionIndexBefore():Int return TextInputHistoryEntry_Ffi.get_selectionIndexBefore(this);

	inline function set_selectionIndexBefore(value:Int):Int { TextInputHistoryEntry_Ffi.set_selectionIndexBefore(this, value); return value; }
	public var textAfter(get, set):String;
	inline function get_textAfter():String { var raw = TextInputHistoryEntry_Ffi.get_textAfter(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TextInputHistoryEntry_Ffi.freeString(raw); return value; }
	inline function set_textAfter(value:String):String { var raw:cpp.ConstCharStar = cast value; TextInputHistoryEntry_Ffi.set_textAfter(this, raw); return value; }
	public var textBefore(get, set):String;
	inline function get_textBefore():String { var raw = TextInputHistoryEntry_Ffi.get_textBefore(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); TextInputHistoryEntry_Ffi.freeString(raw); return value; }
	inline function set_textBefore(value:String):String { var raw:cpp.ConstCharStar = cast value; TextInputHistoryEntry_Ffi.set_textBefore(this, raw); return value; }
}
