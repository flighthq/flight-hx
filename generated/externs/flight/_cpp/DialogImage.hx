package flight._cpp;

private extern class DialogImage_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_dialog_image_data_url") static function get_dataUrl(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_dialog_image_data_url") static function set_dataUrl(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_dialog_image_height") static function get_height(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_dialog_image_height") static function set_height(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_dialog_image_mime_type") static function get_mimeType(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_dialog_image_mime_type") static function set_mimeType(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_dialog_image_width") static function get_width(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_dialog_image_width") static function set_width(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract DialogImage(cpp.Star<cpp.Void>) {
	public var dataUrl(get, set):String;
	inline function get_dataUrl():String { var raw = DialogImage_Ffi.get_dataUrl(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DialogImage_Ffi.freeString(raw); return value; }
	inline function set_dataUrl(value:String):String { var raw:cpp.ConstCharStar = cast value; DialogImage_Ffi.set_dataUrl(this, raw); return value; }
	public var height(get, set):Single;

	inline function get_height():Single return DialogImage_Ffi.get_height(this);

	inline function set_height(value:Single):Single { DialogImage_Ffi.set_height(this, value); return value; }
	public var mimeType(get, set):String;
	inline function get_mimeType():String { var raw = DialogImage_Ffi.get_mimeType(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); DialogImage_Ffi.freeString(raw); return value; }
	inline function set_mimeType(value:String):String { var raw:cpp.ConstCharStar = cast value; DialogImage_Ffi.set_mimeType(this, raw); return value; }
	public var width(get, set):Single;

	inline function get_width():Single return DialogImage_Ffi.get_width(this);

	inline function set_width(value:Single):Single { DialogImage_Ffi.set_width(this, value); return value; }
}
