package flight;

#if hl

typedef HostStatusBarStyleCapability = flight._hl.HostStatusBarStyleCapability;

#elseif cpp

typedef HostStatusBarStyleCapability = flight._cpp.HostStatusBarStyleCapability;

#elseif (js && flight_esm)

typedef HostStatusBarStyleCapability = flight._js.HostStatusBarStyleCapability;

#elseif js

#error "flight.HostStatusBarStyleCapability on js requires flight_esm."

#else

#error "flight.HostStatusBarStyleCapability: no backend for this target."

#end
