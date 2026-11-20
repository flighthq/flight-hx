package flight._hl;

private extern class HostCapabilityExplanation_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_host_capability_explanation_capability")
	static function get_capability(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_host_capability_explanation_capability")
	static function set_capability(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_host_capability_explanation_group")
	static function get_group(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_host_capability_explanation_group")
	static function set_group(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_host_capability_explanation_message")
	static function get_message(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_host_capability_explanation_message")
	static function set_message(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_host_capability_explanation_slot")
	static function get_slot(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_host_capability_explanation_slot")
	static function set_slot(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract HostCapabilityExplanation(hl.Bytes) {
	public var capability(get, set):String;
	inline function get_capability():String { var raw = HostCapabilityExplanation_Ffi.get_capability(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); HostCapabilityExplanation_Ffi.freeString(raw); return value; }
	inline function set_capability(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } HostCapabilityExplanation_Ffi.set_capability(this, raw); return value; }
	public var group(get, set):String;
	inline function get_group():String { var raw = HostCapabilityExplanation_Ffi.get_group(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); HostCapabilityExplanation_Ffi.freeString(raw); return value; }
	inline function set_group(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } HostCapabilityExplanation_Ffi.set_group(this, raw); return value; }
	public var isPresent(get, set):Bool;

	inline function get_isPresent():Bool return this.getUI8(120) != 0;

	inline function set_isPresent(value:Bool):Bool { this.setUI8(120, value ? 1 : 0); return value; }
	public var message(get, set):String;
	inline function get_message():String { var raw = HostCapabilityExplanation_Ffi.get_message(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); HostCapabilityExplanation_Ffi.freeString(raw); return value; }
	inline function set_message(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } HostCapabilityExplanation_Ffi.set_message(this, raw); return value; }
	public var slot(get, set):String;
	inline function get_slot():String { var raw = HostCapabilityExplanation_Ffi.get_slot(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); HostCapabilityExplanation_Ffi.freeString(raw); return value; }
	inline function set_slot(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } HostCapabilityExplanation_Ffi.set_slot(this, raw); return value; }
}
