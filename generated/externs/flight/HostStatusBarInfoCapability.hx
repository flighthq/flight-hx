package flight;

#if hl

typedef HostStatusBarInfoCapability = flight._hl.HostStatusBarInfoCapability;

#elseif cpp

typedef HostStatusBarInfoCapability = flight._cpp.HostStatusBarInfoCapability;

#elseif (js && flight_esm)

typedef HostStatusBarInfoCapability = flight._js.HostStatusBarInfoCapability;

#elseif js

#error "flight.HostStatusBarInfoCapability on js requires flight_esm."

#else

#error "flight.HostStatusBarInfoCapability: no backend for this target."

#end
