package flight._hl;

private extern class MediaSessionArtwork_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_media_session_artwork_src")
	static function get_src(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_media_session_artwork_src")
	static function set_src(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract MediaSessionArtwork(hl.Bytes) {
	public var src(get, set):String;
	inline function get_src():String { var raw = MediaSessionArtwork_Ffi.get_src(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); MediaSessionArtwork_Ffi.freeString(raw); return value; }
	inline function set_src(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } MediaSessionArtwork_Ffi.set_src(this, raw); return value; }
}
