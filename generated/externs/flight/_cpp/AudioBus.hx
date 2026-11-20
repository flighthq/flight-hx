package flight._cpp;

private extern class AudioBus_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_get_audio_bus_gain") static function get_gain(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_get_audio_bus_muted") static function get_muted(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_field_get_audio_bus_name") static function get_name(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_audio_bus_name") static function set_name(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_get_audio_bus_pan") static function get_pan(ptr:cpp.Star<cpp.Void>):Single;
}

abstract AudioBus(cpp.Star<cpp.Void>) {
	public var gain(get, never):Single;

	inline function get_gain():Single return AudioBus_Ffi.get_gain(this);
	public var muted(get, never):Bool;

	inline function get_muted():Bool return AudioBus_Ffi.get_muted(this);
	public var name(get, set):String;
	inline function get_name():String { var raw = AudioBus_Ffi.get_name(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); AudioBus_Ffi.freeString(raw); return value; }
	inline function set_name(value:String):String { var raw:cpp.ConstCharStar = cast value; AudioBus_Ffi.set_name(this, raw); return value; }
	public var pan(get, never):Single;

	inline function get_pan():Single return AudioBus_Ffi.get_pan(this);
}
