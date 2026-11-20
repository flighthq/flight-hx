package flight._hl;

private extern class MediaSessionMetadata_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_media_session_metadata_title")
	static function get_title(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_media_session_metadata_title")
	static function set_title(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_media_session_metadata_artist")
	static function get_artist(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_media_session_metadata_artist")
	static function set_artist(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_media_session_metadata_album")
	static function get_album(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_media_session_metadata_album")
	static function set_album(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract MediaSessionMetadata(hl.Bytes) {
	public var title(get, set):String;
	inline function get_title():String { var raw = MediaSessionMetadata_Ffi.get_title(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); MediaSessionMetadata_Ffi.freeString(raw); return value; }
	inline function set_title(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } MediaSessionMetadata_Ffi.set_title(this, raw); return value; }
	public var artist(get, set):String;
	inline function get_artist():String { var raw = MediaSessionMetadata_Ffi.get_artist(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); MediaSessionMetadata_Ffi.freeString(raw); return value; }
	inline function set_artist(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } MediaSessionMetadata_Ffi.set_artist(this, raw); return value; }
	public var album(get, set):String;
	inline function get_album():String { var raw = MediaSessionMetadata_Ffi.get_album(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); MediaSessionMetadata_Ffi.freeString(raw); return value; }
	inline function set_album(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } MediaSessionMetadata_Ffi.set_album(this, raw); return value; }
}
