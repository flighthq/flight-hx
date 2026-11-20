package flight.esm.types.media_contract;

#if (js && flight_esm)
typedef AudioBus = flight.esm.types.media.Types.AudioBus;

typedef AudioBusMixerGuard = flight.esm.types.media.Types.AudioBusMixerGuard;

typedef AudioBusMixerOperation = flight.esm.types.media.Types.AudioBusMixerOperation;

typedef AudioBusOptions = flight.esm.types.media.Types.AudioBusOptions;

typedef AudioChannel = flight.esm.types.media.Types.AudioChannel;

typedef AudioDeviceOperation = String;

typedef AudioMixer = flight.esm.types.media.Types.AudioMixer;

typedef AudioMixerOptions = flight.esm.types.media.Types.AudioMixerOptions;

typedef HostAudioCapabilities = { ?codec:Null<flight.esm.types.audio.Types.HostAudioCodecCapability>, ?device:Null<flight.esm.types.media_contract.Types.HostAudioDeviceCapability>, ?mixer:Null<flight.esm.types.media_contract.Types.HostAudioMixerCapability> };

typedef HostAudioDeviceCapability = { createBuffer:((device:flight.esm.types.host_contract.Types.AudioDeviceHandle, channels:Float, length:Float, sampleRate:Float, data:Array<js.lib.Float32Array>) -> flight.esm.types.host_contract.Types.AudioBufferHandle), createDevice:((sampleRate:Float) -> flight.esm.types.host_contract.Types.AudioDeviceHandle), createSource:((device:flight.esm.types.host_contract.Types.AudioDeviceHandle, buffer:flight.esm.types.host_contract.Types.AudioBufferHandle) -> flight.esm.types.host_contract.Types.AudioSourceHandle), destroyBuffer:((buffer:flight.esm.types.host_contract.Types.AudioBufferHandle) -> Void), destroyDevice:((device:flight.esm.types.host_contract.Types.AudioDeviceHandle) -> Void), destroySource:((source:flight.esm.types.host_contract.Types.AudioSourceHandle) -> Void), ?fadeSourceGain:Null<((source:flight.esm.types.host_contract.Types.AudioSourceHandle, targetGain:Float, durationMs:Float) -> Void)>, getDeviceTime:((device:flight.esm.types.host_contract.Types.AudioDeviceHandle) -> Float), onSourceEnded:((source:flight.esm.types.host_contract.Types.AudioSourceHandle, callback_:Dynamic) -> Void), resumeDevice:((device:flight.esm.types.host_contract.Types.AudioDeviceHandle) -> Void), setSourceGain:((source:flight.esm.types.host_contract.Types.AudioSourceHandle, gain:Float) -> Void), setSourcePan:((source:flight.esm.types.host_contract.Types.AudioSourceHandle, pan:Float) -> Void), setSourcePlaybackRate:((source:flight.esm.types.host_contract.Types.AudioSourceHandle, rate:Float) -> Void), startSource:((source:flight.esm.types.host_contract.Types.AudioSourceHandle, offset:Float, duration:Float) -> Void), stopSource:((source:flight.esm.types.host_contract.Types.AudioSourceHandle) -> Void) };

typedef HostAudioMixerCapability = { createMixerGraph:((device:flight.esm.types.host_contract.Types.AudioDeviceHandle, masterGain:Float) -> flight.esm.types.host_contract.Types.AudioMixerGraphHandle), destroyMixerGraph:((graph:flight.esm.types.host_contract.Types.AudioMixerGraphHandle) -> Void), createBusNode:((graph:flight.esm.types.host_contract.Types.AudioMixerGraphHandle, gain:Float, pan:Float) -> flight.esm.types.host_contract.Types.AudioBusNodeHandle), destroyBusNode:((graph:flight.esm.types.host_contract.Types.AudioMixerGraphHandle, bus:flight.esm.types.host_contract.Types.AudioBusNodeHandle) -> Void), setBusNodeGain:((graph:flight.esm.types.host_contract.Types.AudioMixerGraphHandle, bus:flight.esm.types.host_contract.Types.AudioBusNodeHandle, gain:Float) -> Void), setBusNodePan:((graph:flight.esm.types.host_contract.Types.AudioMixerGraphHandle, bus:flight.esm.types.host_contract.Types.AudioBusNodeHandle, pan:Float) -> Void), fadeBusNodeGain:((graph:flight.esm.types.host_contract.Types.AudioMixerGraphHandle, bus:flight.esm.types.host_contract.Types.AudioBusNodeHandle, target:Float, durationMs:Float) -> Void), setMasterGain:((graph:flight.esm.types.host_contract.Types.AudioMixerGraphHandle, gain:Float) -> Void), routeSourceToBus:((graph:flight.esm.types.host_contract.Types.AudioMixerGraphHandle, source:flight.esm.types.host_contract.Types.AudioSourceHandle, bus:flight.esm.types.host_contract.Types.AudioBusNodeHandle) -> Void), unrouteSource:((graph:flight.esm.types.host_contract.Types.AudioMixerGraphHandle, source:flight.esm.types.host_contract.Types.AudioSourceHandle) -> Void), routeSourceToDefault:((graph:flight.esm.types.host_contract.Types.AudioMixerGraphHandle, source:flight.esm.types.host_contract.Types.AudioSourceHandle) -> Void) };

typedef MediaChannelSignals = flight.esm.types.media.Types.MediaChannelSignals;

typedef MediaReadyState = flight.esm.types.media.Types.MediaReadyState;

#else
#error "Flight ESM bindings require the JavaScript target and flight_esm."
#end
