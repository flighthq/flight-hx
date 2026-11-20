package flight.esm.types.video_contract;

#if (js && flight_esm)
typedef HostVideoCapabilities = flight.esm.types.video.Types.HostVideoCapabilities;

typedef HostVideoCapability = flight.esm.types.video.Types.HostVideoCapability;

typedef VideoChannel = flight.esm.types.video.Types.VideoChannel;

typedef VideoChannelState = flight.esm.types.video.Types.VideoChannelState;

typedef VideoPlayOptions = flight.esm.types.video.Types.VideoPlayOptions;

typedef VideoResource = flight.esm.types.video.Types.VideoResource;

typedef VideoResourceLoadOptions = flight.esm.types.video.Types.VideoResourceLoadOptions;

typedef VideoResourceUrl = flight.esm.types.video.Types.VideoResourceUrl;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
