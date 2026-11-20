package flight._hl;

private extern class AudioBuffer_Ffi {
	@:hlNative("flight", "flight_get_audio_buffer_sample_rate")
	static function get_sampleRate(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_audio_buffer_sample_rate")
	static function set_sampleRate(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_audio_buffer_length")
	static function get_length(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_audio_buffer_length")
	static function set_length(ptr:hl.Bytes, value:Int):Int;
}

abstract AudioBuffer(hl.Bytes) {
	public var sampleRate(get, set):Single;

	inline function get_sampleRate():Single return AudioBuffer_Ffi.get_sampleRate(this);

	inline function set_sampleRate(value:Single):Single { AudioBuffer_Ffi.set_sampleRate(this, value); return value; }
	public var length(get, set):Int;

	inline function get_length():Int return AudioBuffer_Ffi.get_length(this);

	inline function set_length(value:Int):Int { AudioBuffer_Ffi.set_length(this, value); return value; }
}
