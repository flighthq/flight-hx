package flight._cpp;

private extern class MediaSessionArtwork_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_media_session_artwork_src") static function get_src(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_media_session_artwork_src") static function set_src(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract MediaSessionArtwork(cpp.Star<cpp.Void>) {
	public var src(get, set):String;
	inline function get_src():String { var raw = MediaSessionArtwork_Ffi.get_src(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); MediaSessionArtwork_Ffi.freeString(raw); return value; }
	inline function set_src(value:String):String { var raw:cpp.ConstCharStar = cast value; MediaSessionArtwork_Ffi.set_src(this, raw); return value; }
}
