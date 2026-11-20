package flight._hl;

private extern class RequirementDisposition_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_requirement_disposition_backend")
	static function get_backend(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_requirement_disposition_backend")
	static function set_backend(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_requirement_disposition_reason")
	static function get_reason(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_requirement_disposition_reason")
	static function set_reason(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract RequirementDisposition(hl.Bytes) {
	public var backend(get, set):String;
	inline function get_backend():String { var raw = RequirementDisposition_Ffi.get_backend(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RequirementDisposition_Ffi.freeString(raw); return value; }
	inline function set_backend(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RequirementDisposition_Ffi.set_backend(this, raw); return value; }
	public var reason(get, set):String;
	inline function get_reason():String { var raw = RequirementDisposition_Ffi.get_reason(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RequirementDisposition_Ffi.freeString(raw); return value; }
	inline function set_reason(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RequirementDisposition_Ffi.set_reason(this, raw); return value; }
}
