package flight.esm.types.mediasession_contract;

#if (js && flight_esm)
typedef HostMediaSessionActionCapability = flight.esm.types.mediasession.Types.HostMediaSessionActionCapability;

typedef HostMediaSessionCapabilities = flight.esm.types.mediasession.Types.HostMediaSessionCapabilities;

typedef HostMediaSessionCapability = flight.esm.types.mediasession.Types.HostMediaSessionCapability;

typedef MediaSessionAction = flight.esm.types.mediasession.Types.MediaSessionAction;

typedef MediaSessionActionDetails = flight.esm.types.mediasession.Types.MediaSessionActionDetails;

typedef MediaSessionActionSignal = flight.esm.types.mediasession.Types.MediaSessionActionSignal;

typedef MediaSessionArtwork = flight.esm.types.mediasession.Types.MediaSessionArtwork;

typedef MediaSessionClearMetadataOutcome = flight.esm.types.mediasession.Types.MediaSessionClearMetadataOutcome;

typedef MediaSessionClearPositionStateOutcome = flight.esm.types.mediasession.Types.MediaSessionClearPositionStateOutcome;

typedef MediaSessionMetadata = flight.esm.types.mediasession.Types.MediaSessionMetadata;

typedef MediaSessionOperationBlockReason = flight.esm.types.mediasession.Types.MediaSessionOperationBlockReason;

typedef MediaSessionOperationOutcome<BlockReason> = flight.esm.types.mediasession.Types.MediaSessionOperationOutcome<BlockReason>;

typedef MediaSessionPlaybackState = flight.esm.types.mediasession.Types.MediaSessionPlaybackState;

typedef MediaSessionPositionState = flight.esm.types.mediasession.Types.MediaSessionPositionState;

typedef MediaSessionSetMetadataOutcome = flight.esm.types.mediasession.Types.MediaSessionSetMetadataOutcome;

typedef MediaSessionSetPlaybackStateOutcome = flight.esm.types.mediasession.Types.MediaSessionSetPlaybackStateOutcome;

typedef MediaSessionSetPositionStateOutcome = flight.esm.types.mediasession.Types.MediaSessionSetPositionStateOutcome;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
