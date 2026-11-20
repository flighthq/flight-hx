package flight;

#if hl

typedef HostCapabilityCoverage = flight._hl.HostCapabilityCoverage;

#elseif cpp

typedef HostCapabilityCoverage = flight._cpp.HostCapabilityCoverage;

#elseif (js && flight_esm)

typedef HostCapabilityCoverage = flight._js.HostCapabilityCoverage;

#elseif js

#error "flight.HostCapabilityCoverage on js requires flight_esm."

#else

#error "flight.HostCapabilityCoverage: no backend for this target."

#end
