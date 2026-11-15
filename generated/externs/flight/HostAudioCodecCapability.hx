package flight;

#if hl

typedef HostAudioCodecCapability = flight._hl.HostAudioCodecCapability;

#elseif cpp

typedef HostAudioCodecCapability = flight._cpp.HostAudioCodecCapability;

#elseif (js && flight_esm)

typedef HostAudioCodecCapability = flight._js.HostAudioCodecCapability;

#elseif js

#error "flight.HostAudioCodecCapability on js requires flight_esm."

#else

#error "flight.HostAudioCodecCapability: no backend for this target."

#end
