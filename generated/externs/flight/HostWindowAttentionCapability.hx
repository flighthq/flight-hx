package flight;

#if hl

typedef HostWindowAttentionCapability = flight._hl.HostWindowAttentionCapability;

#elseif cpp

typedef HostWindowAttentionCapability = flight._cpp.HostWindowAttentionCapability;

#elseif (js && flight_esm)

typedef HostWindowAttentionCapability = flight._js.HostWindowAttentionCapability;

#elseif js

#error "flight.HostWindowAttentionCapability on js requires flight_esm."

#else

#error "flight.HostWindowAttentionCapability: no backend for this target."

#end
