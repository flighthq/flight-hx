package flight;

#if hl

typedef HostStatusBarChangeCapability = flight._hl.HostStatusBarChangeCapability;

#elseif cpp

typedef HostStatusBarChangeCapability = flight._cpp.HostStatusBarChangeCapability;

#elseif (js && flight_esm)

typedef HostStatusBarChangeCapability = flight._js.HostStatusBarChangeCapability;

#elseif js

#error "flight.HostStatusBarChangeCapability on js requires flight_esm."

#else

#error "flight.HostStatusBarChangeCapability: no backend for this target."

#end
