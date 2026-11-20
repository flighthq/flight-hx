package flight.esm.mediasession;

#if (js && flight_esm)
@:jsRequire("@flighthq/mediasession/contract")
extern class Contract {
  public static function attachMediaSessionAction(hostMediaSessionAction:flight.esm.types.mediasession.Types.HostMediaSessionActionCapability, signal:flight.esm.types.mediasession.Types.MediaSessionActionSignal):Bool;
  public static function clearMediaSessionMetadata(hostMediaSession:flight.esm.types.mediasession.Types.HostMediaSessionCapability):flight.esm.types.mediasession.Types.MediaSessionClearMetadataOutcome;
  public static function clearMediaSessionPositionState(hostMediaSession:flight.esm.types.mediasession.Types.HostMediaSessionCapability):flight.esm.types.mediasession.Types.MediaSessionClearPositionStateOutcome;
  public static function createMediaSessionActionSignal(action:flight.esm.types.mediasession.Types.MediaSessionAction):flight.esm.types.mediasession.Types.MediaSessionActionSignal;
  public static function destroyMediaSession(hostMediaSession:flight.esm.types.mediasession.Types.HostMediaSessionCapability, hostMediaSessionAction:flight.esm.types.mediasession.Types.HostMediaSessionActionCapability):Void;
  public static function detachMediaSessionAction(signal:flight.esm.types.mediasession.Types.MediaSessionActionSignal):Void;
  public static function disposeMediaSessionActionSignal(signal:flight.esm.types.mediasession.Types.MediaSessionActionSignal):Void;
  public static function initializeMediaSessionActionSignal(out:flight.esm.types.entity_contract.Types.EntityConstruction<flight.esm.types.mediasession.Types.MediaSessionActionSignal>, action:flight.esm.types.mediasession.Types.MediaSessionAction):Void;
  public static function setMediaSessionMetadata(hostMediaSession:flight.esm.types.mediasession.Types.HostMediaSessionCapability, metadata:flight.esm.types.mediasession.Types.MediaSessionMetadata):flight.esm.types.mediasession.Types.MediaSessionSetMetadataOutcome;
  public static function setMediaSessionPlaybackState(hostMediaSession:flight.esm.types.mediasession.Types.HostMediaSessionCapability, state:flight.esm.types.mediasession.Types.MediaSessionPlaybackState):flight.esm.types.mediasession.Types.MediaSessionSetPlaybackStateOutcome;
  public static function setMediaSessionPositionState(hostMediaSession:flight.esm.types.mediasession.Types.HostMediaSessionCapability, state:flight.esm.types.mediasession.Types.MediaSessionPositionState):flight.esm.types.mediasession.Types.MediaSessionSetPositionStateOutcome;
}
#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
