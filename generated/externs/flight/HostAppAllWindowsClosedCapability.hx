package flight;

#if hl

typedef HostAppAllWindowsClosedCapability = flight._hl.HostAppAllWindowsClosedCapability;

#elseif cpp

typedef HostAppAllWindowsClosedCapability = flight._cpp.HostAppAllWindowsClosedCapability;

#elseif (js && flight_esm)

typedef HostAppAllWindowsClosedCapability = flight._js.HostAppAllWindowsClosedCapability;

#elseif js

#error "flight.HostAppAllWindowsClosedCapability on js requires flight_esm."

#else

#error "flight.HostAppAllWindowsClosedCapability: no backend for this target."

#end
