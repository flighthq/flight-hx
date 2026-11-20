package flight._cpp;

private extern class PromptDialogOptions_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_prompt_dialog_options_message") static function get_message(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_prompt_dialog_options_message") static function set_message(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract PromptDialogOptions(cpp.Star<cpp.Void>) {
	public var message(get, set):String;
	inline function get_message():String { var raw = PromptDialogOptions_Ffi.get_message(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); PromptDialogOptions_Ffi.freeString(raw); return value; }
	inline function set_message(value:String):String { var raw:cpp.ConstCharStar = cast value; PromptDialogOptions_Ffi.set_message(this, raw); return value; }
}
