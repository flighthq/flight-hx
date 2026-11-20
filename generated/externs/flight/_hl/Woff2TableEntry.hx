package flight._hl;

private extern class Woff2TableEntry_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_woff2_table_entry_tag")
	static function get_tag(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_woff2_table_entry_tag")
	static function set_tag(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Woff2TableEntry(hl.Bytes) {
	public var originalLength(get, set):Int;

	inline function get_originalLength():Int return this.getI32(24);

	inline function set_originalLength(value:Int):Int { this.setI32(24, value); return value; }
	public var tag(get, set):String;
	inline function get_tag():String { var raw = Woff2TableEntry_Ffi.get_tag(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Woff2TableEntry_Ffi.freeString(raw); return value; }
	inline function set_tag(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Woff2TableEntry_Ffi.set_tag(this, raw); return value; }
	public var transformLength(get, set):Int;

	inline function get_transformLength():Int return this.getI32(32);

	inline function set_transformLength(value:Int):Int { this.setI32(32, value); return value; }
	public var transformVersion(get, set):Int;

	inline function get_transformVersion():Int return this.getUI8(41);

	inline function set_transformVersion(value:Int):Int { this.setUI8(41, value); return value; }
	public var transformed(get, set):Bool;

	inline function get_transformed():Bool return this.getUI8(40) != 0;

	inline function set_transformed(value:Bool):Bool { this.setUI8(40, value ? 1 : 0); return value; }
}
