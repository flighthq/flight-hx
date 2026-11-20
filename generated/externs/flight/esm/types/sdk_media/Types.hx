package flight.esm.types.sdk_media;

#if (js && flight_esm)
typedef AudioBus = flight.esm.types.media.Types.AudioBus;

typedef AudioBusMixerGuard = flight.esm.types.media.Types.AudioBusMixerGuard;

typedef AudioBusMixerOperation = flight.esm.types.media.Types.AudioBusMixerOperation;

typedef AudioBusOptions = flight.esm.types.media.Types.AudioBusOptions;

typedef AudioChannel = flight.esm.types.media.Types.AudioChannel;

typedef AudioMixer = flight.esm.types.media.Types.AudioMixer;

typedef AudioMixerOptions = flight.esm.types.media.Types.AudioMixerOptions;

typedef MediaChannelSignals = flight.esm.types.media.Types.MediaChannelSignals;

typedef MediaReadyState = flight.esm.types.media.Types.MediaReadyState;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
