package flight._cpp;

private extern class AudioResourceUrl_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_audio_resource_url_url") static function get_url(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_audio_resource_url_url") static function set_url(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract AudioResourceUrl(cpp.Star<cpp.Void>) {
	public var url(get, set):String;
	inline function get_url():String { var raw = AudioResourceUrl_Ffi.get_url(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AudioResourceUrl_Ffi.freeString(raw); return value; }
	inline function set_url(value:String):String { var raw:cpp.ConstCharStar = cast value; AudioResourceUrl_Ffi.set_url(this, raw); return value; }
}
