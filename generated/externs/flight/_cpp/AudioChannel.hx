package flight._cpp;

private extern class AudioChannel_Ffi {
	@:native("flight_get_audio_channel_current_time") static function get_currentTime(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_audio_channel_current_time") static function set_currentTime(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_audio_channel_gain") static function get_gain(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_audio_channel_gain") static function set_gain(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_audio_channel_length") static function get_length(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_audio_channel_length") static function set_length(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_audio_channel_loop_end") static function get_loopEnd(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_audio_channel_loop_end") static function set_loopEnd(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_audio_channel_loops") static function get_loops(ptr:cpp.Star<cpp.Void>):Int;
	@:native("flight_set_audio_channel_loops") static function set_loops(ptr:cpp.Star<cpp.Void>, value:Int):Int;
	@:native("flight_get_audio_channel_loop_start") static function get_loopStart(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_audio_channel_loop_start") static function set_loopStart(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_audio_channel_muted") static function get_muted(ptr:cpp.Star<cpp.Void>):Bool;
	@:native("flight_set_audio_channel_muted") static function set_muted(ptr:cpp.Star<cpp.Void>, value:Bool):Bool;
	@:native("flight_get_audio_channel_pan") static function get_pan(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_audio_channel_pan") static function set_pan(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_audio_channel_playback_rate") static function get_playbackRate(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_audio_channel_playback_rate") static function set_playbackRate(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract AudioChannel(cpp.Star<cpp.Void>) {
	public var currentTime(get, set):Single;

	inline function get_currentTime():Single return AudioChannel_Ffi.get_currentTime(this);

	inline function set_currentTime(value:Single):Single { AudioChannel_Ffi.set_currentTime(this, value); return value; }
	public var gain(get, set):Single;

	inline function get_gain():Single return AudioChannel_Ffi.get_gain(this);

	inline function set_gain(value:Single):Single { AudioChannel_Ffi.set_gain(this, value); return value; }
	public var length(get, set):Single;

	inline function get_length():Single return AudioChannel_Ffi.get_length(this);

	inline function set_length(value:Single):Single { AudioChannel_Ffi.set_length(this, value); return value; }
	public var loopEnd(get, set):Single;

	inline function get_loopEnd():Single return AudioChannel_Ffi.get_loopEnd(this);

	inline function set_loopEnd(value:Single):Single { AudioChannel_Ffi.set_loopEnd(this, value); return value; }
	public var loops(get, set):Int;

	inline function get_loops():Int return AudioChannel_Ffi.get_loops(this);

	inline function set_loops(value:Int):Int { AudioChannel_Ffi.set_loops(this, value); return value; }
	public var loopStart(get, set):Single;

	inline function get_loopStart():Single return AudioChannel_Ffi.get_loopStart(this);

	inline function set_loopStart(value:Single):Single { AudioChannel_Ffi.set_loopStart(this, value); return value; }
	public var muted(get, set):Bool;

	inline function get_muted():Bool return AudioChannel_Ffi.get_muted(this);

	inline function set_muted(value:Bool):Bool { AudioChannel_Ffi.set_muted(this, value); return value; }
	public var pan(get, set):Single;

	inline function get_pan():Single return AudioChannel_Ffi.get_pan(this);

	inline function set_pan(value:Single):Single { AudioChannel_Ffi.set_pan(this, value); return value; }
	public var playbackRate(get, set):Single;

	inline function get_playbackRate():Single return AudioChannel_Ffi.get_playbackRate(this);

	inline function set_playbackRate(value:Single):Single { AudioChannel_Ffi.set_playbackRate(this, value); return value; }
}
