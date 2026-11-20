package flight._cpp;

private extern class WoffChecksumMismatch_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_woff_checksum_mismatch_stored") static function get_stored(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_woff_checksum_mismatch_stored") static function set_stored(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_woff_checksum_mismatch_computed") static function get_computed(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_woff_checksum_mismatch_computed") static function set_computed(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_field_get_woff_checksum_mismatch_tag") static function get_tag(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_woff_checksum_mismatch_tag") static function set_tag(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract WoffChecksumMismatch(cpp.Star<cpp.Void>) {
	public var stored(get, set):Int;

	inline function get_stored():Int return WoffChecksumMismatch_Ffi.get_stored(this);

	inline function set_stored(value:Int):Int { WoffChecksumMismatch_Ffi.set_stored(this, value); return value; }
	public var computed(get, set):Int;

	inline function get_computed():Int return WoffChecksumMismatch_Ffi.get_computed(this);

	inline function set_computed(value:Int):Int { WoffChecksumMismatch_Ffi.set_computed(this, value); return value; }
	public var tag(get, set):String;
	inline function get_tag():String { var raw = WoffChecksumMismatch_Ffi.get_tag(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); WoffChecksumMismatch_Ffi.freeString(raw); return value; }
	inline function set_tag(value:String):String { var raw:cpp.ConstCharStar = cast value; WoffChecksumMismatch_Ffi.set_tag(this, raw); return value; }
}
