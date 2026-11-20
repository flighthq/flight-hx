package flight._cpp;

private extern class MessageDialogResult_Ffi {
	@:native("flight_get_message_dialog_result_button_index") static function get_buttonIndex(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_message_dialog_result_button_index") static function set_buttonIndex(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_message_dialog_result_cancelled") static function get_cancelled(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_message_dialog_result_cancelled") static function set_cancelled(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_message_dialog_result_checkbox_checked") static function get_checkboxChecked(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_message_dialog_result_checkbox_checked") static function set_checkboxChecked(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract MessageDialogResult(cpp.Star<cpp.Void>) {
	public var buttonIndex(get, set):Int;

	inline function get_buttonIndex():Int return MessageDialogResult_Ffi.get_buttonIndex(this);

	inline function set_buttonIndex(value:Int):Int { MessageDialogResult_Ffi.set_buttonIndex(this, value); return value; }
	public var cancelled(get, set):Bool;

	inline function get_cancelled():Bool return MessageDialogResult_Ffi.get_cancelled(this);

	inline function set_cancelled(value:Bool):Bool { MessageDialogResult_Ffi.set_cancelled(this, value); return value; }
	public var checkboxChecked(get, set):Bool;

	inline function get_checkboxChecked():Bool return MessageDialogResult_Ffi.get_checkboxChecked(this);

	inline function set_checkboxChecked(value:Bool):Bool { MessageDialogResult_Ffi.set_checkboxChecked(this, value); return value; }
}
