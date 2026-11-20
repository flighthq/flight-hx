package flight._cpp._fn;

extern class Mediasession {
	@:native("flight_create_media_session_action_signal")
	public static function createMediaSessionActionSignal():flight._cpp.MediaSessionActionSignal;
	@:native("flight_attach_media_session_action")
	public static function attachMediaSessionAction(hostMediaSessionAction:flight._cpp.HostMediaSessionActionCapability, signal:flight._cpp.MediaSessionActionSignal):Bool;
	@:native("flight_clear_media_session_metadata")
	public static function clearMediaSessionMetadata(hostMediaSession:flight._cpp.HostMediaSessionCapability):flight._cpp.MediaSessionClearMetadataOutcome;
	@:native("flight_clear_media_session_position_state")
	public static function clearMediaSessionPositionState(hostMediaSession:flight._cpp.HostMediaSessionCapability):flight._cpp.MediaSessionClearPositionStateOutcome;
	@:native("flight_destroy_media_session")
	public static function destroyMediaSession(hostMediaSession:flight._cpp.HostMediaSessionCapability, hostMediaSessionAction:flight._cpp.HostMediaSessionActionCapability):Void;
	@:native("flight_detach_media_session_action")
	public static function detachMediaSessionAction(signal:flight._cpp.MediaSessionActionSignal):Void;
	@:native("flight_dispose_media_session_action_signal")
	public static function disposeMediaSessionActionSignal(signal:flight._cpp.MediaSessionActionSignal):Void;
	@:native("flight_set_media_session_metadata")
	public static function setMediaSessionMetadata(hostMediaSession:flight._cpp.HostMediaSessionCapability, metadata:flight._cpp.MediaSessionMetadata):flight._cpp.MediaSessionSetMetadataOutcome;
	@:native("flight_set_media_session_playback_state")
	public static function setMediaSessionPlaybackState(hostMediaSession:flight._cpp.HostMediaSessionCapability, state:Int):flight._cpp.MediaSessionSetPlaybackStateOutcome;
	@:native("flight_set_media_session_position_state")
	public static function setMediaSessionPositionState(hostMediaSession:flight._cpp.HostMediaSessionCapability, state:flight._cpp.MediaSessionPositionState):flight._cpp.MediaSessionSetPositionStateOutcome;
	@:native("flight_free_media_session_action_signal")
	public static function freeMediaSessionActionSignal(ptr:flight._cpp.MediaSessionActionSignal):Void;
	@:native("flight_free_media_session_clear_metadata_outcome")
	public static function freeMediaSessionClearMetadataOutcome(ptr:flight._cpp.MediaSessionClearMetadataOutcome):Void;
	@:native("flight_free_media_session_clear_position_state_outcome")
	public static function freeMediaSessionClearPositionStateOutcome(ptr:flight._cpp.MediaSessionClearPositionStateOutcome):Void;
	@:native("flight_free_media_session_set_metadata_outcome")
	public static function freeMediaSessionSetMetadataOutcome(ptr:flight._cpp.MediaSessionSetMetadataOutcome):Void;
	@:native("flight_free_media_session_set_playback_state_outcome")
	public static function freeMediaSessionSetPlaybackStateOutcome(ptr:flight._cpp.MediaSessionSetPlaybackStateOutcome):Void;
	@:native("flight_free_media_session_set_position_state_outcome")
	public static function freeMediaSessionSetPositionStateOutcome(ptr:flight._cpp.MediaSessionSetPositionStateOutcome):Void;
}
