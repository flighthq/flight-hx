package flight._hl;

private extern class RegExpExecResult_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_reg_exp_exec_result_input")
	static function get_input(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_reg_exp_exec_result_input")
	static function set_input(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract RegExpExecResult(hl.Bytes) {
	public var index(get, set):Int;

	inline function get_index():Int return this.getI32(216);

	inline function set_index(value:Int):Int { this.setI32(216, value); return value; }
	public var input(get, set):String;
	inline function get_input():String { var raw = RegExpExecResult_Ffi.get_input(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RegExpExecResult_Ffi.freeString(raw); return value; }
	inline function set_input(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RegExpExecResult_Ffi.set_input(this, raw); return value; }
}
