package flight._hl;

private extern class ParticleFormatWarning_Ffi {
	@:hlNative("flight", "flight_field_get_particle_format_warning_code")
	static function get_code(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_particle_format_warning_code")
	static function set_code(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
	@:hlNative("flight", "flight_field_get_particle_format_warning_message")
	static function get_message(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_particle_format_warning_message")
	static function set_message(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract ParticleFormatWarning(hl.Bytes) {
	public var code(get, set):String;
	inline function get_code():String {
		final bytes = ParticleFormatWarning_Ffi.get_code(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_code(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ParticleFormatWarning_Ffi.set_code(this, bytes.getData().bytes, bytes.length);
		return value;
	}

	public var message(get, set):String;
	inline function get_message():String {
		final bytes = ParticleFormatWarning_Ffi.get_message(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_message(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		ParticleFormatWarning_Ffi.set_message(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
