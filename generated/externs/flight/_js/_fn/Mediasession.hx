package flight._js._fn;

@:jsRequire("@flighthq/mediasession")
extern class Mediasession {
	@:native("createMediaSessionActionSignal")
	public static function createMediaSessionActionSignal():flight._js.MediaSessionActionSignal;
	@:native("attachMediaSessionAction")
	public static function attachMediaSessionAction(hostMediaSessionAction:flight._js.HostMediaSessionActionCapability, signal:flight._js.MediaSessionActionSignal):Bool;
	@:native("clearMediaSessionMetadata")
	public static function clearMediaSessionMetadata(hostMediaSession:flight._js.HostMediaSessionCapability):flight._js.MediaSessionClearMetadataOutcome;
	@:native("clearMediaSessionPositionState")
	public static function clearMediaSessionPositionState(hostMediaSession:flight._js.HostMediaSessionCapability):flight._js.MediaSessionClearPositionStateOutcome;
	@:native("destroyMediaSession")
	public static function destroyMediaSession(hostMediaSession:flight._js.HostMediaSessionCapability, hostMediaSessionAction:flight._js.HostMediaSessionActionCapability):Void;
	@:native("detachMediaSessionAction")
	public static function detachMediaSessionAction(signal:flight._js.MediaSessionActionSignal):Void;
	@:native("disposeMediaSessionActionSignal")
	public static function disposeMediaSessionActionSignal(signal:flight._js.MediaSessionActionSignal):Void;
	@:native("setMediaSessionMetadata")
	public static function setMediaSessionMetadata(hostMediaSession:flight._js.HostMediaSessionCapability, metadata:flight._js.MediaSessionMetadata):flight._js.MediaSessionSetMetadataOutcome;
	@:native("setMediaSessionPlaybackState")
	public static function setMediaSessionPlaybackState(hostMediaSession:flight._js.HostMediaSessionCapability, state:Dynamic):flight._js.MediaSessionSetPlaybackStateOutcome;
	@:native("setMediaSessionPositionState")
	public static function setMediaSessionPositionState(hostMediaSession:flight._js.HostMediaSessionCapability, state:flight._js.MediaSessionPositionState):flight._js.MediaSessionSetPositionStateOutcome;
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMediaSessionActionSignal(ptr:flight._js.MediaSessionActionSignal):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMediaSessionClearMetadataOutcome(ptr:flight._js.MediaSessionClearMetadataOutcome):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMediaSessionClearPositionStateOutcome(ptr:flight._js.MediaSessionClearPositionStateOutcome):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMediaSessionSetMetadataOutcome(ptr:flight._js.MediaSessionSetMetadataOutcome):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMediaSessionSetPlaybackStateOutcome(ptr:flight._js.MediaSessionSetPlaybackStateOutcome):Void {}
	/** Native allocation release is unnecessary on JavaScript. */
	public static inline function freeMediaSessionSetPositionStateOutcome(ptr:flight._js.MediaSessionSetPositionStateOutcome):Void {}
}
