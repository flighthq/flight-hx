package flight._cpp;

private extern class ParticleSerializeResult_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_particle_serialize_result_text") static function get_text(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_particle_serialize_result_text") static function set_text(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ParticleSerializeResult(cpp.Star<cpp.Void>) {
	public var text(get, set):String;
	inline function get_text():String { var raw = ParticleSerializeResult_Ffi.get_text(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ParticleSerializeResult_Ffi.freeString(raw); return value; }
	inline function set_text(value:String):String { var raw:cpp.ConstCharStar = cast value; ParticleSerializeResult_Ffi.set_text(this, raw); return value; }
}
