package flight;

#if hl

typedef HostAudioDeviceCapability = flight._hl.HostAudioDeviceCapability;

#elseif cpp

typedef HostAudioDeviceCapability = flight._cpp.HostAudioDeviceCapability;

#elseif (js && flight_esm)

typedef HostAudioDeviceCapability = flight._js.HostAudioDeviceCapability;

#elseif js

#error "flight.HostAudioDeviceCapability on js requires flight_esm."

#else

#error "flight.HostAudioDeviceCapability: no backend for this target."

#end
