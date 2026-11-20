package flight._hl;

private extern class Blob_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_blob_mime_type")
	static function get_mimeType(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_blob_mime_type")
	static function set_mimeType(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract Blob(hl.Bytes) {
	public var mimeType(get, set):String;
	inline function get_mimeType():String { var raw = Blob_Ffi.get_mimeType(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); Blob_Ffi.freeString(raw); return value; }
	inline function set_mimeType(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } Blob_Ffi.set_mimeType(this, raw); return value; }
	public var size(get, set):Int;

	inline function get_size():Int return this.getI32(24);

	inline function set_size(value:Int):Int { this.setI32(24, value); return value; }
}
