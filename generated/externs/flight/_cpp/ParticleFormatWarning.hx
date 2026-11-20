package flight._cpp;

private extern class ParticleFormatWarning_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_particle_format_warning_code") static function get_code(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_particle_format_warning_code") static function set_code(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_particle_format_warning_message") static function get_message(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_particle_format_warning_message") static function set_message(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ParticleFormatWarning(cpp.Star<cpp.Void>) {
	public var code(get, set):String;
	inline function get_code():String { var raw = ParticleFormatWarning_Ffi.get_code(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ParticleFormatWarning_Ffi.freeString(raw); return value; }
	inline function set_code(value:String):String { var raw:cpp.ConstCharStar = cast value; ParticleFormatWarning_Ffi.set_code(this, raw); return value; }
	public var message(get, set):String;
	inline function get_message():String { var raw = ParticleFormatWarning_Ffi.get_message(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ParticleFormatWarning_Ffi.freeString(raw); return value; }
	inline function set_message(value:String):String { var raw:cpp.ConstCharStar = cast value; ParticleFormatWarning_Ffi.set_message(this, raw); return value; }
}
