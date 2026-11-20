package flight._cpp;

private extern class ShellPathOpenOutcomeOperationFailed_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_shell_path_open_outcome_operation_failed_message") static function get_message(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_shell_path_open_outcome_operation_failed_message") static function set_message(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ShellPathOpenOutcomeOperationFailed(cpp.Star<cpp.Void>) {
	public var message(get, set):String;
	inline function get_message():String { var raw = ShellPathOpenOutcomeOperationFailed_Ffi.get_message(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ShellPathOpenOutcomeOperationFailed_Ffi.freeString(raw); return value; }
	inline function set_message(value:String):String { var raw:cpp.ConstCharStar = cast value; ShellPathOpenOutcomeOperationFailed_Ffi.set_message(this, raw); return value; }
}
