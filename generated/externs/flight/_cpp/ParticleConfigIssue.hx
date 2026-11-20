package flight._cpp;

private extern class ParticleConfigIssue_Ffi {
	@:native("flight_free_string") static function freeString(value:cpp.RawPointer<cpp.Char>):Void;
	@:native("flight_field_get_particle_config_issue_field") static function get_field(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_particle_config_issue_field") static function set_field(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_particle_config_issue_message") static function get_message(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_particle_config_issue_message") static function set_message(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
	@:native("flight_field_get_particle_config_issue_severity") static function get_severity(ptr:cpp.Star<cpp.Void>):cpp.RawPointer<cpp.Char>;
	@:native("flight_field_set_particle_config_issue_severity") static function set_severity(ptr:cpp.Star<cpp.Void>, value:cpp.ConstCharStar):Void;
}

abstract ParticleConfigIssue(cpp.Star<cpp.Void>) {
	public var field(get, set):String;
	inline function get_field():String { var raw = ParticleConfigIssue_Ffi.get_field(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ParticleConfigIssue_Ffi.freeString(raw); return value; }
	inline function set_field(value:String):String { var raw:cpp.ConstCharStar = cast value; ParticleConfigIssue_Ffi.set_field(this, raw); return value; }
	public var message(get, set):String;
	inline function get_message():String { var raw = ParticleConfigIssue_Ffi.get_message(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ParticleConfigIssue_Ffi.freeString(raw); return value; }
	inline function set_message(value:String):String { var raw:cpp.ConstCharStar = cast value; ParticleConfigIssue_Ffi.set_message(this, raw); return value; }
	public var severity(get, set):String;
	inline function get_severity():String { var raw = ParticleConfigIssue_Ffi.get_severity(this); if (raw == null) return null; var value:String = (cast raw : cpp.ConstCharStar); ParticleConfigIssue_Ffi.freeString(raw); return value; }
	inline function set_severity(value:String):String { var raw:cpp.ConstCharStar = cast value; ParticleConfigIssue_Ffi.set_severity(this, raw); return value; }
}
