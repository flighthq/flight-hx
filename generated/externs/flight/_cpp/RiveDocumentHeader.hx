package flight._cpp;

private extern class RiveDocumentHeader_Ffi {
	@:native("flight_get_rive_document_header_file_id") static function get_fileId(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_rive_document_header_file_id") static function set_fileId(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
	@:native("flight_get_rive_document_header_major_version") static function get_majorVersion(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_rive_document_header_major_version") static function set_majorVersion(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
	@:native("flight_get_rive_document_header_minor_version") static function get_minorVersion(ptr:cpp.Star<cpp.Void>):haxe.Int64;
	@:native("flight_set_rive_document_header_minor_version") static function set_minorVersion(ptr:cpp.Star<cpp.Void>, value:haxe.Int64):haxe.Int64;
}

abstract RiveDocumentHeader(cpp.Star<cpp.Void>) {
	public var fileId(get, set):haxe.Int64;

	inline function get_fileId():haxe.Int64 return RiveDocumentHeader_Ffi.get_fileId(this);

	inline function set_fileId(value:haxe.Int64):haxe.Int64 { RiveDocumentHeader_Ffi.set_fileId(this, value); return value; }
	public var majorVersion(get, set):haxe.Int64;

	inline function get_majorVersion():haxe.Int64 return RiveDocumentHeader_Ffi.get_majorVersion(this);

	inline function set_majorVersion(value:haxe.Int64):haxe.Int64 { RiveDocumentHeader_Ffi.set_majorVersion(this, value); return value; }
	public var minorVersion(get, set):haxe.Int64;

	inline function get_minorVersion():haxe.Int64 return RiveDocumentHeader_Ffi.get_minorVersion(this);

	inline function set_minorVersion(value:haxe.Int64):haxe.Int64 { RiveDocumentHeader_Ffi.set_minorVersion(this, value); return value; }
}
