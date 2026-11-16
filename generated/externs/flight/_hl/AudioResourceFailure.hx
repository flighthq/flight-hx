package flight._hl;

private extern class AudioResourceFailure_Ffi {
	@:hlNative("flight", "flight_field_get_audio_resource_failure_message")
	static function get_message(ptr:hl.Bytes):flight._hl.NativeByteBuffer;
	@:hlNative("flight", "flight_field_set_audio_resource_failure_message")
	static function set_message(ptr:hl.Bytes, data:hl.Bytes, length:Int):Void;
}

abstract AudioResourceFailure(hl.Bytes) {
	public var message(get, set):String;
	inline function get_message():String {
		final bytes = AudioResourceFailure_Ffi.get_message(this);
		try {
			final value = bytes.toBytes().toString();
			bytes.dispose();
			return value;
		} catch (error:Dynamic) { bytes.dispose(); throw error; }
	}
	inline function set_message(value:String):String {
		final bytes = haxe.io.Bytes.ofString(value);
		AudioResourceFailure_Ffi.set_message(this, bytes.getData().bytes, bytes.length);
		return value;
	}

}
