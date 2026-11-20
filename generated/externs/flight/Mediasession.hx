package flight;

#if (js && flight_esm)
extern inline function createMediaSessionActionSignal():MediaSessionActionSignal {
	return flight._js._fn.Mediasession.createMediaSessionActionSignal();
}
#else
extern inline function createMediaSessionActionSignal():MediaSessionActionSignal {
#if hl
	return flight._hl._fn.Mediasession.createMediaSessionActionSignal();
#elseif cpp
	return flight._cpp._fn.Mediasession.createMediaSessionActionSignal();
#elseif (js && flight_esm)
	return flight._js._fn.Mediasession.createMediaSessionActionSignal();
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function attachMediaSessionAction(hostMediaSessionAction:HostMediaSessionActionCapability, signal:MediaSessionActionSignal):Bool {
	return flight._js._fn.Mediasession.attachMediaSessionAction(hostMediaSessionAction, signal);
}
#else
extern inline function attachMediaSessionAction(hostMediaSessionAction:HostMediaSessionActionCapability, signal:MediaSessionActionSignal):Bool {
#if hl
	return flight._hl._fn.Mediasession.attachMediaSessionAction(hostMediaSessionAction, signal);
#elseif cpp
	return flight._cpp._fn.Mediasession.attachMediaSessionAction(hostMediaSessionAction, signal);
#elseif (js && flight_esm)
	return flight._js._fn.Mediasession.attachMediaSessionAction(hostMediaSessionAction, signal);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearMediaSessionMetadata(hostMediaSession:HostMediaSessionCapability):MediaSessionClearMetadataOutcome {
	return flight._js._fn.Mediasession.clearMediaSessionMetadata(hostMediaSession);
}
#else
extern inline function clearMediaSessionMetadata(hostMediaSession:HostMediaSessionCapability):MediaSessionClearMetadataOutcome {
#if hl
	return flight._hl._fn.Mediasession.clearMediaSessionMetadata(hostMediaSession);
#elseif cpp
	return flight._cpp._fn.Mediasession.clearMediaSessionMetadata(hostMediaSession);
#elseif (js && flight_esm)
	return flight._js._fn.Mediasession.clearMediaSessionMetadata(hostMediaSession);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function clearMediaSessionPositionState(hostMediaSession:HostMediaSessionCapability):MediaSessionClearPositionStateOutcome {
	return flight._js._fn.Mediasession.clearMediaSessionPositionState(hostMediaSession);
}
#else
extern inline function clearMediaSessionPositionState(hostMediaSession:HostMediaSessionCapability):MediaSessionClearPositionStateOutcome {
#if hl
	return flight._hl._fn.Mediasession.clearMediaSessionPositionState(hostMediaSession);
#elseif cpp
	return flight._cpp._fn.Mediasession.clearMediaSessionPositionState(hostMediaSession);
#elseif (js && flight_esm)
	return flight._js._fn.Mediasession.clearMediaSessionPositionState(hostMediaSession);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function destroyMediaSession(hostMediaSession:HostMediaSessionCapability, hostMediaSessionAction:HostMediaSessionActionCapability):Void {
	flight._js._fn.Mediasession.destroyMediaSession(hostMediaSession, hostMediaSessionAction);
}
#else
extern inline function destroyMediaSession(hostMediaSession:HostMediaSessionCapability, hostMediaSessionAction:HostMediaSessionActionCapability):Void {
#if hl
	flight._hl._fn.Mediasession.destroyMediaSession(hostMediaSession, hostMediaSessionAction);
#elseif cpp
	flight._cpp._fn.Mediasession.destroyMediaSession(hostMediaSession, hostMediaSessionAction);
#elseif (js && flight_esm)
	flight._js._fn.Mediasession.destroyMediaSession(hostMediaSession, hostMediaSessionAction);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function detachMediaSessionAction(signal:MediaSessionActionSignal):Void {
	flight._js._fn.Mediasession.detachMediaSessionAction(signal);
}
#else
extern inline function detachMediaSessionAction(signal:MediaSessionActionSignal):Void {
#if hl
	flight._hl._fn.Mediasession.detachMediaSessionAction(signal);
#elseif cpp
	flight._cpp._fn.Mediasession.detachMediaSessionAction(signal);
#elseif (js && flight_esm)
	flight._js._fn.Mediasession.detachMediaSessionAction(signal);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function disposeMediaSessionActionSignal(signal:MediaSessionActionSignal):Void {
	flight._js._fn.Mediasession.disposeMediaSessionActionSignal(signal);
}
#else
extern inline function disposeMediaSessionActionSignal(signal:MediaSessionActionSignal):Void {
#if hl
	flight._hl._fn.Mediasession.disposeMediaSessionActionSignal(signal);
#elseif cpp
	flight._cpp._fn.Mediasession.disposeMediaSessionActionSignal(signal);
#elseif (js && flight_esm)
	flight._js._fn.Mediasession.disposeMediaSessionActionSignal(signal);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setMediaSessionMetadata(hostMediaSession:HostMediaSessionCapability, metadata:MediaSessionMetadata):MediaSessionSetMetadataOutcome {
	return flight._js._fn.Mediasession.setMediaSessionMetadata(hostMediaSession, metadata);
}
#else
extern inline function setMediaSessionMetadata(hostMediaSession:HostMediaSessionCapability, metadata:MediaSessionMetadata):MediaSessionSetMetadataOutcome {
#if hl
	return flight._hl._fn.Mediasession.setMediaSessionMetadata(hostMediaSession, metadata);
#elseif cpp
	return flight._cpp._fn.Mediasession.setMediaSessionMetadata(hostMediaSession, metadata);
#elseif (js && flight_esm)
	return flight._js._fn.Mediasession.setMediaSessionMetadata(hostMediaSession, metadata);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setMediaSessionPlaybackState(hostMediaSession:HostMediaSessionCapability, state:Dynamic):MediaSessionSetPlaybackStateOutcome {
	return flight._js._fn.Mediasession.setMediaSessionPlaybackState(hostMediaSession, state);
}
#else
extern inline function setMediaSessionPlaybackState(hostMediaSession:HostMediaSessionCapability, state:flight.MediaSessionPlaybackState):MediaSessionSetPlaybackStateOutcome {
#if hl
	return flight._hl._fn.Mediasession.setMediaSessionPlaybackState(hostMediaSession, state);
#elseif cpp
	return flight._cpp._fn.Mediasession.setMediaSessionPlaybackState(hostMediaSession, state);
#elseif (js && flight_esm)
	return flight._js._fn.Mediasession.setMediaSessionPlaybackState(hostMediaSession, state);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function setMediaSessionPositionState(hostMediaSession:HostMediaSessionCapability, state:MediaSessionPositionState):MediaSessionSetPositionStateOutcome {
	return flight._js._fn.Mediasession.setMediaSessionPositionState(hostMediaSession, state);
}
#else
extern inline function setMediaSessionPositionState(hostMediaSession:HostMediaSessionCapability, state:MediaSessionPositionState):MediaSessionSetPositionStateOutcome {
#if hl
	return flight._hl._fn.Mediasession.setMediaSessionPositionState(hostMediaSession, state);
#elseif cpp
	return flight._cpp._fn.Mediasession.setMediaSessionPositionState(hostMediaSession, state);
#elseif (js && flight_esm)
	return flight._js._fn.Mediasession.setMediaSessionPositionState(hostMediaSession, state);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMediaSessionActionSignal(ptr:MediaSessionActionSignal):Void {
	flight._js._fn.Mediasession.freeMediaSessionActionSignal(ptr);
}
#else
extern inline function freeMediaSessionActionSignal(ptr:MediaSessionActionSignal):Void {
#if hl
	flight._hl._fn.Mediasession.freeMediaSessionActionSignal(ptr);
#elseif cpp
	flight._cpp._fn.Mediasession.freeMediaSessionActionSignal(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Mediasession.freeMediaSessionActionSignal(ptr);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMediaSessionClearMetadataOutcome(ptr:MediaSessionClearMetadataOutcome):Void {
	flight._js._fn.Mediasession.freeMediaSessionClearMetadataOutcome(ptr);
}
#else
extern inline function freeMediaSessionClearMetadataOutcome(ptr:MediaSessionClearMetadataOutcome):Void {
#if hl
	flight._hl._fn.Mediasession.freeMediaSessionClearMetadataOutcome(ptr);
#elseif cpp
	flight._cpp._fn.Mediasession.freeMediaSessionClearMetadataOutcome(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Mediasession.freeMediaSessionClearMetadataOutcome(ptr);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMediaSessionClearPositionStateOutcome(ptr:MediaSessionClearPositionStateOutcome):Void {
	flight._js._fn.Mediasession.freeMediaSessionClearPositionStateOutcome(ptr);
}
#else
extern inline function freeMediaSessionClearPositionStateOutcome(ptr:MediaSessionClearPositionStateOutcome):Void {
#if hl
	flight._hl._fn.Mediasession.freeMediaSessionClearPositionStateOutcome(ptr);
#elseif cpp
	flight._cpp._fn.Mediasession.freeMediaSessionClearPositionStateOutcome(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Mediasession.freeMediaSessionClearPositionStateOutcome(ptr);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMediaSessionSetMetadataOutcome(ptr:MediaSessionSetMetadataOutcome):Void {
	flight._js._fn.Mediasession.freeMediaSessionSetMetadataOutcome(ptr);
}
#else
extern inline function freeMediaSessionSetMetadataOutcome(ptr:MediaSessionSetMetadataOutcome):Void {
#if hl
	flight._hl._fn.Mediasession.freeMediaSessionSetMetadataOutcome(ptr);
#elseif cpp
	flight._cpp._fn.Mediasession.freeMediaSessionSetMetadataOutcome(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Mediasession.freeMediaSessionSetMetadataOutcome(ptr);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMediaSessionSetPlaybackStateOutcome(ptr:MediaSessionSetPlaybackStateOutcome):Void {
	flight._js._fn.Mediasession.freeMediaSessionSetPlaybackStateOutcome(ptr);
}
#else
extern inline function freeMediaSessionSetPlaybackStateOutcome(ptr:MediaSessionSetPlaybackStateOutcome):Void {
#if hl
	flight._hl._fn.Mediasession.freeMediaSessionSetPlaybackStateOutcome(ptr);
#elseif cpp
	flight._cpp._fn.Mediasession.freeMediaSessionSetPlaybackStateOutcome(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Mediasession.freeMediaSessionSetPlaybackStateOutcome(ptr);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
#if (js && flight_esm)
extern inline function freeMediaSessionSetPositionStateOutcome(ptr:MediaSessionSetPositionStateOutcome):Void {
	flight._js._fn.Mediasession.freeMediaSessionSetPositionStateOutcome(ptr);
}
#else
extern inline function freeMediaSessionSetPositionStateOutcome(ptr:MediaSessionSetPositionStateOutcome):Void {
#if hl
	flight._hl._fn.Mediasession.freeMediaSessionSetPositionStateOutcome(ptr);
#elseif cpp
	flight._cpp._fn.Mediasession.freeMediaSessionSetPositionStateOutcome(ptr);
#elseif (js && flight_esm)
	flight._js._fn.Mediasession.freeMediaSessionSetPositionStateOutcome(ptr);
#else
	#error "flight.Mediasession: no backend for this target."
#end
}
#end
