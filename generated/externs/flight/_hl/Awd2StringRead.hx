package flight._hl;

private extern class Awd2StringRead_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_awd2_string_read_value")
	static function get_value(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_awd2_string_read_value")
	static function set_value(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Awd2StringRead(hl.Bytes) {
	public var end(get, set):Int;

	inline function get_end():Int return this.getI32(24);

	inline function set_end(value:Int):Int { this.setI32(24, value); return value; }
	public var value(get, set):String;
	inline function get_value():String { var raw = Awd2StringRead_Ffi.get_value(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Awd2StringRead_Ffi.freeString(raw); return value; }
	inline function set_value(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Awd2StringRead_Ffi.set_value(this, raw); return value; }
}
