package flight._hl;

private extern class RequirementCatalogEntry_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_requirement_catalog_entry_backend")
	static function get_backend(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_requirement_catalog_entry_backend")
	static function set_backend(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_requirement_catalog_entry_implementation_import")
	static function get_implementationImport(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_requirement_catalog_entry_implementation_import")
	static function set_implementationImport(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_requirement_catalog_entry_implementation_symbol")
	static function get_implementationSymbol(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_requirement_catalog_entry_implementation_symbol")
	static function set_implementationSymbol(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract RequirementCatalogEntry(hl.Bytes) {
	public var backend(get, set):String;
	inline function get_backend():String { var raw = RequirementCatalogEntry_Ffi.get_backend(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RequirementCatalogEntry_Ffi.freeString(raw); return value; }
	inline function set_backend(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RequirementCatalogEntry_Ffi.set_backend(this, raw); return value; }
	public var implementationImport(get, set):String;
	inline function get_implementationImport():String { var raw = RequirementCatalogEntry_Ffi.get_implementationImport(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RequirementCatalogEntry_Ffi.freeString(raw); return value; }
	inline function set_implementationImport(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RequirementCatalogEntry_Ffi.set_implementationImport(this, raw); return value; }
	public var implementationSymbol(get, set):String;
	inline function get_implementationSymbol():String { var raw = RequirementCatalogEntry_Ffi.get_implementationSymbol(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RequirementCatalogEntry_Ffi.freeString(raw); return value; }
	inline function set_implementationSymbol(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RequirementCatalogEntry_Ffi.set_implementationSymbol(this, raw); return value; }
}
