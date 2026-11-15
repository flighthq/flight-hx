package flight._js;

@:jsRequire("flight")
private extern class AudioBuffer_Ffi {
	@:native("flight_get_audio_buffer_sample_rate") static function get_sampleRate(ptr:Dynamic):Float;
	@:native("flight_set_audio_buffer_sample_rate") static function set_sampleRate(ptr:Dynamic, value:Float):Float;
	@:native("flight_get_audio_buffer_length") static function get_length(ptr:Dynamic):Int;
	@:native("flight_set_audio_buffer_length") static function set_length(ptr:Dynamic, value:Int):Int;
}

abstract AudioBuffer(Dynamic) {
	public var sampleRate(get, set):Float;

	inline function get_sampleRate():Float return AudioBuffer_Ffi.get_sampleRate(this);

	inline function set_sampleRate(value:Float):Float return AudioBuffer_Ffi.set_sampleRate(this, value);
	public var length(get, set):Int;

	inline function get_length():Int return AudioBuffer_Ffi.get_length(this);

	inline function set_length(value:Int):Int return AudioBuffer_Ffi.set_length(this, value);
}
