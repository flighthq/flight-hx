package flight._cpp;

private extern class RequirementCatalogEntry_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_requirement_catalog_entry_backend") static function get_backend(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_requirement_catalog_entry_backend") static function set_backend(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_requirement_catalog_entry_implementation_import") static function get_implementationImport(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_requirement_catalog_entry_implementation_import") static function set_implementationImport(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_requirement_catalog_entry_implementation_symbol") static function get_implementationSymbol(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_requirement_catalog_entry_implementation_symbol") static function set_implementationSymbol(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract RequirementCatalogEntry(cpp.Star<cpp.Void>) {
	public var backend(get, set):String;
	inline function get_backend():String { var raw = RequirementCatalogEntry_Ffi.get_backend(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RequirementCatalogEntry_Ffi.freeString(raw); return value; }
	inline function set_backend(value:String):String { var raw:cpp.ConstCharStar = cast value; RequirementCatalogEntry_Ffi.set_backend(this, raw); return value; }
	public var implementationImport(get, set):String;
	inline function get_implementationImport():String { var raw = RequirementCatalogEntry_Ffi.get_implementationImport(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RequirementCatalogEntry_Ffi.freeString(raw); return value; }
	inline function set_implementationImport(value:String):String { var raw:cpp.ConstCharStar = cast value; RequirementCatalogEntry_Ffi.set_implementationImport(this, raw); return value; }
	public var implementationSymbol(get, set):String;
	inline function get_implementationSymbol():String { var raw = RequirementCatalogEntry_Ffi.get_implementationSymbol(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); RequirementCatalogEntry_Ffi.freeString(raw); return value; }
	inline function set_implementationSymbol(value:String):String { var raw:cpp.ConstCharStar = cast value; RequirementCatalogEntry_Ffi.set_implementationSymbol(this, raw); return value; }
}
