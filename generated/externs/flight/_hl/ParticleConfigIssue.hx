package flight._hl;

private extern class ParticleConfigIssue_Ffi {
	@:hlNative("flight", "flight_field_get_particle_config_issue_field")
	static function get_field(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_particle_config_issue_field")
	static function set_field(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_particle_config_issue_message")
	static function get_message(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_particle_config_issue_message")
	static function set_message(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_particle_config_issue_severity")
	static function get_severity(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_particle_config_issue_severity")
	static function set_severity(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ParticleConfigIssue(hl.Bytes) {
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
		ParticleConfigIssue_Ffi.set_field(this, bytes.getData().bytes, bytes.length);
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
		ParticleConfigIssue_Ffi.set_message(this, bytes.getData().bytes, bytes.length);
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
		ParticleConfigIssue_Ffi.set_severity(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
