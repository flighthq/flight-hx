package flight._cpp;

private extern class RequirementBackend_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_requirement_backend_infrastructure_import") static function get_infrastructureImport(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_requirement_backend_infrastructure_import") static function set_infrastructureImport(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_requirement_backend_infrastructure_symbol") static function get_infrastructureSymbol(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_requirement_backend_infrastructure_symbol") static function set_infrastructureSymbol(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_requirement_backend_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_requirement_backend_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract RequirementBackend(cpp.Star<cpp.Void>) {
	public var infrastructureImport(get, set):String;
	inline function get_infrastructureImport():String { var raw = RequirementBackend_Ffi.get_infrastructureImport(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RequirementBackend_Ffi.freeString(raw); return value; }
	inline function set_infrastructureImport(value:String):String { var raw:cpp.ConstCharStar = cast value; RequirementBackend_Ffi.set_infrastructureImport(this, raw); return value; }
	public var infrastructureSymbol(get, set):String;
	inline function get_infrastructureSymbol():String { var raw = RequirementBackend_Ffi.get_infrastructureSymbol(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RequirementBackend_Ffi.freeString(raw); return value; }
	inline function set_infrastructureSymbol(value:String):String { var raw:cpp.ConstCharStar = cast value; RequirementBackend_Ffi.set_infrastructureSymbol(this, raw); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = RequirementBackend_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RequirementBackend_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; RequirementBackend_Ffi.set_name(this, raw); return value; }
}
