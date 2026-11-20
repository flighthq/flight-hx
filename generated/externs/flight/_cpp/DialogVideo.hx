package flight._cpp;

private extern class DialogVideo_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_dialog_video_data_url") static function get_dataUrl(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_dialog_video_data_url") static function set_dataUrl(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_dialog_video_duration") static function get_duration(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_dialog_video_duration") static function set_duration(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_dialog_video_mime_type") static function get_mimeType(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_dialog_video_mime_type") static function set_mimeType(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract DialogVideo(cpp.Star<cpp.Void>) {
	public var dataUrl(get, set):String;
	inline function get_dataUrl():String { var raw = DialogVideo_Ffi.get_dataUrl(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DialogVideo_Ffi.freeString(raw); return value; }
	inline function set_dataUrl(value:String):String { var raw:cpp.ConstCharStar = cast value; DialogVideo_Ffi.set_dataUrl(this, raw); return value; }
	public var duration(get, set):Single;

	inline function get_duration():Single return DialogVideo_Ffi.get_duration(this);

	inline function set_duration(value:Single):Single { DialogVideo_Ffi.set_duration(this, value); return value; }
	public var mimeType(get, set):String;
	inline function get_mimeType():String { var raw = DialogVideo_Ffi.get_mimeType(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DialogVideo_Ffi.freeString(raw); return value; }
	inline function set_mimeType(value:String):String { var raw:cpp.ConstCharStar = cast value; DialogVideo_Ffi.set_mimeType(this, raw); return value; }
}
