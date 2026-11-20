package flight._hl;

private extern class BackendOperationExplanation_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_backend_operation_explanation_operation")
	static function get_operation(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_backend_operation_explanation_operation")
	static function set_operation(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract BackendOperationExplanation(hl.Bytes) {
	public var implemented(get, set):Bool;

	inline function get_implemented():Bool return this.getUI8(28) != 0;

	inline function set_implemented(value:Bool):Bool { this.setUI8(28, value ? 1 : 0); return value; }
	public var operation(get, set):String;
	inline function get_operation():String { var raw = BackendOperationExplanation_Ffi.get_operation(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); BackendOperationExplanation_Ffi.freeString(raw); return value; }
	inline function set_operation(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } BackendOperationExplanation_Ffi.set_operation(this, raw); return value; }
}
