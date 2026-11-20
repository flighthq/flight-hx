package flight._cpp;

private extern class MediaSessionPositionState_Ffi {
	@:native("flight_get_media_session_position_state_duration") static function get_duration(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_media_session_position_state_duration") static function set_duration(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_media_session_position_state_playback_rate") static function get_playbackRate(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_media_session_position_state_playback_rate") static function set_playbackRate(ptr:cpp.Star<cpp.Void>, value:Single):Single;
	@:native("flight_get_media_session_position_state_position") static function get_position(ptr:cpp.Star<cpp.Void>):Single;
	@:native("flight_set_media_session_position_state_position") static function set_position(ptr:cpp.Star<cpp.Void>, value:Single):Single;
}

abstract MediaSessionPositionState(cpp.Star<cpp.Void>) {
	public var duration(get, set):Single;

	inline function get_duration():Single return MediaSessionPositionState_Ffi.get_duration(this);

	inline function set_duration(value:Single):Single { MediaSessionPositionState_Ffi.set_duration(this, value); return value; }
	public var playbackRate(get, set):Single;

	inline function get_playbackRate():Single return MediaSessionPositionState_Ffi.get_playbackRate(this);

	inline function set_playbackRate(value:Single):Single { MediaSessionPositionState_Ffi.set_playbackRate(this, value); return value; }
	public var position(get, set):Single;

	inline function get_position():Single return MediaSessionPositionState_Ffi.get_position(this);

	inline function set_position(value:Single):Single { MediaSessionPositionState_Ffi.set_position(this, value); return value; }
}
