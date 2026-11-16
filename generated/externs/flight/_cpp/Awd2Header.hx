package flight._cpp;

private extern class Awd2Header_Ffi {
	@:native("flight_get_awd2_header_body_length") static function get_bodyLength(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_header_body_length") static function set_bodyLength(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_header_compression") static function get_compression(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_header_compression") static function set_compression(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_header_flags") static function get_flags(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_header_flags") static function set_flags(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_header_version_major") static function get_versionMajor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_header_version_major") static function set_versionMajor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_awd2_header_version_minor") static function get_versionMinor(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_awd2_header_version_minor") static function set_versionMinor(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract Awd2Header(cpp.Star<cpp.Void>) {
	public var bodyLength(get, set):Int;

	inline function get_bodyLength():Int return Awd2Header_Ffi.get_bodyLength(this);

	inline function set_bodyLength(value:Int):Int { Awd2Header_Ffi.set_bodyLength(this, value); return value; }
	public var compression(get, set):Int;

	inline function get_compression():Int return Awd2Header_Ffi.get_compression(this);

	inline function set_compression(value:Int):Int { Awd2Header_Ffi.set_compression(this, value); return value; }
	public var flags(get, set):Int;

	inline function get_flags():Int return Awd2Header_Ffi.get_flags(this);

	inline function set_flags(value:Int):Int { Awd2Header_Ffi.set_flags(this, value); return value; }
	public var versionMajor(get, set):Int;

	inline function get_versionMajor():Int return Awd2Header_Ffi.get_versionMajor(this);

	inline function set_versionMajor(value:Int):Int { Awd2Header_Ffi.set_versionMajor(this, value); return value; }
	public var versionMinor(get, set):Int;

	inline function get_versionMinor():Int return Awd2Header_Ffi.get_versionMinor(this);

	inline function set_versionMinor(value:Int):Int { Awd2Header_Ffi.set_versionMinor(this, value); return value; }
}
