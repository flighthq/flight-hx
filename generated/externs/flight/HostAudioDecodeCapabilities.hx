package flight;

#if hl

typedef HostAudioDecodeCapabilities = flight._hl.HostAudioDecodeCapabilities;

#elseif cpp

typedef HostAudioDecodeCapabilities = flight._cpp.HostAudioDecodeCapabilities;

#elseif (js && flight_esm)

typedef HostAudioDecodeCapabilities = flight._js.HostAudioDecodeCapabilities;

#elseif js

#error "flight.HostAudioDecodeCapabilities on js requires flight_esm."

#else

#error "flight.HostAudioDecodeCapabilities: no backend for this target."

#end
