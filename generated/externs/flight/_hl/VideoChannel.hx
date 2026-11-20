package flight._hl;

private extern class VideoChannel_Ffi {
	@:hlNative("flight", "flight_get_video_channel_gain")
	static function get_gain(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_get_video_channel_length")
	static function get_length(ptr:hl.Bytes):Single;
	@:hlNative("flight", "flight_set_video_channel_length")
	static function set_length(ptr:hl.Bytes, value:Single):Single;
	@:hlNative("flight", "flight_get_video_channel_loops")
	static function get_loops(ptr:hl.Bytes):Int;
	@:hlNative("flight", "flight_set_video_channel_loops")
	static function set_loops(ptr:hl.Bytes, value:Int):Int;
	@:hlNative("flight", "flight_get_video_channel_muted")
	static function get_muted(ptr:hl.Bytes):Bool;
	@:hlNative("flight", "flight_get_video_channel_playback_rate")
	static function get_playbackRate(ptr:hl.Bytes):Single;
}

abstract VideoChannel(hl.Bytes) {
	public var gain(get, never):Single;

	inline function get_gain():Single return VideoChannel_Ffi.get_gain(this);

	public var length(get, set):Single;

	inline function get_length():Single return VideoChannel_Ffi.get_length(this);

	inline function set_length(value:Single):Single { VideoChannel_Ffi.set_length(this, value); return value; }
	public var loops(get, set):Int;

	inline function get_loops():Int return VideoChannel_Ffi.get_loops(this);

	inline function set_loops(value:Int):Int { VideoChannel_Ffi.set_loops(this, value); return value; }
	public var muted(get, never):Bool;

	inline function get_muted():Bool return VideoChannel_Ffi.get_muted(this);

	public var playbackRate(get, never):Single;

	inline function get_playbackRate():Single return VideoChannel_Ffi.get_playbackRate(this);

}
