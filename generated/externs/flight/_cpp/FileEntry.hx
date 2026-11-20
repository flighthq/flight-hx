package flight._cpp;

private extern class FileEntry_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_file_entry_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_file_entry_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_file_entry_path") static function get_path(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_file_entry_path") static function set_path(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_file_entry_is_directory") static function get_isDirectory(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_file_entry_is_directory") static function set_isDirectory(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
}

abstract FileEntry(cpp.Star<cpp.Void>) {
	public var name(get, set):String;
	inline function get_name():String { var raw = FileEntry_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); FileEntry_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; FileEntry_Ffi.set_name(this, raw); return value; }
	public var path(get, set):String;
	inline function get_path():String { var raw = FileEntry_Ffi.get_path(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); FileEntry_Ffi.freeString(raw); return value; }
	inline function set_path(value:String):String { var raw:cpp.ConstCharStar = cast value; FileEntry_Ffi.set_path(this, raw); return value; }
	public var isDirectory(get, set):Bool;

	inline function get_isDirectory():Bool return FileEntry_Ffi.get_isDirectory(this);

	inline function set_isDirectory(value:Bool):Bool { FileEntry_Ffi.set_isDirectory(this, value); return value; }
}
