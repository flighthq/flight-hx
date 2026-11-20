package flight._hl;

private extern class HostCapabilityGroupExplanation_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_host_capability_group_explanation_group")
	static function get_group(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_host_capability_group_explanation_group")
	static function set_group(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract HostCapabilityGroupExplanation(hl.Bytes) {
	public var group(get, set):String;
	inline function get_group():String { var raw = HostCapabilityGroupExplanation_Ffi.get_group(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); HostCapabilityGroupExplanation_Ffi.freeString(raw); return value; }
	inline function set_group(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } HostCapabilityGroupExplanation_Ffi.set_group(this, raw); return value; }
}
