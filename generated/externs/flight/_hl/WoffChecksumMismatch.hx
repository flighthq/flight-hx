package flight._hl;

private extern class WoffChecksumMismatch_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_woff_checksum_mismatch_tag")
	static function get_tag(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_woff_checksum_mismatch_tag")
	static function set_tag(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract WoffChecksumMismatch(hl.Bytes) {
	public var stored(get, set):Int;

	inline function get_stored():Int return this.getI32(24);

	inline function set_stored(value:Int):Int { this.setI32(24, value); return value; }
	public var computed(get, set):Int;

	inline function get_computed():Int return this.getI32(28);

	inline function set_computed(value:Int):Int { this.setI32(28, value); return value; }
	public var tag(get, set):String;
	inline function get_tag():String { var raw = WoffChecksumMismatch_Ffi.get_tag(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); WoffChecksumMismatch_Ffi.freeString(raw); return value; }
	inline function set_tag(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } WoffChecksumMismatch_Ffi.set_tag(this, raw); return value; }
}
