package flight._cpp;

private extern class FileDialogFilter_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_file_dialog_filter_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_file_dialog_filter_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract FileDialogFilter(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = FileDialogFilter_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); FileDialogFilter_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; FileDialogFilter_Ffi.set_name(this, raw); return value; }
}
