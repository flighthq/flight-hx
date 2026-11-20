package flight._hl._fn;

extern class Mediasession {
	@:hlNative("flight", "flight_create_media_session_action_signal")
	public static function createMediaSessionActionSignal():flight._hl.MediaSessionActionSignal;
	@:hlNative("flight", "flight_attach_media_session_action")
	public static function attachMediaSessionAction(hostMediaSessionAction:flight._hl.HostMediaSessionActionCapability, signal:flight._hl.MediaSessionActionSignal):Bool;
	@:hlNative("flight", "flight_clear_media_session_metadata")
	public static function clearMediaSessionMetadata(hostMediaSession:flight._hl.HostMediaSessionCapability):flight._hl.MediaSessionClearMetadataOutcome;
	@:hlNative("flight", "flight_clear_media_session_position_state")
	public static function clearMediaSessionPositionState(hostMediaSession:flight._hl.HostMediaSessionCapability):flight._hl.MediaSessionClearPositionStateOutcome;
	@:hlNative("flight", "flight_destroy_media_session")
	public static function destroyMediaSession(hostMediaSession:flight._hl.HostMediaSessionCapability, hostMediaSessionAction:flight._hl.HostMediaSessionActionCapability):Void;
	@:hlNative("flight", "flight_detach_media_session_action")
	public static function detachMediaSessionAction(signal:flight._hl.MediaSessionActionSignal):Void;
	@:hlNative("flight", "flight_dispose_media_session_action_signal")
	public static function disposeMediaSessionActionSignal(signal:flight._hl.MediaSessionActionSignal):Void;
	@:hlNative("flight", "flight_set_media_session_metadata")
	public static function setMediaSessionMetadata(hostMediaSession:flight._hl.HostMediaSessionCapability, metadata:flight._hl.MediaSessionMetadata):flight._hl.MediaSessionSetMetadataOutcome;
	@:hlNative("flight", "flight_set_media_session_playback_state")
	public static function setMediaSessionPlaybackState(hostMediaSession:flight._hl.HostMediaSessionCapability, state:Int):flight._hl.MediaSessionSetPlaybackStateOutcome;
	@:hlNative("flight", "flight_set_media_session_position_state")
	public static function setMediaSessionPositionState(hostMediaSession:flight._hl.HostMediaSessionCapability, state:flight._hl.MediaSessionPositionState):flight._hl.MediaSessionSetPositionStateOutcome;
	@:hlNative("flight", "flight_free_media_session_action_signal")
	public static function freeMediaSessionActionSignal(ptr:flight._hl.MediaSessionActionSignal):Void;
	@:hlNative("flight", "flight_free_media_session_clear_metadata_outcome")
	public static function freeMediaSessionClearMetadataOutcome(ptr:flight._hl.MediaSessionClearMetadataOutcome):Void;
	@:hlNative("flight", "flight_free_media_session_clear_position_state_outcome")
	public static function freeMediaSessionClearPositionStateOutcome(ptr:flight._hl.MediaSessionClearPositionStateOutcome):Void;
	@:hlNative("flight", "flight_free_media_session_set_metadata_outcome")
	public static function freeMediaSessionSetMetadataOutcome(ptr:flight._hl.MediaSessionSetMetadataOutcome):Void;
	@:hlNative("flight", "flight_free_media_session_set_playback_state_outcome")
	public static function freeMediaSessionSetPlaybackStateOutcome(ptr:flight._hl.MediaSessionSetPlaybackStateOutcome):Void;
	@:hlNative("flight", "flight_free_media_session_set_position_state_outcome")
	public static function freeMediaSessionSetPositionStateOutcome(ptr:flight._hl.MediaSessionSetPositionStateOutcome):Void;
}
