package flight._hl;

private extern class Skeleton3DValidationDiagnostic_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_skeleton3_dvalidation_diagnostic_message")
	static function get_message(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_skeleton3_dvalidation_diagnostic_message")
	static function set_message(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Skeleton3DValidationDiagnostic(hl.Bytes) {
	public var jointCount(get, set):Int;

	inline function get_jointCount():Int return this.getI32(24);

	inline function set_jointCount(value:Int):Int { this.setI32(24, value); return value; }
	public var inverseBindMatricesLength(get, set):Int;

	inline function get_inverseBindMatricesLength():Int return this.getI32(32);

	inline function set_inverseBindMatricesLength(value:Int):Int { this.setI32(32, value); return value; }
	public var expectedInverseBindMatricesLength(get, set):Int;

	inline function get_expectedInverseBindMatricesLength():Int return this.getI32(40);

	inline function set_expectedInverseBindMatricesLength(value:Int):Int { this.setI32(40, value); return value; }
	public var message(get, set):String;
	inline function get_message():String { var raw = Skeleton3DValidationDiagnostic_Ffi.get_message(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Skeleton3DValidationDiagnostic_Ffi.freeString(raw); return value; }
	inline function set_message(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Skeleton3DValidationDiagnostic_Ffi.set_message(this, raw); return value; }
}
