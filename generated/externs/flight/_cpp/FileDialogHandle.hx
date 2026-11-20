package flight._cpp;

private extern class FileDialogHandle_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_file_dialog_handle_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_file_dialog_handle_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract FileDialogHandle(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = FileDialogHandle_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); FileDialogHandle_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; FileDialogHandle_Ffi.set_name(this, raw); return value; }
}
