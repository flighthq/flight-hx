package flight.esm.types.media;

#if (js && flight_esm)
typedef AudioBus = { gain:Float, muted:Bool, name:String, pan:Float };

typedef AudioBusMixerGuard = ((operation:flight.esm.types.media.Types.AudioBusMixerOperation, bus:flight.esm.types.media.Types.AudioBus) -> Void);

typedef AudioBusMixerOperation = String;

typedef AudioBusOptions = { ?gain:Null<Float>, ?muted:Null<Bool>, ?name:Null<String>, ?pan:Null<Float> };

typedef AudioChannel = { currentTime:Float, gain:Float, length:Float, loopEnd:Float, loops:Float, loopStart:Float, muted:Bool, pan:Float, playbackRate:Float, source:flight.esm.types.audio.Types.AudioResource, state:flight.esm.types.audio.Types.AudioChannelState, onComplete:flight.esm.types.signals.Types.Signal<Void> };

typedef AudioMixer = { masterGain:Float, masterMuted:Bool };

typedef AudioMixerOptions = { ?masterGain:Null<Float>, ?masterMuted:Null<Bool> };

typedef MediaChannelSignals = { onBuffering:flight.esm.types.signals.Types.Signal<Void>, onComplete:flight.esm.types.signals.Types.Signal<Void>, onError:flight.esm.types.signals.Types.Signal<String>, onLoop:flight.esm.types.signals.Types.Signal<Void>, onPause:flight.esm.types.signals.Types.Signal<Void>, onPlay:flight.esm.types.signals.Types.Signal<Void>, onReady:flight.esm.types.signals.Types.Signal<Void>, onSeeked:flight.esm.types.signals.Types.Signal<Void>, onStop:flight.esm.types.signals.Types.Signal<Void> };

typedef MediaReadyState = String;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
