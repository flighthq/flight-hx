package flight._js;

@:jsRequire("flight")
private extern class RiveDocumentHeader_Ffi {
	@:native("flight_get_rive_document_header_file_id") static function get_fileId(ptr:Dynamic):haxe.Int64;
	@:native("flight_set_rive_document_header_file_id") static function set_fileId(ptr:Dynamic, value:haxe.Int64):haxe.Int64;
	@:native("flight_get_rive_document_header_major_version") static function get_majorVersion(ptr:Dynamic):haxe.Int64;
	@:native("flight_set_rive_document_header_major_version") static function set_majorVersion(ptr:Dynamic, value:haxe.Int64):haxe.Int64;
	@:native("flight_get_rive_document_header_minor_version") static function get_minorVersion(ptr:Dynamic):haxe.Int64;
	@:native("flight_set_rive_document_header_minor_version") static function set_minorVersion(ptr:Dynamic, value:haxe.Int64):haxe.Int64;
}

abstract RiveDocumentHeader(Dynamic) {
	public var fileId(get, set):haxe.Int64;

	inline function get_fileId():haxe.Int64 return RiveDocumentHeader_Ffi.get_fileId(this);

	inline function set_fileId(value:haxe.Int64):haxe.Int64 return RiveDocumentHeader_Ffi.set_fileId(this, value);
	public var majorVersion(get, set):haxe.Int64;

	inline function get_majorVersion():haxe.Int64 return RiveDocumentHeader_Ffi.get_majorVersion(this);

	inline function set_majorVersion(value:haxe.Int64):haxe.Int64 return RiveDocumentHeader_Ffi.set_majorVersion(this, value);
	public var minorVersion(get, set):haxe.Int64;

	inline function get_minorVersion():haxe.Int64 return RiveDocumentHeader_Ffi.get_minorVersion(this);

	inline function set_minorVersion(value:haxe.Int64):haxe.Int64 return RiveDocumentHeader_Ffi.set_minorVersion(this, value);
}
