package flight;

#if hl

typedef HostStatusBarColorCapability = flight._hl.HostStatusBarColorCapability;

#elseif cpp

typedef HostStatusBarColorCapability = flight._cpp.HostStatusBarColorCapability;

#elseif (js && flight_esm)

typedef HostStatusBarColorCapability = flight._js.HostStatusBarColorCapability;

#elseif js

#error "flight.HostStatusBarColorCapability on js requires flight_esm."

#else

#error "flight.HostStatusBarColorCapability: no backend for this target."

#end
