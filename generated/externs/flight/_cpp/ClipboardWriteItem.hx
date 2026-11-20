package flight._cpp;

private extern class ClipboardWriteItem_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_clipboard_write_item_format") static function get_format(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_clipboard_write_item_format") static function set_format(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_clipboard_write_item_data") static function get_data(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_clipboard_write_item_data") static function set_data(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ClipboardWriteItem(cpp.Star<cpp.Void>) {
	public var format(get, set):String;
	inline function get_format():String { var raw = ClipboardWriteItem_Ffi.get_format(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ClipboardWriteItem_Ffi.freeString(raw); return value; }
	inline function set_format(value:String):String { var raw:cpp.ConstCharStar = cast value; ClipboardWriteItem_Ffi.set_format(this, raw); return value; }
	public var data(get, set):String;
	inline function get_data():String { var raw = ClipboardWriteItem_Ffi.get_data(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ClipboardWriteItem_Ffi.freeString(raw); return value; }
	inline function set_data(value:String):String { var raw:cpp.ConstCharStar = cast value; ClipboardWriteItem_Ffi.set_data(this, raw); return value; }
}
