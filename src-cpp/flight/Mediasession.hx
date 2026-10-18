// Generated from src-cpp/manifest.json and flight-compiler native-planning.json. Do not edit.
package flight;

extern inline function attachMediaSessionAction(hostMediaSessionAction:flight.HostMediaSessionActionCapability, signal:flight.MediaSessionActionSignal):Bool {
  return flight._cpp._attempt.Attempt_Mediasession_attachMediaSessionAction.attachMediaSessionAction(hostMediaSessionAction, signal);
}

extern inline function clearMediaSessionMetadata(hostMediaSession:flight.HostMediaSessionCapability):flight.MediaSessionClearMetadataOutcome {
  return flight._cpp._attempt.Attempt_Mediasession_clearMediaSessionMetadata.clearMediaSessionMetadata(hostMediaSession);
}

extern inline function clearMediaSessionPositionState(hostMediaSession:flight.HostMediaSessionCapability):flight.MediaSessionClearPositionStateOutcome {
  return flight._cpp._attempt.Attempt_Mediasession_clearMediaSessionPositionState.clearMediaSessionPositionState(hostMediaSession);
}

extern inline function createMediaSessionActionSignal(action:flight.MediaSessionAction):flight.MediaSessionActionSignal {
  return flight._cpp._attempt.Attempt_Mediasession_createMediaSessionActionSignal.createMediaSessionActionSignal(action);
}

extern inline function destroyMediaSession(hostMediaSession:flight.HostMediaSessionCapability, hostMediaSessionAction:flight.HostMediaSessionActionCapability):Void {
  flight._cpp._attempt.Attempt_Mediasession_destroyMediaSession.destroyMediaSession(hostMediaSession, hostMediaSessionAction);
}

extern inline function detachMediaSessionAction(signal:flight.MediaSessionActionSignal):Void {
  flight._cpp._attempt.Attempt_Mediasession_detachMediaSessionAction.detachMediaSessionAction(signal);
}

extern inline function disposeMediaSessionActionSignal(signal:flight.MediaSessionActionSignal):Void {
  flight._cpp._attempt.Attempt_Mediasession_disposeMediaSessionActionSignal.disposeMediaSessionActionSignal(signal);
}

extern inline function initializeMediaSessionActionSignal(out:flight.EntityConstruction<flight.MediaSessionActionSignal>, action:flight.MediaSessionAction):Void {
  flight._cpp._attempt.Attempt_Mediasession_initializeMediaSessionActionSignal.initializeMediaSessionActionSignal(out, action);
}

extern inline function setMediaSessionMetadata(hostMediaSession:flight.HostMediaSessionCapability, metadata:flight.MediaSessionMetadata):flight.MediaSessionSetMetadataOutcome {
  return flight._cpp._attempt.Attempt_Mediasession_setMediaSessionMetadata.setMediaSessionMetadata(hostMediaSession, metadata);
}

extern inline function setMediaSessionPlaybackState(hostMediaSession:flight.HostMediaSessionCapability, state:flight.MediaSessionPlaybackState):flight.MediaSessionSetPlaybackStateOutcome {
  return flight._cpp._attempt.Attempt_Mediasession_setMediaSessionPlaybackState.setMediaSessionPlaybackState(hostMediaSession, state);
}

extern inline function setMediaSessionPositionState(hostMediaSession:flight.HostMediaSessionCapability, state:flight.MediaSessionPositionState):flight.MediaSessionSetPositionStateOutcome {
  return flight._cpp._attempt.Attempt_Mediasession_setMediaSessionPositionState.setMediaSessionPositionState(hostMediaSession, state);
}
