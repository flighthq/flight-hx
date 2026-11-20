package flight;

#if hl

typedef HostStatusBarOverlaysCapability = flight._hl.HostStatusBarOverlaysCapability;

#elseif cpp

typedef HostStatusBarOverlaysCapability = flight._cpp.HostStatusBarOverlaysCapability;

#elseif (js && flight_esm)

typedef HostStatusBarOverlaysCapability = flight._js.HostStatusBarOverlaysCapability;

#elseif js

#error "flight.HostStatusBarOverlaysCapability on js requires flight_esm."

#else

#error "flight.HostStatusBarOverlaysCapability: no backend for this target."

#end
