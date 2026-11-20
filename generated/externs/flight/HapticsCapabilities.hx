package flight;

#if hl

typedef HapticsCapabilities = flight._hl.HapticsCapabilities;

#elseif cpp

typedef HapticsCapabilities = flight._cpp.HapticsCapabilities;

#elseif (js && flight_esm)

typedef HapticsCapabilities = flight._js.HapticsCapabilities;

#elseif js

#error "flight.HapticsCapabilities on js requires flight_esm."

#else

#error "flight.HapticsCapabilities: no backend for this target."

#end
