package flight._hl;

private extern class RequirementBackend_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_requirement_backend_infrastructure_import")
	static function get_infrastructureImport(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_requirement_backend_infrastructure_import")
	static function set_infrastructureImport(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_requirement_backend_infrastructure_symbol")
	static function get_infrastructureSymbol(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_requirement_backend_infrastructure_symbol")
	static function set_infrastructureSymbol(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_requirement_backend_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_requirement_backend_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract RequirementBackend(hl.Bytes) {
	public var infrastructureImport(get, set):String;
	inline function get_infrastructureImport():String { var raw = RequirementBackend_Ffi.get_infrastructureImport(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RequirementBackend_Ffi.freeString(raw); return value; }
	inline function set_infrastructureImport(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RequirementBackend_Ffi.set_infrastructureImport(this, raw); return value; }
	public var infrastructureSymbol(get, set):String;
	inline function get_infrastructureSymbol():String { var raw = RequirementBackend_Ffi.get_infrastructureSymbol(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RequirementBackend_Ffi.freeString(raw); return value; }
	inline function set_infrastructureSymbol(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RequirementBackend_Ffi.set_infrastructureSymbol(this, raw); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = RequirementBackend_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RequirementBackend_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RequirementBackend_Ffi.set_name(this, raw); return value; }
}
