package flight._hl;

private extern class RiveStateMachineInput_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_rive_state_machine_input_kind")
	static function get_kind(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_rive_state_machine_input_kind")
	static function set_kind(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_rive_state_machine_input_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_rive_state_machine_input_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract RiveStateMachineInput(hl.Bytes) {
	public var kind(get, set):String;
	inline function get_kind():String { var raw = RiveStateMachineInput_Ffi.get_kind(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RiveStateMachineInput_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RiveStateMachineInput_Ffi.set_kind(this, raw); return value; }
	public var name(get, set):String;
	inline function get_name():String { var raw = RiveStateMachineInput_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RiveStateMachineInput_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RiveStateMachineInput_Ffi.set_name(this, raw); return value; }
}
