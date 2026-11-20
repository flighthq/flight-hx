package flight;

#if hl

typedef HostAppQuitRequestCapability = flight._hl.HostAppQuitRequestCapability;

#elseif cpp

typedef HostAppQuitRequestCapability = flight._cpp.HostAppQuitRequestCapability;

#elseif (js && flight_esm)

typedef HostAppQuitRequestCapability = flight._js.HostAppQuitRequestCapability;

#elseif js

#error "flight.HostAppQuitRequestCapability on js requires flight_esm."

#else

#error "flight.HostAppQuitRequestCapability: no backend for this target."

#end
