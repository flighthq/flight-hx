package flight._hl;

private extern class ShareFile_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_share_file_name")
	static function get_name(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_share_file_name")
	static function set_name(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_share_file_mime_type")
	static function get_mimeType(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_share_file_mime_type")
	static function set_mimeType(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_share_file_data_url")
	static function get_dataUrl(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_share_file_data_url")
	static function set_dataUrl(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ShareFile(hl.Bytes) {
	public var name(get, set):String;
	inline function get_name():String { var raw = ShareFile_Ffi.get_name(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ShareFile_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ShareFile_Ffi.set_name(this, raw); return value; }
	public var mimeType(get, set):String;
	inline function get_mimeType():String { var raw = ShareFile_Ffi.get_mimeType(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ShareFile_Ffi.freeString(raw); return value; }
	inline function set_mimeType(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ShareFile_Ffi.set_mimeType(this, raw); return value; }
	public var dataUrl(get, set):String;
	inline function get_dataUrl():String { var raw = ShareFile_Ffi.get_dataUrl(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ShareFile_Ffi.freeString(raw); return value; }
	inline function set_dataUrl(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ShareFile_Ffi.set_dataUrl(this, raw); return value; }
}
