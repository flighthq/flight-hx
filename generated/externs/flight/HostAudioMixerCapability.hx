package flight;

#if hl

typedef HostAudioMixerCapability = flight._hl.HostAudioMixerCapability;

#elseif cpp

typedef HostAudioMixerCapability = flight._cpp.HostAudioMixerCapability;

#elseif (js && flight_esm)

typedef HostAudioMixerCapability = flight._js.HostAudioMixerCapability;

#elseif js

#error "flight.HostAudioMixerCapability on js requires flight_esm."

#else

#error "flight.HostAudioMixerCapability: no backend for this target."

#end
