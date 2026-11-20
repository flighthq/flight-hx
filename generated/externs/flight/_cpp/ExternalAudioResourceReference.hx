package flight._cpp;

private extern class ExternalAudioResourceReference_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_external_audio_resource_reference_uri") static function get_uri(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_external_audio_resource_reference_uri") static function set_uri(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ExternalAudioResourceReference(cpp.Star<cpp.Void>) {
	public var uri(get, set):String;
	inline function get_uri():String { var raw = ExternalAudioResourceReference_Ffi.get_uri(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ExternalAudioResourceReference_Ffi.freeString(raw); return value; }
	inline function set_uri(value:String):String { var raw:cpp.ConstCharStar = cast value; ExternalAudioResourceReference_Ffi.set_uri(this, raw); return value; }
}
