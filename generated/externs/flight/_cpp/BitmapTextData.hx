package flight._cpp;

private extern class BitmapTextData_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_bitmap_text_data_ellipsis") static function get_ellipsis(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_bitmap_text_data_ellipsis") static function set_ellipsis(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_bitmap_text_data_letter_spacing") static function get_letterSpacing(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_bitmap_text_data_letter_spacing") static function set_letterSpacing(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_bitmap_text_data_line_height") static function get_lineHeight(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_bitmap_text_data_line_height") static function set_lineHeight(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_field_get_bitmap_text_data_text") static function get_text(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_bitmap_text_data_text") static function set_text(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract BitmapTextData(cpp.Star<cpp.Void>) {
	public var ellipsis(get, set):String;
	inline function get_ellipsis():String { var raw = BitmapTextData_Ffi.get_ellipsis(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); BitmapTextData_Ffi.freeString(raw); return value; }
	inline function set_ellipsis(value:String):String { var raw:cpp.ConstCharStar = cast value; BitmapTextData_Ffi.set_ellipsis(this, raw); return value; }
	public var letterSpacing(get, set):Single;

	inline function get_letterSpacing():Single return BitmapTextData_Ffi.get_letterSpacing(this);

	inline function set_letterSpacing(value:Single):Single { BitmapTextData_Ffi.set_letterSpacing(this, value); return value; }
	public var lineHeight(get, set):Single;

	inline function get_lineHeight():Single return BitmapTextData_Ffi.get_lineHeight(this);

	inline function set_lineHeight(value:Single):Single { BitmapTextData_Ffi.set_lineHeight(this, value); return value; }
	public var text(get, set):String;
	inline function get_text():String { var raw = BitmapTextData_Ffi.get_text(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); BitmapTextData_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:cpp.ConstCharStar = cast value; BitmapTextData_Ffi.set_text(this, raw); return value; }
}
