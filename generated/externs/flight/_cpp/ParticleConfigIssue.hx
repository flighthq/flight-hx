package flight._cpp;

private extern class ParticleConfigIssue_Ffi {
	@:native("flight_field_get_particle_config_issue_field")
	static function get_field(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_particle_config_issue_field")
	static function set_field(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_particle_config_issue_message")
	static function get_message(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_particle_config_issue_message")
	static function set_message(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
	@:native("flight_field_get_particle_config_issue_severity")
	static function get_severity(ptr:cpp.Star<cpp.Void>):flight._cpp.NativeByteBuffer;
	@:native("flight_field_set_particle_config_issue_severity")
	static function set_severity(ptr:cpp.Star<cpp.Void>, data:cpp.Star<cpp.Void>, length:Int):Void;
}

abstract ParticleConfigIssue(cpp.Star<cpp.Void>) {
	public var field(get, set):String;
	inline function get_field():String {
		final bytes = ParticleConfigIssue_Ffi.get_field(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_field(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ParticleConfigIssue_Ffi.set_field(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var message(get, set):String;
	inline function get_message():String {
		final bytes = ParticleConfigIssue_Ffi.get_message(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_message(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ParticleConfigIssue_Ffi.set_message(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

	public var severity(get, set):String;
	inline function get_severity():String {
		final bytes = ParticleConfigIssue_Ffi.get_severity(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_severity(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ParticleConfigIssue_Ffi.set_severity(this, cast cpp.Pointer.ofArray(bytes.getData()).raw, bytes.length);
		return value;
	}

}
