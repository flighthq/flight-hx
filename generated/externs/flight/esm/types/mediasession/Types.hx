package flight.esm.types.mediasession;

#if (js && flight_esm)
typedef HostMediaSessionActionCapability = { destroy:(() -> Void), subscribe:((action:flight.esm.types.mediasession.Types.MediaSessionAction, listener:Dynamic) -> Dynamic) };

typedef HostMediaSessionCapabilities = { ?action:Null<flight.esm.types.mediasession.Types.HostMediaSessionActionCapability>, ?control:Null<flight.esm.types.mediasession.Types.HostMediaSessionCapability> };

typedef HostMediaSessionCapability = { clearMetadata:(() -> flight.esm.types.mediasession.Types.MediaSessionClearMetadataOutcome), clearPositionState:(() -> flight.esm.types.mediasession.Types.MediaSessionClearPositionStateOutcome), destroy:(() -> Void), setMetadata:((metadata:flight.esm.types.mediasession.Types.MediaSessionMetadata) -> flight.esm.types.mediasession.Types.MediaSessionSetMetadataOutcome), setPlaybackState:((state:flight.esm.types.mediasession.Types.MediaSessionPlaybackState) -> flight.esm.types.mediasession.Types.MediaSessionSetPlaybackStateOutcome), setPositionState:((state:flight.esm.types.mediasession.Types.MediaSessionPositionState) -> flight.esm.types.mediasession.Types.MediaSessionSetPositionStateOutcome) };

typedef MediaSessionAction = String;

typedef MediaSessionActionDetails = { action:flight.esm.types.mediasession.Types.MediaSessionAction, ?seekTime:Null<Float>, ?seekOffset:Null<Float>, ?fastSeek:Null<Bool> };

typedef MediaSessionActionSignal = { action:flight.esm.types.mediasession.Types.MediaSessionAction, onAction:flight.esm.types.signals.Types.Signal<flight.esm.types.mediasession.Types.MediaSessionActionDetails> };

typedef MediaSessionArtwork = { src:String, ?sizes:Null<String>, ?type:Null<String> };

typedef MediaSessionClearMetadataOutcome = { reason:String };

typedef MediaSessionClearPositionStateOutcome = { reason:String };

typedef MediaSessionMetadata = { title:String, artist:String, album:String, artwork:Array<flight.esm.types.mediasession.Types.MediaSessionArtwork> };

typedef MediaSessionOperationBlockReason = String;

typedef MediaSessionOperationOutcome<BlockReason> = { reason:Dynamic };

typedef MediaSessionPlaybackState = String;

typedef MediaSessionPositionState = { duration:Float, playbackRate:Float, position:Float };

typedef MediaSessionSetMetadataOutcome = { reason:String };

typedef MediaSessionSetPlaybackStateOutcome = { reason:String };

typedef MediaSessionSetPositionStateOutcome = { reason:String };

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
