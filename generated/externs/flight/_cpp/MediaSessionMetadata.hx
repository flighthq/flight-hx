package flight._cpp;

private extern class MediaSessionMetadata_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_media_session_metadata_title") static function get_title(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_media_session_metadata_title") static function set_title(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_media_session_metadata_artist") static function get_artist(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_media_session_metadata_artist") static function set_artist(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_media_session_metadata_album") static function get_album(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_media_session_metadata_album") static function set_album(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract MediaSessionMetadata(cpp.Star<cpp.Void>) {
	public var title(get, set):String;
	inline function get_title():String { var raw = MediaSessionMetadata_Ffi.get_title(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); MediaSessionMetadata_Ffi.freeString(raw); return value; }
	inline function set_title(value:String):String { var raw:cpp.ConstCharStar = cast value; MediaSessionMetadata_Ffi.set_title(this, raw); return value; }
	public var artist(get, set):String;
	inline function get_artist():String { var raw = MediaSessionMetadata_Ffi.get_artist(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); MediaSessionMetadata_Ffi.freeString(raw); return value; }
	inline function set_artist(value:String):String { var raw:cpp.ConstCharStar = cast value; MediaSessionMetadata_Ffi.set_artist(this, raw); return value; }
	public var album(get, set):String;
	inline function get_album():String { var raw = MediaSessionMetadata_Ffi.get_album(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); MediaSessionMetadata_Ffi.freeString(raw); return value; }
	inline function set_album(value:String):String { var raw:cpp.ConstCharStar = cast value; MediaSessionMetadata_Ffi.set_album(this, raw); return value; }
}
