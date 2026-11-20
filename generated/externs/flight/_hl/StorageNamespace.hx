package flight._hl;

private extern class StorageNamespace_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_storage_namespace_prefix")
	static function get_prefix(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_storage_namespace_prefix")
	static function set_prefix(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract StorageNamespace(hl.Bytes) {
	public var prefix(get, set):String;
	inline function get_prefix():String { var raw = StorageNamespace_Ffi.get_prefix(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); StorageNamespace_Ffi.freeString(raw); return value; }
	inline function set_prefix(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } StorageNamespace_Ffi.set_prefix(this, raw); return value; }
}
