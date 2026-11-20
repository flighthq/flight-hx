package flight._hl;

private extern class FileEntry_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_file_entry_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_file_entry_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_file_entry_path")
	static function get_path(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_file_entry_path")
	static function set_path(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract FileEntry(hl.Bytes) {
	public var name(get, set):String;
	inline function get_name():String { var raw = FileEntry_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); FileEntry_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } FileEntry_Ffi.set_name(this, raw); return value; }
	public var path(get, set):String;
	inline function get_path():String { var raw = FileEntry_Ffi.get_path(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); FileEntry_Ffi.freeString(raw); return value; }
	inline function set_path(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } FileEntry_Ffi.set_path(this, raw); return value; }
	public var isDirectory(get, set):Bool;

	inline function get_isDirectory():Bool return this.getUI8(48) != 0;

	inline function set_isDirectory(value:Bool):Bool { this.setUI8(48, value ? 1 : 0); return value; }
}
