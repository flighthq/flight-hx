package flight;

#if hl

typedef HostAccessibilityCapability = flight._hl.HostAccessibilityCapability;

#elseif cpp

typedef HostAccessibilityCapability = flight._cpp.HostAccessibilityCapability;

#elseif (js && flight_esm)

typedef HostAccessibilityCapability = flight._js.HostAccessibilityCapability;

#elseif js

#error "flight.HostAccessibilityCapability on js requires flight_esm."

#else

#error "flight.HostAccessibilityCapability: no backend for this target."

#end
