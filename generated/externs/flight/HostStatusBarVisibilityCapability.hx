package flight;

#if hl

typedef HostStatusBarVisibilityCapability = flight._hl.HostStatusBarVisibilityCapability;

#elseif cpp

typedef HostStatusBarVisibilityCapability = flight._cpp.HostStatusBarVisibilityCapability;

#elseif (js && flight_esm)

typedef HostStatusBarVisibilityCapability = flight._js.HostStatusBarVisibilityCapability;

#elseif js

#error "flight.HostStatusBarVisibilityCapability on js requires flight_esm."

#else

#error "flight.HostStatusBarVisibilityCapability: no backend for this target."

#end
