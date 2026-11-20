package flight._cpp;

private extern class ImportDiagnostic_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_import_diagnostic_kind") static function get_kind(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_import_diagnostic_kind") static function set_kind(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_import_diagnostic_origin") static function get_origin(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_import_diagnostic_origin") static function set_origin(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ImportDiagnostic(cpp.Star<cpp.Void>) {
	public var kind(get, set):String;
	inline function get_kind():String { var raw = ImportDiagnostic_Ffi.get_kind(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ImportDiagnostic_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:cpp.ConstCharStar = cast value; ImportDiagnostic_Ffi.set_kind(this, raw); return value; }
	public var origin(get, set):String;
	inline function get_origin():String { var raw = ImportDiagnostic_Ffi.get_origin(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ImportDiagnostic_Ffi.freeString(raw); return value; }
	inline function set_origin(value:String):String { var raw:cpp.ConstCharStar = cast value; ImportDiagnostic_Ffi.set_origin(this, raw); return value; }
}
