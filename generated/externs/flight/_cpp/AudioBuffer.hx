package flight._cpp;

private extern class AudioBuffer_Ffi {
	@:native("flight_get_audio_buffer_sample_rate") static function get_sampleRate(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_audio_buffer_sample_rate") static function set_sampleRate(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_audio_buffer_length") static function get_length(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_audio_buffer_length") static function set_length(ptr:cpp.Star<cpp.Void>, value:Int):Int;
}

abstract AudioBuffer(cpp.Star<cpp.Void>) {
	public var sampleRate(get, set):Single;

	inline function get_sampleRate():Single return AudioBuffer_Ffi.get_sampleRate(this);

	inline function set_sampleRate(value:Single):Single return AudioBuffer_Ffi.set_sampleRate(this, value);
	public var length(get, set):Int;

	inline function get_length():Int return AudioBuffer_Ffi.get_length(this);

	inline function set_length(value:Int):Int return AudioBuffer_Ffi.set_length(this, value);
}
