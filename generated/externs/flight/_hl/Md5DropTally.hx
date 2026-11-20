package flight._hl;

private extern class Md5DropTally_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_md5_drop_tally_kind")
	static function get_kind(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_md5_drop_tally_kind")
	static function set_kind(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Md5DropTally(hl.Bytes) {
	public var count(get, set):Int;

	inline function get_count():Int return this.getI32(72);

	inline function set_count(value:Int):Int { this.setI32(72, value); return value; }
	public var kind(get, set):String;
	inline function get_kind():String { var raw = Md5DropTally_Ffi.get_kind(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Md5DropTally_Ffi.freeString(raw); return value; }
	inline function set_kind(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Md5DropTally_Ffi.set_kind(this, raw); return value; }
}
