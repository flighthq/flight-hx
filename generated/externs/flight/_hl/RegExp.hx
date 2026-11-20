package flight._hl;

private extern class RegExp_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_reg_exp_flags")
	static function get_flags(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_reg_exp_flags")
	static function set_flags(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_reg_exp_source")
	static function get_source(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_reg_exp_source")
	static function set_source(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract RegExp(hl.Bytes) {
	public var flags(get, set):String;
	inline function get_flags():String { var raw = RegExp_Ffi.get_flags(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RegExp_Ffi.freeString(raw); return value; }
	inline function set_flags(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RegExp_Ffi.set_flags(this, raw); return value; }
	public var lastIndex(get, set):Int;

	inline function get_lastIndex():Int return this.getI32(168);

	inline function set_lastIndex(value:Int):Int { this.setI32(168, value); return value; }
	public var source(get, set):String;
	inline function get_source():String { var raw = RegExp_Ffi.get_source(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); RegExp_Ffi.freeString(raw); return value; }
	inline function set_source(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } RegExp_Ffi.set_source(this, raw); return value; }
}
