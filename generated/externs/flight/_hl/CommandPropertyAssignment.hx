package flight._hl;

private extern class CommandPropertyAssignment_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_command_property_assignment_property")
	static function get_property(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_command_property_assignment_property")
	static function set_property(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract CommandPropertyAssignment(hl.Bytes) {
	public var property(get, set):String;
	inline function get_property():String { var raw = CommandPropertyAssignment_Ffi.get_property(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); CommandPropertyAssignment_Ffi.freeString(raw); return value; }
	inline function set_property(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } CommandPropertyAssignment_Ffi.set_property(this, raw); return value; }
}
