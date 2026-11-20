package flight._cpp;

private extern class ShareFile_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_share_file_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_share_file_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_share_file_mime_type") static function get_mimeType(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_share_file_mime_type") static function set_mimeType(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_share_file_data_url") static function get_dataUrl(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_share_file_data_url") static function set_dataUrl(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ShareFile(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = ShareFile_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ShareFile_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; ShareFile_Ffi.set_name(this, raw); return value; }
	public var mimeType(get, set):String;
	inline function get_mimeType():String { var raw = ShareFile_Ffi.get_mimeType(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ShareFile_Ffi.freeString(raw); return value; }
	inline function set_mimeType(value:String):String { var raw:cpp.ConstCharStar = cast value; ShareFile_Ffi.set_mimeType(this, raw); return value; }
	public var dataUrl(get, set):String;
	inline function get_dataUrl():String { var raw = ShareFile_Ffi.get_dataUrl(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ShareFile_Ffi.freeString(raw); return value; }
	inline function set_dataUrl(value:String):String { var raw:cpp.ConstCharStar = cast value; ShareFile_Ffi.set_dataUrl(this, raw); return value; }
}
