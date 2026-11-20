package flight._hl;

private extern class ParticleConfigIssue_Ffi {
	@:hlNative("flight", "flight_free_string")
	static function freeString(value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_particle_config_issue_field")
	static function get_field(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_particle_config_issue_field")
	static function set_field(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_particle_config_issue_message")
	static function get_message(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_particle_config_issue_message")
	static function set_message(ptr:hl.Bytes, value:hl.Bytes):Void;
	@:hlNative("flight", "flight_field_get_particle_config_issue_severity")
	static function get_severity(ptr:hl.Bytes):hl.Bytes;
	@:hlNative("flight", "flight_field_set_particle_config_issue_severity")
	static function set_severity(ptr:hl.Bytes, value:hl.Bytes):Void;
}

abstract ParticleConfigIssue(hl.Bytes) {
	public var field(get, set):String;
	inline function get_field():String { var raw = ParticleConfigIssue_Ffi.get_field(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ParticleConfigIssue_Ffi.freeString(raw); return value; }
	inline function set_field(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ParticleConfigIssue_Ffi.set_field(this, raw); return value; }
	public var message(get, set):String;
	inline function get_message():String { var raw = ParticleConfigIssue_Ffi.get_message(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ParticleConfigIssue_Ffi.freeString(raw); return value; }
	inline function set_message(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ParticleConfigIssue_Ffi.set_message(this, raw); return value; }
	public var severity(get, set):String;
	inline function get_severity():String { var raw = ParticleConfigIssue_Ffi.get_severity(this); if (raw == null) return null; var value:String = @:privateAccess String.fromUTF8(raw); ParticleConfigIssue_Ffi.freeString(raw); return value; }
	inline function set_severity(value:String):String { var raw:hl.Bytes = null; if (value != null) { var bytes = haxe.io.Bytes.ofString(value); raw = new hl.Bytes(bytes.length + 1); raw.blit(0, bytes.getData(), 0, bytes.length); raw.setUI8(bytes.length, 0); } ParticleConfigIssue_Ffi.set_severity(this, raw); return value; }
}
